(load "parsing-module-symbol.lisp")

(defparameter firstWordNum 20)

(defun identify-first-character (languages source)
    (let ((words '()) (scores '()) (f (open source :direction :input)) (num-lines 0))
        ; parse source
        (loop
            (let* ((line (read-line f NIL)) (trimed-line (string-trim " " line)))
                (if line
                    (if (> (length trimed-line) 0)
                        (let ((word (intern (car (split-by-space trimed-line)))))
                            (setf num-lines (+ num-lines 1))
                            (if (assoc word words)
                                (setf (cdr (assoc word words)) (+ (cdr (assoc word words)) 1))
                                (push (cons word 1) words)
                            )
                        )
                    )
                    (return)
                )
            )
        )

        (dolist (lang languages)
            (format T "----~A----~%" lang)
            (let ((summed 0) (lang-score 0) (*strings* '()) (database-words '()) (pairs '()))
                ; read database for each language into memory
                (with-open-file (f (open (format NIL "database/~A/~A.txt" lang "firstWord") :direction :input))
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

                ; database_words[i] = [character frequency of occurence]
                (setf database-words (sort pairs #'sort-asec-helper))

                (dolist (pair pairs)
                    (setf summed (+ summed (cdr pair)))
                )

                ; lang_score = 1/sum(((%freq of char in source - %freq of char in database)/%freq of char in database)^2) 
                ; where sum is for the 5 most common words in the language
                (let ((i 0))
                    (loop
                        ;; i > -1 - lastCharacterNum and i*-1 <= len(database_words)
                        (if (or (>= i (list-length database-words)) (>= i firstWordNum))
                            (return)
                        )

                        ; Avoid divide by 0
                        (if (= summed 0)
                            (setf summed 0.00000000001)
                        )
                        (if (= num-lines 0)
                            (setf num-lines 0.00000000001)
                        )

                        (if (assoc (car (nth i database-words)) words)
                            (let ((k (car (nth i database-words))) (v (cdr (nth i database-words))))
                                (format T "~A Founded ~A ~%" k lang-score)
                                ; ((database_operator[i][0]/summed - operators[database_operator[i][1]]/num_ops)/(database_operator[i][0]/summed))**2
                                (let ((s (/ (- (/ v summed) (/ (cdr (assoc k words)) num-lines)) (/ v summed))))
                                    (setf lang-score (+ lang-score (* s s)))
                                )
                            )
                            (setf lang-score (+ lang-score 1))
                        )

                        (setf i (+ i 1))
                    )
                )

                ; Scale to the same size
                (if (> firstWordNum (list-length database-words))
                    (setf lang-score (* (/ firstWordNum (list-length database-words))))
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

(print (identify-first-character '(lisp c cplusplus java javascript python) "test.lisp"))
