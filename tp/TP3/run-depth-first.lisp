(load "preprocessing-v1.lisp")
(load "forward-motor.lisp")

(setq filename "identifytraits.py")

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
    
    ; On ajoute un fait afin de garantir en profondeur d'abord
    (setf (?firstword source) (caar firstword))

    (format T "----------- Marchant ----------- ~%")

    (if (depth-regles regles)
        (format T "Resultat trouve ~%")
        (progn
            (setf (?brackets source) (caar bracket))
            (if (depth-regles regles)
                (format T "Resultat trouve ~%")
                (progn
                    (setf (?lastCharacter source) (caar lastcharacter))
                    (if (depth-regles regles)
                        (format T "Resultat trouve ~%")
                        (progn
                            (setf (?punctuation source) (caar punctuation))
                            (if (depth-regles regles)
                                (format T "Resultat trouve ~%")
                                (format T "Pas de resultat ~%")
                            )
                        )
                    )
                )
            )
        )
    )
)
