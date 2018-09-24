; Generally 
;   car L is Left element
;   cadr L is middle element
;   caddr L is right element

; Left node, Right node, Root
;   ->
; Root, Left node, Right node
(defun postfix2prefix(L)
    (if (and (listp L) L)
        (list (caddr L) (postfix2prefix (car L)) (postfix2prefix (cadr L)))
        L
    )
)

; Root, Left node, Right node
;   ->
; Left node, Right node, Root
(defun prefix2postfix(L)
    (if (and (listp L) L)
        (list (prefix2postfix (cadr L)) (prefix2postfix (caddr L)) (car L))
        L
    )
)

; Root, Left node, Right node
;   ->
; Left node, Root, Right node
(defun prefix2infix(L)
    (if (and (listp L) L)
        (list (prefix2infix (cadr L)) (car L) (prefix2infix (caddr L)))
        L
    )
)

; Left node, Right, node Root
;   ->
; Left node, Root, Right node
(defun postfix2infix(L)
    (if (and (listp L) L)
        (list (postfix2infix (car L)) (caddr L) (postfix2infix (cadr L)))
        L
    )
)

; Left node, Root, Right node
;   ->
; Root, Left node, Right node
(defun infix2prefix(L)
    (if (and (listp L) L)
        (list (cadr L) (infix2prefix (car L)) (infix2prefix (caddr L)))
        L
    )
)

; Left node, Root, Right node
;   ->
; Left node, Right, node Root
(defun infix2postfix(L)
    (if (and (listp L) L)
        (list (infix2postfix (car L)) (infix2postfix (caddr L)) (cadr L))
        L
    )
)

(setq L (list '(x + 2) '/ '(x - 3)))

(print (infix2postfix nil))

(print '-----------------)
(print L)
(print 'infix2prefix)
(print (infix2prefix L))

(print '-----------------)
(print L)
(print 'infix2postfix)
(print (infix2postfix L))

(print '-----------------)
(print (infix2prefix L))
(print 'prefix2infix)
(print (prefix2infix (infix2prefix L)))

(print '-----------------)
(print (infix2postfix L))
(print 'postfix2infix)
(print (postfix2infix (infix2postfix L)))

(print '-----------------)
(print (infix2prefix L))
(print 'prefix2postfix)
(print (prefix2postfix (infix2prefix L)))

(print '-----------------)
(print (infix2postfix L))
(print 'postfix2prefix)
(print (postfix2prefix (infix2postfix L)))
