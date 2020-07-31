
(load "parsing-module-symbol.lisp")

(defun get-last-character (source)
    (let ((characters '()) (f (open source :direction :input)) (num-lines 0))
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
        characters
    )
)

;(print (sort (get-last-character "test.lisp") #'sort-dsec-helper))