; sat
; 
; (objectives
;  (maxcolors 3)
; )
; (model
;   (define-fun x1 () Int 1)
;   (define-fun x2 () Int 3)
;   (define-fun x3 () Int 2)
;   (define-fun x4 () Int 1)
;   (define-fun x5 () Int 3)
;   (define-fun x6 () Int 1)
;   (define-fun x7 () Int 2)
;   (define-fun x8 () Int 3)
;   (define-fun maxcolors () Int 3)
; )

(set-option :produce-models true)

(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(declare-const x6 Int)
(declare-const x7 Int)
(declare-const x8 Int)

(declare-const maxcolors Int)

(assert (and (>= x1 1) (<= x1 8)))
(assert (and (>= x2 1) (<= x2 8)))
(assert (and (>= x3 1) (<= x3 8)))
(assert (and (>= x4 1) (<= x4 8)))
(assert (and (>= x5 1) (<= x5 8)))
(assert (and (>= x6 1) (<= x6 8)))
(assert (and (>= x7 1) (<= x7 8)))
(assert (and (>= x8 1) (<= x8 8)))

; Adjacent countries must have different colors
(assert (not (= x1 x2)))
(assert (not (= x1 x3)))
(assert (not (= x2 x1)))
(assert (not (= x2 x3)))
(assert (not (= x2 x4)))
(assert (not (= x3 x1)))
(assert (not (= x3 x2)))
(assert (not (= x3 x4)))
(assert (not (= x3 x5)))
(assert (not (= x3 x6)))
(assert (not (= x3 x8)))
(assert (not (= x4 x2)))
(assert (not (= x4 x3)))
(assert (not (= x4 x5)))
(assert (not (= x5 x3)))
(assert (not (= x5 x4)))
(assert (not (= x5 x6)))
(assert (not (= x5 x7)))
(assert (not (= x6 x3)))
(assert (not (= x6 x5)))
(assert (not (= x6 x7)))
(assert (not (= x6 x8)))
(assert (not (= x7 x5)))
(assert (not (= x7 x6)))
(assert (not (= x7 x8)))
(assert (not (= x8 x3)))
(assert (not (= x8 x6)))
(assert (not (= x8 x7)))

(assert (=> (and (>= x1 x2) (>= x1 x3) (>= x1 x4) (>= x1 x5) (>= x1 x6) (>= x1 x7) (>= x1 x8)) (= maxcolors x1)))
(assert (=> (and (>= x2 x1) (>= x2 x3) (>= x2 x4) (>= x2 x5) (>= x2 x6) (>= x2 x7) (>= x2 x8)) (= maxcolors x2)))
(assert (=> (and (>= x3 x1) (>= x3 x2) (>= x3 x4) (>= x3 x5) (>= x3 x6) (>= x3 x7) (>= x3 x8)) (= maxcolors x3)))
(assert (=> (and (>= x4 x1) (>= x4 x2) (>= x4 x3) (>= x4 x5) (>= x4 x6) (>= x4 x7) (>= x4 x8)) (= maxcolors x4)))
(assert (=> (and (>= x5 x1) (>= x5 x2) (>= x5 x3) (>= x5 x4) (>= x5 x6) (>= x5 x7) (>= x5 x8)) (= maxcolors x5)))
(assert (=> (and (>= x6 x1) (>= x6 x2) (>= x6 x3) (>= x6 x4) (>= x6 x5) (>= x6 x7) (>= x6 x8)) (= maxcolors x6)))
(assert (=> (and (>= x7 x1) (>= x7 x2) (>= x7 x3) (>= x7 x4) (>= x7 x5) (>= x7 x6) (>= x7 x8)) (= maxcolors x7)))
(assert (=> (and (>= x8 x1) (>= x8 x2) (>= x8 x3) (>= x8 x4) (>= x8 x5) (>= x8 x6) (>= x8 x7)) (= maxcolors x8)))

(minimize maxcolors)
(check-sat)
(get-objectives)
(get-model)
(exit)