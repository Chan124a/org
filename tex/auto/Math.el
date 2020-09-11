(TeX-add-style-hook
 "Math"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ctexart" "UTF8")))
   (TeX-run-style-hooks
    "latex2e"
    "ctexart"
    "ctexart10")
   (LaTeX-add-environments
    "theorem"
    "pro"
    "coro"
    "lemma"))
 :latex)

