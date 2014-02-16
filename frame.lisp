(in-package :3Dmacs)

(defclass frame (element clinch:viewport clinch:node )  
  ((camera :accessor camera
	   :initform nil
	   :initarg :camera)
   (clear-color :accessor clear-color
	       :initform nil
	       :initarg  :clear-color)))

(defmacro frame (&rest args)
  
  (multiple-value-bind (keys children) (3dmacs::split-keywords args)
    
    `(make-instance 'frame ,@keys :children (list ,@children))))


(defmethod render :before ((this frame) &key)

  (gl:enable :blend :depth-test :line-smooth :point-smooth :polygon-smooth :texture-2d :cull-face :scissor-test)
  (%gl:blend-func :src-alpha :one-minus-src-alpha)


  (with-slots ((x x)
	       (y y)
	       (w width)
	       (h height)) this

    (print (list w h))
    (gl:scissor x y w h)
    (gl:viewport x y w h))

  (when (clear-color this)
    (apply #'gl:clear-color (clear-color this))
    (gl:clear :color-buffer-bit :depth-buffer-bit))


  (gl:matrix-mode :projection)

  (when (changed? this)
    (update this :parent (parent this)))
  
   (clinch::load-matrix this))
  


(defmethod width ((this frame))
  (with-slots ((w width)) this
    (if (zerop w)
	(attribute this 'window-width)
	w)))

(defmethod (setf width) (new-val (this frame))
  (setf (slot-value this 'width) new-val))

(defmethod height ((this frame))
  (with-slots ((w height)) this
    (if (zerop w)
	(attribute this 'window-height)
	w)))


(defmethod (setf height) (new-val (this frame))
  (setf (slot-value this 'height) new-val))


(defmethod print-object ((this frame) s)

  (format s "(frame ")
  (when (name     this)     (format s ":name ~S " (name this)))
  (when (id       this)      (format s ":id ~S "   (id this)))
  (when (x        this)      (format s ":x ~S "   (x this)))
  (when (y        this)      (format s ":y ~S "   (y this)))
  (when (width this)         (format s ":width ~S "   (width this)))
  (when (height   this)      (format s ":height ~S "   (height this)))
  (when (clinch:transform   this)      (format s ":transform ~S "   (clinch:transform this)))
  (when (camera   this)      (format s ":camera ~S "   (camera this)))
  
  (when (children this) (format s "~{~%~S~}" (children this)))
  (format s ")"))

