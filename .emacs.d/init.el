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

;; -------------------------
;; -- ELPA configuration
;; -------------------------
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

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
;; -- enable ecb --
;; -------------------------
(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'ecb)
;; add ecb-setting
(require 'ecb-setting)
(defun my-ecb-active-or-deactive() 
  (interactive)
  (if ecb-minor-mode
	(ecb-deactivate)
	(ecb-activate)))
(global-set-key (kbd "C-c C-i") 'my-ecb-active-or-deactive)
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-c d") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c @") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c #") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c $") 'ecb-goto-window-compilation)

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

;; -------------------------
;; -- Config cedet --
;; -------------------------
(global-ede-mode 1)
(semantic-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("leftright2" (ecb-directories-buffer-name 0.25925925925925924 . 0.625) (ecb-sources-buffer-name 0.25925925925925924 . 0.35) (ecb-methods-buffer-name 0.2037037037037037 . 0.625) (ecb-history-buffer-name 0.2037037037037037 . 0.35)) ("left1" (ecb-directories-buffer-name 0.33121019108280253 . 0.28205128205128205) (ecb-sources-buffer-name 0.1592356687898089 . 0.358974358974359) (ecb-history-buffer-name 0.17197452229299362 . 0.358974358974359) (ecb-methods-buffer-name 0.33121019108280253 . 0.3333333333333333)))))
 '(ecb-source-path (quote ("~/Workspace/mupdf"))))
