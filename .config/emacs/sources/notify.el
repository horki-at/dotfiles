;; Notify Plugin (used by Glossary, Reminders, etc.)

(defvar ascii-art '())

(defvar notify-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "q") #'notify/restored-exit-popup)
    map))

(define-derived-mode notify-mode special-mode "Notify Plugin"
  "Major mode for the Notify system.")

(with-eval-after-load 'evil
  (evil-set-initial-state 'notify-mode 'emacs))

(defun notify/restored-exit-popup ()
  (interactive)
  (let ((buf (get-buffer "*notify*")))
    (when saved-window-config
      (set-window-configuration saved-window-config)
      (setq saved-window-config nil))
    (when buf (kill-buffer buf))))

(defun notify/dispatch-message (msg use-art)
  (interactive
   (list
    (read-string "Enter the message: ")               ; get the message text
    (yes-or-no-p "Use ASCII art for the message? "))) ; use-art?
  (setq saved-window-config (current-window-configuration))
  (let ((buf (get-buffer-create "*notify*"))
        (art (nth (random (length ascii-art)) ascii-art)))
    (let ((inhibit-read-only t))
      (with-current-buffer buf
        (notify-mode)
        (erase-buffer)
        (notify/insert-text msg use-art art)
        (goto-char 0)
        (setq-local cursor-type nil)
        (use-local-map notify-mode-map))
      (delete-other-windows)
      (switch-to-buffer buf))))

(defun notify/insert-text (msg use-art art)
  (let ((art-lines (string-split art "\n"))
        (msg-lines (string-split msg "\n"))
        (padding "        "))
    (if use-art
        (dotimes (i (length art-lines))
          (let ((current-art-line (nth i art-lines))
                (current-msg-line (or (nth i msg-lines) "")))
            (insert current-art-line padding current-msg-line "\n")))
      (insert msg))))
