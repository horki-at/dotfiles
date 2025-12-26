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

;; General C++ Utilities
(defun cpp-extract-class-name ()
  "Extract the first class name to the top in the current buffer."
  (save-excursion
    (when (re-search-backward "\\b\\(?:struct\\|class\\)\\b\\s-+\\([A-Za-z0-9_]+\\)" nil t)
      (match-string 1))))

;; TODO: Problems with this functions are:
;; 1) no nesting in default arguments
;; 2) doesn't handle noexcept(...) syntax at all
;; 3) doesn't handle attributes (e.g., [[maybe_unused]])
(defun cpp-copy-declaration (start end)
  "Copy C++ declaration in region and transform it into a definition stub."
  (interactive "r")
  (let* ((decl (buffer-substring-no-properties start end))
         (prefix (if (string-match "\\b\\(static\\)\\b" decl) "//static\n"))
         (class-name (cpp-extract-class-name))
         (def decl))

    ;; strip forward keywords that can exist in C++ declarations
    (setq def (replace-regexp-in-string "\\b\\(virtual\\|inline\\|static\\|friend\\|explicit\\)\\b\\s-+" "" def))

    ;; strip backward keywords that can exist in C++ declarations
    (setq def (replace-regexp-in-string "\\s-+\\b\\(override\\|noexcept\\)\\b" "" def))

    ;; remove default arguments (e.g., = 0, = default, = delete, etc.)
    (setq def (replace-regexp-in-string "\\s-+=[^,);]+" "" def))

    ;; remove trailing semicolon and comment starting with /
    (setq def (replace-regexp-in-string "\\s-*;\\s-*\\(?:/.*\\)?" "" def))

    ;; prepend ClassName:: to the function name if class-name exists
    (when class-name
      (setq def (replace-regexp-in-string
                 "\\([A-Za-z0-9_~]+\\s-*(\\|\\boperator\\b\\)"
                 (concat class-name "::\\1")
                 def)))

    ;; Format as a stub and put it in the kill-ring
    (kill-new (concat prefix (string-trim def) "\n{\n\t\n}"))
    (message "Definition successfully stub copied.")))

(global-set-key (kbd "C-c y d") #'cpp-copy-declaration)
(with-eval-after-load 'evil
  (evil-define-key 'visual c++-mode-map (kbd "g y") 'cpp-copy-declaration))
