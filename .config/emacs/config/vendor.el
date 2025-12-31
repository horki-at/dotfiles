(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install 'use-package)
(require 'use-package)
(setq use-package-always-ensure t)

(use-package move-text
  :bind (("M-u" . move-text-up)
         ("M-d" . move-text-down)))
(use-package yasnippet
  :config
  (yas-global-mode)
  (setq yas-snippet-dirs '("~/.config/emacs/snippets/"))
  (setq yas/triggers-in-field nil))
(use-package hl-todo
  :config
  (global-hl-todo-mode))
(use-package projectile
  :config
  (projectile-mode)
  (setq projectile-project-search-path '("~/projects/"))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(use-package xclip
  :config (xclip-mode))
(use-package evil
  :config
  (evil-mode)
  (evil-set-initial-state 'dashboard-mode 'emacs)
  (evil-set-initial-state 'magit-status-mode 'emacs))
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
(use-package zenity-color-picker
  :bind (("C-c z" . zenity-cp-color-at-point-dwim)))
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
    (evil-define-key 'normal ggtags-mode-map (kbd "gb") 'pop-tag-mark)
    (evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)))
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Merry Christmas!"
        dashboard-startup-banner "~/.config/emacs/config/dashboard-banner.txt"
        dashboard-center-content t
        dashboard-vertically-center-content t
        dashboard-projects-backend 'projectile
        dashboard-items '((projects . 7)
                          (bookmarks . 5))
        dashboard-item-shortcuts '((projects . "p")
                                   (bookmarks . "b"))))
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
(use-package avy
  :ensure t
  :bind ("M-j" . avy-goto-char-timer))
(use-package lorem-ipsum
  :ensure t
  :bind ("C-c l" . lorem-ipsum-insert-paragraphs))
(use-package markdown-mode
  :ensure t)
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox))
