(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/base16")
(load-theme 'base16-default t)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
