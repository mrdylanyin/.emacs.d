;;; init-keybinding.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Dylan Yin
;;
;; Author: Dylan Yin <mrdylanyin@gmail.com>
;; Maintainer: Dylan Yin <mrdylanyin@gmail.com>
;; Created: November 27, 2023
;; Modified: November 27, 2023
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/dylanyin/init-keybinding
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

;;; core-keybinds.el --- -*- lexical-binding: t; -*-

;; Copyright (C) 2020-2023  Tianshu Wang

;; Author: Tianshu Wang <wang@tianshu.me>

;;; Commentary:

;;; Code:

;; (use-package which-key
;;   :straight t
;;   :hook (after-init . which-key-mode)
;;   :config
;;   (setq which-key-idle-delay 0.4
;;        which-key-idle-secondary-delay 0.01
;;        which-key-max-description-length 32
;;        which-key-sort-order 'which-key-key-order-alpha
;;        which-key-allow-evil-operators t)

;;   (push '((nil . "tab-bar-select-tab") . t) which-key-replacement-alist))

(use-package evil-nerd-commenter)
(use-package general
  ;; :straight t
  :after evil
  :config
  (setq general-emit-autoloads nil)

  (general-define-key
   :states '(normal insert motion emacs)
   :keymaps 'override
   :prefix-map 'tyrant-map
   :prefix "SPC"
   :non-normal-prefix "M-SPC")


  (general-create-definer tyrant-def :keymaps 'tyrant-map)
  (tyrant-def "" nil)

  (general-create-definer despot-def
    :states '(normal insert motion emacs)
    :keymaps 'override
    :major-modes t
    :prefix "SPC m"
    :non-normal-prefix "M-SPC m")
  (despot-def "" nil)

  (general-def universal-argument-map
    "SPC u" 'universal-argument-more)

  (tyrant-def
   "SPC"     '("M-x" . execute-extended-command)
   "TAB"     '("last buffer" . alternate-buffer)
   "!"       '("shell cmd" . shell-command)

   "a"       (cons "applications" (make-sparse-keymap))
   "ac"      'calc-dispatch
   "ap"      'list-processes
   "aP"      'proced

   "b"       (cons "buffers" (make-sparse-keymap))
   "bb"      'switch-to-buffer
   "bB"      'ibuffer
   "bd"      'kill-current-buffer
   "bm"      'switch-to-messages-buffer
   "bs"      'switch-to-scratch-buffer
   "bu"      'reopen-killed-buffer
   "bx"      'kill-buffer-and-window

   "c"       (cons "code" (make-sparse-keymap))
   "cb"      'flymake-show-buffer-diagnostics
   "cc"      'compile
   "cn"      'next-error
   "cp"      'previous-error
   "cr"      'recompile
   "cx"      'kill-compilation
   "c="      'indent-region-or-buffer

   "f"       (cons "files" (make-sparse-keymap))
   "fC"      '("copy-file" . write-file)
   "fD"      'delete-current-buffer-file
   "fe"      'find-library
   "fE"      'sudo-edit
   "ff"      'find-file
   "fj"      'dired-jump
   "fJ"      'dired-jump-other-window
   "fo"      'open-file-or-directory-in-external-app
   "fR"      'rename-current-buffer-file
   "fs"      'save-buffer
   "fv"      (cons "variables" (make-sparse-keymap))
   "fvd"     'add-dir-local-variable
   "fvf"     'add-file-local-variable
   "fvp"     'add-file-local-variable-prop-line

   "F"       (cons "frame" (make-sparse-keymap))
   "Fd"      'delete-frame
   "FD"      'delete-other-frames
   "Fn"      'make-frame
   "Fo"      'other-frame

   "h"       (cons "help" (make-sparse-keymap))
   "ha"      'apropos
   "hb"      'describe-bindings
   "hc"      'describe-char
   "hf"      'describe-function
   "hF"      'describe-face
   "hi"      'info-emacs-manual
   "hI"      'info-display-manual
   "hk"      'describe-key
   "hK"      'describe-keymap
   "hm"      'describe-mode
   "hM"      'woman
   "hp"      'describe-package
   "ht"      'describe-text-properties
   "hv"      'describe-variable
   "hP"      (cons "profiler" (make-sparse-keymap))
   "hPs"     'profiler-start
   "hPk"     'profiler-stop
   "hPr"     'profiler-report

   "j"       (cons "jump" (make-sparse-keymap))
   "ji"      'imenu
   "jg"      'avy-goto-char-timer

   "l"       (cons "layouts" tab-prefix-map)
   "ld"      'tab-bar-close-tab
   "lD"      'tab-bar-close-other-tabs
   "lg"      'tab-bar-change-tab-group
   "lm"      'tab-bar-move-tab-to
   "lM"      'tab-bar-move-tab-to-group
   "ll"      'tab-bar-switch-to-tab
   "lR"      'tab-bar-rename-tab
   "lt"      'other-tab-prefix
   "lu"      'tab-bar-undo-close-tab
   "l1"      '("select tab 1..8" . tab-bar-select-tab)
   "l2"      'tab-bar-select-tab
   "l3"      'tab-bar-select-tab
   "l4"      'tab-bar-select-tab
   "l5"      'tab-bar-select-tab
   "l6"      'tab-bar-select-tab
   "l7"      'tab-bar-select-tab
   "l8"      'tab-bar-select-tab
   "l TAB"   'tab-bar-switch-to-last-tab

   "m"       (cons "major mode" (make-sparse-keymap))

   "p"       (cons "projects" project-prefix-map)
   "pt"      'project-open-in-tab

   "q"       (cons "quit" (make-sparse-keymap))
   "qd"      'restart-emacs-debug-init
   "qr"      'restart-emacs
   "qR"      'restart-emacs-without-desktop
   "qf"      'delete-frame
   "qq"      'save-buffers-kill-terminal
   "qQ"      'save-buffers-kill-emacs

   "s"       (cons "search" (make-sparse-keymap))
   "ss"      'consult-line
   "sp"      'consult-ripgrep

   "T"       (cons "toggles" (make-sparse-keymap))
   "Ta"      'auto-fill-mode
   "Td"      'toggle-debug-on-error
   "Tf"      'display-fill-column-indicator-mode
   "Tl"      'toggle-truncate-lines
   "Tm"      'flymake-mode
   "Tn"      'display-line-numbers-mode
   "Ts"      'flyspell-mode
   "Tw"      'whitespace-mode
   "TW"      'toggle-word-wrap

   "u"       '("universal arg" . universal-argument)

   "w"       (cons "windows" (make-sparse-keymap))
   "w TAB"   'alternate-window
   "w+"      'window-layout-toggle
   "wb"      'switch-to-minibuffer-window
   "wd"      'delete-window
   "wD"      'delete-other-windows
   "wm"      'toggle-maximize-buffer
   "wf"      'follow-mode
   "wh"      'evil-window-left
   "wH"      'evil-window-move-far-left
   "wj"      'evil-window-down
   "wJ"      'evil-window-move-very-bottom
   "wk"      'evil-window-up
   "wK"      'evil-window-move-very-top
   "wl"      'evil-window-right
   "wL"      'evil-window-move-far-right
   "wr"      'rotate-windows-forward
   "wR"      'rotate-windows-backward
   "ws"      'split-window-vertically
   "wS"      'split-window-vertically-and-focus
   "wt"      'toggle-current-window-dedication
   "wu"      'winner-undo
   "wU"      'winner-redo
   "wv"      'split-window-horizontally
   "wV"      'split-window-horizontally-and-focus)

  (general-create-definer motion-p-leader-def
    :prefix "[")
  (general-create-definer motion-n-leader-def
    :prefix "]")
  (motion-p-leader-def
   :keymaps 'normal
   ;; bind "SPC a"
   "b" 'previous-buffer)
  (motion-n-leader-def
   :keymaps 'normal
   ;; bind "SPC a"
   "b" 'next-buffer)
  (general-define-key
   :states '(normal visual)
   :prefix "g"
   "c" 'evilnc-comment-or-uncomment-lines)


  (general-def
    [remap comment-dwim] 'comment-or-uncomment
    "M-/" 'hippie-expand
    "M-j" (defun scroll-other-window-next-line (&optional arg)
            (interactive "P")
            (scroll-other-window (or arg 1)))
    "M-k" (defun scroll-other-window-previous-line (&optional arg)
            (interactive "P")
            (scroll-other-window (- (or arg 1)))))

  (when (eq system-type 'darwin)
    (general-def
      "s-`"   'other-frame
      "s-a"   'mark-whole-buffer
      "s-c"   'evil-yank
      "s-n"   'make-frame
      "s-m"   'iconify-frame
      "s-q"   'save-buffers-kill-terminal
      "s-v"   'yank
      "s-x"   'kill-region
      "s-w"   'delete-window
      "s-W"   'delete-frame
      "s-z"   'evil-undo
      "s-Z"   'evil-redo
      "s-C-F" 'toggle-frame-fullscreen
      "s-s"   'save-buffer
      "s-<backspace>" (defun delete-line-before-point ()
                        (interactive)
                        (let ((prev-pos (point)))
                          (forward-visible-line 0)
                          (delete-region (point) prev-pos)
                          (indent-according-to-mode))))))

(use-package evil
  ;; :straight t
  :demand t
  :hook ((after-init . evil-mode)
         (prog-mode . hs-minor-mode))
  :init
  (setq evil-want-keybinding nil
        evil-symbol-word-search t
        evil-ex-search-vim-style-regexp t
        evil-search-module 'evil-search
        evil-magic 'very-magic
        evil-want-C-u-delete t
        evil-want-C-u-scroll t
        hs-minor-mode-map nil)
  :config
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
  (define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-line)
  (setq evil-cross-lines t
        evil-kill-on-visual-paste nil
        evil-move-beyond-eol t
        evil-want-C-i-jump t
        evil-want-fine-undo t
        evil-v$-excludes-newline t)

  (setq evil-normal-state-cursor  '("DarkGoldenrod2" box)
        evil-insert-state-cursor  '("chartreuse3" (bar . 2))
        evil-emacs-state-cursor   '("SkyBlue2" box)
        evil-replace-state-cursor '("chocolate" (hbar . 2))
        evil-visual-state-cursor  '("gray" (hbar . 2))
        evil-motion-state-cursor  '("plum3" box))

  (evil-set-undo-system 'undo-redo)

  (progn
    ;; Thanks to `editorconfig-emacs' for many of these
    (defvar evil-indent-variable-alist
      ;; Note that derived modes must come before their sources
      '(((awk-mode c-mode c++-mode java-mode
          idl-mode java-mode objc-mode pike-mode) . c-basic-offset)
        (groovy-mode . groovy-indent-offset)
        (python-mode . python-indent-offset)
        (cmake-mode . cmake-tab-width)
        (coffee-mode . coffee-tab-width)
        (cperl-mode . cperl-indent-level)
        (css-mode . css-indent-offset)
        (elixir-mode . elixir-smie-indent-basic)
        ((emacs-lisp-mode lisp-mode) . lisp-indent-offset)
        (enh-ruby-mode . enh-ruby-indent-level)
        (erlang-mode . erlang-indent-level)
        (js2-mode . js2-basic-offset)
        (js3-mode . js3-indent-level)
        ((js-mode json-mode) . js-indent-level)
        (latex-mode . (LaTeX-indent-level tex-indent-basic))
        (livescript-mode . livescript-tab-width)
        (mustache-mode . mustache-basic-offset)
        (nxml-mode . nxml-child-indent)
        (perl-mode . perl-indent-level)
        (puppet-mode . puppet-indent-level)
        (ruby-mode . ruby-indent-level)
        (rust-mode . rust-indent-offset)
        (scala-mode . scala-indent:step)
        (sgml-mode . sgml-basic-offset)
        (sh-mode . sh-basic-offset)
        (typescript-mode . typescript-indent-level)
        (web-mode . web-mode-markup-indent-offset)
        (yaml-mode . yaml-indent-offset))
      "An alist where each key is either a symbol corresponding
  to a major mode, a list of such symbols, or the symbol t,
  acting as default. The values are either integers, symbols
  or lists of these.")

    (defun set-evil-shift-width ()
      "Set the value of `evil-shift-width' based on the indentation settings of the
  current major mode."
      (let ((shift-width
             (catch 'break
               (dolist (test evil-indent-variable-alist)
                 (let ((mode (car test))
                       (val (cdr test)))
                   (when (or (and (symbolp mode) (derived-mode-p mode))
                             (and (listp mode) (apply 'derived-mode-p mode))
                             (eq 't mode))
                     (when (not (listp val))
                       (setq val (list val)))
                     (dolist (v val)
                       (cond
                        ((integerp v) (throw 'break v))
                        ((and (symbolp v) (boundp v))
                         (throw 'break (symbol-value v))))))))
               (throw 'break (default-value 'evil-shift-width)))))
        (when (and (integerp shift-width)
                   (< 0 shift-width))
          (setq-local evil-shift-width shift-width))))

    ;; after major mode has changed, reset evil-shift-width
    (add-hook 'after-change-major-mode-hook #'set-evil-shift-width 'append))

  (progn
    (evil-define-text-object evil-pasted (count &rest args)
      (list (save-excursion (evil-goto-mark ?\[) (point))
            (save-excursion (evil-goto-mark ?\]) (1+ (point)))))
    (define-key evil-inner-text-objects-map "P" 'evil-pasted)

    ;; define text-object for entire buffer
    (evil-define-text-object evil-inner-buffer (count &optional beg end type)
      (list (point-min) (point-max)))
    (define-key evil-inner-text-objects-map "g" 'evil-inner-buffer))

  ;; allow eldoc to trigger directly after changing modes
  (eldoc-add-command #'evil-normal-state
                     #'evil-insert
                     #'evil-change
                     #'evil-delete
                     #'evil-replace)

  (add-hook 'evil-normal-state-exit-hook #'evil-ex-nohighlight)

  (general-def 'normal "zf" 'reposition-window)
  (general-def 'insert [remap evil-complete-previous] 'hippie-expand))

(use-package evil-collection
  ;; :straight t
  :hook (after-init . evil-collection-init)
  :init
  (add-hook 'org-agenda-mode-hook
            (lambda () (evil-collection-unimpaired-mode -1))))

(use-package evil-owl
  ;; :straight t
  :hook (after-init . evil-owl-mode)
  :config
  (add-to-list 'display-buffer-alist
               '("*evil-owl*"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (window-height . 0.3)))
  (setq evil-owl-idle-delay 0.5))

(use-package evil-surround
  ;; :straight t
  :hook ((text-mode prog-mode conf-mode) . evil-surround-mode)
  :config
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (push '(?` . ("`" . "'")) evil-surround-pairs-alist)))
  ;; `s' for surround instead of `subtitute'
  (general-def 'visual evil-surround-mode-map
    "s" 'evil-surround-region
    "S" 'evil-substitute))




(provide 'init-keybinding)
;;; init-keybinding.el ends here
