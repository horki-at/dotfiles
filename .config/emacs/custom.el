;; Customization of Emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("10c74c53f103ba82e930dc040fa66ed427a0080e118d5bb97abd1b08922fe106"
     "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c"
     "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7"
     "cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2"
     "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569"
     "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4"
     "b1cb7aeccbefaea58b7979562c727855771f2530a776be5d02b80ebdfcda12e6"
     "adb2c32015c42ac06e4cadc87796c6255d7f7d107a2a5f9650672fe90fedd244"
     "6f177b9a2579197e650918c8e53440997063b543fc854763e3597b5a4c33860d"
     "a60b04e5c0fef30209f9576f04651938472b57cb1dae0375d80a53a78f515f69"
     "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d"
     "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757"
     "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
     "75b371fce3c9e6b1482ba10c883e2fb813f2cc1c88be0b8a1099773eb78a7176"
     "18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9"
     "c5532fb4c3025eb02c9452ba64e4671fcd33900db00b5ea10b4bb919f32f70a5" default))
 '(package-selected-packages
   '(evil ggtags hl-todo move-text posframe projectile swiper use-package xclip
          yasnippet zenity-color-picker))
 '(safe-local-variable-values
   '((tasks/alist ("build" . "gcc -std=c99 *.c -o suguru -DDEBUG")
                  ("release" . "gcc -std=c99 *.c -o suguru")
                  ("run" . "./suguru") ("test1" . "cat test1 | ./suguru")
                  ("test2" . "cat test2 | ./suguru")
                  ("test3" . "cat test3 | ./suguru"))
     (tasks/alist ("build" . "gcc -std=c99 *.c -o suguru -DDEBUG")
                  ("run" . "./suguru") ("test1" . "cat test1 | ./suguru")
                  ("test2" . "cat test2 | ./suguru")
                  ("test3" . "cat test3 | ./suguru"))
     (tasks/alist ("build" . "gcc -std=c99 *.c -o suguru -DDEBUG")
                  ("run" . "./suguru"))
     (tasks/alist ("build" . "gcc -std=c99 *.c -o suguru") ("run" . "./suguru"))
     (projectile-project-root-files-top-down-recurring "Makefile"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-directory ((t (:weight bold))))
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-comment-face ((t (:italic t))))
 '(font-lock-constant-face ((t nil)))
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-keyword-face ((t nil)))
 '(font-lock-string-face ((t nil)))
 '(font-lock-type-face ((t nil)))
 '(font-lock-variable-name-face ((t nil))))
