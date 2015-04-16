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

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

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

;; Always highlight parentheses
(show-paren-mode t)

