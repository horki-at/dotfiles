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
  (setq projectile-project-search-path '("~/projects/" "~/probe/"))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(use-package xclip
  :config (xclip-mode))
(use-package evil
  :config
  (evil-mode)
  (evil-set-initial-state 'dashboard-mode 'emacs))
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
    (evil-define-key 'normal ggtags-mode-map (kbd "gb") 'pop-tag-mark)))
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Damn you are sexy :3"
        dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-vertically-center-content t
        dashboard-projects-backend 'projectile
        dashboard-items '((projects . 7)
                          (bookmarks . 5))
        dashboard-item-shortcuts '((projects . "p")
                                   (bookmarks . "b"))))
