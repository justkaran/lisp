
(print "Do you think the earth is round?")
(defvar *answer* (read))
(defvar *collge-ready* nil)


(cond ((equal *answer* 'yes)
       (setf *college-ready* 'yes)
       (format t "Ready for college ~%"))

			 ((< *age* 18)
			 (setf *college-ready* 'no)
			 (format t "Not Ready for college ~%"))

			 (t (format t "Don't know whats up with you. But I think you need to see a doctor.")))
