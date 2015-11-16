(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(require 'bind-key "~/.emacs.d/use-package/bind-key.el")
(require 'use-package "~/.emacs.d/use-package/use-package.el")

(use-package flatui-theme
  :ensure t
  :init (progn
	  (load-theme 'flatui t)))

(use-package evil
  :ensure t)

(use-package neotree
  :ensure t
  :init (progn
	  (neotree-show)
	  (custom-set-variables
	   '(neo-theme (quote ascii)))))

(use-package highlight-parentheses
  :ensure t
  :init (add-hook 'prog-mode 'highlight-parenthesesi-mode))

(use-package highlight-blocks
  :ensure t
  :init (add-hook 'lisp-mode 'highlight-blocks-mode))

(use-package highlight-thing
  :ensure t
  :init (add-hook 'prog-mode 'highlight-thing-mode))

(use-package ido-ubiquitous
  :ensure t
  :init (ido-ubiquitous-mode))

(use-package ido-vertical-mode
  :ensure t
  :init (ido-vertical-mode))

(use-package ldap-mode
  :ensure t)

;;; built-in modes
(ido-mode)

;; general
(setf inhibit-startup-screen t)
; word-wrap
(global-visual-line-mode t)
(tool-bar-mode -1)

;;; sudo save file
(defun sudo-save ()
  (interactive)
  (if (not buffer-file-name)
      (write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
    (write-file (concat "/sudo:root@localhost:" buffer-file-name))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3b24f986084001ae46aa29ca791d2bc7f005c5c939646d2b800143526ab4d323" default)))
 '(neo-cwd-line-style (quote button))
 '(neo-dont-be-alone t)
 '(neo-theme (quote ascii))
 '(neo-window-width 15))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#ecf0f1" :foreground "#2c3e50" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
 '(neo-button-face ((t (:distant-foreground "peru" :underline nil))))
 '(neo-dir-link-face ((t (:foreground "MediumBlue" :family "DejaVu Sans"))))
 '(neo-file-link-face ((t (:foreground "Black" :family "DejaVu Sans"))))
 '(neo-header-face ((t (:foreground "DarkMagenta" :family "DejaVu Sans"))))
 '(neo-root-dir-face ((t (:foreground "DarkMagenta" :family "DejaVu Sans")))))

