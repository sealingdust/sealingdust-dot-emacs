;;Set front
;(set-default-font "-outline-Consolas-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")
;; Setting English Font
(set-face-attribute
  'default nil :font "Consolas 12")
 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 14)))

;; shut down the ring when error comes
(setq visible-bell t)

;;Let the title show the name of current buffer
;;but not just something like emacs@hostname
(setq frame-title-format "emacs@%b %f")

;;set the version control when do the copy
;;much safer
;;put all backupfile in a directory
(setq backup-directory-alist (quote (("." . "~/.emacs.d/auto-save-list"))))
(setq version-control t)
(setq kept-old-versions 2)    ;the default is actually 2
(setq kept-new-versions 3)    ;the default is 2
(setq delete-old-versions t)  ;delete the old backups silently
;(setq dired-kept-versions 1)
(setq back-by-copying t)
