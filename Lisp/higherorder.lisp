(defun times-3 (x) (* 3 x))
(defun times-4 (x) (* 4 x))

(defun multiples (mult-func max-num)
    (dotimes (x max-num)
      (format t "~d : ~d ~%" x (funcall mult-func x))))

(multiples #'times-3 10)
(multiples #'times-4 10)
