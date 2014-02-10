;;;; 3Dmacs.lisp

(in-package #:3dmacs)

;;; "3Dmacs" goes here. Hacks and glory await!


(setq *debug* t)

(defmacro CC (name state)
  (when *debug*
    (cond ((eql state :unimplemented) `(format t "~A not Yet Implemented!~%" ,(princ-to-string name)))
	  ((eql state :unfinished)    `(format t "~A not Yet finished!~%" ,(princ-to-string name)))
	  ((eql state :untested)      `(format t "~A not Yet tested!~%" ,(princ-to-string name)))
	  (t nil))))

