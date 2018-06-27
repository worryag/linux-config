(column-number-mode t)
(setq display-time-format "%H:%M")
(display-time-mode t)
(setq-default mode-line-format
(list
   "  " '(:eval (propertize (format-mode-line mode-line-buffer-identification)
			  'face 'font-lock-keyword-face
			  'help-echo (buffer-file-name)))
      " ("
      (propertize "%02l" 'face 'font-lock-string-face) ","
      (propertize "%02c" 'face 'font-lock-string-face)
      ") "
      "[" (propertize "%p" 'face 'font-lock-constant-face)
      "/" (propertize "%I" 'face 'font-lock-constant-face) "]"

    ;  '(vc-mode vc-mode)
      " [" '(:eval (propertize "%m" 'face 'font-lock-string-face
			       'help-echo buffer-file-coding-system)) "] "

    ;  'mode-line-modes
      "[" '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
			      'face 'font-lock-preprocessor-face
			      'help-echo (concat "Buffer is in "
			      (if overwrite-mode "overwrite" "insert") " mode")))
      '(:eval (when (buffer-modified-p)
		(concat "," (propertize "Mod" 'face 'font-lock-warning-face
			       'help-echo "Buffer has been modified"))))
      '(:eval (when buffer-read-only
		(concat "," (propertize "RO" 'face 'font-lock-string-face
			       'help-echo "Buffer is read-only")))) "] "

      '(:eval (propertize (format-mode-line global-mode-string)
			  'help-echo (concat (format-time-string "%c; ")
					     (emacs-uptime "Uptime:%hh"))))
      " --"
      "%-"
      ))

(provide 'mode-line-config)
