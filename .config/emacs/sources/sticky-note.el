;; Sticky Notes Plugin
(defvar-local sticky-notes/file nil
  "Sticky note file that will be used per-project in the sticky-notes sidebar.")

(defun sticky-notes/show ()
  (interactive)
  (let ((file (or sticky-notes/file
                  (setq sticky-notes/file
                        (read-file-name "Choose sticky note file: ")))))
    (sidebar/create-buffer "*sticky-notes*"
                           "Sticky Notes"
                           "#D2E0BF"
                           (lambda () (find-file-noselect file)))))

(defun sticky-notes/change-file ()
  (interactive)
  (setq sticky-notes/file (read-file-name "Choose sticky note file: "))
  (sticky-notes/show))

(global-set-key (kbd "C-c s") #'sticky-notes/show)
(global-set-key (kbd "C-c M-s") #'sticky-notes/change-file)
