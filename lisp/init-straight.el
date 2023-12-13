;;; init-straight.el --- Description -*- lexical-binding: t; -*-

;; (setq straight-check-for-modifications nil)
;; bootstrap `straight.el'
(defvar bootstrap-version)
(setq straight-check-for-modifications '(find-when-checking)
      ;; straight-host-usernames '((github . "tshu-w"))
      straight-vc-git-default-clone-depth 1
      straight-build-dir (format "build/%d%s%d"
                                 emacs-major-version
                                 version-separator
                                 emacs-minor-version))

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

(setq straight-use-package-by-default t)
(setq use-package-always-defer t
      use-package-expand-minimally t
      use-package-enable-imenu-support t)

(use-package diminish :straight t)

;; Update GPG keyring for GNU ELPA
(use-package gnu-elpa-keyring-update)

;; A modern Packages Menu
(use-package paradox
  :custom-face
  (paradox-archive-face ((t (:inherit font-lock-doc-face))))
  (paradox-description-face ((t (:inherit completions-annotations))))
  :hook (emacs-startup . paradox-enable)
  :init (setq paradox-execute-asynchronously t
              paradox-github-token t
              paradox-display-star-count nil
              paradox-status-face-alist ;
              '(("built-in"   . font-lock-builtin-face)
                ("available"  . success)
                ("new"        . (success bold))
                ("held"       . font-lock-constant-face)
                ("disabled"   . font-lock-warning-face)
                ("avail-obso" . font-lock-comment-face)
                ("installed"  . font-lock-comment-face)
                ("dependency" . font-lock-comment-face)
                ("incompat"   . font-lock-comment-face)
                ("deleted"    . font-lock-comment-face)
                ("unsigned"   . font-lock-warning-face)))
  :config
  (add-hook 'paradox-after-execute-functions
            (lambda (_)
              "Display `page-break-lines' in \"*Paradox Report*\" buffer."
              (when (fboundp 'page-break-lines-mode)
                (let ((buf (get-buffer "*Paradox Report*"))
                      (inhibit-read-only t))
                  (when (buffer-live-p buf)
                    (with-current-buffer buf
                      (page-break-lines-mode 1))))))
            t))

;; Update packages
(unless (fboundp 'package-upgrade-all)
  (use-package auto-package-update
    :init
    (setq auto-package-update-delete-old-versions t
          auto-package-update-hide-results t)
    (defalias 'package-upgrade-all #'auto-package-update-now)))

(provide 'init-straight)
;;; init-straight.el ends here
