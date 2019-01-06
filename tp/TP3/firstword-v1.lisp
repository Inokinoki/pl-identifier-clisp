(load "parsing-module-symbol.lisp")

(defun get-first-word (source)
    (let ((words '()) (f (open source :direction :input)) (num-lines 0))
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
        words
    )
)

;(print (sort (get-first-word "test.lisp") #'sort-dsec-helper))
