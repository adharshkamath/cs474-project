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
; IMO problem
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; make some points and lines
;

:extrafuns ((A Point))
:extrafuns ((B Point))
:extrafuns ((C Point))
:extrafuns ((D Point))
:extrafuns ((E Point))
:extrafuns ((F Point))
:extrafuns ((G Point))
:extrafuns ((O Point))
:extrafuns ((AB Line))
:extrafuns ((BC Line))
:extrafuns ((CA Line))
:extrafuns ((AD Line))
:extrafuns ((AE Line))
:extrafuns ((AF Line))
:extrafuns ((AG Line))
:extrafuns ((BF Line))
:extrafuns ((CG Line))
:extrafuns ((OABC Circle))

;
; describe the diagram
;

:assumption (on A AB)
:assumption (on B AB)
:assumption (not (on C AB))
:assumption (on B BC)
:assumption (on C BC)
:assumption (not (on A BC))
:assumption (on C CA)
:assumption (on A CA)
:assumption (not (on B CA))

:assumption (intersects AB BC)
:assumption (intersects BC CA)
:assumption (intersects CA AB)

:assumption (< (angle A B C) rightangle)
:assumption (< (angle B C A) rightangle)
:assumption (< (angle C A B) rightangle)

:assumption (on D BC)
; :assumption (bet B D C)
:assumption (= (angle D A B) (angle B C A))

:assumption (on D AD)
:assumption (on A AD)
:assumption (intersects AD BC)

:assumption (on E BC)
; :assumption (bet B E C)
:assumption (= (angle E A C) (angle C B A))

:assumption (on E AE)
:assumption (on A AE)
:assumption (intersects AE BC)

:assumption (on F AD)
:assumption (bet A D F)
:assumption (= (seg A D) (seg D F))

:assumption (on G AE)
:assumption (bet A E G)
:assumption (= (seg A E) (seg E G))

:assumption (on B BF)
:assumption (on F BF)
:assumption (on C CG)
:assumption (on G CG)

:assumption (center O OABC)
:assumption (onc A OABC)
:assumption (onc B OABC)
:assumption (onc C OABC)

:extrafuns ((L Point)) ; for testing
:extrafuns ((AL Line)) ; for testing
:assumption (on A AL)
:assumption (on L AL)
:assumption (on L BC)
:assumption (= (seg B L) (seg L C))
:assumption (bet B L C)

:extrafuns ((H Point))
:assumption (on H BF)
:assumption (on H CG)

:extrafuns ((J Point)) ; for testing
:extrafuns ((AJ Line)) ; for testing
:assumption (on A AJ)
:assumption (on J AJ)
:assumption (on O AJ)
:assumption (onc J OABC)
:assumption (= (seg A O) (seg J O))

:formula (not (= (seg O H) (seg O A)))



; :formula (not (intersects BF CG))
; :formula (not (intersectslc BF OABC))
; :formula (not (intersectslc CG OABC))

; satisfiable

; :formula (true)
; :formula (not (sameside s t O))
; :formula (sameside u t M)

; unsatisfiable

; :formula (sameside p t O)
; :formula (sameside s t O)
; :formula (not (sameside s t M))
; :formula (not (sameside u t M))
; :formula (bet s p t)
; :formula (= M N)
; :formula (bet q s u)
; :formula (on q N)
; :formula (= q t)
; :formula (not (< (seg s u) (seg s t)))
; :formula (not (< (seg u s) (seg s t)))
; :formula (not (< (+ (seg s u) (seg u t)) (seg p t)))
; :formula (not (< (+ (seg u s) (seg u t)) (seg p t)))
; :formula (on u L)
; :formula (on t L)
; :formula (on p K)
; :formula (not (sameside r s L))
; :formula (not (sameside s u L))

; ; takes a few of seconds
; :formula (not (sameside r u L))

; :formula (sameside s v K)
; :formula (not (= (+ (angle r p s) (angle s p q)) (angle r p q)))
; :formula (not (sameside p s K))
; :formula (not (sameside s t L))
; :formula (= L K)
; :formula (= q s)
; :formula (= q t)
; :formula (= q p)

; ; this one takes a long time
; :formula (not (= (+ (angle p q s) (angle s q t)) (angle p q t)))

; ; this one takes a long time
; :formula (not (< (angle p q s) (angle p q t)))

; ; immediate
; :formula (not (implies
;   (= (+ (angle p q s) (angle s q t)) (angle p q t))
;     (< (angle p q s) (angle p q t))))

)
