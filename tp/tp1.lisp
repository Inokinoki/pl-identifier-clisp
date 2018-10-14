;;IA01_Tp01

;; Exercice1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun reverseA(arg1 arg2 arg3)
    (list arg3 arg2 arg1)
)

(defun reverseB(L)
    (if(not(listp L))
        L
        (cond
            ((cddr L)(reverseA (car L) (cadr L) (caddr L))) ;; 3 elements ou plus
            ((not(cdr L))(L))                               ;; 1 element
            ((not(cddr L))(list (cadr L) (car L)))          ;; 2 elements
        )
    )
)

(defun reverseC (L)
    (if (or(not(listp L))(not(cdr L)))
        L
        (append (reverseC (cdr L)) (list(car L))) ;; avec recursive
    )
)



(defun list-double (L)
    (setq templist '())
    (loop for n in L
       do(cond
            ((listp n) (setq templist (append templist (list n))))
            ((not(listp n)) (setq templist (append templist (list n) (list n))))
        )
    )
    templist
)
;; loop for n in L===> "n" est un element dans la liste, "append" qui travaille avec des qlistes, donc il faut reconstruire une liste pour "n"



(defun monAppend(L M)
    (if (not L)
        M
        (cons (car L) (monAppend (cdr L) M)))  ;; avec recursive
)


(defun myEqual (a b)
  (cond ((numberp a)
            (eq a b)
        )
        ((symbolp a) 
            (eq a b)
        )
        ((and (listp a) (listp b))
            (and 
                (myEqual (car a) (car b)) 
                (myEqual (cdr a) (cdr b))
            )
        )
        (T nil))
)

;;Test myEqual
(print (myEqual 'LUC 'LUC))
(print (myEqual 'LUC 'DANIEL))
(print (myEqual (car '(do re)) (cadr '(mi do sol))))
(print (myEqual '(d p f t r) '(d p f t r)))    ;; NIL

(print (eq 'LUC 'LUC))
(print (eq 'LUC 'DANIEL))
(print (eq (car '(do re)) (cadr '(mi do sol))))
(print (eq '(d p f t r) '(d p f t r)))    ;; NIL


;;Test la fonction standard EQ
;(print (eq 'LUC 'LUC))
;(print (eq 'LUC 'DANIEL))
;(print (eq (car'(do re)) (cadr'(mi do sol))))
;(print (eq '(d p f t r) '(d p f t r)))    ;; NIL
;(print "-----------------------------------")
;;Test la fonction standard EQUAL
;(print (equal 'LUC 'LUC))
;(print (equal 'LUC 'DANIEL))
;(print (equal (car'(do re)) (cadr'(mi do sol))))
;(print (equal '(d p f t r) '(d p f t r)))   ;;T

;(print(reverseA 1 2 3))
;(setq L (list 'a '(a b) 'c))
;(print L)
;(print(reverseB L))
;(print(reverseC L))
;(setq l '(a b))
;(setq m '(c d))
;(print(monAppend l m))
;(print(list-double '((1 2) 3 (4 6) 6)))



;;Exercice2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun list-paire (L1 L2)
    (mapcar #'list L1 L2)
)

(defun list-paire2 (L1 L2)
     (mapcar (lambda (a b)  (cons a (list b))  ) L1 L2 )
)

(defun list-paire3 (L1 L2)
     (mapcar (lambda (a b)  (list a b)  ) L1 L2 )
)

(setq a '(0 2 3 11))
(setq b '(6 10 20 30))
;; (print"--------list-paire----------")
 (print (list-paire a b))
;; (print"--------list-paire2----------")
(print (list-paire2 a b))
;; (print"--------list-paire3----------")
(print (list-paire3 a b))
;; (print"--------cons----------")
;; (print (cons a b))
;; (print"--------append----------")
;; (print (append a b))

;;Exercice3;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-assoc(cle a-list)
    (setq temp NIL)
    (loop for n in a-list
        do(if (and (eq cle (car n)) (not temp))
            (setq temp n)
            NIL
        )
    )
    temp
)

(defun my-assocBis(cle a-list)
    (setq temp '())
    (loop for n in a-list
        do(if (eq cle (car n))
            (setq temp (append temp (list n)))
            NIL
        )
    )
    temp
)

(setq a-list '((Yolande 25) (Pierre 22) (Julie 45) (Pierre 33)))
(print (my-assoc 'Pierre a-list))
(print (my-assocBis 'Pierre a-list))


;;Exercice4;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun auteur(ouvrage)
    (cadr ouvrage)
)

(defun titre(ouvrage)
    (car ouvrage)
)

(defun annee(ouvrage)
    (caddr ouvrage)
)

(defun nombre(ouvrage)
    (cadddr ouvrage)
)



(setq BaseTest '((" Le Dernier Jour d'un condamné " Hugo 1829 50000)
(" Notre-Dame de Paris " Hugo 1831 3000000)
(" Les Misérables " Hugo 1862 2000000)
("Le Horla " Maupassant 1887 2000000)
(" Contes de la bécasse " Maupassant 1883 500000)
("Germinal " Zola 1885 3000000))
)


(defun FB1(ouvrage)
    (loop for n in ouvrage
        do(print n)
    )
)

(defun FB2(ouvrage)
    (loop for n in ouvrage
        do(if (eq 'Hugo (cadr n))
            (print n)
            NIL
        )
    )
)


(defun FB3(auteur ouvrage)
    (setq l '())
    (loop for n in ouvrage
        do(if (eq auteur (cadr n))
            (setq l (append l (list n)))
            NIL
        )
    )
    l
)

(defun FB4(X ouvrage)
    (setq temp '())
    (loop for n in ouvrage
        do(if (and (eq X (annee n)) (equal nil temp))
            (setq temp n)
        )
    )
    temp
)

(defun FB5(ouvrage)
    (setq l '())
    (loop for n in ouvrage
        do(if (< 1000000 (cadddr n))
            (setq l (append l (list n)))
        )
    )
    l
)

(defun FB6(X ouvrage)
    (setq sum 0)
    (loop for n in (FB3 X ouvrage)
        do(setq sum (+ sum (nombre n)) )
    )
    (eval (/ sum (list-length (FB3 X ouvrage))))
)




;(FB1 BaseTest)
;(FB2 BaseTest)
;(print(FB3 'Zola BaseTest))
;(print(FB4 1831 BaseTest))
;(print(FB5 BaseTest))
;(print(FB6 'Hugo BaseTest))

;; (setq BaseTest2 '((" Le Dernier Jour d'un condamné ", Hugo, 1829, 50000)
;; (" Notre-Dame de Paris ", Hugo, 1831, 3000000)
;; (" Les Misérables ", Hugo, 1862, 2000000)
;; ("Le Horla ", Maupassant, 1887, 2000000)
;; (" Contes de la bécasse ", Maupassant, 1883, 500000) ("Germinal ", Zola, 1885, 3000000)
;; ))

;; (print(remove #\, BaseTest2))
;; (print (setq q '((a , b) c)))