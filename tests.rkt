#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;
;Don't worry about this file unless you are doing the extra credit tests. 
;

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "1: ~a" (test_ins_beg1))
    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
(define (test_ins_beg1)
  (eq? (ins_beg 1 '(2 3 4)) '(1 2 3 4)))

;Q2
(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d))
(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))
(count_top_level '(1 2 3 (4 5)))
(count_instances_tr 1 '(1 1 2 3 1))
(count_instances 1 '(1 1 2 3 1))
(count_instances_deep 1 '(1 2 3 (1 1)) )


;Run the tests
(runTests)