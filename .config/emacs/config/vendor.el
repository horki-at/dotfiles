(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install 'use-package)

(require 'use-package)
(setq use-package-always-ensure t)

;; Text movement utilities
(use-package move-text
  :bind (("M-u" . move-text-up)
         ("M-d" . move-text-down)))

;; Completion Engine
(use-package ivy
  :config
  (ivy-mode))
(use-package swiper
  :bind (("C-s" . swiper)))

;; Snippets Engine
(use-package yasnippet
  :config
  (yas-global-mode)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (setq yas/triggers-in-field nil))

;; Discoverability
(use-package which-key
  :config
  (which-key-mode))

;; Todo highlighting
(use-package hl-todo
  :config
  (global-hl-todo-mode))

;; Projectile
(use-package projectile
  :config
  (projectile-mode)
  (setq projectile-project-search-path '("~/projects/" "~/probe/"))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Clipboard for the terminal emacs
(use-package xclip
  :config (xclip-mode))

;; Because I am used to vim
(use-package evil
  :config
  (evil-mode))

;; Extra
(use-package zenity-color-picker
  :bind (("C-c z" . zenity-cp-color-at-point-dwim)))

;; Global GNU Configuration --- Tags System
(use-package ggtags
  :ensure t
  :hook ((c-mode . ggtags-mode)
         (c++-mode . ggtags-mode))
  :config
  (setenv "GTAGSLIBPATH" (expand-file-name "~/.config/emacs/tags/"))
  (setenv "GTAGSCONF" (expand-file-name "~/.globalrc"))
  (setq ggtags-split-window-function #'split-window-horizontally)
  (with-eval-after-load 'evil
    (evil-define-key 'normal ggtags-mode-map (kbd "gd") 'ggtags-find-tag-dwim)
    (evil-define-key 'normal ggtags-mode-map (kbd "C-]") 'ggtags-find-tag-dwim)
    (evil-define-key 'normal ggtags-mode-map (kbd "gb") 'pop-tag-mark)))
