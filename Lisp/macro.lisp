;;; It can be irritating to have to use progn with if
(if (= *num* 2)
	(progn
		(setf *num-2* 2)
		(format t "*num-2* = ~d ~%" *num-2*)
	)
	(format t "Not equal to 2 ~%"))

(defmacro ifit (condition &rest body)

	;;; The backquote generates the code
	;;; The , changes the condition to code mode from data mode
	;;; The &rest body parameter will hold commands in a list
	;;; The "Can't Drive" Works as the else

	`(if ,condition (progn ,@body) (format t "Can't Drive ~%") ))

(setf *age* 16)

(ifit (>= *age* 16)
	(print "You are over 16")
	(print "Time to Drive")
	(terpri)
)

;;; let can also get confusing with its parentheses

(defun add (num1 num2)
	(let ((sum (+ num1 num2)))
		(format t "~a + ~a = ~a ~%" num1 num2 sum)))

;;; Define a macro to clean up let

(defmacro letx (var val &body body)
	`(let ((,var ,val)) ,@body))

(defun subtract (num1 num2)
	(letx dif (- num1 num2)
		(format t "~a - ~a = ~a ~%" num1 num2 dif)))

(subtract 10 6)
