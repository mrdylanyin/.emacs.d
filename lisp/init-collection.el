(use-package super-save
  :straight t
  :config
  (setq super-save-auto-save-when-idle t)
  (setq super-save-all-buffers t)
  (setq super-save-exclude '(".gpg"))
  ;; 例子，当为某个模式时停止自动保存
  ;; (add-to-list 'super-save-predicates (lambda () (not (eq major-mode 'markdown-mode))))
  (super-save-mode +1))

(provide 'init-collection)
