
(add-to-list 'load-path "/home/xuelian/.emacs.d/lisp")

(require 'init-packages)


(tool-bar-mode -1)
;; (menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(global-linum-mode t)

(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; (setq-default cursor-type 'bar)

(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(require 'nodejs-repl)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(global-auto-revert-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8ss" "sswanv")
					    ("8email" "sswanv@gamil.com")
					    ))

(setq ring-bell-function 'ignore)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
