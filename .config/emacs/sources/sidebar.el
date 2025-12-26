;; Sidebar Helper Plugin
(defun sidebar/create-buffer (name header color &optional buffer-create slot)
  "Create a buffer in the side window with NAME."
  "NAME          - name of the buffer"
  "HEADER        - header line string of the buffer"
  "COLOR         - color face background of the buffer in the sidebar"
  "BUFFER-CREATE - function symbol that returns a buffer"
  "SLOT          - slot number of the buffer (useful for stacking)"
  (interactive
   (list
    (read-string "Enter the name of the buffer: ")   ; obtain NAME
    (read-string "Enter the header of the buffer: ") ; obtain HEADER
    (read-string "Enter the color of the buffer: ")  ; obtain COLOR
    (if (yes-or-no-p "Use a custom buffer creation function? ")
        (nil))                              ; TODO: implement this
    (if (yes-or-no-p "Use a custom slot? ")          ; obtain optional SLOT
        (read-number "Enter the slot of the buffer: "))))
  (let ((display-action `(display-buffer-in-side-window
                          (side . right)
                          (slot . ,(or slot 0))
                          (window-width . 0.45)
                          (preserve-size . (t . nil))))
        (buf (if buffer-create
                 (funcall buffer-create)
               (get-buffer-create name))))
    (unless (bufferp buf)
      (error "buffer-create must return a buffer, got: %s" buf))
    (with-current-buffer buf
      (rename-buffer name nil)
      (face-remap-add-relative 'default `(:background ,color))
      (setq-local mode-line-format nil)
      (setq-local header-line-format header)
      (setq-local no-other-window t)
      (setq-local tabtag "sidebar-main")
      (tab-line-mode 1))
    (select-window (display-buffer buf display-action))))

(defun sidebar/tab-filter-by-tabtag ()
  "Group windows into tabs using tabtag local variable"
  (let ((group (buffer-local-value 'tabtag (current-buffer))))
    (if group
        (cl-remove-if-not
         (lambda (buf) (equal (buffer-local-value 'tabtag buf) group))
         (buffer-list)))
    (tab-line-tabs-window-buffers)))    ; for buffers without tabtag
(setq tab-line-tabs-buffer-list-function #'sidebar/tab-filter-by-tabtag)
