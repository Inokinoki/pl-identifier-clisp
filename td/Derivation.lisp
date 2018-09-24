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

(defun simplify (expr var)
    (cond
        ((and (listp expr) (equal (car expr) '+)) 
            (cond 
                ((member 0 expr)
                    (cond 
                        ((equal (cadr expr) 0)
                            (simplify (caddr expr) var)    
                        )
                        ((equal (caddr expr) 0)
                            (simplify (cadr expr) var)    
                        )
                    )
                )
                (simplify expr)
            )
        )
        ((and (listp expr) (equal (car expr) '*))
            (cond 
                ((member 0 expr)
                    (0)
                )
                ((member 1 expr)
                    (cond 
                        ((equal (cadr expr) 1)
                            (simplify (caddr expr) var)    
                        )
                        ((equal (caddr expr) 1)
                            (simplify (cadr expr) var)    
                        )
                    )
                )
            )
        )
        ((listp expr)   ; Empty or 
            (print "Expression list or empty")
            0
        )
        ((not (listp expr))
            (print "Expression atom")
        )
    )

)

;(print (deriv-sum '(x) 'x))
;(print (deriv-sum '(+ x 4) 'x))
;(print (deriv-prod '(* 3 x) 'x))
;(print (deriv-prod '(* (+ x 3) (+ x 4)) 'x))

(setq expr (deriv-expr '(* (+ (* x 3) (* x 6)) x) 'x))
(setq x 3)
(print expr)
(print (eval expr))
(print (simplify expr))

;(print (deriv-terme 'x 'x))

;(defun deriv(expression v)

;)