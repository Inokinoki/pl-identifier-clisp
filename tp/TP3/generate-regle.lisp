(load "readfile-module.lisp")

(defun pickup-features (features-list min-score)
    (let ((features-filted '()) (item (car features-list)) (features (cdr features-list)))
         ; For a sorted list, we can stop when the 
         (loop
             (if features
                 (if (>= (cdar features) min-score)
                     (push (car features) features-filted)
                     (return)
                 )
                 (return)
             )
             (setq features (cdr features))
         )
         features-filted
    )
)

(setq count 0)
(setq regles-origin '())

(dolist (score *scores*)
    (dolist (part (cdr score))
        (if (member (intern (car part)) (list (intern "keywords") (intern "operators")))
            (let ((features (pickup-features (cdr part) 5000)))
                ;(setf count (+ count (length features)))
                (dolist (feature features)
                    (setf count (+ count 1))
                    (format T "(R~A 
    (
        (equal (?~A source) (intern \"~A\"))
    ) 
    (
        (equal (~A-probability ~A) 1)
    )
)~%" count (car part) (car feature) (car part) (car score))
                )
            )
            (let ((features (pickup-features (cdr part) 1000)))
                ;(setf count (+ count (length features)))
                (dolist (feature features)
                    (setf count (+ count 1))
                    (format T "(R~A 
    (
        (equal (?~A source) (intern \"~A\"))
    ) 
    (
        (equal (~A-probability ~A) 1)
    )
)~%" count (car part) (car feature) (car part) (car score))
                )
            )
        )
    )
)
