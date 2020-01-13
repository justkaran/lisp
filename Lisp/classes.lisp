(defclass animal ()
  (name sound))

(defparameter *dog* (make-instance 'animal))

(setf (slot-value *dog* 'name)  "Spot")
(setf (slot-value *dog* 'sound)  "Woof")

(format t "~a says ~a ~%"
	(slot-value *dog* 'name)
	(slot-value *dog* 'sound))
