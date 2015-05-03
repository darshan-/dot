;(load "/usr/share/emacs/site-lisp/site-gentoo")

(global-font-lock-mode 1)
(column-number-mode 1)
(prefer-coding-system 'utf-8)
(setq inhibit-splash-screen t)
(fringe-mode '(0 . 1))
(setq-default indent-tabs-mode nil)

;Set window title to buffer name
(setq frame-title-format "%b")

;(set-default-font "Source Code Pro")
;(set-face-attribute 'default nil :font "Source Code Pro" :height 100 :weight 'medium)
;(set-face-font 'default "Source Code Pro")

(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

(add-hook 'java-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)))

(add-hook 'java-mode-hook
          '(lambda () "Treat Java 1.5 @-style annotations as comments."
             (setq c-comment-start-regexp "\\(@\\|/\\(/\\|[*][*]?\\)\\)")
             (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

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

(add-to-list 'load-path "~/.emacs.d/lisp" t)
(require 'go-mode-autoloads)
;(require 'd-mode)
(require 'dart-mode)
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))

(require 'julia-mode)

;(add-hook 'julia-mode-hook
;          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

(setq load-path (cons "/usr/share/emacs/site-lisp/ess" load-path))
(require 'ess-site)

;(add-hook 'R-mode-hook
;          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

;(add-hook 'sh-mode-hook
;          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))
