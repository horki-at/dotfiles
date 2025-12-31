(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(load-library "core")
(load-library "prog")
(load-library "vendor")

(add-to-list 'load-path (expand-file-name "sources" user-emacs-directory))
(load-library "tasks")
(load-library "sticky-note")
(load-library "sidebar")
(load-library "utils")
