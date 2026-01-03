;; Dired and Miscellaneous Utility Functions
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
(defun cpp-declaration-from-declarator-node (func-declarator-node)
  "Get function declaration node from declarator node up the c++ syntax tree"
  (let ((func-declaration-node func-declarator-node))
    (while (and
            (not (string-equal "field_declaration" (treesit-node-type func-declaration-node)))
            (not (string-equal "declaration" (treesit-node-type func-declaration-node)))
            (not (string-equal "function_definition" (treesit-node-type func-declaration-node))))
      (setq func-declaration-node (treesit-node-parent func-declaration-node)))
    func-declaration-node))

(defun cpp-declaration-extract-return-type (func-declaration-node func-declarator-node)
  "Extract and return the return type of the function. This works because
declaration = type + declarator"
  (let* ((start (treesit-node-start func-declaration-node))
         (end (treesit-node-start func-declarator-node))
         (raw-text (buffer-substring-no-properties start end)))
    ;; Remove storage specifiers that shouldn't be in the type
    (setq raw-text (replace-regexp-in-string
                    "\\b\\(virtual\\|static\\|explicit\\|friend\\)\\b"
                    ""
                    raw-text))
    raw-text))

(defun cpp-identifier-convert-at-point ()
  "Converts the function declarator at point to the definition and yanks it into
the kill-ring. If point is not a function declarator, the caller is
notified via the echo buffer."
  (interactive)
  (let* ((identifier-node (treesit-node-at (point) 'cpp))
         (func-declarator-node (treesit-parent-until
                                identifier-node
                                (lambda (node) (string-equal "function_declarator" (treesit-node-type node)))))
         (func-declarator (treesit-node-text func-declarator-node))
         (func-identifier (treesit-node-text (treesit-node-child func-declarator-node 0))))
    (if (string-equal "function_declarator" (treesit-node-type func-declarator-node))
        ;; Search up the syntax tree, and collect classes/namespaces/templates
        (let* ((func-declaration-node (cpp-declaration-from-declarator-node func-declarator-node))
               (return-type (cpp-declaration-extract-return-type func-declaration-node func-declarator-node))
               (context-stack '())  ; includes: class/struct, namespace
               (template-stack '()) ; includes: template, requires
               (current-node func-declaration-node))
          (while current-node
            (cond
             ;; CASE: template declaration, push "template template_parameter_list"
             ((string-equal "template_declaration" (treesit-node-type current-node))
              (let* ((template-parameter-list-node (treesit-node-child-by-field-name current-node "parameters"))
                     (template-parameter-list (treesit-node-text template-parameter-list-node))
                     ;; Maybe this template has requires statement
                     (constraint-node (treesit-search-subtree
                                       current-node ; search until "requires_clause" type is found
                                       (lambda (node) (string-equal "requires_clause" (treesit-node-type node)))
                                       t   ; search not-named nodes (requires_clause is not-named)
                                       nil ; don't search backward
                                       1   ; search at most the same level as template
                                       ))
                     (constraint (if constraint-node
                                     (concat (treesit-node-text constraint-node) "\n")
                                   "")))
                (push (concat "template " template-parameter-list "\n" constraint) template-stack)))

             ;; CASE: class specifier, push "class_identifier::"
             ((string-equal "class_specifier" (treesit-node-type current-node))
              (let* ((class-identifier-node (treesit-node-child-by-field-name current-node "name"))
                     (class-identifier (treesit-node-text class-identifier-node)))
                (push (concat class-identifier "::") context-stack)))

             ;; CASE: struct specifier, push "struct_identifier::"
             ((string-equal "struct_specifier" (treesit-node-type current-node))
              (let* ((struct-identifier-node (treesit-node-child-by-field-name current-node "name"))
                     (struct-identifier (treesit-node-text struct-identifier-node)))
                (push (concat struct-identifier "::") context-stack)))

             ;; CASE: namespace definition, push "namespace_identifier::"
             ((string-equal "namespace_definition" (treesit-node-type current-node))
              (let* ((namespace-identifier-node (treesit-node-child-by-field-name current-node "name"))
                     (namespace-identifier (treesit-node-text namespace-identifier-node)))
                (push (concat namespace-identifier "::") context-stack))))

            ;; Loop step
            (setq current-node (treesit-node-parent current-node)))
          ;; Attach context-stack and template-stack to the function definition
          (let ((func-definition
                 (concat
                  (mapconcat #'identity template-stack "")
                  return-type
                  (mapconcat #'identity context-stack "")
                  func-declarator
                  "\n{\n\t\n}")))
            (kill-new func-definition))
          (message "%s's function definition is yanked." func-identifier))
      (message "[%s] is NOT a function declarator" func-declarator))))

(with-eval-after-load 'c++-ts-mode
  (define-key c++-ts-mode-map (kbd "C-c d") 'cpp-identifier-convert-at-point))
