;; Docbar --- Documentation Bar Plugin
(defvar docbar/alist
  '(("cpp" . "https://en.cppreference.com/w/")
    ("dafny" . "https://dafny.org/latest/DafnyRef/DafnyRef")
    ("elisp" . "https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html"))
  "List of documentation resources for Docbar.")

(defun docbar/open-docs (resource)
  "Open the documentation of the resource in the side window."
  (interactive
   (list
    (completing-read "Choose the resource: " docbar/alist)))
  (let* ((target (alist-get resource docbar/alist nil nil #'string=))
         (docbar-bufname (format "*docbar-%s*" resource)))
    (if (get-buffer docbar-bufname)
        (error "%s already exists, so can't create a new buffer" docbar-bufname)
      (if (string-match "^http" target)
          (sidebar/create-buffer
           docbar-bufname
           resource
           "#D1A7A0"
           (lambda () (docbar/create-new-link-buffer target)))
        (error "docbar doesn't support target %s" target)))))
(global-set-key (kbd "C-c d o") #'docbar/open-docs)

(defun docbar/create-new-link-buffer (target)
  "Create a new buffer with EWW opening the link specified by TARGET."
  (save-window-excursion
    (eww target)
    (current-buffer)))
