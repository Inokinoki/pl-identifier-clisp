
; Node ((name . name) (type . type) (in-arc) (out-arc))
; Arc ((type . type) (from ...) (to ...))

;((name . Roxane) (type . individu) (in-arc) (out-arc))
;((name . Christien) (type . individu) (in-arc) (out-arc))

(setq nodes '())
(setq arcs '())

(defun defnode (name type)
     (let ((name (gentemp "N")) (node (list (cons 'name name) (cons 'type type) '(in-arc) '(out-arc))))
          (push (cons name node) nodes)
	  name
     )
)

(defun defnode2 (name type)
	(let ((N (gentemp "N")))
		(set N (list (cons 'name name) (cons 'type type)))
		(push N nodes)
		N
	)
)

(defun defarc (type from to)
	(if (and (member from nodes) (member to nodes))
		 (let ((A (gentemp "A")))
		   	(set A (list (cons 'type type) (cons 'from from) (cons 'to to)))
		 	(push A arcs) 
			A
		 )
		 (error "No such element")
        )
)

(print (defnode2 '1 'individu))
(print (defnode2 '2 'individu))
(print (defnode2 '3 'individu))
(print (defnode2 '4 'individu))
(print (defnode2 '5 'individu))
(print nodes)
(print (eval (defarc 'is-a 'N1 'N5)))
(print (eval (defarc 'is-a 'N2 'N5)))
(print (eval (defarc 'is-a 'N3 'N5)))
(print arcs)
