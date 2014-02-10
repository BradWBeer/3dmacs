
(in-package :3Dmacs)

(defclass element ()
  ((parent   :reader   parent
	     :initform nil
	     :initarg  :parent)

   (children :reader   children
	     :initform nil
	     :initarg  :children)
   
   (id       :reader   id
	     :initform nil
	     :initarg  :id)

   (name     :reader   name
	     :initform nil
	     :initarg  :name)))

(defun element (&rest args)
  
  (let* ((name nil)
	 (id   nil)
	 (parent nil)
	 (children (labels ((rec (lst)
				 (print lst)
				 (cond ((null lst) nil)
				       ((eql :name   (first lst)) (setf name   (second lst)) (rec (cddr lst)))
				       ((eql :id     (first lst)) (setf id     (second lst)) (rec (cddr lst)))
				       ((eql :parent (first lst)) (setf parent (second lst)) (rec (cddr lst)))
				       (t (cons (first lst) (rec (rest lst)))))))
		     (rec args))))

    (print children)
    (make-instance 'element
		   :id id
		   :name name
		   :parent parent
		   :children children)))



(defmethod (setf children) (children (this element))
  (CC (setf children) :unimplemented)
  
  (setf (slot-value this 'children) children))

(defmethod print-object ((this element) s)

  (format s "(element ")
  (when (name     this)     (format s ":name ~S " (name this)))
  (when (id       this)      (format s ":id ~S "   (id this)))
  (when (children this) (format s "~{~%~S~}" (children this)))
  (format s ")"))

(defmethod element-back ((this element))
  )

(defmethod element-front ((this element))
  )

(defmethod element-push-back ((this element) (child element))
  )

(defmethod element-get-child ((this element) (i integer))

  )

(defmethod element-get-child ((this element) (e element))

  )

(defmethod element-push-front ((this element))
  )

(defmethod element-pop-back ((this element))
  )

(defmethod element-pop-front ((this element))
  )

(defmethod element-remove-child ((this element) (i integer))

  )

(defmethod element-remove-child ((this element) (e element))

  )

(defmethod element-replace-child ((this element) (child element) (i integer))

  )

(defmethod element-next-sibling ((this element))
  )

(defmethod element-previous-sibling ((this element))
  )

