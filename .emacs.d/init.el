;; Emacs config v1.5.1

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'default-frame-alist '(left . 800))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 120))

(setenv "PATH" (concat (getenv "PATH") ":/usr/bin"))
(setq exec-path (append exec-path '(":/usr/bin")))
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/magit/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/themes")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(load-theme 'smyx t) ;; Загрузка темы оформления
(setq delete-by-moving-to-trash nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-fill-mode t)
 '(auto-revert-verbose nil)
 '(auto-save-default nil)
 '(browse-url-browser-function (quote browse-url-firefox))
 '(column-number-mode t)
 '(confirm-nonexistent-file-or-buffer nil)
 '(delete-auto-save-files nil)
 '(display-time-mode t)
 '(ffip-project-file ".git")
 '(fill-column 80)
 '(font-use-system-font t)
 '(gc-cons-threshold 50000000)
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:handled-backends (quote (git)))
 '(git-gutter:modified-sign "  ")
 '(global-auto-revert-mode t)
 '(global-auto-revert-non-file-buffers t)
 '(global-font-lock-mode t)
 '(ido-case-fold t)
 '(ido-confirm-unique-completion t)
 '(ido-enable-flex-matching nil)
 '(ido-enable-last-directory-history t)
 '(ido-everywhere t)
 '(ido-ignore-buffers
   (quote
    ("\\` " "^*Mess" "^*Back" ".*Completions" "^*Ido" "^*trace" "^*compilation" "^*GTAGS" "^session.*" "^*" "*Messages*")))
 '(ido-max-prospects 8)
 '(ido-max-work-directory-list 30)
 '(ido-max-work-file-list 50)
 '(ido-mode (quote both) nil (ido))
 '(ido-save-directory-list-file "~/.emacs.d/history/ido.last")
 '(ido-use-filename-at-point nil)
 '(ido-use-url-at-point nil)
 '(ido-work-directory-list (quote ("~/" "~/documents" "~/code")) t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(linum-format "%d ")
 '(menu-bar-mode nil)
 '(make-backup-files nil)
 '(mouse-wheel-mode t)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-yank-at-point t)
 '(overflow-newline-into-fringe t)
 '(prefer-coding-system (quote utf-8-unix))
 '(scroll-bar-mode t)
 '(scroll-conservatively 100000)
 '(scroll-margin 10)
 '(scroll-preserve-screen-position t)
 '(set-keyboard-coding-system (quote utf-8))
 '(set-language-environment (quote utf-8))
 '(set-terminal-coding-system (quote utf-8))
 '(setq-default desktop-missing-file-warning)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-mode-specific-contents-flag t)
 '(speedbar-show-unknown-files t)
 '(speedbar-use-images t)
 '(sr-speedbar-auto-refresh t)
 '(sr-speedbar-width-x 40)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(visible-bell nil)
 '(word-wrap t))

(ido-mode t)
(setq
 file-name-coding-system 'utf-8
 buffer-file-coding-system 'utf-8
 coding-system-for-write 'utf-8
 default-process-coding-system '(utf-8 . utf-8))


(delete-selection-mode 1);;copy overwrite selected

;; === coding system ===
(modify-coding-system-alist 'file "\\.txt\\'" 'utf-8)
(setq utf-translate-cjk-mode nil)  ;; disable (Chinese/Japanese/Korean characters)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(fset'yes-or-no-p 'y-or-n-p)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 143 :width normal)))))

;;============================================================================;;
(require 'auto-complete-config)
(require 'org-config)
(require 'mode-line-config)
(require 'direx)
(require 'popwin-conf)
(require 'prog-config)
(require 'utils-config)
(modify-coding-system-alist 'file "" 'enca-detect-coding)
(reverse-input-method 'russian-computer)

(autoload 'el-get-install "emacs-pkg-config" nil t)
(autoload 'package-install "emacs-pkg-config" nil t)
(autoload 'sr-speedbar-toggle "sr-speedbar" nil t)
(autoload 'magit-status "magit" nil t)
(autoload 'find-file-in-project "find-file-in-project" nil t)
(autoload 'neotree-toggle "neotree" nil t)
(autoload 'swiper "swiper" nil t)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 80)

;; (eval-after-load "flyspell-mode"
;;   '(progn
;;    (setq flyspell-dictionary "russian"))) ;; Провека орфографии
(require 'magit)
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(add-hook 'before-save-hook 'whitespace-cleanup) ;; удаление лишних пробелов
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; автодополнения для текс режима
;; Удаляем оконечные пробелы перед сохранением файлов
(add-hook 'before-save-hook '(lambda ()(delete-trailing-whitespace)))

;; === key config ===
(windmove-default-keybindings 'meta) ; Переключение между окнами alt стрелки:
(global-set-key (kbd "C-q") 'kill-this-buffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
(global-set-key (kbd "C-c C-t") 'popwin-term:ansi-term)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-k") 'kill-some-buffers)
(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-c C-f") 'find-name-dired)
(global-set-key (kbd "C-c C-w") 'whitespace-mode)
(global-set-key (kbd "C-c C-p") 'find-file-in-project)
(global-set-key (kbd "C-c f") 'vc-git-grep)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key [f1] 'woman) ;; Man pages
(global-set-key (kbd "C-c o") 'occur) ; показывает все строки в текущем буфере, подпадающие под регулярное выражение
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)
(global-set-key (kbd "<f4>") 'neotree-toggle)
(global-set-key (kbd "<f5>") 'sr-speedbar-toggle)
(global-set-key (kbd "<f8>") `flyspell-mode) ;; вкл проверки орфографии
(global-set-key (kbd "<f9>") `flyspell-buffer) ;;  проверка текущего буфера
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
(global-set-key [home] 'beginning-of-line) ;; перемещают в начало строки
(global-set-key [end] 'end-of-line)       ;; перемещают в конец строки

(global-set-key (kbd "C-x C-g") 'git-gutter-mode)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk) ;; Jump to next/previous hunk
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk) ;; Stage current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk) ;; Revert current hunk

(require 'ivy)
(require 'counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-c C-s") 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-load-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

;; ===  mouse ===
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)
(global-set-key [(mouse-3)] 'mouse-major-mode-menu)
;; scroll: normal speed
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
;; Shift + scroll: low speed
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)
;; Ctrl + scroll: high speed
(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;; Создание резервных копий редактируемых файлов (Backup)
;; нумерованный бэкап - 2 первых и 2 последних
(setq  backup-by-copying t      ; don't clobber symlinks
       make-backup-files t               ; backup of a file the first time it is saved.
       backup-directory-alist  '(("." . "~/.emacs.d/backup"))
       delete-old-versions t            ;; удаление промежуточных бэкапов
       delete-by-moving-to-trash t
       kept-new-versions 9
       kept-old-versions 6
       version-control t)       ; use versioned backups

;;============================================================================;;
;; automatic GPG encryption/decryption support: (app-emacs/easypg)
;;   (require 'epa-file)
;;   (epa-file-enable)

;(require 'fill-column-indicator)
;(fci-mode t)
;(setq fci-style 'shading)
;(set-face-background 'fci-shading "light gray")

;; instead of save desktop, rather save last editing place in files,
   ;; as well as minibuffer:
;; (setq save-place-file "~/.emacs.d/history/saved-places")
;; (setq-default save-place t)
;; (require 'saveplace)

;; (setq save-place-file "~/.emacs.d/history/saved-places")
;; (setq-default save-place t)

;; (savehist-mode t)
