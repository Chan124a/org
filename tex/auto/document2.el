(TeX-add-style-hook
 "document2"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "amsmath")
   (LaTeX-add-labels
    "sec:a"))
 :latex)

