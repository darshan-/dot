;(load "/usr/share/emacs/site-lisp/site-gentoo")

;; (setq gc-cons-threshold 10000000000)
;; (defun garbage-collect (&rest args)
;; 	  (message "Would garbage collect. Probably you want to quit emacs."))
;; (setq garbage-collection-messages t)

(add-hook 'after-change-major-mode-hook
          (lambda()
            (electric-indent-mode -1)
            (local-set-key [return] 'newline-and-indent)
            (local-set-key (kbd "}")
                           (lambda()
                             (interactive)
                             (insert-char ?})
                             (indent-for-tab-command)
                             ))
            (define-key minibuffer-local-map [return] "\n")
            ))

;; (add-hook 'after-change-major-mode-hook
;;           (lambda()
;;             (setq-local electric-indent-chars '(?\n ?}))
;;             ))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/"))
(package-initialize)

(global-font-lock-mode 1)
(column-number-mode 1)
(prefer-coding-system 'utf-8)
(setq inhibit-splash-screen t)
(fringe-mode '(0 . 1))
(setq-default indent-tabs-mode nil)

;Set window title to buffer name
(setq frame-title-format "%b")

;;;(set-default-font "Source Code Pro")
;(set-face-attribute 'default nil :font "Source Code Pro" :height 100 :weight 'normal)
;(set-face-attribute 'default nil :font "Liberation Mono" :height 100 :weight 'normal)
;;;(set-face-attribute 'default nil :font "Source Code Pro" :height 100 :weight 'medium :foreground "black")
;(set-face-attribute 'default nil :font "Source Code Pro Medium" :height 100 :weight 'medium)
;(set-face-attribute 'default nil :font "Source Code Pro" :height 100 :weight 'semi-bold)
;;;(set-face-font 'default "Source Code Pro")

(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

(add-hook 'java-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)))

;;(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
;;                                        comment-end   "")))

(add-hook 'c-mode-hook '(lambda ()
                          (c-toggle-comment-style -1)
                          (local-set-key (kbd "C-c C-c")
                                         'comment-or-uncomment-region)
                          ))

;; (add-hook 'java-mode-hook
;;           '(lambda () "Treat Java 1.5 @-style annotations as comments."
;;              (setq c-comment-start-regexp "\\(@\\|/\\(/\\|[*][*]?\\)\\)")
;;              (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

;(setq default-directory "~/")

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(put 'downcase-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(put 'upcase-region 'disabled nil)

(add-hook 'go-mode-hook
  (function
   (lambda ()
     (setq tab-width 4)
     )))

;(setq gofmt-command "/home/darshan/go/gopath/bin/goimports")

(add-to-list 'load-path "~/.emacs.d/lisp" t)
;(require 'go-mode-autoloads)
;(require 'd-mode)
(require 'dart-mode)
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))

;(require 'julia-mode)

;(add-hook 'julia-mode-hook
;          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

;; (setq load-path (cons "/usr/share/emacs/site-lisp/ess" load-path))
;; (require 'ess-site)

;(add-hook 'R-mode-hook
;          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

;(add-hook 'sh-mode-hook
;          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(nasm-mode rust-mode swift-mode epl groovy-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(setq confirm-kill-emacs 'y-or-n-p)

; I sometimes press C-x C-c by mistake.
; Setting confirm-kill-emacs to 'y-or-n-p (or 'yes-or-no-p) is a huge improvement, but most of the time I
;   actually do want quitting to be really easy.  This makes quitting essentially C-x C-c RET, which is
;   something I won't do by mistake, but is nearly as easy to do on purpose.  Just C-g if I did C-x C-c
;   by mistake is any easy way to stay in emacs.  This is bascially perfect for me
; By darshan, 2018-04-09 03:50 PDT, based on code at https://www.emacswiki.org/emacs/YesOrNoP
(defun darshan-not-C-g-is-confirm (prompt)
    "Prompt user"
    (if (read-from-minibuffer
         (concat prompt " Anything but C-g confirms... "))
        t
      nil))
(defun my-kill-emacs (prompt)
  (darshan-not-C-g-is-confirm "Quit emacs?"))

(setq confirm-kill-emacs 'my-kill-emacs)

(defun my-web-mode-hook ()
  ;(setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-auto-closing nil)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)


;(eval-after-load "web-mode"
;  '(setq web-mode-tag-auto-close-style 0))

(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))

(put 'overwrite-mode 'disabled t)
