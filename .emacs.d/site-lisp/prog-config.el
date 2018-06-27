(require 'hideshow)

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
   This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|BUG\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
	  1 font-lock-warning-face t))))

(defface my-hi-lock-face '((t (;; :background  "red"
                               :foreground  "red"
                               :bold t)))
                          "my-hi-lock-face")

(add-hook 'forth-mode-hook
          (lambda ()
            (highlight-regexp "\\(FIXME\\|TODO\\|BUG\\|OPTIMIZE\\|HACK\\|REFACTOR\\)" "my-hi-lock-face")))

 ;;"\\(FIXME\\)"

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)


; (add-to-list 'hs-special-modes-alist
;	     '(forth-mode
;	       "\\(?:\\|if\\)" "\\(?:;\\|then\\)" nil nil))



(add-hook 'emacs-lisp-mode-hook 'font-lock-comment-annotations)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; (add-hook 'forth-mode-hook 'hs-minor-mode)
;; (add-hook 'forth-mode-hook 'font-lock-comment-annotations)
;; GIT-GUTTER
(require 'git-gutter)

(custom-set-variables
 '(git-gutter:modified-sign "  ") ;; two space
 '(git-gutter:added-sign "++")    ;; multiple character is OK
 '(git-gutter:deleted-sign "--")
 '(git-gutter:handled-backends '(git))
 )

(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")


(add-to-list 'git-gutter:update-hooks 'focus-in-hook)

;; If you enable global minor mode
;; (global-git-gutter-mode nul)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

;; If you enable git-gutter-mode for some modes
(add-hook 'forth-mode-hook 'git-gutter-mode)

;;----------------------------------------------------------------------------
;; Forth mode
;;----------------------------------------------------------------------------
(autoload 'forth-mode "forth-mode")
(add-to-list 'auto-mode-alist '("\\.[Ff]\\'" . forth-mode))
(add-to-list 'auto-mode-alist '("\\.fs\\'" . forth-mode))
(add-to-list 'auto-mode-alist '("\\.frt\\'" . forth-mode))
(add-to-list 'auto-mode-alist '("\\.fts\\'" . forth-mode))
(add-to-list 'auto-mode-alist '("\\.fth\\'" . forth-mode))

;;----------------------------------------------------------------------------
;; PKGbuild mode
;;----------------------------------------------------------------------------
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

;;----------------------------------------------------------------------------
;; CSV mode
;;----------------------------------------------------------------------------
(autoload 'csv-mode "csv-mode" "Major mode for editing comma-separated value files." t)
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))

;;----------------------------------------------------------------------------
;; Lua mode
;;----------------------------------------------------------------------------
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;----------------------------------------------------------------------------
;; Arduino mode
;;----------------------------------------------------------------------------
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)
(add-to-list 'auto-mode-alist '("\.ino$" . arduino-mode))



(setq auto-mode-alist (append (list '("\\.\\(vcf\\|gpg\\)$" . sensitive-minor-mode))
			      auto-mode-alist))


(provide 'prog-config)
