(setq user-full-name "Vivitsu Maharaja")
(setq user-mail-address "vivitsu.maharaja@gmail.com")

(setq make-backup-files nil)

(when (member "SF Mono" (font-family-list))
  (set-face-attribute 'default nil :font "SF Mono"))

;; set font height
(set-face-attribute 'default nil :height 120)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

;; Prevent packages from loading again after processing the init file - http://stackoverflow.com/a/18783152
(setq package-enable-at-startup nil)

;; Set $PATH to bash PATH on Mac OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; set appearance
(when (display-graphic-p)
  (progn
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))
;; using sellout's version of solarized at https://github.com/sellout/emacs-color-theme-solarized
;; (load-theme 'solarized t))

(load-theme 'zenburn t t)
(enable-theme 'zenburn)

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

;; Open Emacs maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(split-window-horizontally)
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq column-number-mode t)

;; Set indentation to 4 in CC mode
(setq-default c-basic-offset 4)

(show-paren-mode 1)

;; Set shell
(setq explicit-shell-file-name "/usr/local/bin/bash")

(defalias 'yes-or-no-p 'y-or-n-p)

;; Swap option and command keys on Mac OS X
(cond
 ((string-equal system-type "darwin")    ; Mac OS X
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
 )
)

;; Enable Ido-Mode
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)

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
