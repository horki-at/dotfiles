;;; "Compiled" snippets and support files for `c++-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'c++-mode
                     '(("std" "using namespace std;$0\n"
                        "put using namespace std" nil ("programming embedded")
                        nil "/home/horki/.emacs.snippets/c++-mode/std" nil nil)
                       ("lh" "#include \"$1.$2h\"\n\n$0" "insert a local header"
                        nil ("programming embedded") nil
                        "/home/horki/.emacs.snippets/c++-mode/lh" nil nil)
                       ("guard"
                        "#ifndef INCLUDED_$1_\n#define INCLUDED_$1_\n\n$0\n\n#endif // INCLUDED_$1_"
                        "C-style include header guards." nil
                        ("programming embedded") nil
                        "/home/horki/.emacs.snippets/c++-mode/guard" nil nil)
                       ("gh" "#include <$1.$2h>\n\n$0" "insert a global header"
                        nil ("programming embedded") nil
                        "/home/horki/.emacs.snippets/c++-mode/gh" nil nil)))


;;; Do not edit! File generated at Sat Dec 20 02:10:19 2025
