(setq user-full-name "Vivitsu Maharaja")
(setq user-mail-address "vivitsu.maharaja@gmail.com")

;; set a default font
(when (member "Monaco" (font-family-list))
  (set-face-attribute 'default nil :font "Monaco"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/base16")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa") t) ; Org-mode's repository
(package-initialize)

(setq backup-by-copying t    ; Don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.saves"))  ; Don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)     ; Use versioned backups

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq tab-width 4
      indent-tabs-mode nil)

(tool-bar-mode -1)

;; Always highlight parentheses
(show-paren-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Add python-mode
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode.el-6.2.0")
;;(setq py-install-directory "~/.emacs.d/plugins/python-mode.el-6.2.0")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)







