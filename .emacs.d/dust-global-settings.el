;;Set front
(set-default-font "-outline-Consolas-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")

;; hide menu bar
(menu-bar-mode nil)

;; hide scroll bar
(scroll-bar-mode nil)

;;shut down the ring when error comes
(setq visible-bell t)

;;shut down the menu bar

;;don't show the picture when start emacs
(setq inhibit-startup-message t)

;;show the column number
;(setq column-number-mode t)

;;Don't insert content in plate at point mouse clicked
(setq mouse-yank-at-point t)

;;Using a super kill ring.
(setq kill-ring-max 200)

;;set fill-column to 60
(setq default-fill-column 70)


;中文
;;set sentence-end to enable recgnize chinese interpunction
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;allow using minibuffer recursively
(setq enable-recursive-minibuffers t)


;;provent jumping when the page strolls
;;set scroll-margin 3 can utils strolling when reach to 3 lines to egde
(setq scroll-margin 3
      scroll-conservatively 10000)

;;set default major mode to text-mode
(setq default-major-mode 'text-mode)

;;Just show pattern parenthese instead of jump to
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;Let the mouse go away when close to cursor
(mouse-avoidance-mode 'animate)


;;Let the title show the name of current buffer
;;but not just something like emacs@hostname
(setq frame-title-format "emacs@%b %f")

;;enable open picture
(auto-image-file-mode)

;;highlight index
(global-font-lock-mode t)

;;open the function that are disabled defaultly
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;;set the version control when do the copy
;;much safer
;;put all backupfile in a directory
(setq backup-directory-alist (quote (("." . "e:/mydocs/emacsbackups"))))
;(setq back-directory-alist '(("." . "e:/mydocs/emacsbackups")))
(setq version-control t)
(setq kept-old-versions 2)    ;the default is actually 2
(setq kept-new-versions 3)    ;the default is 2
(setq delete-old-versions t)  ;delete the old backups silently
;(setq dired-kept-versions 1)
(setq back-by-copying t)

;;Don't generate backups
;(setq make-backup-files nil)

;;a simple method to set auto-mode-alist
(mapcar
 (function (lambda (setting)
	     (setq auto-mode-alist
		   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . cc-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))

;;set useful self information
(setq user-full-name "Yang QingQing")
(setq user-mail-address "qqyang@zju.edu.cn")

;;let dired delete and copy derectories 
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; The fowllowing are from jams teach you Emacs 24 hours 
;;; 
;;don't show the menu bar when in a terminal
(if (equal window-system nil)
   (menu-bar-mode nil))
;;just don't want to see the menubar
;(menu-bar-mode nil)

;;remove the toolbar,the command following is not quite
;true, and I tried it out the same as hide the munubar
;(set-specifier default-toolbar-visible-p nil) 
(tool-bar-mode nil)

;;When I'm at the end of the buffer, I still want to go to
;;the next line, I choose to add a new blank line at the end
;;of the buffer
;(setq next-line-add-newlines t)
;;Or you can select to setup where the bell rings

(setq next-line-add-newlines nil)

;;Windows use of template, we should add the following
;;command to tell the Emacs to search our template files
;;farther beyond our home directory
(setq template-home-directory "/")