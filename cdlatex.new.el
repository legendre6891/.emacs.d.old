(setq cdlatex-command-alist
      '(
	("bi" "Insert \\binom{}{}" "\\binom{?}{}" cdlatex-position-cursor nil nil t)
	("ggr(" "Insert \biggl( \biggr)" "\\biggl(? \\biggr" cdlatex-position-cursor nil nil t)
	("ggr|" "Insert \biggl| \biggr|" "\\biggl|? \\biggr|" cdlatex-position-cursor nil nil t)
	("axm" "Insert axiom env"   "" cdlatex-environment ("axiom") t nil)
	("thr" "Insert theorem env" "" cdlatex-environment ("theorem") t nil)
	("lem" "Insert lemma env" "" cdlatex-environment ("lemma") t nil)
	))



(setq cdlatex-math-modify-alist
      '(
	(?t "\\text" nil t nil nil)
	))


(setq cdlatex-env-alist
      '(("axiom" "\\begin{axiom}\nAUTOLABEL\n?\n\\end{axiom}\n" nil)
	("theorem" "\\begin{theorem}\nAUTOLABEL\n?\n\\end{theorem}\n" nil)
	("lemma" "\\begin{lemma}\nAUTOLABEL\n?\n\\end{lemma}\n" nil)
	))



(add-hook 'LaTeX-mode-hook
   (lambda ()
     (LaTeX-add-environments
       '("axiom" LaTeX-env-label)
       '("theorem" LaTeX-env-label)
       '("lemma" LaTeX-env-label)
       )))

(setq reftex-label-alist
   '(("axiom"   ?a "ax:"  "~\\ref{%s}" t ("axiom"   "ax.") -2)
     ("theorem" ?h "thr:" "~\\ref{%s}" t ("theorem" "th.") -3)
     ("lemma" ?l "lem:" "~\\ref{%s}" t ("lemma" "le.") -3)
     ))
