;;; init-evil.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Dylan Yin
;;
;; Author: Dylan Yin <mrdylanyin@gmail.com>
;; Maintainer: Dylan Yin <mrdylanyin@gmail.com>
;; Created: November 26, 2023
;; Modified: November 26, 2023
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/dylanyin/init-evil
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

;; load evil
(use-package evil
  :demand t
  :init     ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config ;; tweak evil after loading it
  (evil-mode 1)

  ;; example how to map a command in normal mode (called 'normal state' in evil)
  (define-key evil-normal-state-map (kbd ", w") 'evil-window-vsplit))

(use-package evil-collection
  :demand t
  :after evil
  :config
  (evil-collection-init))

(provide 'init-evil)
;;; init-evil.el ends here
