(defun my-c-style ()
  (c-set-style "bsd")
  (c-set-offset 'member-init-intro 0)
  (setq c-basic-offset 2)
  (hs-minor-mode 1)
  (setq indent-tabs-mode nil))

(add-hook 'c-mode-hook 'my-c-style)
(add-hook 'c++-mode-hook 'my-c-style)

(add-to-list 'auto-mode-alist '("\\.ih\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))

(keymap-global-set "C-c c" 'compile)
(keymap-global-set "C-c r" 'recompile)
