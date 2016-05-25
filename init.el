
(package-initialize)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(linum-mode t)

(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(recentf-mode t)

(global-company-mode t)
