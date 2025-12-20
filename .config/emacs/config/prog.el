(defun my-c-style ()
  (c-set-style "bsd")
  (setq c-basic-offset 2)
  (setq indent-tabs-mode nil))

(add-hook 'c++-mode-hook 'my-c-style)
(add-to-list 'auto-mode-alist '("\\.ih\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))

(keymap-global-set "C-c c" 'compile)
(keymap-global-set "C-c r" 'recompile)
