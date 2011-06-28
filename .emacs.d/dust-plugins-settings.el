(add-to-list 'load-path "~/.emacs.d/plug-in")

;; solve the coding system
;; auto recognize coding
(require 'unicad)
;; seen not used

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; I use pluskid's yasnippet for completion 
(add-to-list 'load-path "~/.emacs.d/plug-in/yasnippet")
(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory "~/.emacs.d/plug-in/yasnippet/dust-snippets")
(yas/load-directory yas/root-directory)
;; recombine the trigger-key to Ctrl-Tab, default is "TAB"
(setq yas/trigger-key "<C-tab>")
;(setq yas/prompt-functions 'yas/dropdown-prompt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;Require auto-complete as my complete engine
(add-to-list 'load-path "~/.emacs.d/plug-in/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plug-in/auto-complete/ac-dict")
(setq global-auto-complete-mode t)
;; automatic starting completion if type more than 4 words
;; set it to "nil" will disable automatic starting completion
(setq ac-auto-start 4)
;; bind trigger key
(define-key ac-mode-map (kbd "TAB") 'auto-complete)

;(define-key ac-completing-map "\r" 'ac-complete)
;; turn-on ac-use-menu-map, default use
;; "C-n" "C-p" to select candidades
(setq ac-use-menu-map t)
(define-key ac-completing-map "\M-/" 'ac-stop)

;; global set key "TAB" as auto-complete
(global-set-key (kbd "TAB") 'auto-complete)

;; Some small adjust
;; not use quick help of ac-complete
(setq ac-use-quick-help nil)
;; change height of completion menu
(setq ac-menu-height 20)
;; set default of sources
(setq-default ac-sources '(ac-source-semantic
                           ac-source-yasnippet
                           ac-source-words-in-buffer
                           ac-source-words-in-all-buffer
                           ac-source-words-in-same-mode-buffers
                           ac-source-files-in-current-dir
                           ac-source-dictionary
                           ac-source-filename))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;Require CC-mode
(require 'cc-mode)
					;(c-set-offset 'inline-open nil)
					;(c-set-offset 'friend '-)
					;(c-set-offset 'substatement-open 0)

;;Set mode hook
;;;C/C++ edit resolve
(defun my-c-mode-common-hook()
  (c-set-style "stroustrup")  ;;set C code style
					; (c-set-style "k&r")
  (setq tab-width 4 indent-tabs-mode nil)
  ;;; hungry-delete and auto-newline
					;  (c-toggle-auto-hungry-state 1)
  ;;Only auto-newline but no hungry delete
					;(c-toggle-auto-newline 1)
  ;;; auto-newline and auto filling
					;  (c-setup-filladapt)
					;  (filladapt-mode 1)
  ;;key definition
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  '(compile-command "make")
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
					;(define-key c-mode-base-map [(tab)] 'auto-complete)
					;(define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  (define-key c-mode-base-map [(control c)(h)] 'my-insert-cpp-header)
  (define-key c-mode-base-map [(control c)(u)] 'uncomment-region)
  ;;Preprocessing set
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
					;(setq hs-minor-mode t)
					;(setq abbrev-mode t)
  (setq default-fill-column 80)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;Configure CEDET
(require 'cedet)
;; turn on semantic function
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
;; if use official CEDET, not build-in one, use the following 
;; 
;(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst cedet-win32-include-dirs
  (list "D:/MinGW/include"
        "D:/MinGW/include/gdiplus"
        "D:/MinGW/include/GL"
        "D:/MinGW/include/sys"
        "D:/MinGW/ddk"
        "D:/MinGW/lib/gcc/mingw32/4.5.0/include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;; Code jump setting
;; Key binding
(global-set-key [f12] 'semantic-ia-fast-jump)
(define-key c-mode-base-map [S-f12] 'semantic-analyze-proto-impl-toggle)

;; Enable visual high-light bookmarks in CEDET
; Not available in build-in CEDET
;(enable-visual-studio-bookmarks)

;; Use easy Matlab mode, just edit matlab files in emacs
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;User Level customizations (You need not use them all):
(setq matlab-indent-function-body t)  ; if you want function bodies indented
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
    (setq fill-column 76)		; where auto-fill should wrap
    (add-to-list 'ac-modes 'matlab-mode) ;; add to auto-complete support list
    ;(define-key matlab-mode-base-map [(tab)] 'auto-complete)
)
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
;(defun my-matlab-shell-mode-hook ()
;	'())
;(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load AucTex to edit Latex files

;; if use a pre-compiled version, need add to path
;; other-wise, the default path of "auctex.el" is in dir "site-lisp"
;(add-to-list 'load-path 
;             "~/.emacs.d/plug-in/auctex/site-lisp/site-start.d")
(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
;; default to use mik make configuration in windows easier
;(if (string-equal system-type "windows-nt")
    (require 'tex-mik) 
    (require 'tex-site)
;)


(defun my-LaTeX-mode-hook ()
   (setq TeX-auto-untabify t)     ; remove all tabs before saving
   (setq TeX-auto-save t)         ; turn on auto save and auto parse
   (setq TeX-parse-self t)
   (setq TeX-show-compilation t)  ; display compilation in another window
   (setq fill-column 80)
   (turn-on-auto-fill)     ; enable auto-fill-mode
   (turn-on-reftex)         
   (LaTeX-math-mode t)     ; enable math-mode
   (TeX-fold-mode t)       ; enable TeX-fold-mode
   (TeX-global-PDF-mode t) ; PDF mode enable, use pdflatex
   ;; use acrobat to preview the pdf file, it noly works this way
   (setq TeX-output-view-style
       (cons '("^pdf$" "." "acrobat [DocOpen("%o")]") TeX-output-view-style))
   ;; the following command not work yet
;   (setq TeX-view-program-list 
;         '(("Acrobat" "acrobat %o")
;           ("AcroReader" "acroread %o")
;           ("Gsview" "gsview32.exe %o")))
;   (setq TeX-view-program-selection 
;         '((output-pdf "Acrobat") 
;           (output-dvi "Yap")))  ;; Yap is in TeX-view-program-list-builtin
   
)
(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)
;                  ;TeX-engine 'xetex       ; use xelatex default
;                  Tex-command-default "pdflatex"
;            ;(setq-default TeX-master nil) ;; if always use multi-file, set this
;            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
;            (setq TeX-save-query nil)
            ;(imenu-add-menubar-index)  ;; no menu
            ;; I use TAB as auto-complete
            ;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)


;;; Load session.el
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;; Load desktop.el
(require 'desktop)
(desktop-load-default)
(desktop-read)
 