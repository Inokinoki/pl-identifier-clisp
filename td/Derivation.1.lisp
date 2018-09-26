; (x+1)' = 1
; (3x+1)' = 3
; (xy * z)'

; (+ (* 3 x) y)
; deriv (+ (* 3 x) y)  x)

(defun deriv-terme (expression v)
    (if (equal v expression)
        '1
        '0
    )
)

(defun deriv-sum (expression v)
    (list '+ (deriv-expr (cadr expression) v) (deriv-expr (caddr expression) v))
)

(defun deriv-prod (expression v)
    (list '+ 
        (list '* (deriv-expr (cadr expression) v) (caddr expression))
        (list '* (cadr expression) (deriv-expr (caddr expression) v))
    )      
)

(defun deriv-expr (expr var)
    (cond
        ((and (listp expr) (equal (car expr) '+)) 
            (print "Expression +")
            (deriv-sum expr var)
        )
        ((and (listp expr) (equal (car expr) '*))
            (print "Expression *")
            (deriv-prod expr var)
        )
        ((listp expr)   ; Empty or 
            (print "Expression list or empty")
            0
        )
        ((not (listp expr))
            (print "Expression atom")
            (deriv-terme expr var)
        )
    )
)

(defun removeZero (expr var)
    (print expr)
    (if (and expr 
            (listp expr) 
            (equal (list-length expr) 3)
        )
        (cond
            ((and (equal (car expr) '*) (member 0 expr))
                0
            )
            ((and (equal (car expr) '+) (member 0 expr))
                (if (equal (cadr expr) 0)
                    (caddr expr)
                    (cadr expr)
                )
            )
            (T
                (setq tmp_list (list (car expr) 
                        (removeZero (cadr expr) var) 
                        (removeZero (caddr expr) var)
                    )
                )
                (if (member 0 tmp_list)
                    (removeZero tmp_list var)
                    tmp_list
                )
            )
        )
        expr  ; Do nothing
    )
)


(defun removeOne (expr var)
    (print expr)
    (if (and expr 
            (listp expr) 
            (equal (list-length expr) 3)
        )
        (cond
            ((and (equal (car expr) '*) (member 1 expr))
                (if (equal (cadr expr) 1)
                    (caddr expr)
                    (cadr expr)
                )
            )
            (T
                (setq tmp_list (list (car expr) 
                        (removeOne (cadr expr) var) 
                        (removeOne (caddr expr) var)
                    )
                )
                (if (member 1 tmp_list)
                    (removeOne tmp_list var)
                    tmp_list
                )
            )
        )
        expr  ; Do nothing
    )
)

;(print (deriv-sum '(x) 'x))
;(print (deriv-sum '(+ x 4) 'x))
;(print (deriv-prod '(* 3 x) 'x))
;(print (deriv-prod '(* (+ x 3) (+ x 4)) 'x))

(setq expr (deriv-expr '(+ (* x 3) (* x 6)) 'x))
(setq x 3)
(print expr)
(print (eval expr))
(print (removeZero expr 'x))
(print (removeOne (removeZero expr 'x) 'x))
;(print (simplify expr))

;(print (deriv-terme 'x 'x))

;(defun deriv(expression v)

;)