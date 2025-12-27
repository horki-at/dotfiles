;;; "Compiled" snippets and support files for `snippet-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippet-mode
                     '(("snip"
                        "# -*- mode: snippet -*-\n# name: $1\n# key: ${2:`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`}\n# group: $3\n# --\n$0"
                        "snippet snippet" nil ("utility") nil
                        "/home/horki/.config/emacs/snippets/snippet-mode/snip"
                        nil nil)))


;;; Do not edit! File generated at Sat Dec 27 15:54:20 2025
