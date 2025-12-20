;; Sticky Notes Plugin
(defvar-local sticky-note-file nil
  "Sticky note file that will be used per-project in the sticky-notes sidebar.")

(defface sticky-notes-sidebar-background
  '((t :background "#a8bba3"))
  "Background face for sticky notes sidebar.")

(defun show-sticky-notes ()
  (interactive)
  (let* ((file (or sticky-note-file
                   (setq sticky-note-file
                         (read-file-name "Choose sticky note file: "))))
         (buf (find-file-noselect file))
         (win (get-buffer-window buf)))
    (if win
        (delete-window win)
      (display-buffer-in-side-window
       buf '((side . right)
             (slot . 0)
             (window-width . 0.35)))
      (select-window (get-buffer-window buf))
      (buffer-face-set 'sticky-notes-sidebar-background)
      (rename-buffer "*sticky-note*" t)
      (setq-local header-line-format "QUESTS"
                  mode-line-format nil
                  display-line-numbers nil
                  cursor-type nil))))

(defun change-sticky-note-file ()
  (interactive)
  (setq sticky-note-file (read-file-name "Choose sticky note file: "))
  (show-sticky-notes))

(global-set-key (kbd "C-c s") #'show-sticky-notes)
(global-set-key (kbd "C-c M-s") #'change-sticky-note-file)
