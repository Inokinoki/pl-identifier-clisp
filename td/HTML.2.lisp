(setq document '(<html> 
    (<head> 
        (<title> (Ma page) </title>) 
    </head>) 
    (<body> 
        (<h1> (Un titre) </h1>) 
        (<p> (Soror et aemula Romae) </p>) 
    </body>) 
</html>))
;(print (caddr document))

(setq document1 
    '(html 
        (head
            (title "Ma page")
        ) 
        (body
            (h1 "Un titre")
            (p "Soror et aemula Romae")
        )
    )
)

; (print (caddr document1))

(defun make-html (L)
    ; (car L) is tag
    (if (and (> (list-length L) 1) (stringp (cadr L)))
        (concatenate 'string (format NIL "<~A>" (car L)) (cadr L) (format NIL "</~A>" (car L)))
        (concatenate 'string (format NIL "<~A>" (car L)) 
            (format NIL "~{~A~}" (mapcar 'make-html (cdr L)))
            (format NIL "</~A>" (car L))
        )
    )
)

(setq text (make-html document1))

(setq a "tet")
(write-line a)

(print text)

(setq file (open "index.html" :if-does-not-exist :create :direction :output :if-exists :overwrite))
(format file "~A" text)
(close file)

(with-open-file (f "index.1.html" :if-does-not-exist :create :direction :output :if-exists :overwrite)
    (format f "~A" text)
)