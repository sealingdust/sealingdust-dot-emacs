(add-to-list 'load-path "~/.emacs.d/plug-in")
;;; Load "color theme"
;(add-to-list 'load-path "./color-theme")
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-pok-wog)
(require 'color-theme-zenburn)
(color-theme-zenburn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Load "tabbar.el"
;;;
(require 'tabbar)
(tabbar-mode)
;(require 'tabbar-ruler)
(define-prefix-command 'lwindow-map)
(global-set-key (kbd "<M-up>") 'tabbar-backward-group)
(global-set-key (kbd "<M-down>") 'tabbar-forward-group)
(global-set-key (kbd "<M-left>") 'tabbar-backward)
(global-set-key (kbd "<M-right>") 'tabbar-forward)
;;now I changed key "s-up" to "M-up", so it works. I hope this will not 
;;lead to confiliction
;; DOTO: Configure more on tabbar
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(session-use-package t nil (session))
 '(tabbar-auto-scroll-flag t)
 '(tabbar-mwheel-mode nil nil (tabbar))
 '(tabbar-separator (quote (1.0 (:type string :data "|")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tabbar-button ((t (:inherit tabbar-default :box (:line-width 1 :style released-button)))))
 '(tabbar-default ((((class color grayscale) (background dark)) (:inherit variable-pitch :background "gray25" :foreground "gray75" :box nil :height 1))))
 '(tabbar-highlight ((t (:underline nil))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "#93e0e2"))))
 '(tabbar-separator ((t (:inherit tabbar-default :weight normal :width normal))))
 '(tabbar-unselected ((t (:inherit tabbar-default :box (:line-width 1 :color "gray25"))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load "browse-kill-ring.el"
;;;
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; TODO: we shall decide whether to use it.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load "browse-kill-ring.el"
;;;
;(require 'browse-kill-ring)
;(global-set-key [(control c)(k)] 'browse-kill-ring)
;(browse-kill-ring-default-keybindings)

;(require 'linum)
;(setq linum-format "%3d")
;(add-hook 'find-file-hooks (lambda()(linum-mode nil)))
;(global-linum-mode 0)

;;; Load session.el
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;; Load desktop.el
(require 'desktop)
(desktop-load-default)
(desktop-read)
