(load "regles.lisp")

(defun valid-premisse (premisse)
    (funcall (car premisse) (eval (cadr premisse)) (eval (caddr premisse)))
)

(defun apply-conclusion (conclusion)
    (if (equal (car conclusion) 'equal)
        (setf (slot-value (eval (cadadr conclusion)) (caadr conclusion)) (eval (caddr conclusion)))
        (eval conclusion)
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
    (let ((conclusion-a-apply '()))
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
                        (apply-conclusion conclusion)
                    )
                )

                ;; Enter next
                (parcour-regles regles applied-regles (+ depth 1))
            )
        )
    )
)
