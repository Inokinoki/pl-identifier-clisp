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

(print text)
