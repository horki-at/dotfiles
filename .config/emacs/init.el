(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(load-library "core")
(load-library "prog")
(load-library "vendor")

(add-to-list 'load-path (expand-file-name "sources" user-emacs-directory))
(load-library "glossary")
(load-library "sticky-note")
(load-library "utils")

(let ((local-config (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-config)
    (load local-config)))
