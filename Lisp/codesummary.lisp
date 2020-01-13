
(setf *print-case* :capitalize)
(cons 'superman 'batman)
(list 'superman 'batman 'flash)
(cons 'aquaman '(superman batman))

(format t "First item = ~A ~%" (car '(superman batman aquaman)))
(format t "Second item = ~A ~%" (nth 1 '(superman batman aquaman)))
(format t "Is Superman in the list? = ~A ~%" (if (member 'superman '(superman batman aquaman)) 't nil))

(defvar superman (list :name "Superman" :secret-id "Clark Kent"))

(defvar *hero-list* nil)
(push superman *hero-list*)

(dolist (hero *hero-list*)
        (format t "~{~a : ~a ~}~%" hero))

(defparameter *hero-size*
	'((Superman (Clark Kent))
		(Flash (Barry Allen))
		(Batman (Bruce Wayne))))

		(defparameter *heroes*
			'((Superman (Clark Kent))
				(Flash (Barry Allen))
				(Batman (Bruce Wayne))))
(format t "Superman Data ~a ~%" (assoc 'superman *heroes*))
(format t "Superman is  ~a ~%" (cadr (assoc 'superman *heroes*)))

(defun hello ()
	(print "Hello World")
  (terpri))
(hello)

(defun avg (num1 num2)
  (/ (+ num1 num2) 2))
(format t "Avg of 10 & 50 is ~a ~%" (avg 10 50))

(defvar *total* 0)
(defun sum (&rest nums)
	(dolist (num nums)
			(setf *total* (+ *total* num)))
(format t "Sum = ~a ~%" *total*))

(sum 1 2 3 4 5 6 7)

(defun print-list(&optional &key x y z)
	(format t "List: ~a ~%" (list x y z)))
(print-list :x 1 :y 2)

(defun get-hero-data (size)
	(format t "~a ~%"
     `(,(caar size) is ,(cadar size) and ,(cddar size))))
(get-hero-data *hero-size*)
