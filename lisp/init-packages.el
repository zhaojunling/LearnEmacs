
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://elpa.popkit.org/packages/") t)
  )
(require 'cl)

;;add whatever packages you want here
(defvar sswanv/packages '(
			  company
			  monokai-theme
			  hungry-delete
			  swiper
			  counsel
			  smartparens
			  js2-mode
			  nodejs-repl
			  popwin
			  web-mode
			  js2-refactor
			  expand-region
			  iedit
			  org-pomodoro
			  helm-ag
			  flycheck
			  auto-yasnippet
			  evil
			  evil-leader
			  undo-tree
			  goto-chg
			  window-numbering
			  lua-mode
			  evil-surround
			  evil-nerd-commenter
			  powerline-evil
			  which-key
			  mwe-log-commands
			  pallet
			  )  "Default packages")

(setq package-selected-packages 'sswanv/packages)

(defun sswanv/packages-installed-p ()
  (loop for pkg in sswanv/packages
        when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (sswanv/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg sswanv/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(global-hungry-delete-mode)

(smartparens-global-mode)
;; (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(require 'org-pomodoro)

(add-hook 'js2-mode-hook 'flycheck-mode)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(evil-mode 1)
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":" 'counsel-M-x
  "wm" 'delete-other-windows
  )

(window-numbering-mode)


(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'powerline-evil)

(which-key-mode)

(provide 'init-packages)
