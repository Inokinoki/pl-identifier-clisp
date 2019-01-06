(load "regles.lisp")

(defun valid-premisse (premisse)
    (funcall (car premisse) (eval (cadr premisse)) (eval (caddr premisse)))
)

(defun apply-conclusion (conclusion)
    (if (equal (car conclusion) 'equal)
        (progn
            (setf (slot-value (eval (cadadr conclusion)) (caadr conclusion)) (eval (caddr conclusion)))
            NIL
        )
        (progn 
            (eval conclusion)
            T ; Resultat trouve
        )
    )
)

(defun valid-et (premisses)
    (let ((result T))
        (dolist (premisse premisses)
            (if (not (valid-premisse premisse))
                (setf result NIL)
            )
        )
        result
    )
)

;; Breadth first search, O(n)
(defun parcour-regles (regles applied-regles depth)
    ;(format T "------------- Inference ~A ---------------- ~%" depth)
    (let ((conclusion-a-apply '()) (is-ok NIL))
        (dolist (regle regles)
            ;(format T "Validating Regle ~A" (nom regle))
            ;(format T " Result: ~A ~%" (valid-et (premisses regle)))
            (if (valid-et (premisses regle))
                (if (not (member regle applied-regles))
                    (progn
                        ;(format T "Regle ~A Result: ~A  ~A ~%" (nom regle) (valid-et (premisses regle)) (conclusions regle))
                        (push (conclusions regle) conclusion-a-apply)
                        (push regle applied-regles)
                    )
                )
            )
        )

        (if (= (list-length conclusion-a-apply) 0)
            (format T "Inference over~%")
            (progn
                ; apply
                (dolist (conclusions conclusion-a-apply)
                    (dolist (conclusion conclusions)
                        (if (apply-conclusion conclusion)
                            (setf is-ok T)
                        )
                    )
                )

                ;; Enter next
                (let ((next-ok (parcour-regles regles applied-regles (+ depth 1))))
                    (or next-ok is-ok)  ; Return
                )
            )
        )
    )
)

(defun get-regles-possible (regles)
    (let ((regles-valable '()))
        (dolist (regle regles)
            (if (valid-et (premisses regle))
                (if (not (member regle *applied-regles*))
                    (progn
                        ;(format T "Regle ~A Result: ~A  ~A ~%" (nom regle) (valid-et (premisses regle)) (conclusions regle))
                        (push regle regles-valable)
                    )
                )
            )
        )
        regles-valable
    )
)

(defparameter *applied-regles* '())
;; Depth first search
(defun depth-regles (regles)
    (let ((regles-valable (get-regles-possible regles)) (is-ok NIL))
        ; Get valable
        ; Pick up one, valide it, enter next
        (dolist (regle regles-valable)
            (dolist (conclusion (conclusions regle))
                (push regle *applied-regles*)
                (if (apply-conclusion conclusion)
                    (progn
                        ;(format T "~A ~%" conclusion)
                        (setf is-ok T)
                    )
                )

                (let ((next-ok (depth-regles regles)))
                    (if next-ok
                        (progn 
                            (setf is-ok next-ok)
                            (return )
                        )
                    )  ; Return
                )
            )
        )
        is-ok
    )
)
