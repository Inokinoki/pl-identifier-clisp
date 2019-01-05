(load "parsing-module-symbol.lisp")

(defun identify-punctuation (languages source)
    (let ((punctuation (list (cons '\; 0) (cons (intern "a") 0))) 
            (scores '()) (f (open source :direction :input))
            (punclist '(\! \" \# \$ \% \& \' \( \) \* \+ \, \- \. \/ \: \; \< \= \> \? \@ \[  \\ \] \^ \_ \` \{ \| \} \~))
            (letterlist '(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z))
        )

        ; parse source
        (loop
            (let* ((line (read-line f NIL)) (trimed-line (string-trim " " line)))
                (if line
                    (if (> (length trimed-line) 0)
                        (loop for index from 0 to (- (length trimed-line) 1)
                            do 
                            (let ((c (intern (subseq trimed-line index (+ index 1)))))
                                (cond
                                    ((member c punclist)
                                        
                                        (setf (cdr (assoc '\; punctuation)) (+ 1 (cdr (assoc '\; punctuation))))
                                    )
                                    ((member c letterlist)
                                        (setf (cdr (assoc (intern "a") punctuation)) (+ 1 (cdr (assoc (intern "a") punctuation))))
                                    )
                                )
                            )
                        )
                    )
                    (return)
                )
            )
        )

        
        (dolist (lang languages)
            (let ((summed 0) (lang-score 0) (*strings* '()) (database-punctuation '()) (pairs '()))
                ; read database for each language into memory
                (with-open-file (f (open (format NIL "database/~A/~A.txt" lang "punctuation") :direction :input))
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

                ; database_punctuation[i] = [character frequency of occurence]
                (setf database-punctuation (sort pairs #'sort-asec-helper))

                (dolist (pair pairs)
                    (setf summed (+ summed (cdr pair)))
                )

                ; lang_score += abs((punctuation['a']/(punctuation[';']+punctuation['a']))-(database_punctuation['a']/(database_punctuation[';']+database_punctuation['a'])))
                (setf lang-score 
                    (+ lang-score 
                        (abs 
                            (- 
                                (/ 
                                    (cdr (assoc '\; punctuation)) 
                                    (+ (cdr (assoc '\; punctuation)) (cdr (assoc (intern "a") punctuation)))
                                )
                                (/ (cdr (assoc '\; database-punctuation)) summed)
                            )
                        )
                    )
                )
                (setf lang-score 
                    (+ lang-score 
                        (abs 
                            (- 
                                (/ 
                                    (cdr (assoc (intern "a") punctuation)) 
                                    (+ (cdr (assoc '\; punctuation)) (cdr (assoc (intern "a") punctuation)))
                                )
                                (/ (cdr (assoc (intern "a") database-punctuation)) summed)
                            )
                        )
                    )
                )

                
                (if (= 0 lang-score)
                    (setf lang-score 0.00000000001)
                )

                (setf lang-score (/ 1 (sqrt lang-score)))
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

(print (identify-punctuation '(lisp c cplusplus java javascript python) "test.lisp"))
