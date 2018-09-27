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
        ((listp expr)   ; Empty or 
            0
        )
        ((not (listp expr))
            (deriv-terme expr var)
        )
    )
)

(defun removeZero (expr var)
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
                expr
            )
        )
        expr  ; Do nothing
    )
)

(defun removeOne (expr var)
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
                expr
            )
        )
        expr  ; Do nothing
    )
)

(defun simplify (expr var)
    (cond
        ((and (listp (cadr expr)) (listp (caddr expr)))
            ; Remove 0,1
            (setq tmp_list 
                (list (car expr) 
                    (removeOne (removeZero (simplify (cadr expr) var) var) var)
                    (removeOne (removeZero (simplify (caddr expr) var) var) var)
                )
            )
        )
        ((listp (cadr expr))
            ; Remove 0,1
            (setq tmp_list 
                (list (car expr) 
                    (removeOne (removeZero (simplify (cadr expr) var) var) var)
                    (removeOne (removeZero (caddr expr) var) var)
                )
            )
        )
        ((listp (caddr expr))
            ; Remove 0,1
            (setq tmp_list 
                (list (car expr) 
                    (removeOne (removeZero (cadr expr) var) var)
                    (removeOne (removeZero (simplify (caddr expr) var) var) var)
                )
            )
        )
        (T
            (setq tmp_list expr)
        )
    )
    (if (and 
            (numberp (cadr tmp_list))
            (numberp (caddr tmp_list))
        )
        (eval tmp_list)
        tmp_list
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

(print '-----------------------)
(print "Unit test for removeOne")
(assert (equal (removeOne '(+ 2 2) 'x) '(+ 2 2)) () "Test failed at (removeOne '(* 2 2) 'x)")
(assert (equal (removeOne '(* 2 2) 'x) '(* 2 2)) () "Test failed at (removeOne '(* 2 2) 'x)")
(assert (equal (removeOne '(* 1 2) 'x) '2      ) () "Test failed at (removeOne '(* 1 2) 'x)")
(assert (equal (removeOne '(+ 1 2) 'x) '(+ 1 2)) () "Test failed at (removeOne '(+ 1 2) 'x)")
(assert (equal (removeOne '(* 1 x) 'x) 'x      ) () "Test failed at (removeOne '(* 1 x) 'x)")
(assert (equal (removeOne '(+ 1 x) 'x) '(+ 1 x)) () "Test failed at (removeOne '(+ 1 x) 'x)")
(assert (equal (removeOne '(* x 1) 'x) 'x      ) () "Test failed at (removeOne '(* x 1) 'x)")
(assert (equal (removeOne '(+ x 1) 'x) '(+ x 1)) () "Test failed at (removeOne '(+ x 1) 'x)")
(assert (equal (removeOne '(* 1 1) 'x) '1      ) () "Test failed at (removeOne '(* 1 1) 'x)")
(assert (equal (removeOne '(+ 1 1) 'x) '(+ 1 1)) () "Test failed at (removeOne '(+ 1 1) 'x)")
(print '(All removeOne tests passed!))

(print '-----------------------)
(print "Unit test for removeZero")
(assert (equal (removeZero '(+ 2 2) 'x) '(+ 2 2)) () "Test failed at (removeZero '(+ 2 2)")
(assert (equal (removeZero '(* 2 2) 'x) '(* 2 2)) () "Test failed at (removeZero '(* 2 2)")
(assert (equal (removeZero '(* 0 2) 'x) '0      ) () "Test failed at (removeZero '(* 0 2)")
(assert (equal (removeZero '(+ 0 2) 'x) '2      ) () "Test failed at (removeZero '(+ 0 2)")
(assert (equal (removeZero '(* 0 x) 'x) '0      ) () "Test failed at (removeZero '(* 0 x)")
(assert (equal (removeZero '(+ 0 x) 'x) 'x      ) () "Test failed at (removeZero '(+ 0 x)")
(assert (equal (removeZero '(* x 0) 'x) '0      ) () "Test failed at (removeZero '(* x 0)")
(assert (equal (removeZero '(+ x 0) 'x) 'x      ) () "Test failed at (removeZero '(+ x 0)")
(assert (equal (removeZero '(+ 0 0) 'x) '0      ) () "Test failed at (removeZero '(+ 0 0)")
(assert (equal (removeZero '(* 0 0) 'x) '0      ) () "Test failed at (removeZero '(* 0 0)")
(print '(All removeZero tests passed!))

(print '-----------------------)
(print "Unit test for simplify '(+ (* x 3) (* x 6)) 'x)")
(setq expr (deriv-expr '(+ (* x 3) (* x 6)) 'x))
(assert (equal (simplify expr 'x) 9) () "Test failed at '(+ (* x 3) (* x 6)) 'x)")
(print "Unit test for simplify '(+ (* x 3) (* x 6)) = 9 passed!")

(print '-----------------------)
(setq expr (deriv-expr '(* (+ (* x 3) (* x 6)) x) 'x))
(print expr)
(print (simplify expr 'x))
; (+ (* (+ (+ (* 1 3) (* X 0)) (+ (* 1 6) (* X 0))) X) (* (+ (* X 3) (* X 6)) 1))
; -> (+ (* 9 X) (+ (* X 3) (* X 6)))
; -> (* 18 X) TO-DO
