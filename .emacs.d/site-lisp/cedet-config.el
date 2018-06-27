(require 'srecode)

 ;; Чтобы использовать возможности по дополнению имен и показу информации о
;; функциях и классах, вам необходимо загрузить пакет semantic/ia с помощью
;; следующей команды:
(require 'semantic/ia)

;; Activate semantic
(semantic-mode 1)


 ;; включает режим автоматического запоминания информации о редактируемых тагах,
;; так что вы можете перейти к ним позднее с помощью команды
;; semantic-mrub-switch-tags
;; NOTE возможно функйция излишня
(global-semantic-mru-bookmark-mode t)
;; включает глобальную поддержку Semanticdb;
(global-semanticdb-minor-mode t)
;; активирует автоматический анализ кода в буферах когда Emacs "свободен" и
;; ожидает ввода данных от пользователя (idle time);
(global-semantic-idle-scheduler-mode t)
;; активирует показ названия текущего тага в верхней строке буфера;
(global-semantic-stickyfunc-mode t)
;; активирует контекстное меню привязанное к правой клавише мыши;
;; (global-cedet-m3-minor-mode t)

;;  включает подсветку вхождений локальных переменных чье имя совпадает с именем текущего тага;
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)

(global-semantic-idle-completions-mode 1)
(global-semantic-idle-summary-mode 1)
;;  активирует использование стилей при показе тагов разных типов. Набор стилей определяется списком semantic-decoration-styles
;; NOTE возможно функция излишня
(global-semantic-decoration-mode t)
;; активирует подстветку первой строки текущего тага (функции, класса и т.п.)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)






;; customisation of modes

  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)



;; (when (cedet-ectag-version-check t)
;; (semantic-load-enable-primary-ectags-support))
 ;;NOTE SRecode Пока не нужно, вставка шаблонов с использованием инфы semantic
;; (global-srecode-minor-mode 1)
 ;; EDE
(global-ede-mode 1)
(ede-enable-generic-projects t)
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)


(provide 'cedet-config)
