
(setq baseRegle '(
        (F (B D E) R1)
        (A (D G) R2)
        (A (C F) R3)
        (D (C) R4)
        (E (D) R5)
        (H (A) R6)
        (X (B) R7)
        (A (X C) R8)
    )
)

(setq baseFait 
    '(B C)
)

(defun cclRegle (regle) (car regle))

(defun premisseRegle (regle) (cadr regle))

(defun numRegle (regle) (caddr regle))

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

(defun RegleCanditatRecu (but bdr)
    (if bdr
        (if (equal but (cclRegle (car bdr)))
            (cons (car bdr) (RegleCanditatRecu but (cdr bdr)))
            (RegleCanditatRecu but (cdr bdr))
        )
    )
)

(defun verifer_ou (but bdr bdf)
    (cond 
        ((member but bdf)
            T
        )
        (T
            (setq regles (RegleCanditat but bdr))
            (setq ok NIL)
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

(print (RegleCanditat 'X baseRegle))
(print (RegleCanditat 'A baseRegle))
(print (RegleCanditatRecu 'A baseRegle))
(print (premisseRegle (car baseRegle)))

(print (verifer_ou 'F baseRegle '(B C D)))
