(in-package :3Dmacs)

(defclass 3dnode (element clinch:node) ())


(defmacro 3dnode (&rest args)
  
  (multiple-value-bind (keys children) (3dmacs::split-keywords args)
    
    `(make-instance '3dnode ,@keys :children (list ,@children))))


(defmethod print-object ((this 3dnode) s)

  (format s "(3dnode ")
  (when (name     this)     (format s ":name ~S " (name this)))
  (when (id       this)      (format s ":id ~S "   (id this)))
  (when (clinch:transform   this)      (format s ":transform ~S "   (clinch:transform this)))
  (when (children this) (format s "~{~%~S~}" (children this)))
  (format s ")"))



