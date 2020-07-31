(load "parsing-module-symbol.lisp")

(defparameter lastCharacterNum 5)

(defun identify-last-character (languages source)
    (let ((characters '()) (scores '()) (f (open source :direction :input)) (num-lines 0))
        ; parse source
        (loop
            (let* ((line (read-line f NIL)) (trimed-line (string-trim " " line)))
                (if line
                    (if (> (length trimed-line) 0)
                        (let ((ch (intern (subseq trimed-line (- (length trimed-line) 1) (length trimed-line)))))
                            (setf num-lines (+ num-lines 1))
                            (if (assoc ch characters)
                                (setf (cdr (assoc ch characters)) (+ (cdr (assoc ch characters)) 1))
                                (push (cons ch 1) characters)
                            )
                        )
                    )
                    (return)
                )
            )
        )

        (dolist (lang languages)
            (format T "----~A----~%" lang)
            (let ((summed 0) (lang-score 0) (*strings* '()) (database-characters '()) (pairs '()))
                ; read database for each language into memory
                (with-open-file (f (open (format NIL "database/~A/~A.txt" lang "lastCharacter") :direction :input))
                    (loop
                        (let ((line (read-line f NIL)))
                            (if line
                                (push line *strings*)
                                (return)
                            )
                        )
                    )
                )

                (setf pairs (parse-lines *strings*))

                ; database_characters[i] = [character frequency of occurence]
                (setf database-characters (sort pairs #'sort-asec-helper))

                (dolist (pair pairs)
                    (setf summed (+ summed (cdr pair)))
                )

                ; lang_score = 1/sum(((%freq of char in source - %freq of char in database)/%freq of char in database)^2) 
                ; where sum is for the 5 most common characters in the language
                (let ((i 0))
                    (loop
                        ;; i > -1 - lastCharacterNum and i*-1 <= len(database_characters)
                        (if (or (>= i (list-length database-characters)) (>= i lastCharacterNum))
                            (return)
                        )

                        ; Avoid divide by 0
                        (if (= summed 0)
                            (setf summed 0.00000000001)
                        )
                        (if (= num-lines 0)
                            (setf num-lines 0.00000000001)
                        )

                        (if (assoc (car (nth i database-characters)) characters)
                            (let ((k (car (nth i database-characters))) (v (cdr (nth i database-characters))))
                                (format T "~A Founded ~A ~%" k lang-score)
                                ; ((database_operator[i][0]/summed - operators[database_operator[i][1]]/num_ops)/(database_operator[i][0]/summed))**2
                                (let ((s (/ (- (/ v summed) (/ (cdr (assoc k characters)) num-lines)) (/ v summed))))
                                    (setf lang-score (+ lang-score (* s s)))
                                )
                            )
                            (setf lang-score (+ lang-score 1))
                        )

                        (setf i (+ i 1))
                    )
                )

                ; Scale to the same size
                (if (> lastCharacterNum (list-length database-characters))
                    (setf lang-score (* (/ lastCharacterNum (list-length database-characters))))
                )

                (if (= 0 lang-score)
                    (setf lang-score 0.00000000001)
                )

                (setf lang-score (/ 1 lang-score))
                (push (cons lang lang-score) scores)
            )
        )

        (let ((summed-scores 0))
            ; Sum
            (dolist (lang languages)
                (setf summed-scores (+ summed-scores (cdr (assoc lang scores))))
            )
            (dolist (lang languages)
                (if (= summed-scores 0)
                    (setf (cdr (assoc lang scores)) 0)
                    (setf (cdr (assoc lang scores)) (/ (cdr (assoc lang scores)) summed-scores))
                )
            )
        )

        scores
    )
)

(print (identify-last-character '(lisp c cplusplus java javascript python) "test.lisp"))
