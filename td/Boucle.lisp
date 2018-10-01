(setq ll '(A 1 BB 2 CC DDD 4))

(do ((sous-l ll (cdr ll))) (sous-l) (print (car ll)))

(dolist (element ll) (print element))

(mapcar (lambda (element) (print element)) ll)

(maplist (lambda (element) (print (car element))) ll)

(loop (print (car ll)) (setq ll (cdr ll)) (when (not ll) (return NIL)))

(loop (print (car ll)) (setq ll (cdr ll)) (unless ll (return NIL)))

(dotimes (n (list-length ll))
    (print (car ll))
    (setq ll (cdr ll))
)
