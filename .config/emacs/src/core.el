;; Performance
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ; 1mb

;; Disable backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(add-hook 'prog-mode-hook 'hs-minor-mode)
(which-function-mode 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(setq-default fill-column 100)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(global-completion-preview-mode)
(column-number-mode 1)
(menu-bar-mode 0)
(global-display-fill-column-indicator-mode)
(global-hl-line-mode)

(setq c-basic-offset 2)
(setq c-default-style "bsd")
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.hh\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ih\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c-or-c++-ts-mode))

(setq treesit-language-source-alist
      '((cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.22.3")
        (c "https://github.com/tree-sitter/tree-sitter-c" "v0.23.6")))

(keymap-global-set "C-c r" 'recompile)

(custom-set-faces
 '(dired-directory ((t (:weight bold))))
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:italic t))))
 '(font-lock-constant-face ((t nil)))
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-keyword-face ((t (:weight bold))))
 '(font-lock-string-face ((t (:foreground "#a36e08"))))
 '(font-lock-type-face ((nil)))
 '(font-lock-variable-name-face ((t nil))))
