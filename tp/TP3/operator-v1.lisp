
(load "parsing-module-symbol.lisp")

(defun get-operator (source)
    (let ((operators '()) 
            (f (open source :direction :input))
            (punclist '(\! \" \# \$ \% \& \' \( \) \* \+ \, \- \. \/ \: \; \< \= \> \? \@ \[  \\ \] \^ \_ \` \{ \| \} \~))
        )

        ; parse source
        (loop
            (let* ((line (read-line f NIL)) (trimed-line (string-trim " " line)))
                (if line
                    (if (> (length trimed-line) 0)
                        (progn
                            (loop for index from 0 to (- (length trimed-line) 1)
                                do 
                                (let ((c (intern (subseq trimed-line index (+ index 1)))))
                                    (cond
                                        ((member c punclist)
                                            c
                                        )
                                        (T
                                            (replace trimed-line " " :start1 index :end1 (+ 1 index))
                                        )
                                    )
                                )
                            )
                            (let ((words (split-by-space trimed-line)))
                                (dolist (word words)
                                    (if (> (length word) 0)
                                        (let ((w (intern word)))
                                            (if (assoc w operators)
                                                (setf (cdr (assoc w operators)) (+ 1 (cdr (assoc w operators))))
                                                (push (cons w 1) operators)
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                    (return)
                )
            )
        )

        operators
    )
)

;(print (sort (get-operator "test.lisp") #'sort-dsec-helper))
