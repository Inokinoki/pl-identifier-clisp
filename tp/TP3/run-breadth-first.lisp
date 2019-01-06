(load "preprocessing-v1.lisp")
(load "forward-motor.lisp")

(setq filename "identifytraits.py")
;(setq filename "forward-motor.lisp")

(let ( 
        (firstword (get-highest (get-first-word filename)))
        (bracket (get-highest (get-brackets filename)))
        (lastcharacter (get-highest (get-last-character filename)))
        (punctuation (get-highest (get-punctuation-rate filename)))
    )

    (format T "Le premier mot : ~{~A ~} ~%" firstword)
    (format T "Le crochet : ~{~A ~} ~%" bracket)
    (format T "Le dernier character: ~{~A ~} ~%" lastcharacter)
    (format T "La ponctuation: ~{~A ~} ~%" punctuation)

    (defparameter source (make-instance '$source-descriptor))
    (setf (?firstword source) (caar firstword))
    (setf (?brackets source) (caar bracket))
    (setf (?lastCharacter source) (caar lastcharacter))
    (setf (?punctuation source) (caar punctuation))

    (format T "----------- Marchant ----------- ~%")

    (parcour-regles regles '() 1)
)
