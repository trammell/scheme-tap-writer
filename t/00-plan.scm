(use-modules (tap writer))
(plan 2)
(diag "this is a comment")    ; diagnostic output
(ok #t)                       ; => ok
(ok #f)                       ; => not ok
