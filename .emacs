(menu-bar-mode -1)
(global-linum-mode)
(setq linum-format " %d ")
(setq scroll-step 1)
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-l") 'goto-line)

(global-set-key (kbd "S-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-M-<down>") 'shrink-window)
(global-set-key (kbd "S-M-<up>") 'enlarge-window)

(global-set-key (kbd "<f5>") 'compile)

;; org-mode configuration

(setq org-log-done t)
(setq org-todo-keywords 
  '((sequence "TODO(t@)" "WAIT(w@/!)" "|" "DONE(d@)" "CANCELED(c@)")))

(setq org-todo-keyword-faces '(("TODO" . (:foreground "yellow" :background "red" :bold t :weight bold))
  ("WAIT" . (:foreground "red" :bold t :weight bold))
  ("DONE" . (:foreground "green"))
  ("CANCELED" . (:foreground "gray"))))

(global-set-key "\C-ca" 'org-agenda)