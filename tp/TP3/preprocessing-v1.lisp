(load "lastcharacter-v1.lisp")
(load "firstword-v1.lisp")
(load "punctuation-v1.lisp")
(load "brackets-v1.lisp")

(load "parsing-module-symbol.lisp")

(defun get-highest (pairs)
    (let* ((highest-pairs '()) (sorted-pairs (sort pairs #'sort-dsec-helper)) (highest (car sorted-pairs)))
        (if highest ;; If highest exists
            (let ((rest-pairs (cdr pairs)))
                (push highest highest-pairs)
                (loop
                    (if rest-pairs
                        (if (equal (cdr (car rest-pairs)) (cdr highest))
                                (progn
                                    (push (car rest-pairs) highest-pairs)
                                    (setf rest-pairs (cdr rest-pairs))
                                )
                                (return )
                        )
                        (return )
                    )
                )
            )
        )
        highest-pairs
    )
)

(defun get-highest-rate (pairs)
    (let* ((highest-pairs '()) (sorted-pairs (sort pairs #'sort-dsec-helper)) (highest (car sorted-pairs)))
        (if highest ;; If highest exists
            (let ((rest-pairs (cdr pairs)))
                (push highest highest-pairs)
                (loop
                    (if rest-pairs
                        (if (equal (cdr (car rest-pairs)) (cdr highest))
                                (progn
                                    (push (car rest-pairs) highest-pairs)
                                    (setf rest-pairs (cdr rest-pairs))
                                )
                                (return )
                        )
                        (return )
                    )
                )
            )
        )
        highest-pairs
    )
)
