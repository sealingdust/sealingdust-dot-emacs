(add-to-list 'load-path "~/.emacs.d/plug-in")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load AucTex to edit Latex files

;; if use a pre-compiled version, need add to path
;; other-wise, the default path of "auctex.el" is in dir "site-lisp"
(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
;; default to use mik make configuration in windows easier
(if (string-equal system-type "windows-nt")
  (require 'tex-mik) 
; (require 'tex-site)
)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
    '("PrintPDF" "dvipdfmx %s.dvi" TeX-run-command t t :help "Run dvipdfmx to convert the dvi file to pdf") t))

(defun my-LaTeX-mode-hook ()
  (setq TeX-auto-untabify t)     ; remove all tabs before saving
  (setq TeX-auto-save t)         ; turn on auto save 
  (setq TeX-parse-self t)        ; turn on self sparing
  (setq-default TeX-master nil)  ; enable \include or \input
  ; Each time you open a new file, AUCTeX will then ask you for a master file.
  
  (setq TeX-show-compilation t)  ; display compilation in another window
  (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
  (visual-line-mode t)
  (turn-on-reftex)     
;   (LaTeX-math-mode t)     ; enable math-mode
;   (TeX-fold-mode t)       ; enable TeX-fold-mode
)
(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode-hook)
;            (setq TeX-save-query nil)
            ;(imenu-add-menubar-index)  ;; no menu
            ;; I use TAB as auto-complete
            ;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
