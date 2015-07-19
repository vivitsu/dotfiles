(setq user-full-name "Vivitsu Maharaja")
(setq user-mail-address "vivitsu.maharaja@gmail.com")

;; set a default font
(when (member "Monaco" (font-family-list))
  (set-face-attribute 'default nil :font "Monaco"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/base16")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(if (display-graphic-p)
    (load-theme 'smyx t)
  (load-theme 'wombat t))

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(package-initialize)

(setq make-backup-files nil)

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

(setq tab-width 4
      indent-tabs-mode nil
      column-number-mode t)

(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

;; Swap option and command keys on Mac OS X
(cond
 ((string-equal system-type "darwin")    ; Mac OS X
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
 )
)

;; Set $PATH to bash PATH on Mac OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Always highlight parentheses
(show-paren-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; Add ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

; Add python-mode
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode.el-6.2.0")
;(setq py-install-directory "~/.emacs.d/plugins/python-mode.el-6.2.0")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)
