;(add-to-list 'load-path "~/.emacs.d/mode/twittering-mode/")
(autoload 'twittering-mode "twittering-mode")
(eval-after-load "twittering-mode"
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
(setq twittering-display-remaining t)
(setq twittering-status-format
      "%FOLD{%RT{%FACE[bold]{RT}}%i%s>>%r @%C{%Y-%m-%d %H:%M:%S} %@{}\n%FOLD[ ]{%T%RT{\nretweeted by %s @%C{%Y-%m-%d %H:%M:%S}}}}")
)
(provide 'twitter-config)
