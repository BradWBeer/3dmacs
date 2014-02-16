;;;; package.lisp

(defpackage #:3dmacs
  (:use #:cl #:clinch)
  (:shadow #:attributes #:render #:node)
  (:import-from :clinch )
  (:export #:element #:children #:element-back #:element-front #:element-push-back #:attribute
	   #:element-get-child  #:element-get-child #:element-push-front #:element-pop-back
	   #:element-pop-front #:element-remove-child #:element-remove-child #:element-replace-child
	   #:element-next-sibling #:element-previous-sibling #:window #:render #:start
	   #:ELEMENT-BACK #:ELEMENT-FRONT #:ELEMENT-PUSH-BACK #:ELEMENT-GET-CHILD
	   #:ELEMENT-GET-CHILD #:ELEMENT-PUSH-FRONT #:ELEMENT-POP-BACK
	   #:ELEMENT-POP-FRONT #:ELEMENT-REMOVE-CHILD #:ELEMENT-REMOVE-CHILD
	   #:ELEMENT-REPLACE-CHILD #:ELEMENT-NEXT-SIBLING
	   #:ELEMENT-PREVIOUS-SIBLING #:parent
	   #:frame #:width #:height #:x #:y #:window-width #:window-height))

