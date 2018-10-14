(setq BaseTest '(
    (" Le Dernier Jour d'un condamné " Hugo 1829 50000)
    (" Notre-Dame de Paris " Hugo 1831 3000000)
    (" Les misérables " Maupassant 1862 2000000)
    ("Le Horla " Maupassant 1887 2000000)
    (" Contes de la bécasse " Maupassant 1883 500000)
    ("Germinal " Zola 1885 3000000)
))

; A. Fonctions basses
(defun auteur (bookinfo)
    (if (> (list-length bookinfo) 1)
        (cadr bookinfo)
        NIL
    )
)

(defun titre (bookinfo)
    (if (> (list-length bookinfo) 0)
        (car bookinfo)
        NIL
    )
)

(defun annee (bookinfo)
    (if (> (list-length bookinfo) 2)
        (caddr bookinfo)
        NIL
    )
)

(defun nombre (bookinfo)
    (if (> (list-length bookinfo) 3)
        (cadddr bookinfo)
        NIL
    )
)

(print (auteur (cadr BaseTest)))
(print (titre (cadr BaseTest)))
(print (annee (cadr BaseTest)))
(print (nombre (cadr BaseTest)))


; B. Service
(defun FB1 (bookinfos)
    (mapcar 
        (lambda (bookinfo) (format T "~A~%" (car bookinfo)))
        bookinfos
    )
)

;(FB1 BaseTest)

; B. Service
(defun FB2 (bookinfos)
    (mapcar 
        (lambda (bookinfo) 
            (if (equal (auteur bookinfo) 'Hugo)
                (format T "~A~%" (car bookinfo))
                NIL
            )
        )
        bookinfos
    )
)

(FB2 BaseTest)
