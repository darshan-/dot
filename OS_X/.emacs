;; This works how I want when using a graphical window, but understandably not
;;  from within a terminal.  I don't want to go back and forth, so I'm
;;  commenting it out
;(setq mac-option-key-is-meta nil
;      mac-command-key-is-meta t
;      mac-command-modifier 'meta
;      mac-option-modifier 'none)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq ispell-program-name "/usr/local/bin/ispell")

;(defun my-objc-mode-hook ()
;  (setq tab-width 4))

;(add-hook 'objc-mode-hook 'my-objc-mode-hook)

;(defun my-c-mode-common-hook ()
;  (setq tab-width 4
;        ;; this will make sure spaces are used instead of tabs
;        indent-tabs-mode nil))
;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
