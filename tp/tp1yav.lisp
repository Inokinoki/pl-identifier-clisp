; tp 1 yet another version

(defun reverseB (L)
    (let ((reversedList NIL))
        (mapcar (lambda (x) (push x reversedList)) L)
        reversedList
    )
)

(defun reverseC (L)
    (let ((reversedList NIL))
        (mapcar (lambda (x) (push x reversedList)) L)
        reversedList
    )
)

(defun monAppend(L M)
    (setq temp_list NIL)
    
    (mapcar (lambda (x) (push x temp_list)) (reverseC M))
    (mapcar (lambda (x) (push x temp_list)) (reverseC L))
    ;; avec iteration
    temp_list
)

(setq l '(a b))
(setq m '(c d))
(print(monAppend l m))

