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
