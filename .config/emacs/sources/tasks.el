;; Tasks Runner (similar to Visual Studio Code tasks.json)

(defvar-local tasks/alist nil
  "An alist of (TaskName . Cmd) for the current project.")

(defun tasks/run-task ()
  "Prompt for a task defined in the local tasks/alist and execute it."
  (interactive)
  (if (not tasks/alist)
      (user-error "No tasks defined. Create it in .dir-locals.el")
    (let* ((choices (mapcar #'car tasks/alist))
           (selected (completing-read "Run task: " choices))
           (cmd (cdr (assoc selected tasks/alist)))
           (root (projectile-project-root)))
      (unless root
        (user-error "Not in a project, cannot run the command"))
      (projectile-with-default-dir root
        (cond
         ((stringp cmd) (compile cmd))    ; string => run shell command
         ((functionp cmd) (funcall cmd))  ; elisp func => execute it in emacs
         (t (user-error "Invalid task format: %s" cmd)))))))
(global-set-key (kbd "C-c t") #'tasks/run-task)
