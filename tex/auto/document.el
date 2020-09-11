(TeX-add-style-hook
 "document"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("babel" "english")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "inputenc"
    "babel")
   (LaTeX-add-labels
    "pythagorean")
   (LaTeX-add-environments
    "theorem"
    "corollary"
    "lemma"))
 :latex)

