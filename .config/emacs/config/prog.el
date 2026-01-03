(defun my-c-style ()
  (c-set-style "bsd")
  (which-function-mode 1)
  (setq c-basic-offset 2))

(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'c-or-c++-ts-mode-hook 'my-c-style)
(add-hook 'c-or-c++-ts-mode-hook 'c++-ts-mode)
(add-hook 'c-or-c++-ts-mode-hook 'my-c-style)

(add-to-list 'auto-mode-alist '("\\.ih\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c-or-c++-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c-or-c++-ts-mode))

(keymap-global-set "C-c c" 'compile)
(keymap-global-set "C-c r" 'recompile)

(setq treesit-language-source-alist
      '((cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.22.3")
        (c "https://github.com/tree-sitter/tree-sitter-c" "v0.23.6")))
