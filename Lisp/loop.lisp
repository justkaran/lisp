
(setf *print-case* :capitalize)
(setq x 1)
(loop for x in '(Peter Paul Mary) do
	(format t "This is ~A ~%" x)
)
