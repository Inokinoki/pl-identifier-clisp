(load "parsing-module-symbol.lisp")

(defun get-brackets (source)
    (let ((brackets (list (cons (intern "(") 0) (cons (intern ")") 0) (cons (intern "[") 0) (cons (intern "]") 0)
			(cons (intern "{") 0) (cons (intern "}") 0)
		))
		(bracketlist (list (intern "(") (intern ")") (intern "[") (intern "]") (intern "{") (intern "}")))
		(f (open source :direction :input)))
        ; parse source
        (loop
            (let* ((line (read-line f NIL)) (trimed-line (string-trim " " line)))
                (if line
                    (if (> (length trimed-line) 0)
                        (loop for index from 0 to (- (length trimed-line) 1)
                            do 
                            (let ((c (intern (subseq trimed-line index (+ index 1)))))
                                (cond
                                    ((member c bracketlist)
                                        (setf (cdr (assoc c brackets)) (+ (cdr (assoc c brackets)) 1))
                                    )
                                )
                            )
                        )
                    )
                    (return)
                )
            )
        )

        brackets
    )
)

(print (sort (get-brackets "test.lisp") #'sort-dsec-helper))
