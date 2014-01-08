(defun orgtbl-to-latex-matrix (table params)
  "Convert the Orgtbl mode TABLE to a LaTeX Matrix."
  (interactive)
  (let* ((params2
          (list
           :tstart (concat "\\begin{pmatrix}")
           :tend "\\end{pmatrix}"
           :lstart "" :lend " \\\\" :sep " & "
           :efmt "%s\\,(%s)" :hline "\\hline")))
    (orgtbl-to-generic table (org-combine-plists params2 params))))


(defun orgtbl-insert-matrix ()
  "Insert a radio table template appropriate for this major mode."
  (interactive)
  (let* ((txt orgtbl-latex-matrix-string)
         name pos)
    (setq name (read-string "Table name: "))
    (while (string-match "%n" txt)
      (setq txt (replace-match name t t txt)))
    (or (bolp) (insert "\n"))
    (setq pos (point))
    (insert txt)
    (previous-line)
    (previous-line)))

(defcustom orgtbl-latex-matrix-string  "% BEGIN RECEIVE ORGTBL %n
% END RECEIVE ORGTBL %n
\\begin{comment}
#+ORGTBL: SEND %n orgtbl-to-latex-matrix :splice nil :skip 0

\\end{comment}\n"
  "Template for the latex matrix orgtbl translator
All occurrences of %n in a template will be replaced with the name of the
table, obtained by prompting the user."
  :type 'string
  :group 'org-table)
