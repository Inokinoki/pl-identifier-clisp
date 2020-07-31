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
        (equal (~A-probability ~A) T)
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
        (equal (~A-probability ~A) T)
    )
)~%" count (car part) (car feature) (car part) (car score))
                )
            )
        )
    )
)

(defun generate-with-dp (to-be-generated language)
    (if (> (list-length to-be-generated) 1)
        (let ((results))
            (dolist (option (generate-with-dp (cdr to-be-generated) language))
                (push (append (list (format NIL "(equal (?~A ~A) ~A)" (car to-be-generated) language T)) option) results)
                (push (append (list (format NIL "(equal (?~A ~A) ~A)" (car to-be-generated) language NIL)) option) results)
            )
            results
        )
        (list (list (format NIL "(equal (?~A ~A) ~A)" (car to-be-generated) language T)) 
            (list (format NIL "(equal (?~A ~A) ~A)" (car to-be-generated) language NIL)))
    )
)

(defun count-true (dp-list)
    (let ((count 0))
        (dolist (regle dp-list)
            (if (equal "T" (subseq regle (- (length regle) 2) (- (length regle) 1)))
                (setf count (+ count 1))
            )
        )
        count
    )
)

(dolist (lang '(c cplusplus java javascript lisp python))
    (dolist (regle (generate-with-dp '(lastCharacter-probability firstword-probability punctuation-probability 
        brackets-probability operators-probability keywords-probability) lang))
        (setf count (+ count 1))
        (format T "(R~A~%    (~%~{        ~A~%~})~%" count regle)
        (format T 
"    (
        (equal (~A *result*) ~A)
    )
)~%" lang (count-true regle))
    )
)


;; Round 3/4
(dolist (lang *LANGUAGES*)
    (setf count (+ count 1))
    (format T "(R~A 
    (
        (>= (?~A *result*) 4)
    ) 
    (
        (print \"Le code est probablement ~A~%\")
    )
)~%" count lang lang)
)
