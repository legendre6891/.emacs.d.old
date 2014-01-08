
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(setq my-packages '(ac-nrepl ace-jump-mode ample-theme
auto-complete autopair base16-theme better-defaults cider
clojure-mode coffee-mode color-theme-railscasts color-theme
color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow
discover espresso-theme evil-leader evil-matchit
evil-nerd-commenter evil-tabs elscreen evil expand-region
flatland-theme flx-ido flx geiser goto-chg haskell-mode
ido-ubiquitous ido-vertical-mode iy-go-to-char key-chord
latex-extra auctex litable magit git-rebase-mode git-commit-mode
makey multiple-cursors noctilux-theme org paredit pkg-info epl
popup sass-mode haml-mode scala-mode2 scss-mode smart-mode-line
smartparens dash cl-lib smex soothe-theme sublime-themes surround
ujelly-theme undo-tree yasnippet zenburn-theme))
	

(dolist (package my-packages)
  (when (not (package-installed-p package))
    (package-install package)))
