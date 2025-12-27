;; Performance
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ; 1mb

;; Disable backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq ring-bell-function 'ignore)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(setq-default fill-column 80)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(global-completion-preview-mode)
(column-number-mode 1)
(show-paren-mode 1)
(menu-bar-mode 0)
(ido-mode 1)
(ido-everywhere 1)
(global-display-fill-column-indicator-mode)
(global-hl-line-mode)

(custom-set-faces
 '(dired-directory ((t (:weight bold))))
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:italic t))))
 '(font-lock-constant-face ((t nil)))
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-keyword-face ((t nil)))
 '(font-lock-string-face ((t nil)))
 '(font-lock-type-face ((t nil)))
 '(font-lock-variable-name-face ((t nil))))
