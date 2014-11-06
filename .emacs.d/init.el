;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode -1)
(normal-erase-is-backspace-mode 0)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t) 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(column-marker-1 ((t (:background "red"))))
 '(diff-added ((t (:foreground "cyan"))))
 '(flymake-errline ((((class color) (background light)) (:background "Red"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))))
 '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 '(linum ((t (:foreground "black" :weight bold))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 '(show-paren-match ((((class color) (background light)) (:background "black"))))
 '(vertical-border ((t nil))))

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)
(global-set-key (kbd "C-c C-b") 'windmove-left)
(global-set-key (kbd "C-c C-f") 'windmove-right)
(global-set-key (kbd "C-c C-p") 'windmove-up)
(global-set-key (kbd "C-c C-n") 'windmove-down)
;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(load "js-config.el")
(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(setq js2-highlight-level 3)
(setq js-indent-level 2)
;; ----------------------------
;; -- JSX Mode configuration --
;; ----------------------------
(add-to-list 'auto-mode-alist '("\\.jsx$" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
(setq jsx-indent-level 2)
(add-hook 'jsx-mode-hook
		  (lambda () (auto-complete-mode 1))
)
;; -------------------------
;; -- ELPA configuration
;; -------------------------
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ;; TODO: Maybe, use this after emacs24 is released
                  ;; (development versions of packages)
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)

;; -------------------------
;; -- c Mode configuration
;; -------------------------
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;; -- enable autopaire --
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

;; -------------------------
;; -- Config yasnipper and auto-complete --
;; -------------------------
(require 'yasnippet)
(yas-global-mode 1)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20131128.233/dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
