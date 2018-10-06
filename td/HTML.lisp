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
    (let ((balise (car L)))
        (format T "<~A>" balise)
        (if (stringp (cadr L))
            (format T "~A" (cadr L))
            (mapcar 'make-html (cdr L))
        )
        (format T "</~A>" balise)
    )
)

(setq text (make-html document1))

(print text)
