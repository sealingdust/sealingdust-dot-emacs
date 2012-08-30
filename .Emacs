(add-to-list 'load-path "~/.emacs.d")
;; load the golobal-settings.el where the 
(load "dst-global-settings.el")

;; Require my plugins.el
(load "dst-plugins-settings.el")

;; Require key bindings
(load "dst-key-bindings.el")

