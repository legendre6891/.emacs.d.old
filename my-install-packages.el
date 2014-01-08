
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(setq my-packages
      '(color-theme-sanityinc-tomorrow
	base16-theme
	paredit
	undo-tree
	yasnippet
	ido-ubiquitous
	;; latex-pretty-symbols
	latex-extra
	smex
	key-chord
	multiple-cursors
	noctilux-theme
	litable
	auto-complete
	scala-mode2
	haskell-mode
	undo-tree
	ido-vertical-mode
	flx
	flx-ido
	ujelly-theme
	soothe-theme
	espresso-theme
	expand-region
	magit
	ace-jump-mode
	iy-go-to-char
	coffee-mode
	color-theme-railscasts
	color-theme-sanityinc-solarized
	geiser
	sass-mode
	scss-mode
	sublime-themes
	evil
	autopair
        better-defaults
        evil-matchit
        evil-leader
        flatland-theme
        evil-tabs
        evil-nerd-commenter
        ido-vertical-mode
        ample-theme
        smart-mode-line
        cider
        auto-complete
        ac-nrepl
        discover
	))

(dolist (package my-packages)
  (when (not (package-installed-p package))
    (package-install package)))
