;;;; 3Dmacs.lisp

(in-package #:3dmacs)

;;; "3Dmacs" goes here. Hacks and glory await!


(defun split-keywords (lst &optional keys objects)
  (cond 
    ((or (null lst)
	 (and (keywordp (first lst))
	      (null (cdr lst))))
     (values keys (reverse objects)))
    
    ((and (first lst) 
	  (second lst)
	  (keywordp (first lst))) 
     (push (second lst) keys)
     (push (first lst) keys)
     (split-keywords (cddr lst) keys objects))
    
    (t 
     (push (first lst) objects) 
     (split-keywords (cdr lst) keys objects))))




(setq *debug* t)

(defmacro CC (name state)
  (when *debug*
    (cond ((eql state :unimplemented) `(format t "~A not Yet Implemented!~%" ,(princ-to-string name)))
	  ((eql state :unfinished)    `(format t "~A not Yet finished!~%" ,(princ-to-string name)))
	  ((eql state :untested)      `(format t "~A not Yet tested!~%" ,(princ-to-string name)))
	  (t nil))))

