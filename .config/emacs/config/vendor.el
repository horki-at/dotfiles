(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install 'use-package)
(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))
(use-package swiper
  :bind (("C-s" . swiper)))
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
  (evil-set-initial-state 'magit-status-mode 'emacs))
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
(use-package zenity-color-picker
  :bind (("C-c z" . zenity-cp-color-at-point-dwim)))
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
(use-package lorem-ipsum
  :ensure t
  :bind ("C-c l" . lorem-ipsum-insert-paragraphs))
(use-package markdown-mode
  :ensure t)
