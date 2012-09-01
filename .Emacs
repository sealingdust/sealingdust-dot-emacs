(server-mode 1) 

(add-to-list 'load-path "~/.emacs.d")

;; load the golobal-settings.el where the 
(load "sdt-global-settings.el")

;; Require my plugins.el
(load "sdt-plugins-settings.el")

;; Require key bindings
(load "sdt-key-bindings.el")

;; finally some options
(custom-set-variables
 '(line-number-mode nil)  ;; hide line number
 '(scroll-bar-mode nil)   ;; hide scrol bar
 ;'(session-use-package t nil (session))
 '(show-paren-mode t)    
 '(tool-bar-mode nil))    ;; hide tool bar
;(custom-set-faces
 ;)
