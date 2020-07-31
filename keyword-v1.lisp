
(load "parsing-module-symbol.lisp")

(defun get-keywords (source)
    (let ((keywords '()) 
            (f (open source :direction :input))
            (letterlist '(|a| |b| |c| |d| |e| |f| |g| |h| |i| |j| |k| |l| |m| |n| |o| |p| |q| |r| |s| |t| |u| |v| |w| |x| |y| |z| 
                A B C D E F G H I J K L M N O P Q R S T U V W X Y Z))
        )

        ; parse source
        (loop
            (let* ((line (read-line f NIL)) (trimed-line (string-trim " " line)))
                (if line
                    (if (> (length trimed-line) 0)
                        (progn
                            (loop for index from 0 to (- (length trimed-line) 1)
                                do 
                                (let ((c (intern (subseq trimed-line index (+ index 1)))))
                                    (cond
                                        ((member c letterlist)
                                            NIL
                                        )
                                        (T
                                            (replace trimed-line " " :start1 index :end1 (+ 1 index))
                                        )
                                    )
                                )
                            )
                            (let ((words (split-by-space trimed-line)))
                                (dolist (word words)
                                    (if (> (length word) 0)
                                        (let ((w (intern word)))
                                            (if (assoc w keywords)
                                                (setf (cdr (assoc w keywords)) (+ 1 (cdr (assoc w keywords))))
                                                (push (cons w 1) keywords)
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                    (return)
                )
            )
        )

        keywords
    )
)

; (print (sort (get-keywords "test.lisp") #'sort-dsec-helper))
