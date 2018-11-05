
(setq baseRegle '(
        (R1 ((>= d 5)) (eq moyen voiture))
        (R2 ((>= d 1) (<= t 15)) (eq moyen voiture))
        (R4 ((eq moyen voiture) (eq cinema ville)) (eq action taxi))
    )
)

(setq baseFait 
    '(B C)
)

;(funcall function-name params...)

; Conclusion
(defun cclRegle (regle) (caddr regle))

(defun premisseRegle (regle) (cadr regle))

(defun numRegle (regle) (car regle))

(defun RegleCanditat (but bdr)
    (let ((canditat NIL))
        (dolist (x bdr canditat)
            (if (equal but (cclRegle x))
                (push x canditat)
                NIL
            )
        )
    )
)

(defun appartient(but BF)
    ; LOOP
    (dolist (regle BF)
        (if (and 
                (equal (cadr but) (car regle)) 
                (funcall (car but) (cadr regle) (caddr but))
            )
            (return T)
            NIL
        )
    )
    
    ; NON-LOOP
    ;(let ((valeur (cadr (assoc (cadr but) BF))))
    ;    (and valeur
    ;        (not (eq valeur ))
    ;        (funcall (car but) valeur (caddr but))
    ;    )
    ;)
)

(defun RegleCanditatRecu (but bdr)
    (if bdr
        (if (equal but (cclRegle (car bdr)))
            (cons (car bdr) (RegleCanditatRecu but (cdr bdr)))
            (RegleCanditatRecu but (cdr bdr))
        )
    )

    ; (if (null regles) NIL
    ;   (let* ((concl (conclusion (car regles))))
    ;       (attribut (cadr concl))
    ;       (valeur (caddr concl)))
    ;       (if (and (eq attribut (cadr but)))
    ;           (funcall (car but) valeur (caddr but)))
    ;           (cons (car regles) (regles-canditature but (cdr regles)))
    ;           (regles-canditature but (cdr regles)))
    ;       )
    ;   )
    ; )
)

(defun verifer_ou (but bdr bdf)
    (cond 
        ((appartient but bdf)
            T
        )
        (T
            (let ((regles (RegleCanditat but bdr)) (ok NIL))
                (mapcar (lambda (regle) 
                        (if ok
                            NIL
                            (setq ok (verfier_et regle bdr bdf))
                        )
                    ) regles
                )
                ok
            )
        )
    )
)

(defun verfier_et (regle bdr bdf)
    (let ((premisse (premisseRegle regle)) (ok T))
        (mapcar (lambda (premis)
            (if ok
                (setq ok (verifer_ou premis bdr bdf))
                NIL
            )) premisse
        )
        ok
    )
)

(setq BF '((d 7) (t 12)))

(print (appartient '(>= d 5) BF))
(print (appartient '(>= t 22) BF))

(print (RegleCanditat '(eq action taxi) baseRegle))

(print (verifer_ou '(eq action taxi) baseRegle BF))
