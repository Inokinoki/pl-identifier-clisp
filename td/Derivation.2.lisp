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
            (deriv-sum expr var)
        )
        ((and (listp expr) (equal (car expr) '*))
            (deriv-prod expr var)
        )
        ((listp expr)
            0
        )
        ((not (listp expr))
            (deriv-terme expr var)
        )
    )
)

(defun haveVarInfix (expr var)
    ;; Detect whether variable is in the expression
    (if (member var (list expr))
        T
        (if (and (listp expr) expr) ; expr is a list and expr is not an empty list
            (or 
                (haveVarInfix (cadr expr) var)
                (haveVarInfix (caddr expr) var)
            )
            NIL
        )
    )
)

(print (haveVarInfix '(+ (+ (* 1 3) (* X 0)) (+ (* 0 X) (* 4 1))) 'x))

(defun simplify (expr var)
    (print expr)
    (cond
        ((and (listp expr) (equal (car expr) '+)) 
            (print "Addition")
            (cond 
                ((member 0 expr)
                    (print "0")
                    (cond 
                        ((equal (cadr expr) 0)
                            (simplify (caddr expr) var)    
                        )
                        ((equal (caddr expr) 0)
                            (simplify (cadr expr) var)    
                        )
                    )
                )
                (T 
                    (list '+ 
                        (if (haveVarInfix (cadr expr) var)
                            (simplify (cadr expr) var)
                            (
                                (print (list 'Evaluating (cadr expr)))
                                (eval (cadr expr))
                            )
                        ) 
                        (if (haveVarInfix (caddr expr) var)
                            (simplify (caddr expr) var)
                            (eval (caddr expr))
                        )
                    )
                )
            )
        )
        ((and (listp expr) (equal (car expr) '*))
            (print "Production")
            (cond 
                ((member 0 expr)
                    0
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
                (T 
                    (list '* 
                        (if (haveVarInfix (cadr expr) var)
                            (simplify (cadr expr) var)
                            (eval (cadr expr))
                        ) 
                        (if (haveVarInfix (caddr expr) var)
                            (simplify (caddr expr) var)
                            (eval (caddr expr))
                        )
                    )
                )
                ;(T (list '* (simplify (cadr expr) var) (simplify (caddr expr) var)))
            )
        )
        ((numberp expr)
            (eval expr)
        )
        (T (list 0))
    )
)

;(print (deriv-sum '(x) 'x))
;(print (deriv-sum '(+ x 4) 'x))
;(print (deriv-prod '(* 3 x) 'x))
;(print (deriv-prod '(* (+ x 3) (+ x 4)) 'x))

(setq expr (deriv-expr '(+ (* x 3) (* 4 x)) 'x))
(setq x 3)
(print expr)
(print (eval expr))
(print (simplify expr 'x))

;(print (deriv-terme 'x 'x))

;(defun deriv(expression v)

;)