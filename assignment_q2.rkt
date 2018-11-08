#lang racket



;PART A
(provide ins_beg)
(define (ins_beg element lst)
  (append (list element) lst)
  )


;PART B
(provide ins_end)
(define (ins_end element lst)
  (append lst (list element))
  )

;PART C
(provide count_top_level)
(define (count_top_level lst)
  (length lst)
  )


 ;PART D 
  (provide count_instances)
  (define (count_instances element lst)
    (c_instances element lst 0)
    )
  
  (define (c_instances element lst total)
    (cond
    [(null? lst) total]
    [(= element (car lst)) (c_instances element (cdr lst) (+ 1 total))]
    [else (c_instances element (cdr lst) total)]
    ))


;PART E
(provide count_instances_tr)
(define (count_instances_tr element lst)
  (cond
    [(null? lst) 0]
    [(= element (car lst)) (+ 1 (count_instances_tr element (cdr lst)))]
    [else (count_instances_tr element(cdr lst)) ]
  ))



;PART F
(provide count_instances_deep)
(define (count_instances_deep element lst)
  (c_instances_deep element lst 0)
  )

(define (c_instances_deep element lst total)
  (cond
    [(null? lst) total] 
    [(list? (car lst))(c_instances_deep element (cdr lst) (c_instances element (car lst) total))]
    [(= element (car lst)) (c_instances_deep element (cdr lst) (+ 1 total))]
    [else (c_instances_deep element(cdr lst) total) ]
  ))
