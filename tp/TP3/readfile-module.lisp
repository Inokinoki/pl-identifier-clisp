(load "parsing-module-symbol.lisp")

(setq *FILE-NAMES* '("brackets" "firstWord" "keywords" "lastCharacter" "operators" "punctuation"))
(setq *LANGUAGES* '())
(setq *scores* '())

;; Read all known languages
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

(dolist (language *LANGUAGES*)
    (let ((scores '()))
        (dolist (filename *FILE-NAMES*)
            (let ((*strings* '()))
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
                
                ;; Parsing all lines
                (push (cons filename (sort (parse-lines *strings*) #'sort-dsec-helper)) scores)
            )
        )
        (push (cons language scores) *scores*)
    )
)

