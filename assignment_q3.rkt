#lang racket


(define (root node)
  (car node)
  )

(define (left_tree node)
  (cadr node)
  )
 
  (define (node middle left right)
  (list middle left right)
  )

(define (right_tree node)
  (caddr node)
  )
;A
(define (traverse tree)
  (if(null? tree)
  '()
  (begin
    (traverse (left_tree tree))
    (display (root tree))(newline)
    (traverse (right_tree tree))
  )))
;B
(define (search s tree)
  (if (null? tree)
  #f
  (let ((current (root tree)))
    (cond
      [(< s current)(search s (left_tree tree))]
      [(> s current)(search s (right_tree tree))]
      [(equal? s current) #t ]
     )
  )))



;;C
(define (insert i tree)
  (if (null? tree)
   (node i '() '())
   (let ((current (root tree)))
     (cond
      [(< i current)(node current (insert i (left_tree tree)) (right_tree tree) )]
      [(> i current)(node current (left_tree tree) (insert i (right_tree tree)))]
      [(equal? i current)]
       )
   )))

;;D
(define (insert_list list tree)
  (if (empty? list) tree
      (insert_list (cdr list) (insert (car list) tree)))
  )
;;E
(define (t_sort list)
    (traverse (insert_list list '()))
  )
;F
(define (insert_list_desc i tree)
  (if (null? tree)
   (node i '() '())
   (let ((current (root tree)))
     (cond
      [(> i current)(node current (insert_list_desc i (left_tree tree)) (right_tree tree) )]
      [(< i current)(node current (left_tree tree) (insert_list_desc i (right_tree tree)))]
      [(equal? i current)]
       )
   )))

(define (insert_list_ld i tree)
  (if (null? tree)
   (node i '() '())
   (let ((current (root tree)))
     (cond
      [(< (remainder i 10)(remainder current 10))(node current (insert_list_ld i (left_tree tree)) (right_tree tree) )]
      [(> (remainder i 10)(remainder current 10))(node current (left_tree tree) (insert_list_ld i (right_tree tree)))]
      [(equal? i current)]
       )
   )))

(define (insert_list_d list tree)
  (if (empty? list) tree
      (insert_list_d (cdr list) (insert_list_desc (car list) tree)))
  )

(define (insert_list_last_digit list tree)
  (if (empty? list) tree
      (insert_list_last_digit (cdr list) (insert_list_ld (car list) tree)))
  )

(define (descend list)
  (traverse (insert_list_d list '()))
  )

(define (ascend list)
  (traverse (insert_list list '()))
  )

(define (ascend_ld list)
  (traverse (insert_list_last_digit list '()))
  )

(define (higher_order list function)
  (function list)
  )
(define test (node 9 ( node 2 ( node 1 '() '() ) (node 7 (node 5 '() '()) (node 8 '() '())))  (node 10 '() (node 13 (node 11 '() '()) '()))))
;Part A  
(display "Part A\n")
  (traverse test)
;Part B
(display "Part B\n")
(search 1 test)
;PART C
(display "Part C\n")
(traverse (insert 6 test))
;PART D
(display "Part D\n")
(traverse (insert_list (list 20 30 40) test))
;PART E
(display "Part E\n")
(t_sort (list 12 44 24 11 7 5))
;PART F
(display "Part F\n")
(higher_order (list 45 65 44 83 56) ascend )
(display "Descend\n")
(higher_order (list 45 65 44 83 56) descend )
(display "Ascend Last Digit\n")
(higher_order (list 58 47 92 55 46) ascend_ld)






