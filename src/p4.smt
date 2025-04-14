(benchmark e
   :source { A formalization of Euclidean geometry }
   :logic AUFLIRA
   :category { crafted }
;   :difficulty { 5 }
;   :status unsat
   :extrasorts (Point)
   :extrasorts (Line)
   :extrasorts (Circle)
   :extrapreds ((bet Point Point Point))
   :extrapreds ((on Point Line))
   :extrapreds ((onc Point Circle))
   :extrapreds ((in Point Circle))
   :extrapreds ((center Point Circle))
   :extrapreds ((sameside Point Point Line))
   :extrapreds ((intersects Line Line))
   :extrapreds ((intersectslc Line Circle))
   :extrapreds ((intersectscc Circle Circle))
   :extrafuns  ((seg Point Point Real))
   :extrafuns  ((angle Point Point Point Real))
   :extrafuns  ((area Point Point Point Real))
   :extrafuns  ((rightangle Real))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Diagrammatic axioms
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Generalities
;

; Two points determine a line
:assumption
(forall (?a Point) (?b Point) (?L Line) (?M Line)
  (implies (and (not (= ?a ?b)) (on ?a ?L) (on ?b ?L)
      (on ?a ?M) (on ?b ?M))
    (= ?L ?M)))

; Center is unique
:assumption
(forall (?a Point) (?b Point) (?C Circle)
  (implies (and (center ?a ?C) (center ?b ?C))
    (= ?a ?b)))

:assumption
(forall (?a Point) (?C Circle)
  (implies (center ?a ?C) (in ?a ?C)))

;
; Between axioms
;

:assumption
(forall (?a Point) (?b Point) (?c Point)
  (implies (bet ?a ?b ?c)
    (and (bet ?c ?b ?a) (not (= ?a ?b)) (not (= ?a ?c))
      (not (bet ?b ?a ?c)))))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
   (implies (and (bet ?a ?b ?c) (on ?a ?L) (on ?b ?L)) (on ?c ?L)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
  (implies (and (bet ?a ?b ?c) (on ?a ?L) (on ?c ?L)) (on ?b ?L)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point)
  (implies (and (bet ?a ?b ?c) (bet ?a ?d ?b))
    (bet ?a ?d ?c)))
;   (and (bet ?a ?d ?c) (bet ?d ?b ?c))))    This variant redundant.

:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point)
  (implies (and (bet ?a ?b ?c) (bet ?b ?c ?d))
    (bet ?a ?b ?d)))
;   (and (bet ?a ?c ?d) (bet ?a ?b ?d))))    This variant redundant.

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
   (implies (and (on ?a ?L) (on ?b ?L) (on ?c ?L)
       (not (= ?a ?b)) (not (= ?a ?c)) (not (= ?b ?c)))
     (or (bet ?a ?b ?c) (bet ?b ?a ?c) (bet ?a ?c ?b))))

;
; Same side axioms
;

:assumption
(forall (?a Point) (?L Line)
   (implies (not (on ?a ?L)) (sameside ?a ?a ?L)))

:assumption
(forall (?a Point) (?b Point) (?L Line)
   (implies (sameside ?a ?b ?L)
     (and (not (on ?a ?L)) (sameside ?b ?a ?L))))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
   (implies (and (sameside ?a ?b ?L) (sameside ?a ?c ?L))
     (sameside ?b ?c ?L)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
   (implies (and (not (on ?a ?L)) (not (on ?b ?L)) (not (on ?c ?L)))
     (or (sameside ?a ?b ?L) (sameside ?a ?c ?L) (sameside ?b ?c ?L))))

;
; Pasch axioms
;

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
   (implies (and (bet ?a ?b ?c) (sameside ?a ?c ?L))
     (sameside ?a ?b ?L)))
;    (and (sameside ?a ?b ?L) (sameside ?b ?c ?L)))) This variant redundant

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
   (implies (and (bet ?a ?b ?c) (on ?a ?L) (not (on ?b ?L)))
     (sameside ?b ?c ?L)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
   (implies (and (bet ?a ?b ?c) (on ?b ?L))
     (not (sameside ?a ?c ?L))))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line) (?M Line)
   (implies (and (not (= ?a ?b)) (not (= ?b ?c)) (not (= ?L ?M)) (on ?a ?M)
       (on ?b ?M) (on ?c ?M)
     (not (sameside ?a ?c ?L)) (on ?b ?L))
       (bet ?a ?b ?c)))

;
; Triple incidence axioms
;

:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point)
    (?L Line) (?M Line) (?N Line)
  (implies (and (on ?a ?L) (on ?a ?M) (on ?a ?N) 
      (on ?b ?L) (on ?c ?M) (on ?d ?N) 
      (sameside ?c ?d ?L) (sameside ?b ?c ?N))
    (not (sameside ?b ?d ?M))))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point)
    (?L Line) (?M Line) (?N Line)
   (implies (and (on ?a ?L) (on ?a ?M) (on ?a ?N) 
       (on ?b ?L) (on ?c ?M) (on ?d ?N)
       (sameside ?c ?d ?L)
       (not (sameside ?d ?b ?M)) (not (on ?d ?M)) (not (= ?b ?a)))
     (sameside ?b ?c ?N)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point) (?e Point)
    (?L Line) (?M Line) (?N Line)
  (implies (and (on ?a ?L) (on ?a ?M) (on ?a ?N) 
      (on ?b ?L) (on ?c ?M) (on ?d ?N) 
      (sameside ?b ?c ?N) (sameside ?d ?c ?L)
      (sameside ?d ?e ?M) (sameside ?c ?e ?N))
    (sameside ?c ?e ?L)))

;
; Circle axioms
;

:assumption
(forall (?a Point) (?b Point) (?c Point) (?C Circle) (?L Line)
  (implies (and (in ?a ?C) (onc ?b ?C) (onc ?c ?C) (on ?a ?L)
      (on ?b ?L) (on ?c ?L) (not (= ?b ?c)))
    (bet ?b ?a ?c)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?C Circle)
  (implies (and (or (in ?a ?C) (onc ?a ?C))
      (or (in ?b ?C) (onc ?b ?C))
      (bet ?a ?c ?b))
  (in ?c ?C)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?C Circle) (?L Line)
   (implies (and (or (in ?a ?C) (onc ?a ?C)) (not (in ?c ?C)) 
       (bet ?a ?c ?b))
     (and (not (in ?b ?C)) (not (onc ?b ?C)))))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point)
     (?C Circle) (?D Circle) (?L Line)
   (implies (and (onc ?c ?C) (onc ?c ?D) (onc ?d ?C) (onc ?d ?D) 
       (not (= ?C ?D)) (not (= ?c ?d))
       (on ?a ?L) (on ?b ?L) (center ?a ?C) (center ?b ?D))
     (not (sameside ?c ?d ?L))))

;
; Intersections
;

:assumption
(forall (?L Line) (?M Line) (?a Point) (?b Point)
    (implies (and (on ?a ?M) (on ?b ?M) (not (sameside ?a ?b ?L)))
      (intersects ?L ?M)))

:assumption
(forall (?C Circle) (?L Line) (?a Point) (?b Point)
    (implies (and (or (in ?a ?C) (onc ?a ?C)) (or (in ?b ?C) (onc ?b ?C))
        (not (on ?a ?L)) (not (on ?b ?L)) (not (sameside ?a ?b ?L)))
      (intersectslc ?L ?C)))

:assumption
(forall (?L Line) (?C Circle) (?a Point)
    (implies (and (in ?a ?C) (on ?a ?L))
      (intersectslc ?L ?C)))

:assumption
(forall (?C Circle) (?D Circle) (?a Point) (?b Point)
    (implies (and (onc ?a ?C) (or (in ?b ?C) (onc ?b ?C))
        (in ?a ?D) (not (in ?b ?D)) (not (onc ?b ?D)))
      (intersectscc ?C ?D)))

:assumption
(forall (?C Circle) (?D Circle) (?a Point) (?b Point)
    (implies (and (onc ?a ?C) (in ?b ?D) (in ?a ?D) (onc ?b ?D))
      (intersectscc ?C ?D)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Metric axioms
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; segments

:assumption
(forall (?a Point) (?b Point) (implies (= (seg ?a ?b) 0.0) (= ?a ?b)))

:assumption
(forall (?a Point) (= (seg ?a ?a) 0.0))

:assumption
(forall (?a Point) (?b Point) (>= (seg ?a ?b) 0.0))

:assumption
(forall (?a Point) (?b Point) (= (seg ?a ?b) (seg ?b ?a)))

; angles

:assumption
(forall (?a Point) (?b Point) (?c Point)
  (implies (and (not (= ?a ?b)) (not (= ?b ?c)))
    (= (angle ?a ?b ?c) (angle ?c ?b ?a))))

:assumption
(forall (?a Point) (?b Point) (?c Point)
  (implies (and (not (= ?a ?b)) (not (= ?b ?c)))
    (and (>= (angle ?a ?b ?c) 0.0) 
         (<= (angle ?a ?b ?c) (+ rightangle rightangle)))))

; areas

:assumption
(forall (?a Point) (?b Point)
  (= (area ?a ?a ?b) 0.0))

:assumption
(forall (?a Point) (?b Point) (?c Point)
  (>= (area ?a ?b ?c) 0.0))

:assumption
(forall (?a Point) (?b Point) (?c Point)
  (and (= (area ?a ?b ?c) (area ?c ?a ?b)) 
    (= (area ?a ?b ?c) (area ?b ?a ?c))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Transfer axioms
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Diagram-segment transfer axioms
;

:assumption
(forall (?a Point) (?b Point) (?c Point)
  (implies (bet ?a ?b ?c) (= (+ (seg ?a ?b) (seg ?b ?c)) (seg ?a ?c))))

; center and radius determines the circle
:assumption
(forall (?a Point) (?b Point) (?c Point) (?C Circle) (?D Circle)
  (implies (and (center ?a ?C) (center ?a ?D) (onc ?b ?C) (onc ?c ?D)
      (= (seg ?a ?b) (seg ?a ?c)))
    (= ?C ?D)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?C Circle)
  (implies (and (center ?a ?C) (onc ?b ?C) (= (seg ?a ?c) (seg ?a ?b)))
         (onc ?c ?C)))

:assumption
(forall (?a Point) (?b Point) (?c Point) (?C Circle)
  (implies (and (center ?a ?C) (onc ?b ?C))
      (= (< (seg ?a ?c) (seg ?a ?b))
         (in ?c ?C))))

;
; Diagram-angle transfer axioms
;

; colinear iff angle is equal to 0
:assumption
(forall (?a Point) (?b Point) (?c Point) (?L Line)
  (implies (and (not (= ?a ?b)) (not (= ?a ?c)) (on ?a ?L) (on ?b ?L))
    (= (and (on ?c ?L) (not (bet ?c ?a ?b)))       
       (= (angle ?b ?a ?c) 0.0) )))

; point inside angle iff angles sum
:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point) (?L Line) (?M Line)
  (implies (and (on ?a ?L) (on ?b ?L) (on ?a ?M) (on ?c ?M)
      (not (= ?a ?b)) (not (= ?a ?c)) (not (on ?d ?L)) (not (on ?d ?M)) 
      (not (= ?L ?M)))
  (= (= (angle ?b ?a ?c) (+ (angle ?b ?a ?d) (angle ?d ?a ?c)))
     (and (sameside ?b ?d ?M) (sameside ?d ?c ?L)))))

; def right angle (and all right angles are equal)
:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point) (?L Line)
  (implies (and (on ?a ?L) (on ?b ?L) (bet ?a ?c ?b) (not (on ?d ?L)))
    (= (= (angle ?a ?c ?d) (angle ?d ?c ?b))
       (= (angle ?a ?c ?d) rightangle))))

;
; Diagram / areas
;

:assumption 
(forall (?a Point) (?b Point) (?c Point) (?L Line)
  (implies (and (on ?a ?L) (on ?b ?L) (not (= ?a ?b)))
    (= (= (area ?a ?b ?c) 0.0)
       (on ?c ?L))))

; areas sum
:assumption
(forall (?a Point) (?b Point) (?c Point) (?d Point) (?L Line)
  (implies (and (on ?a ?L) (on ?b ?L) (on ?c ?L) (not (on ?d ?L)) 
      (not (= ?a ?b)) (not (= ?c ?a)) (not (= ?c ?b)))
    (= (bet ?a ?c ?b)
       (= (+ (area ?a ?c ?d) (area ?d ?c ?b)) (area ?a ?d ?b)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Test diagram
; examples/complete2/010/complete_012_7_Book_00EE_11_E076-32.gex
; c a b = r_triangle c a b; d = midpoint d b c; e = foot e c a d ? eqangle a b b c d e e b
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; make some points and lines
;

:extrafuns ((c Point))
:extrafuns ((a Point))
:extrafuns ((b Point))
:extrafuns ((d Point))
:extrafuns ((e Point))

:extrafuns ((ca Line))
:assumption (on c ca)
:assumption (on a ca)
:extrafuns ((cb Line))
:assumption (on c cb)
:assumption (on b cb)
:extrafuns ((ab Line))
:assumption (on a ab)
:assumption (on b ab)
:assumption (not(= a b))
:assumption (not(= a c))
:assumption (not(= b c))
:assumption (not(= ca cb))
:assumption (not(= ca ab))
:assumption (not(= cb ab))
:assumption (= (angle c a b) rightangle)

:assumption (on d cb)
:assumption (bet c d b)
:assumption (= (seg d c) (seg d b))
:assumption (not(= d c))
:assumption (not(= d b))
:assumption (not(= d a))

:extrafuns ((ad Line))
:assumption (on a ad)
:assumption (on d ad)
:extrafuns ((ce Line))
:assumption (on c ce)
:assumption (on e ce)
:assumption (on e ad)
:assumption (= (angle c e a) rightangle)
:assumption (= (angle c a d) rightangle)
:assumption (not(= c e))
:assumption (not(= e a))
:assumption (not(= e b))
:assumption (not(= e d))

:formula (not(= (angle a b c) (angle d e b)))

)
