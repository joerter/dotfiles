;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Oerter"
      user-mail-address "john@redgreenrefactor.dev")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Dank Mono" :size 15 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Avenir next" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

 (setq projectile-project-search-path '(("~/github" . 2) "~/org" ))
(add-hook! 'org-mode-hook
           #'+org-pretty-mode #'mixed-pitch-mode)

(after! org
  (custom-set-faces!
    '(org-document-title :height 1.3)
    '(org-level-1 :inherit outline-1 :weight extra-bold :height 1.4)
    '(org-level-2 :inherit outline-2 :weight bold :height 1.15)
    '(org-level-3 :inherit outline-3 :weight bold :height 1.12)
    '(org-level-4 :inherit outline-4 :weight bold :height 1.09)
    '(org-level-5 :inherit outline-5 :weight semi-bold :height 1.06)
    '(org-level-6 :inherit outline-6 :weight semi-bold :height 1.03)
    '(org-level-7 :inherit outline-7 :weight semi-bold)
    '(org-level-8 :inherit outline-8 :weight semi-bold)
    ;; Ensure that anything that should be fixed-pitch in org buffers appears that
    ;; way
    '(org-block nil :foreground nil :inherit 'fixed-pitch)
    '(org-code nil   :inherit '(shadow fixed-pitch))
    '(org-table nil   :inherit '(shadow fixed-pitch))
    '(org-verbatim nil :inherit '(shadow fixed-pitch))
    '(org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    '(org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    '(org-checkbox nil :inherit 'fixed-pitch)))
