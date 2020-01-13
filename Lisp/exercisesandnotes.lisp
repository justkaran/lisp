Write a function that returns the squares of numbers until 5
(defun show-squares (start end) 
	(do ((i  start (+ i 1)))
	    ((> i end) 'done)
(format t "~A ~A ~%" i (* i i))))
(show-squares 2 5)


1. Describe what happens when the following expressions are evaluated:

(a) (+ (- 5 1) (+ 3 7))
The plus is called the operator. The integers are called the arguments. The way it is written is called the prefix notation. Because operators can take any number of arguments, we need to show where an expression begins and ends. 
+ is a function, and (- 5 1) and (+ 3 7) are function calls. Lisp evaluates a function call in two steps: First the arguments are evaluated, from left to right. In this case each argument evaluates to itself. So the values of the arguments are 5 and 1 and 3 and z.  The values of the arguments are passed to the function named by the operator: + - and +:

1. Lisp evaluates (- 5 1) 5 evaluates to 5 and 1 evaluates to 1. These values are passed to the function -, which returns 4. 

2. Lisp evaluates (+ 3 7): 3 evaluates to 3 and 7 evaluates to 7. These values are passed to the function +, which returns 10. 

3. The values are sent to the function +, which returns 14. 



(b) (list 1 (+2 3))

1. 2 evaluates to 2 and 3 to 3. They are passed to the function +, which returns 5. 
2. The value 5 is send to the function list, which is creating lists. It will add 5 to the list starting with 1. 


(c) (if (listp 1) (+ 12) (+3 4)) 
 
 1. The function lisp is a predicate that checks if 1 is a list. 
 2. Since the 1 is only an integer and not a list, 1 evaluates to itself. 
 3. Lisp moves on the expression if 1 is not a list. 3 will evaluate to itself. 4 will evaluate to itself.  It will pass both 3 and 4 to the operator and will return 7. 



(d) (list (and (listp 3) t) (+ 1 2))

1. Lisp evaluates list to create a list. It will use the predicate listp and check wether 3 is list. 3 evaluates to itself and is not a list. It will not return true, but NIL. Then 
one will evaluate to itself. After that 2 will evaluate to itself. Both integers will be send to the + plus operator. It will return 3. The list function will build a list using NIL and 3. 
The expression will return (NIL 3)


2. Give three distinct cons expressions that return (a b c).
(print (cons 'a '(b c)))
(print (cons '(a b c) NIL))
(print (cons 'a (cons 'b '(c))))
(print (cons 'a (cons 'b (cons 'c nil))))


3. Using car and cdr, define a function to return the fourth element of a list.
(print (car (cdr (cdr (cdr '(a b c d))))))


4. Define a function that takes two arguments and returns the greater of the two.
(defun larger (x y)
	(if (> x y) x y)
)

(print(larger 1 2))

or 

(defun larger (a b)
  (if (> a b) a b))

5. What do these functions do?
(a) (defun enigma (x) (and (not (null x))
(or (null (car x)) (enigma (cdr x)))))


The functions defines the function called enigma. It takes one argument. Apparently the argument can be anything, also a list.  The function adds the operator "and". If all arguments are true, it will
return the last argument. Thus if nil is true it will return nil.  It will also return nil if the first or any other part of a list is nil. 

(b) (defun mystery (x y) 
	; defines a function with 2 arguments
	(if (null y)
		; checks if y is nil
		nil
		; if so it will return nil
			(if (eql (car y) x)
				; if the first element of y matches x
				0
				; if so it returns 0 
			(let ((z (mystery x (cdr y))))
				; defines a variable called z. z takes the arguments x and the all elements of y after the first one.
				(and z (+ z 1))))))
						;it iterates z in steps of 1 until it finds the position of x



6. What could occur in place of the x in each of the following exchanges?

(a) > (car (x (cdr '(a (b c) d)))
B
b is the first element in the list. The first car will create an a. A second car will get the first element of the list b c. 
Answer: car

(b) > (x 13 (/ 1 0))
13
The expression needs to result in 13. 13 can be devided by 1 but not 0. We thus need a logical operator that returns true first and then stops. It should be or.  
Answer: or

(c) > (x #>list 1 nil)
(1)
Answer: apply



7. Using only operators introduced in this chapter, define a function that takes a list as an argument and returns true if one of its elements is a list.

(defun checkthis (l)
	(if (null l)
		 nil
     (or (listp (car l)) (checkthis (cdr l)))))

(print (checkthis '(a '(b c) e)))


8. Give iterative and recursive definitions of a function that
(a) takes a positive integer and prints that many dots.

Iterative: 
(defun show-dots (end)
  (do ((i 0 (+ i 1)))
      ((> i end) 'done)
    (format t "." i (* i i))))

(print(show-dots 9))

Recursive: 
(defun show-dots (n)    
  (if (plusp n)
      (progn
         (format t ".")
         (show-dots (- n 1)))))

 (show-dots 9)

(b) takes a list and returns the number of times the symbol a occurs in it.

Iterative:
(defun our-member (ls)
  (do ((i ls (cdr i))
       (n 0 (+ n (if (eq (car i) 'a) 1 0))))
      ((not i) n)))

(print(our-member '(a b a c a a a a)))


Recursive: 
(defun our-member (a L)
  (cond
   ((null L) 0)
   ((equal a (car L)) 
   	; checks if the atom is the first element of the list
   (+ 1 (our-member a (cdr L))))
   ; if it is, it adds 1. it calls the function takes the object and adds the atom to the list. 
   (t (our-member a (cdr L)))))
	; it sends the list to the toplevel 

(print(our-member 'a '(a b a c a a a a)))

9. What do these functions do:

do
;iterates through a list
eql
;checks if objects are the same
equal
;cehcks if objects prints the same value
cond
;tests for something and if true executes action
union
;The union function takes two lists and returns a new list containing all the elements present in either of the lists. If there are duplications, then only one copy of the member is retained in the returned list.
filter
set-difference
;list of elements that appear in list1 but do not appear in list2
intersection
nth
;To find the element at a given position in a list we call nth,
nthcdr2
;to find the nth cdr, we call nthcdr
copy-list
;takes a list and returns a copy of it
consp
;checks if 
append
;returns the concatenation of any number of lists
list-of
listp
progn
plusp
minusp
compress
uncompress
last
mapcar
maplist
length
setf
subseq
reverse
sort
assoc
acc

 