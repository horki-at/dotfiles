;; Extra Utility Functions
(defun dired-untabify-file ()
  "In Dired, open the selected file, untabify the while buffer, and save."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (with-current-buffer (find-file-noselect file)
      (mark-whole-buffer)
      (untabify (region-beginning) (region-end))
      (save-buffer)
      (message "Untabified: %s" file))))

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "C-c t") 'dired-untabify-file)
  (define-key dired-mode-map (kbd "%") 'dired-create-empty-file))

;; C++ Course Utility Functions
(defvar rug/cpp-extensions '(".h" ".hh" ".ih" ".inl" ".cc" ".cpp" ".C")
  "List of C++ file extensions to look for.")

(defun rug/submit-extract-cpp-files-from (dir output-with-prefix)
  "Output sorted C++ files listed in `rug/cpp-extensions` in the given DIR."
  (interactive
   (list
    (read-directory-name "Directory: ")
    (y-or-n-p "Use prefixed output? ")))
  (let ((all-found-files '()))
    (dolist (ext rug/cpp-extensions)
      (let* ((ext-regex (concat (regexp-quote ext) "\\'"))
             (files-for-ext (directory-files dir nil ext-regex)))
        (setq all-found-files (append all-found-files files-for-ext))))
    (if all-found-files
        (let* ((prefix (file-name-nondirectory (directory-file-name dir)))
               (prefixed-files (mapcar (lambda (file)
                                         (format "%s/%s" prefix file))
                                       all-found-files))
               (files-result (if output-with-prefix prefixed-files all-found-files)))
          (insert (mapconcat 'identity files-result "\n") "\n"))
      (message "No matching C++ files found in %s" dir))))
