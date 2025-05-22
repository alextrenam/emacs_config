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
(blink-cursor-mode 1)			; Blink the cursor (10 blinks then static)

;; Display max character line
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)

;; ;; Highlight text that goes over max character line
;; (setq whitespace-style '(face lines-tail))
;; (add-hook 'prog-mode-hook #'whitespace-mode)
;; (add-hook 'text-mode-hook #'whitespace-mode)
;; (custom-set-faces
;;  '(whitespace-line ((t (:background "#ffc1cc" :foreground "red")))))

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
(setq use-package-always-ensure t) ; Make sure packages to be used are downloaded

;; Make hex codes the colour they represent
(use-package rainbow-mode
  :config
  (add-hook 'after-change-major-mode-hook #'rainbow-mode))

;; Improved navigation (e.g. visual autocomplete, fuzzy find) in minibuffer
(use-package vertico
  :init (vertico-mode 1))

;; Frequently used entries appear first
(use-package prescient
  :config
  (prescient-persist-mode 1))

;; Frequently used entries appear first
(use-package vertico-prescient
  :after (vertico prescient)
  :config
  ;; Let vertico use prescient only for sorting
  (setq vertico-prescient-enable-filtering nil)
  (vertico-prescient-mode 1))

;; Improved fuzzy finding
(use-package orderless
  :init (setq  completion-styles '(orderless)
	       completion-category-defaults nil
	       completion-category-overrides '((file (styles . (partial-completion))))
	       orderless-component-matching-styles '(orderless-prefixes orderless-literal orderless-regexp)))

;; Adds extra information to results when finding things (e.g. file size, modified)
(use-package marginalia
  :init (marginalia-mode 1))

;; Terminal emulator inside Emacs
(use-package vterm)

;; Git
(use-package magit)

;; Mode line customisation
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Improved fuzzy searching and file finding
(use-package consult)
(global-set-key (kbd "C-s") #'consult-line)
(global-set-key (kbd "C-x b") #'consult-buffer)
(global-set-key (kbd "M-y") #'consult-yank-pop)

;; LaTeX stuff
(use-package auctex)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auctex consult doom-modeline ivy magit marginalia orderless prescient
	    rainbow-mode vertico vertico-prescient vterm))
 '(safe-local-variable-values '((TeX-master . t))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
