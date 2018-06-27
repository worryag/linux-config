;; Org mode
;;Временная метка при закрытии задания
(require 'org)
(setq org-log-done t)
(setq org-src-fontify-nativery t)
(org-indent-mode t)
(setq org-agenda-files (list "~/documents/org/сделать.org"
			     "~/documents/org/orda.org"
			     "~/documents/org/фильмография.org"
			     "~/documents/org/литература.org"
			     "~/documents/org/info.org"
			     ))

(setq org-default-notes-file (list
			      "~/documents/org/сделать.org"
			      ))
(setq org-directory "~/documents/org")

(setq org-todo-keywords
      '((sequence "TODO" "WAIT" "INPROGRESS" "DONE")))
(setq org-todo-keyword-faces
      '(
	("TODO" . (:foreground "red" :weight bold))
	("INPROGRESS" . (:foreground "blue" :weight bold))
	("WAIT" . (:foreground "orange" :weight bold))
	("DONE" . (:foreground "green" :weight bold))))


;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))


;; org-mode agenda options                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))
;;warn me of any deadlines in next 7 days
(setq org-deadline-warning-days 7)
;;show me tasks scheduled or due in next fortnight
(setq org-agenda-span (quote fortnight))
;;don't show tasks as scheduled if they are already shown as a deadline
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
;;don't give awarning colour to tasks with impending deadlines
;;if they are scheduled to be done
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
;;don't show tasks that are scheduled or have deadlines in the
;;normal todo list
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))
;;sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
  (quote
   ((agenda deadline-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep))))


;;capture todo items using C-c c t
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/documents/org/сделать.org" "Tasks")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp
          (org-read-date nil t \"+0d\"))\n" )))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode t)
			   (auto-fill-mode -1)
			   (auto-complete-mode t)))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(provide 'org-config)
