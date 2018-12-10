(setq *frames* ())
(setq ELEPHANT '(ELEPHANT (TYPE (VALUE CONCEPT)) (IS-A (VALUE ETRE)) (COLOR (DEFAULT "grey")) (AGE (IF-NEEDED ask-user) (IF-ADDED check-age)) (POIDS (IF-NEEDED computer-weight-from-age)) (AFFICHAGE (IF-ADDED draw-elephant) (IF-REMOVED erase-elephant)))) 
(pushnew 'ELEPHANT *frames*)

(defun check-age(slot value)
	value
)

(defun make-individu (name concept &rest prop-val)
	(unless (member concept *frames*) (error "Le concept ~S n'existe pas"))
	(let ((id (gentemp "F")) (allowed-slots (mapcar 'car (cdr (symbol-value concept)))) slot value fn)
		(set id (list name (list 'type '(value individu)) (list 'is-a (list 'value concept))))
		(loop
			(unless prop-val (return NIL))
			(setq slot (pop prop-val))
			(setq value (pop prop-val))
			(when (member slot allowed-slots)
				(setq fn (cadr (assoc 'if-added (cdr (assoc slot (cdr (symbol-value concept)))))))
				(setq value (if fn (funcall fn slot value)))
				(when value 
					(set id (append (symbol-value id) (list (list slot (list 'value value))))))
			)
		)
	)
)

(make-individu 'N1 'ELEPHANT 'COLOR "grey" 'AGE 5)

(defun computer-weight-from-age (id)
	5.6
)

(defun get-slot-value (id slot)
	(if (not (symbol-value id)) (error "No frame with id"))
	(let* ((frame (symbol-value id)) (prop (assoc slot (cdr frame))))
		(cond 
			((and prop (equal 'value (caadr prop)))
				(cadadr prop)
			)
			(prop
				(cond
					((equal 'value (caadr prop))
						prop
					)
					((equal 'if-needed (caadr prop))
						(funcall (cadadr prop) id)
					)
					(T
						NIL
					)
				)
			)
			(T
				(if (equal 'concept (cadadr (assoc 'type (cdr frame))))
					(error "Not get value")
					(get-slot-value (cadadr (assoc 'is-a (cdr frame))) slot)
				)
			)
		)
	)	
		
)


(print (get-slot-value 'F1 'age))
(print (get-slot-value 'F1 'poids))

