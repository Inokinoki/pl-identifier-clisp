(load "parsing-module.lisp")

(setq *FILE-NAMES* '("strings" "brackets"))
(setq *LANGUAGES* '())

(with-open-file (f (open "languagesknown.txt" :direction :input))
    (loop
        (let ((line (read-line f NIL)))
            (if line
                (push line *LANGUAGES*)
                (return)
            )
        )
    )
)

(print *LANGUAGES*)

(setq *scores* '())

(dolist (language *LANGUAGES*)
    (let ((scores '()))
        (dolist (filename *FILE-NAMES*)
            (let ((*strings* '()))
                (print filename)
                (with-open-file (f (open (format NIL "database/~A/~A.txt" language filename) :direction :input))
                    (loop
                        (let ((line (read-line f NIL)))
                            (if line
                                (push line *strings*)
                                (return)
                            )
                        )
                    )
                ) ;; Close file

                ;(print (sort (parse-lines *strings*) #'sort-helper))
                
                (push (cons filename (sort (parse-lines *strings*) #'sort-helper)) scores)

                ;; Parsing all lines
                ;(print (parse-lines *strings*))
            )
        )
        (push (cons language scores) *scores*)
    )
)

(print *scores*)
