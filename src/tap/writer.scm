;;; $Id$

(define-module (tap writer)
   #:export (plan diag ok is isnt))

(define planned #f)
(define index #f)

(define index++
  (lambda ()
    (cond ((eq? index #f) (set! index 1))
          (else (set! index (+ index 1))))))

(define (plan n)
  (cond (planned (error "Multiple calls to (plan)"))
        (else (begin (set! planned n)
                     (simple-format #t "1..~a~%" n)
                     n))))

(define (diag msg)
   (map diag1 (string-split msg #\newline)))

(define (diag1 msg)
  (simple-format #t "# ~a~%" msg))

(define ok
  (lambda (b)
    (cond ((not (boolean? b)) (error "Arguments to 'ok' must be boolean"))
          (b (display-ok))
          (else (display-not-ok)))))

(define (display-ok)
  (begin (index++)
         (simple-format #t "ok ~a~%" index)
         (flush-all-ports)))

(define (display-not-ok)
  (begin (display "not ")
         (display-ok)))

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
;;; (define (no-plan)
;;;   (set! has-plan #f))

