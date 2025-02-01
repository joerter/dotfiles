{
  description = "John Oerter's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
    let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
      environment.systemPackages = 
        [
        pkgs.arc-browser
          pkgs.direnv
          pkgs.fzf
          pkgs.git 
          pkgs.lazydocker
          pkgs.lazygit
          pkgs.hledger
          pkgs.mkalias
          pkgs.mkcert
          pkgs.neovim
          pkgs.obsidian
          pkgs.raycast
          pkgs.ripgrep
          pkgs.spotify
          pkgs.tableplus
          pkgs.terraform
          pkgs.tmux
          pkgs.vscode
          pkgs.xz
          pkgs.zoom-us
          ];

      homebrew = {
        enable = true;
        brews = [
          "fswatch",
          "qmk/qmk/qmk",
        ];
        casks = [
          "ghostty"
        ];
# masApps = {
#     "Yoink" = ""
#   }
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      fonts.packages = [
        pkgs.nerd-fonts._0xproto
          pkgs.nerd-fonts.droid-sans-mono
      ];

# fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);


# Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

# Enable alternative shell support in nix-darwin.
# programs.fish.enable = true;

# Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
# Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
            done
            '';

      system.defaults = {
        ".GlobalPreferences"."com.apple.mouse.scaling" = 9.0;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 7;
        controlcenter.BatteryShowPercentage = true;
        controlcenter.Bluetooth = true;
        controlcenter.Sound = true;
        dock.autohide = true;
        dock.appswitcher-all-displays = true;
        dock.launchanim = false;
        dock.persistent-others = ["~/github/joerter" "~/Downloads" "~/Screenshots"];
        dock.showhidden = true;
        dock.static-only = true;
        finder.AppleShowAllFiles = true;
        finder.CreateDesktop = false;
        finder.ShowPathbar = true;
        finder.ShowStatusBar = true;
        hitoolbox.AppleFnUsageType = "Show Emoji & Symbols";
        loginwindow.GuestEnabled = false;
        menuExtraClock.ShowSeconds = true;

        finder.FXPreferredViewStyle = "clmv";
      };

      system.keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;  # Optional, if you want this
          userKeyMapping = [];  # Add any custom key mappings here
      };

# Used for backwards compatibility, please read the changelog before changing.
# $ darwin-rebuild changelog
      system.stateVersion = 5;

# The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
# Build darwin flake using:
# $ darwin-rebuild build --flake .#maverick
    darwinConfigurations."maverick" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "joerter";
          };
        }];
    };

    darwinPackages = self.darwinConfigurations."maverick".pkgs;
  };
}
