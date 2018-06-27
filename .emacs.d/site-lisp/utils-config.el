;;;###autoload
(defun enca-detect-coding (arg)
  (if (not (and (eq (car arg) 'insert-file-contents) (nth 1 arg)))
      'undecided
    (let* ((target (nth 1 arg))
	  (enca-buffer (generate-new-buffer " *enca*"))
	  (charset nil)
	  (run-enca (if (atom target)
			(lambda ()
			  (if (file-exists-p target)
			      (call-process "enca" target
					    enca-buffer nil "-m")
			    1))
		      (lambda ()
			(with-current-buffer (cdr target)
			  (let ((coding-system-for-write 'no-conversion)
				(size (min 20480 (- (point-max)
						    (point-min)))))
			    (call-process-region
			     (point-min) (+ (point-min) size)
			     "enca" nil enca-buffer nil "-m")))))))
      (unwind-protect
	  (when (= 0 (funcall run-enca))
	    (with-current-buffer enca-buffer
	      (goto-char 1)
	      (downcase-region 1 (point-max))
	      (skip-chars-forward "\t\n\f\r ")
	      (delete-region 1 (point))
	      (when (looking-at "\\(ibm\\)[0-9]")
		(replace-match "cp" t t nil 1))
	      (skip-chars-forward "^\t\n\f\r ")
	      (setq charset (intern-soft (buffer-substring 1 (point))))))
	(kill-buffer enca-buffer))
      (or (and (not (memq charset '(nil unknown us-ascii)))
	       (coding-system-p charset)
	       charset)
	  'undecided))))


(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
    (list (read-input-method-name "Use input method (default current): ")))
    (if (and input-method (symbolp input-method))
       (setq input-method (symbol-name input-method)))
     (let ((current current-input-method)
	(modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
	(let* ((to (car map))
	       (from (quail-get-translation
		      (cadr map) (char-to-string to) 1)))
	  (when (and (characterp from) (characterp to))
	    (dolist (mod modifiers)
	      (define-key local-function-key-map
		(vector (append mod (list from)))
		(vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))



(defun prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url-firefox
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
	 (buffer-substring (region-beginning) (region-end))
       (read-string "Google: "))))))

(global-set-key (kbd "\C-c\C-g") 'prelude-google)

(defun reload-config ()
 (interactive)
 (message "Rerunning emacs config")
    (load-file (concat "~/.emacs.d/init.el")))
( global-set-key (kbd "\C-c r") 'reload-config)

(defun ido-find-project ()
  (interactive)
  (find-file
   (concat "~/src/" (ido-completing-read "Project: "
			   (directory-files "~/src/" nil "^[^.]")))))


;;----------------------------------------------------------------------------
;; Delete the current file
;;----------------------------------------------------------------------------
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
			     (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


;;----------------------------------------------------------------------------
;; Rename the current file
;;----------------------------------------------------------------------------
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
	(message "A buffer named '%s' already exists!" new-name)
      (progn
	(when (file-exists-p filename)
	 (rename-file filename new-name 1))
	(rename-buffer new-name)
	(set-visited-file-name new-name)))))

;; TODO rename this files utils-config


(provide 'utils-config)
