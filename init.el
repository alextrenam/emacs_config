(setq inhibit-startup-message t		; Don't show the splash screen
      visible-bell nil)			; Flashes to replace beep sound for illegal actions

;; General Emacs UI
(menu-bar-mode -1)			; Show menu bar
(tool-bar-mode -1)			; Show tool bar
(scroll-bar-mode 1)			; Show scroll bar
(set-fringe-mode 15)			; Side padding

;; Theme choice
(load-theme 'deeper-blue)

;; Useful visual aids
(global-display-line-numbers-mode 1)	; Display line numbers
(global-hl-line-mode 1)			; Highlight the current line
(blink-cursor-mode 1)			; Blink the cursor (default is 10 blinks before static)

;; Fonts
(set-face-attribute 'default nil :font "Fira Code Retina" :height 130)

;; Initialise package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialise use-package for easy package installation
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)	; Make sure packages to be used are downloaded

;; Improved navigation (e.g. visual autocomplete, fuzzy find) in minibuffer
(use-package ivy
  :init (ivy-mode 1))

;; Mode line customisation
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil)
 '(safe-local-variable-values '((TeX-master . t))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
