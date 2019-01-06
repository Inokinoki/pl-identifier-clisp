(load "parsing-module-symbol.lisp")

(defun get-punctuation-rate (source)
    (let ((punctuation (list (cons '\; 0) (cons (intern "a") 0))) 
            (f (open source :direction :input))
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

        punctuation
    )
)

(print (sort (get-punctuation-rate "test.lisp") #'sort-dsec-helper))
