;;;; 3Dmacs.asd

(asdf:defsystem #:3dmacs
  :serial t
  :description "Describe 3Dmacs here"
  :author "Brad Beer (WarWeasle)"
  :license "MIT"
  :depends-on (#:clinch
               #:clinch-cairo
               #:clinch-pango
               #:clinch-freeimage)
  :components ((:file "package")
               (:file "3dmacs")
	       (:file "element")
	       (:file "window")
	       (:file "frame")))

