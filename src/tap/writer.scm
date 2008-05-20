;;; $Id$

(define-module (test tap writer)
   #:export (plan diag ok is isnt))

(define planned #f)
(define index #f)

(define (plan n)
  (cond (planned (error "Multiple calls to (plan)"))
        (else (begin
                (set! planned n)
                (simple-format #t "1..~a~%" n)
                n))))

(define (diag msg)
   (map diag1 (string-split msg #\newline)))

(define (diag1 msg)
  (simple-format #t "# ~a~%" msg))

(define (display-ok)
  (begin (set! index (+ index 1))
         (simple-format #t "ok ~a~%" index)
         (flush-all-ports)))

(define (display-not-ok)
  (begin (display "not ")
         (display-ok)))

(define (plan n)
  (cond (max (error "Multiple calls to (plan)"))
        (else (begin (set! max n)
                     (set! has-plan #t)
                     (simple-format #t "1..~a~%" max)
                     max))))

(define (no-plan)
  (set! has-plan #f))

(define (cleanup)
  (cond (has-plan (diag "has plan"))
        (else (begin
                (simple-format #t "has-plan: ~a~%" has-plan)
                (simple-format #t "1..~a~%" index)
                (flush-all-ports)))))

(define (ok bool)
  (cond (bool (display-ok))
        (else (display-not-ok))))

(define (is s1 s2)
  (cond ((equal? s1 s2) (display-ok))
        (else (display-not-ok))))

(define (isnt s1 s2)
  (cond ((equal? s1 s2) (display-not-ok))
        (else (display-ok))))

;;; (define (like s re)
;;;   (cond ((equal? s1 s2) (display-not-ok))
;;;         (else (display-ok))))
;;;
;;; (define (unlike s re)
;;;   (cond ((equal? s1 s2) (display-not-ok))
;;;         (else (display-ok))))
;;;
