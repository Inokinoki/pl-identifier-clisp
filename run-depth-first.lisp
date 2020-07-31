(load "preprocessing-v1.lisp")
(load "forward-motor.lisp")

(load "file.lisp")

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
                                (progn
                                    (setf (?keywords source) (caar keywords))
                                    (if (depth-regles regles)
                                        (format T "Resultat trouve ~%")
                                        (progn
                                            (setf (?operators source) (caar operators))
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
            )
        )
    )
)
