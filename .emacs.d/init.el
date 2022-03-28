(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq use-dialog-box nil)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode)
;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

(setq-default display-line-numbers 'visual
              display-line-numbers-widen t
              ;; this is the default
              display-line-numbers-current-absolute t)

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 150)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 150)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 160 :weight 'regular)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer jo/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")
)

(general-imap "j"
    (general-key-dispatch 'self-insert-command
    :timeout 0.25
    "k" 'evil-normal-state))


(jo/leader-keys
  :keymaps 'normal
  ;; windows
  "w%" '(evil-window-vsplit :which-key "split window vertically")
  "w\"" '(evil-window-split :which-key "split window horizontally")
  "wd" '(evil-window-delete :which-key "close window")
  "wj" '(evil-window-down :which-key "window down")
  "wh" '(evil-window-left :which-key "window left")
  "wk" '(evil-window-up :which-key "window up")
  "wl" '(evil-window-right :which-key "window right")
  ;; files
  "fs" '(evil-write :which-key "write file")
  "ff" '(counsel-find-file :which-key "find file")
  ;; buffers
  "be" '(eval-buffer :which-key "eval-buffer")
  "bb" '(counsel-switch-buffer :which-key "switch buffer")
  "bcc" '(comment-region :which-key "comment region")
  "bcu" '(uncomment-region :which-key "uncomment region")
  "bd" '(kill-buffer :which-key "kill-buffer")
  "bota" '(origami-toggle-all-nodes :which-key "origami toggle all")
  "botn" '(origami-toggle-node :which-key "origami toggle node")
  "botr" '(origami-recursively-toggle-node :which-key "origami toggle node recursively")
  "bp" '(prettier-js :which-key "run prettier on buffer")
  ;; projectile
  "ps" '(projectile-switch-project :which-key "switch project")
  "pf" '(projectile-find-file :which-key "find file")
  "pr" '(counsel-projectile-rg :which-key "rip grep")
  "pe" '(projectile-run-eshell :which-key "run eshell")
  ;; magit
  "gs" '(magit :which-key "git status")
  ;; org mode
  "ot" '(org-babel-tangle :which-key "org babel tangle")
  ;; lsp
  "lca" '(lsp-execute-code-action :which-key "code action")
  "le" '(lsp-treemacs-errors-list :which-key "errors")
  "lfd" '(lsp-find-definition :which-key "find definition")
  "lfrr" '(lsp-find-references :which-key "find references")
  "lfrn" '(lsp-ui-find-next-reference :which-key "next reference")
  "lfrp" '(lsp-ui-find-prev-reference :which-key "prev reference")
  "lrr" '(lsp-rename :which-key "rename")
  )

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package smartparens
    :config
    (add-hook 'prog-mode-hook 'smartparens-mode))

(add-hook 'prog-mode-hook 'electric-pair-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)     ;

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-dracula") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-tree)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
      :diminish projectile-mode
      :config (projectile-mode)
      :custom ((projectile-completion-system 'ivy))
      :demand t
      :bind-keymap
      ("C-c p" . projectile-command-map)
      :init
      (when (file-directory-p "~/gitlab.pdev.io")
        (setq projectile-project-search-path '(("~/gitlab.pdev.io" . 2) ("~/github" . 2) "~/org" )))
      (setq projectile-switch-project-action #'projectile-dired))

    (use-package counsel-projectile
      :config (counsel-projectile-mode))

(setq projectile-sort-order 'recently-active)
(setq projectile-enable-caching t)

(use-package helpful
    :custom
    (counsel-describe-function-function #'helpful-callable)
    (counsel-describe-variable-function #'helpful-variable)
    :bind
    ([remap describe-function] . helpful-function)
    ([remap describe-symbol] . helpful-symbol)
    ([remap describe-variable] . helpful-variable)
    ([remap describe-command] . helpful-command)
    ([remap describe-key] . helpful-key))

(use-package yaml-mode)
  (use-package origami) ;; code folding

(use-package magit)

  (use-package forge
    :after magit
    :init
    (setq auth-sources '("~/.authinfo")))
(add-to-list 'forge-alist '("gitlab.pdev.io" "gitlab.pdev.io/api/v4" "gitlab.pdev.io" forge-gitlab-repository))

(defun jo/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file ))
  (setq lsp-modeline-code-actions-segments '(count icon))
  (setq lsp-ui-sideline-enable nil)
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . jo/lsp-mode-setup)
  :bind (:map lsp-mode-map
  ("TAB" . completion-at-point))
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

  ;; disabled for performance reasons
;; (use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package company
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0))

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-use-plists t)
(setq lsp-idle-delay 0.500) ;; fine tune this value for how often lsp-mode refreshes

(use-package typescript-mode
  :ensure t
  :mode ("\\.tsx?$" "\\.jsx?$")
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package tree-sitter :ensure t)
(use-package tree-sitter-langs :ensure t)
(require 'tree-sitter)
(require 'tree-sitter-langs)
(add-hook 'typescript-mode-hook #'tree-sitter-hl-mode)

(use-package prettier-js
    :config
    (add-hook 'typescript-mode 'prettier-js-mode))

(use-package add-node-modules-path)

(use-package web-mode
    :mode ("\\.html\\'")
    :config
    (setq web-mode-markup-indent-offset 2))

(use-package zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

(defun jo/use-eslint-from-node-modules ()
"Set local eslint if available."
(let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	(eslint (and root
		    (expand-file-name "node_modules/eslint/bin/eslint.js"
					root))))
    (when (and eslint (file-executable-p eslint))
    (setq-local flycheck-javascript-eslint-executable eslint))))

(defun jo/configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  (evil-normalize-keymaps)

  (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt)

(use-package eshell
  :hook (eshell-first-time-mode . jo/configure-eshell)
  :config

  (with-eval-after-load 'esh-opt
    (setq eshell-destroy-buffer-when-process-dies t)
    (setq eshell-visual-commands '("htop" "zsh" "vim")))

  (eshell-git-prompt-use-theme 'powerline))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package flycheck
    :config
    (add-hook 'after-init-hook 'global-flycheck-mode)
    (add-hook 'flycheck-mode-hook 'jo/use-eslint-from-node-modules)
    (add-to-list 'flycheck-checkers 'proselint)
    (setq-default flycheck-highlighting-mode 'lines)
    ;; Define fringe indicator / warning levels
    (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
      (vector #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00011100
              #b00111110
              #b00111110
              #b00111110
              #b00011100
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000))
    (flycheck-define-error-level 'error
      :severity 2
      :overlay-category 'flycheck-error-overlay
      :fringe-bitmap 'flycheck-fringe-bitmap-ball
      :fringe-face 'flycheck-fringe-error)
    (flycheck-define-error-level 'warning
      :severity 1
      :overlay-category 'flycheck-warning-overlay
      :fringe-bitmap 'flycheck-fringe-bitmap-ball
      :fringe-face 'flycheck-fringe-warning)
    (flycheck-define-error-level 'info
      :severity 0
      :overlay-category 'flycheck-info-overlay
      :fringe-bitmap 'flycheck-fringe-bitmap-ball
      :fringe-face 'flycheck-fringe-info))



(defun jo/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1))

(defun jo/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . jo/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (jo/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun jo/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . jo/org-mode-visual-fill))