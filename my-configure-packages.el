(use-package better-defaults)


(use-package ido
  :init
  (progn
    (ido-mode t)
    (ido-ubiquitous-mode t))
  :config
  (progn
    (set 'ido-enable-flex-matching t)
    (set 'ido-everywhere t)
    (set 'ido-use-virtual-buffers t))
)



;; Latex configure
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(setq-default TeX-master nil)
    (setq TeX-PDF-mode t)





(defun turn-off-yas ()
  "Turns off yas-minor-mode"
  (interactive)
  (yas-minor-mode -1))

(add-hook 'LaTeX-mode-hook 'turn-off-yas)


(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))

(setq reftex-plug-into-AUCTeX t)


(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.


(use-package yasnippet
  :init
  (yas-global-mode t)
  :config
  (setq yas/prompt-functions '(yas-ido-prompt))
  ;; :config
  ;; (progn 
  ;;   (defun yas/advise-indent-function (function-symbol)
  ;;     (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
  ;; 	       ,(format
  ;; 		 "Try to expand a snippet before point, then call `%s' as usual"
  ;; 		 function-symbol)
  ;; 	       (let ((yas/fallback-behavior nil))
  ;; 		 (unless (and (interactive-p)
  ;; 			      (yas/expand))
  ;; 		   ad-do-it)))))
    
  ;;   (yas/advise-indent-function 'cdlatex-tab)
  ;;   (yas/advise-indent-function 'org-cycle)
  ;;   (yas/advise-indent-function 'org-try-cdlatex-tab)
  ;;   )
)

(use-package smex
  :init
  (smex-initialize)
  :bind 
    (("M-x" . smex)
     ("C-x C-m" . smex)
     ("C-x m" . smex))
)

(use-package switch-window)
(use-package latex-pretty-symbols)
;; (use-package auto-complete
;;   :init
;;   (global-auto-complete-mode)
;; )

(use-package multiple-cursors
  :bind
  (
   ("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("S-M-SPC" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C-<" . mc/mark-all-like-this)
   ("C-z" . set-rectangular-region-anchor)))
   

(load "~/.emacs.d/cdlatex.el")
(use-package cdlatex
  :init
  (progn 
    (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

    (add-hook 'LaTeX-mode-hook '
	      (lambda ()
		(yas-minor-mode)))

    ;; Some Mathematica-like settings 
    (global-set-key (kbd "C-2") (kbd "s q TAB"))
    (global-set-key (kbd "C-/") (kbd "f r TAB"))
    (setq cdlatex-paired-parens "$")
    ))
    


(use-package haskell-mode
  :config
  (progn
    (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
    (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
    (add-to-list 'completion-ignored-extensions ".hi")))



(use-package flx-ido
  :init
  (progn
    (require 'flx-ido)
    (print "Loaded flx")
    (ido-mode 1)
    (ido-everywhere 1)
    (flx-ido-mode 1)
    ;; disable ido faces to see flx highlights.
    (setq ido-use-faces nil)))


(use-package ido-vertical-mode
  :init
  (ido-vertical-mode 1))

(use-package expand-region
  :init
  (progn 
    (require 'expand-region))
  :bind
  (("C-@" . er/expand-region)
   ("C-S-SPC" . er/expand-region)
   )
  :config
  (progn
    (pending-delete-mode t)))

(use-package evil
  :init
    (evil-mode 1)
  :config
  (setq evil-default-cursor t)
  (surround-mode 1)
)

;; (use-package evil-tabs
;;   :init
;;   (global-evil-tabs-mode t)
;; )

(use-package surround
  :init 
  (global-surround-mode 1)
)

(use-package evil-leader
  :init
  (global-evil-leader-mode)
  :config
  (progn
    (evil-leader/set-leader "SPC")
    (evil-leader/set-key
     "e" 'find-file
     "b" 'switch-to-buffer
     "t" 'switch-to-buffer
     "k" 'kill-buffer
     "x" 'smex
     "j" 'smex
     "r" 'reftex-renumber-simple-labels
     )
    )
)


(evilnc-default-hotkeys)


(use-package key-chord
  :init
  (key-chord-mode t)
  :config
 (progn 
    (defun comment-or-uncomment-region-or-line ()
      "Comments or uncomments the region or the current line if there's no active region."
      (interactive)
      (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
	  (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))


    (defun duplicate-line()
      (interactive)
      (move-beginning-of-line 1)
      (kill-line)
      (yank)
      (open-line 1)
      (next-line 1)
      (yank)
      )

    (defun copy-line()
      (interactive)
      (move-beginning-of-line 1)
      (kill-line)
      (yank)
      )

    ;; (key-chord-define-global "mx" 'smex)
    ;; (key-chord-define-global "jk" 'smex)
    (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
    ;; (key-chord-define-global "zx" 'eval-buffer)
    ;; (key-chord-define-global "fj" 'ido-switch-buffer)
    ;; (key-chord-define-global "jf" 'ido-switch-buffer)
    ;; (key-chord-define-global "FF" 'ido-find-file)
    ;; (key-chord-define-global "yy" 'copy-line)
    ;; (key-chord-define-global "YY" 'duplicate-line)
    ;; (key-chord-define-global ";;" 'comment-or-uncomment-region-or-line)
))



;; (use-package color-theme-twilight)
(use-package iy-go-to-char
  :bind
  (("M-m" . iy-go-to-char)))

(use-package autopair
   :init
   (autopair-global-mode))


;; use-package smartparens
;;   :init
;;   (progn
;;    (require 'smartparens-config)
;;    (turn-on-smartparens-mode)
;;    (turn-on-show-smartparens-mode)))


(use-package smart-mode-line
  :init
  (progn
    (setq sml/theme 'dark)
    (sml/setup))
)
  

;; (require 'smartparens-config)
;; (smartparens-global-mode)
;; (turn-on-show-smartparens-mode)

(setq preview-scale-function 1.7)                 ;; enlarge equation preview
(setq preview-auto-cache-preamble t)              ;; auto cache preamble

(eval-after-load 'latex '(latex/setup-keybinds))


;; (use-package discover
;;   :init
;;   (global-discover-mode 1)
;;   )

(require 'makey)
(require 'discover)
(global-discover-mode)

;; (lambda () set-custom-latex-style
;;   (TeX-add-style-hook
;;    "citfast"
;;    (lambda ()
;;      (LaTeX-run-style-hooks
;;       "amsmath"
;;       "amsthm"
;;       "amssymb"))))


;; (add-hook 'LaTeX-mode-hook 'set-custom-latex-style)
