; Entree 1 2 3 ... 20 Sortie

; Nodes
(setq maze '(
	(E 1)
	(1 E 2)
	(2 1 7)
	(3 6)
	(4 5)
	(5 4 12)
	(6 3 7)
	(7 2 6 8)
	(8 7 9)
	(9 8 10)
	(10 9 11 15)
	(11 10 12 14)
	(12 5 11)
	(13 20)
	(14 11)
	(15 10 16)
	(16 15 17)
	(17 16 18)
	(18 17 19)
	(19 18 20)
	(20 13 19 S)
	(S 20)
    )
)

;(assoc 'c '((a 1) (b 2) (c 3 4) (d 5 6)))
;(C 3 4)

;(member 'c '(a b c d e))
;(c d e)

;(push 'b '(a b c d))
;(b a b c d)

;(pushnew 'b '(a b c d))
;(a b c d)

(defun buildSearchTree (e states)
	NIL
)

(defun successeurs (current states)
	(cdr (assoc current states))
)

(defun explore (current states states_visited sortie)
	(if (equal current sortie)
		(append states_visited (list current))
		(let ((nextElements (successeurs current states)))
			(loop 
			  	(setq result (if (member (car nextElements) states_visited) 
					NIL
					(explore (car nextElements) states 
						 (if (member current states_visited) states_visited (append states_visited (list current))) 
						 sortie
					)
				))
				(setq nextElements (cdr nextElements))
				(when (or result (not nextElements)) (return result))
			)  	
		)
	)
)

;(print (successeurs 'E maze))
(print (explore 'E maze '() 'S))
(print (explore 'E maze '() '14))

