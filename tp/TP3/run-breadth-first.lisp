(load "preprocessing-v1.lisp")
(load "forward-motor.lisp")

(load "file.lisp")
;(setq filename "forward-motor.lisp")

(let ( 
        (firstword (get-highest (get-first-word filename)))
        (bracket (get-highest (get-brackets filename)))
        (lastcharacter (get-highest (get-last-character filename)))
        (punctuation (get-highest (get-punctuation-rate filename)))
        (keywords (get-highest (get-keywords filename)))
        (operators (get-highest (get-operator filename)))
    )

    (format T "Le premier mot : ~{~A ~} ~%" firstword)
    (format T "Le crochet : ~{~A ~} ~%" bracket)
    (format T "Le dernier character: ~{~A ~} ~%" lastcharacter)
    (format T "La ponctuation: ~{~A ~} ~%" punctuation)
    (format T "Le mot cle: ~{~A ~} ~%" keywords)
    (format T "L'operateur: ~{~A ~} ~%" operators)

    (defparameter source (make-instance '$source-descriptor))
    (setf (?firstword source) (caar firstword))
    (setf (?brackets source) (caar bracket))
    (setf (?lastCharacter source) (caar lastcharacter))
    (setf (?punctuation source) (caar punctuation))
    (setf (?keywords source) (caar keywords))
    (setf (?operators source) (caar operators))

    (format T "----------- Marchant ----------- ~%")

    (if (parcour-regles regles '() 1)
        (format T "Resultat trouve ~%")
        (format T "Pas de resultat ~%")
    )
)
