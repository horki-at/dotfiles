;;; "Compiled" snippets and support files for `c-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'c-mode
                     '(("pln" "printf(\"\\n\");$0" "insert printf(\"\\n\");" nil
                        ("programming embedded") nil
                        "/home/horki/.config/emacs/snippets/c-mode/pln" nil nil)
                       ("ln" "\"\\n\"$0" "insert a new line." nil
                        ("programming embedded") nil
                        "/home/horki/.config/emacs/snippets/c-mode/ln" nil nil)
                       ("lh" "#include \"$1.$2h\"\n\n$0" "insert a local header"
                        nil ("programming embedded") nil
                        "/home/horki/.config/emacs/snippets/c-mode/lh" nil nil)
                       ("guard"
                        "#ifndef INCLUDED_$1_\n#define INCLUDED_$1_\n\n$0\n\n#endif // INCLUDED_$1_"
                        "C-style include header guards." nil
                        ("programming embedded") nil
                        "/home/horki/.config/emacs/snippets/c-mode/guard" nil
                        nil)
                       ("gh" "#include <$1.$2h>\n\n$0" "insert a global header"
                        nil ("programming embedded") nil
                        "/home/horki/.config/emacs/snippets/c-mode/gh" nil nil)))


;;; Do not edit! File generated at Sat Dec 27 15:54:20 2025
