;;; "Compiled" snippets and support files for `latex-mode'  -*- lexical-binding:t -*-
;;; Snippet definitions:
;;;
(yas-define-snippets 'latex-mode
                     '(("uni" "\\bigcup_{i=$1}^{$2}{$3}$0\n"
                        "discrete union using variable i" nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/uni" nil
                        nil)
                       ("un" "\\bigcup_{$1}{$2}$0\n" "general discrete union"
                        nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/un" nil
                        nil)
                       ("sumj" "\\sum_{j=$1}^{$2}{$0}"
                        "discrete summation using variable j" nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/sumj" nil
                        nil)
                       ("sumi" "\\sum_{i=$1}^{$2}{$0}\n"
                        "discrete summation using variable i" nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/sumi" nil
                        nil)
                       ("sum" "\\sum_{$1}{$0}" "general discrete summation" nil
                        ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/sum" nil
                        nil)
                       ("sol" "\\begin{solution}\n  $0\n\\end{solution}"
                        "solution block from common/common.tex" nil
                        ("environment") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/sol" nil
                        nil)
                       ("mod" "$1 \\equiv $2 (\\mod $3)$0"
                        "congruences module some number" nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/mod" nil
                        nil)
                       ("lr" "\\left$1 $3 \\right$2$0\n"
                        "left and right pair of enclosing" nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/lr" nil
                        nil)
                       ("ini" "\\bigcap_{i=$1}^{$2}{$3}$0\n"
                        "discrete intersection using variable i" nil ("math")
                        nil "/home/horki/.config/emacs/snippets/latex-mode/ini"
                        nil nil)
                       ("in" "\\bigcap_{$1}{$2}$0\n"
                        "general discrete intersection" nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/in" nil
                        nil)
                       ("frac" "\\frac{${1:numerator}}{${2:denominator}}$0"
                        "fraction" nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/frac" nil
                        nil)
                       ("eql"
                        "\\begin{equation} \\label{eq:$1}\n  $0\n\\end{equation}"
                        "equation block with a label" nil ("environment") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/eql" nil
                        nil)
                       ("eq" "\\begin{equation*}\n  $0\n\\end{equation*}"
                        "equation block with no label" nil ("environment") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/eq" nil
                        nil)
                       ("enum" "\\begin{enumerate}\n\\item $0\n\\end{enumerate}"
                        "enumerate block" nil ("environment") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/enum" nil
                        nil)
                       ("align" "\\begin{align*}\n  $0\n\\end{align*}"
                        "align* block" nil ("environment") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/align"
                        nil nil)
                       ("N+" "\\mathbb{N}^+"
                        "the set of natural numbers without 0" nil ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/Np" nil
                        nil)
                       ("N" "\\mathbb{N}\n" "the set of natural numbers" nil
                        ("math") nil
                        "/home/horki/.config/emacs/snippets/latex-mode/N" nil
                        nil)))


;;; Do not edit! File generated at Sat Dec 27 15:54:20 2025
