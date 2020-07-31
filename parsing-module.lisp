
;; Split strings with space
(defun split-by-space (string)
    (loop for i = 0 then (1+ j) as j = (position #\Space string :start i)
          collect (subseq string i j) while j)
)

;; Find all space position in given string, note that there will be always a NIL in the last position
(defun find-all-space (string)
    (loop for i = 0 then (1+ j) as j = (position #\Space string :start i)
          collect j while j)
)

;; Retrieve the sublist without the last element
(defun list-without-last-element (list)
    (loop for l on list
        while (rest l)
        collect (first l)
    )
)

;; Form a pair of key-integer
(defun form-pair (strings-array)
    (if (> (list-length strings-array) 0)
        ;; List not null
        (if (parse-integer (car (last strings-array)))
            ;; List last element is integer
            (cons (format NIL "~{~A ~}"(list-without-last-element strings-array)) (parse-integer (car (last strings-array))))
            NIL
        )
        NIL
    )
)

;; Parse a line, form a paire
(defun parse-one-line (line)
    (format T "Parsing ~A...~%" line)   ;; Log
    (form-pair (split-by-space line))
)

;; Parse several lines
(defun parse-lines (lines &aux results)
    (format T "------ Parsing a list of ~A elements ------~%" (list-length lines))   ;; Log
    (dolist (line lines)
        (let ((result (parse-one-line line)))
            (if result
                (push result results)
            )
        )
    )
    results
)

;; Predicat
(defun sort-helper (list-a list-b)
    (if (and (listp list-a) (listp list-b))
        (> (cdr list-a) (cdr list-b))
        NIL
    )
)


