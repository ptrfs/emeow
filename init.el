;; The Emacs Config
;; Font
(set-frame-font "JetBrains Mono 9")
(set-face-attribute 'default nil :font "JetBrains Mono 9")
(set-fontset-font t nil "JetBrains Mono" nil 'append)

;; Splash message
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message "nyasha")

;; UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom
  (straight-use-package-by-default t)
  (use-package-compute-statistics t))

;; Install GCMH
(use-package gcmh :init (gcmh-mode))

;; Install Evil mode
(use-package evil
  :init (evil-mode)
  (evil-set-undo-system 'undo-redo))

;; Smartparens for autopairs
(use-package smartparens :defer t
  :hook (prog-mode)
  :init (smartparens-global-mode))

;; Markdown
(use-package markdown-mode :defer t)

;; Treesitter
(use-package tree-sitter-langs :defer t)

;; LSP
(use-package eglot :defer t :straight nil :ensure nil
  :init (add-hook 'c++-mode-hook #'eglot-ensure))

;; Corfu
(use-package company
  :hook (prog-mode))

(use-package company-box
  :init (add-hook 'company-mode-hook #'company-box-mode)
  :custom (company-box-scrollbar nil))

;; Vertico
(use-package vertico :ensure t
  :init (vertico-mode))

(use-package mood-line
  :init (mood-line-mode)
  :custom (mood-line-glyph-alist mood-line-glyphs-ascii))

;; Echo area
(use-package maple-echoarea
  :straight (echoarea :type git :host github :repo "honmaple/emacs-maple-echoarea")
  :commands (maple-echoarea-enable maple-echoarea-disable)
  :init (add-hook 'after-init-hook 'maple-echoarea-mode))

;; Noise reduction
(setq log-warning-minimum-level :error)

;; Org
(use-package org :straight nil :ensure nil
  :hook ((org-mode  . org-indent-mode)
         (org-mode  . visual-line-mode)))

;; Projectile
(use-package projectile :defer t
  :init (projectile-mode)
  :bind (("C-c p" . projectile-find-file))
  :config (setq projectile-project-search-path '(("~/Documents/" . 1))))

;; Themes
(use-package doom-themes :straight t)
(use-package gruber-darkest-theme
  :straight (gruber-darkest-theme :type git :host github :repo "ptrfs/gruber-darkest-theme"))

;; Circadian
(use-package circadian :straight t
  :custom
  (calendar-latitude -18.013760)
  (calendar-longitude 31.099600)
  :config
  (setq circadian-themes '((:sunrise . doom-earl-grey)
                           (:sunset . gruber-darkest))))
(circadian-setup)

