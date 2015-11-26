(setq user-full-name "Vivitsu Maharaja")
(setq user-mail-address "vivitsu.maharaja@gmail.com")

(setq make-backup-files nil)

;; set a default font
(when (member "Inconsolata" (font-family-list))
  (set-face-attribute 'default nil :font "Inconsolata"))

;; set font height
(set-face-attribute 'default nil :height 140)

;; set theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/base16")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(if (display-graphic-p)
    (load-theme 'smyx t)
  (load-theme 'wombat t))

;; set appearance
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

(setq tab-width 4
      indent-tabs-mode nil
      column-number-mode t
      show-paren-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; Swap option and command keys on Mac OS X
(cond
 ((string-equal system-type "darwin")    ; Mac OS X
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
 )
)

(require 'package)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; Prevent packages from loading again after processing the init file - http://stackoverflow.com/a/18783152
(setq package-enable-at-startup nil)

(setq package-list '(ag
		     async
		     auto-complete
		     dash
		     enh-ruby-mode
		     epl
		     exec-path-from-shell
		     findr
		     flx
		     flx-ido
		     flycheck
		     flycheck-haskell
		     ghc
		     git-commit
		     grizzl
		     haskell-mode
		     inf-ruby
		     inflections
		     jump
		     let-alist
		     magit
		     magit-popup
		     markdown-mode
		     pkg-info
		     popup
		     projectile
		     python-mode
		     rinari
		     ruby-compilation
		     seq
		     smartparens
		     sql-indent
		     with-editor
		     yasnippet))

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Set $PATH to bash PATH on Mac OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Enable Ido-Mode
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)

;; auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories
	     "~/.directories.d/elpa/auto-complete-20151112.2030/dict")

(require 'auto-complete-config)
(ac-config-default)
(setq ac-ignore-case nil)

;; Projectile config
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

;; smartparens
(require 'smartparens-config)

;; Add ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; Haskell indentation modes
(require 'haskell-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Add python-mode
(require 'python-mode)
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode.el-6.2.0")
;(setq py-install-directory "~/.emacs.d/plugins/python-mode.el-6.2.0")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
