; benchmark generated from python API
(set-info :status unknown)
(declare-sort Line 0)
(declare-sort Point 0)
(declare-sort Circle 0)
(declare-fun On (Point Line) Bool)
(declare-fun |ForAll([a, b, L, M],
       Implies(And(Not(a == b),
                   On(a, L),
                   On(b, L),
                   On(a, M),
                   On(b, M)),
               L == M))| () Bool)
(declare-fun Center (Point Circle) Bool)
(declare-fun |ForAll([a, b, alpha],
       Implies(And(Center(a, alpha), Center(b, alpha)),
               a == b))| () Bool)
(declare-fun Inside (Point Circle) Bool)
(declare-fun |ForAll([a, alpha],
       Implies(Center(a, alpha), Inside(a, alpha)))| () Bool)
(declare-fun Onc (Point Circle) Bool)
(declare-fun |ForAll([a, alpha],
       Implies(Inside(a, alpha), Not(Onc(a, alpha))))| () Bool)
(declare-fun Between (Point Point Point) Bool)
(declare-fun |ForAll([a, b, c],
       Implies(Between(a, b, c),
               And(Between(c, b, a),
                   Not(a == b),
                   Not(a == c),
                   Not(Between(b, a, c)))))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(a, L), On(b, L)),
               On(c, L)))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(a, L), On(c, L)),
               On(b, L)))| () Bool)
(declare-fun |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, d, b)),
               Between(a, d, c)))| () Bool)
(declare-fun |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(b, c, d)),
               Between(a, b, d)))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(On(a, L), On(b, L), On(c, L)),
               Or(Between(a, b, c),
                  Between(b, a, c),
                  Between(a, c, b))))| () Bool)
(declare-fun |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, b, d)),
               Not(Between(c, b, d))))| () Bool)
(declare-fun SameSide (Point Point Line) Bool)
(declare-fun |ForAll([a, L], Implies(Not(On(a, L)), SameSide(a, a, L)))| () Bool)
(declare-fun |ForAll([a, b, L],
       Implies(SameSide(a, b, L), SameSide(b, a, L)))| () Bool)
(declare-fun |ForAll([a, b, L], Implies(SameSide(a, b, L), Not(On(a, L))))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(SameSide(a, b, L), SameSide(a, c, L)),
               SameSide(b, c, L)))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Not(On(a, L)),
                   Not(On(b, L)),
                   Not(On(c, L)),
                   Not(SameSide(a, b, L))),
               Or(SameSide(a, c, L), SameSide(b, c, L))))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), SameSide(a, c, L)),
               SameSide(a, b, L)))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c),
                   On(a, L),
                   Not(On(b, L))),
               SameSide(b, c, L)))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(b, L)),
               Not(SameSide(a, c, L))))| () Bool)
(declare-fun Intersectsll (Line Line) Bool)
(declare-fun |ForAll([a, b, c, L, M],
       Implies(And(Not(L == M),
                   Intersectsll(L, M),
                   On(b, L),
                   On(b, M),
                   On(a, M),
                   On(c, M),
                   Not(c == a),
                   Not(a == b),
                   Not(b == c),
                   Not(SameSide(a, c, L))),
               Between(a, b, c)))| () Bool)
(declare-fun |ForAll([a, b, c, d, L, M, N],
       Implies(And(Not(L == M),
                   Not(L == N),
                   Not(M == N),
                   Intersectsll(L, M),
                   Intersectsll(M, N),
                   Intersectsll(L, N),
                   On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   SameSide(b, c, N)),
               Not(SameSide(b, d, M))))| () Bool)
(declare-fun |ForAll([a, b, c, d, L, M, N],
       Implies(And(Not(L == M),
                   Not(L == N),
                   Not(M == N),
                   Intersectsll(L, M),
                   Intersectsll(M, N),
                   Intersectsll(L, N),
                   On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   Not(SameSide(b, d, M)),
                   Not(On(d, M)),
                   Not(b == a)),
               SameSide(b, c, N)))| () Bool)
(declare-fun |ForAll([a, b, c, d, e, L, M, N],
       Implies(And(Not(L == M),
                   Not(L == N),
                   Not(M == N),
                   Intersectsll(L, M),
                   Intersectsll(M, N),
                   Intersectsll(L, N),
                   On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   SameSide(b, c, N),
                   SameSide(d, e, M),
                   SameSide(c, e, N)),
               SameSide(c, e, L)))| () Bool)
(declare-fun |ForAll([a, b, c, L, alpha],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Inside(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha),
                   Not(b == c)),
               Between(b, a, c)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Or(Onc(a, alpha), Inside(a, alpha)),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Between(a, c, b)),
               Inside(c, alpha)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Not(Inside(c, alpha)),
                   Between(a, c, b)),
               Not(Or(Inside(b, alpha), Onc(b, alpha)))))| () Bool)
(declare-fun Intersectscc (Circle Circle) Bool)
(declare-fun |ForAll([a, b, c, d, L, alpha, beta],
       Implies(And(Not(alpha == beta),
                   Intersectscc(alpha, beta),
                   Onc(c, alpha),
                   Onc(c, beta),
                   Onc(d, alpha),
                   Onc(d, beta),
                   Not(c == d),
                   Center(a, alpha),
                   Center(b, beta),
                   On(a, L),
                   On(b, L)),
               Not(SameSide(c, d, L))))| () Bool)
(declare-fun |ForAll([a, b, L, M],
       Implies(And(Not(SameSide(a, b, L)),
                   On(a, M),
                   On(b, M)),
               Intersectsll(L, M)))| () Bool)
(declare-fun Intersectslc (Line Circle) Bool)
(declare-fun |ForAll([a, b, L, alpha],
       Implies(And(Or(Onc(a, alpha), Inside(a, alpha)),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Not(SameSide(a, b, L))),
               Intersectslc(L, alpha)))| () Bool)
(declare-fun |ForAll([a, L, alpha],
       Implies(And(Inside(a, alpha), On(a, L)),
               Intersectslc(L, alpha)))| () Bool)
(declare-fun |ForAll([a, b, alpha, beta],
       Implies(And(Onc(a, alpha),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Inside(a, beta),
                   Not(Onc(b, beta)),
                   Not(Inside(b, beta))),
               Intersectscc(alpha, beta)))| () Bool)
(declare-fun |ForAll([a, b, alpha, beta],
       Implies(And(Onc(a, alpha),
                   Inside(b, alpha),
                   Inside(a, beta),
                   Onc(b, beta)),
               Intersectscc(alpha, beta)))| () Bool)
(declare-fun Segment (Point Point) Real)
(declare-fun |ForAll([a, b],
       And(Implies(a == b, 0 == Segment(a, b)),
           Implies(0 == Segment(a, b), a == b)))| () Bool)
(declare-fun |ForAll([a, b], 0 <= Segment(a, b))| () Bool)
(declare-fun |ForAll([a, b], Segment(a, b) == Segment(b, a))| () Bool)
(declare-fun Angle (Point Point Point) Real)
(declare-fun |ForAll([a, b, c],
       Implies(And(Not(a == b), Not(a == c)),
               Angle(a, b, c) == Angle(c, b, a)))| () Bool)
(declare-fun RightAngle () Real)
(declare-fun |ForAll([a, b, c],
       And(0 <= Angle(a, b, c),
           Angle(a, b, c) <= RightAngle + RightAngle))| () Bool)
(declare-fun Area (Point Point Point) Real)
(declare-fun |ForAll([a, b], 0 == Area(a, a, b))| () Bool)
(declare-fun |ForAll([a, b, c], 0 <= Area(a, b, c))| () Bool)
(declare-fun |ForAll([a, b, c],
       And(Area(a, b, c) == Area(c, a, b),
           Area(a, b, c) == Area(a, c, b)))| () Bool)
(declare-fun |ForAll([a, b, c, d, e, f],
       Implies(And(Segment(a, b) == Segment(d, e),
                   Segment(b, c) == Segment(e, f),
                   Segment(c, a) == Segment(f, d),
                   Angle(a, b, c) == Angle(d, e, f),
                   Angle(b, c, a) == Angle(e, f, d),
                   Angle(c, a, b) == Angle(f, d, e)),
               Area(a, b, c) == Area(d, e, f)))| () Bool)
(declare-fun |ForAll([a, b, c],
       Implies(Between(a, b, c),
               Segment(a, c) ==
               Segment(a, b) + Segment(b, c)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha, beta],
       Implies(And(Center(a, alpha),
                   Center(a, beta),
                   Onc(b, alpha),
                   Onc(c, beta),
                   Segment(a, b) == Segment(a, c)),
               alpha == beta))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha), Onc(b, alpha)),
               And(Implies(Onc(c, alpha),
                           Segment(a, b) == Segment(a, c)),
                   Implies(Segment(a, b) == Segment(a, c),
                           Onc(c, alpha)))))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha), Onc(b, alpha)),
               And(Implies(Inside(c, alpha),
                           Segment(a, c) < Segment(a, b)),
                   Implies(Segment(a, c) < Segment(a, b),
                           Inside(c, alpha)))))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Not(a == b),
                   Not(a == c),
                   On(a, L),
                   On(b, L)),
               And(Implies(And(On(c, L),
                               Not(Between(b, a, c))),
                           0 == Angle(b, a, c)),
                   Implies(0 == Angle(b, a, c),
                           And(On(c, L),
                               Not(Between(b, a, c)))))))| () Bool)
(declare-fun |ForAll([a, b, c, d, L, M],
       Implies(And(On(a, L),
                   On(a, M),
                   Intersectsll(L, M),
                   On(b, L),
                   On(c, M),
                   Not(a == b),
                   Not(a == c),
                   Not(On(d, L)),
                   Not(On(d, M)),
                   Not(L == M)),
               And(Implies(Angle(b, a, c) ==
                           Angle(b, a, d) + Angle(d, a, c),
                           And(SameSide(b, d, M),
                               SameSide(c, d, L))),
                   Implies(And(SameSide(b, d, M),
                               SameSide(c, d, L)),
                           Angle(b, a, c) ==
                           Angle(b, a, d) + Angle(d, a, c)))))| () Bool)
(declare-fun |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   Between(a, c, b),
                   Not(On(d, L))),
               And(Implies(Angle(a, c, d) == Angle(d, c, b),
                           Angle(a, c, d) == RightAngle),
                   Implies(Angle(a, c, d) == RightAngle,
                           Angle(a, c, d) == Angle(d, c, b)))))| () Bool)
(declare-fun |ForAll([a, b, c, d, e, L, M],
       Implies(And(On(a, L),
                   On(b, L),
                   On(d, L),
                   On(a, M),
                   On(c, M),
                   On(e, M),
                   Not(b == a),
                   Not(d == a),
                   Not(c == a),
                   Not(e == a),
                   Not(Between(b, a, d)),
                   Not(Between(c, a, e))),
               Angle(b, a, c) == Angle(d, a, e)))| () Bool)
(declare-fun |ForAll([a, b, c, d, e, L, M, N],
       Implies(And(On(a, L),
                   On(b, L),
                   On(b, M),
                   On(c, M),
                   On(c, N),
                   On(d, N),
                   Not(b == c),
                   SameSide(a, d, N),
                   Angle(a, b, c) + Angle(b, c, d) <
                   RightAngle + RightAngle),
               And(Intersectsll(L, N),
                   Implies(And(On(e, L), On(e, N)),
                           SameSide(a, e, M)))))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(On(a, L), On(b, L), Not(a == b)),
               And(Implies(On(c, L), 0 == Area(a, b, c)),
                   Implies(0 == Area(a, b, c), On(c, L)))))| () Bool)
(declare-fun |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Not(a == b),
                   Not(a == c),
                   Not(b == c),
                   Not(On(d, L))),
               And(Implies(Between(a, c, b),
                           Area(a, c, d) + Area(d, c, b) ==
                           Area(a, d, b)),
                   Implies(Area(a, c, d) + Area(d, c, b) ==
                           Area(a, d, b),
                           Between(a, c, b)))))| () Bool)
(declare-fun F1 () Point)
(declare-fun E1 () Point)
(declare-fun D1 () Point)
(declare-fun C1 () Point)
(declare-fun B1 () Point)
(declare-fun A1 () Point)
(declare-fun CG1 () Line)
(declare-fun BF1 () Line)
(declare-fun GE1 () Line)
(declare-fun FD1 () Line)
(declare-fun CA1 () Line)
(declare-fun BC1 () Line)
(declare-fun AB1 () Line)
(declare-fun |Intersectsll(AB1, BC1)| () Bool)
(declare-fun |Intersectsll(BC1, CA1)| () Bool)
(declare-fun |Intersectsll(CA1, AB1)| () Bool)
(declare-fun |On(A1, AB1)| () Bool)
(declare-fun |On(B1, AB1)| () Bool)
(declare-fun |Not(On(C1, AB1))| () Bool)
(declare-fun |On(B1, BC1)| () Bool)
(declare-fun |On(C1, BC1)| () Bool)
(declare-fun |Not(On(A1, BC1))| () Bool)
(declare-fun |On(C1, CA1)| () Bool)
(declare-fun |On(A1, CA1)| () Bool)
(declare-fun |Not(On(B1, CA1))| () Bool)
(declare-fun |On(D1, BC1)| () Bool)
(declare-fun |Angle(D1, A1, B1) == Angle(B1, C1, A1)| () Bool)
(declare-fun |On(E1, BC1)| () Bool)
(declare-fun |Angle(E1, A1, C1) == Angle(C1, B1, A1)| () Bool)
(declare-fun |On(F1, FD1)| () Bool)
(declare-fun |On(D1, FD1)| () Bool)
(declare-fun |On(A1, FD1)| () Bool)
(declare-fun |Segment(F1, D1) == Segment(D1, A1)| () Bool)
(declare-fun G1 () Point)
(declare-fun |On(G1, GE1)| () Bool)
(declare-fun |On(E1, GE1)| () Bool)
(declare-fun |On(A1, GE1)| () Bool)
(declare-fun |Segment(G1, E1) == Segment(E1, A1)| () Bool)
(declare-fun |On(B1, BF1)| () Bool)
(declare-fun |On(F1, BF1)| () Bool)
(declare-fun |On(C1, CG1)| () Bool)
(declare-fun |On(G1, CG1)| () Bool)
(declare-fun H1 () Point)
(declare-fun |On(H1, BF1)| () Bool)
(declare-fun OABC () Circle)
(declare-fun I1 () Point)
(declare-fun |Center(I1, OABC)| () Bool)
(declare-fun |Onc(A1, OABC)| () Bool)
(declare-fun |Onc(B1, OABC)| () Bool)
(declare-fun |Onc(C1, OABC)| () Bool)
(assert
 (let (($x39 (forall ((a Point) (b Point) (L Line) (M Line) )(let (($x30 (= L M)))
 (let (($x31 (On b M)))
 (let (($x32 (On a M)))
 (let (($x33 (On b L)))
 (let (($x34 (On a L)))
 (let (($x35 (= a b)))
 (let (($x36 (not $x35)))
 (=> (and $x36 $x34 $x33 $x32 $x31) $x30)))))))))
 ))
 (=> |ForAll([a, b, L, M],
       Implies(And(Not(a == b),
                   On(a, L),
                   On(b, L),
                   On(a, M),
                   On(b, M)),
               L == M))| $x39)))
(assert
 (let (($x43 (forall ((a Point) (b Point) (alpha Circle) )(let (($x24 (= a b)))
 (=> (and (Center a alpha) (Center b alpha)) $x24)))
 ))
 (=> |ForAll([a, b, alpha],
       Implies(And(Center(a, alpha), Center(b, alpha)),
               a == b))| $x43)))
(assert
 (let (($x44 (forall ((a Point) (alpha Circle) )(let (($x20 (Inside a alpha)))
 (let (($x25 (Center a alpha)))
 (=> $x25 $x20))))
 ))
 (=> |ForAll([a, alpha],
       Implies(Center(a, alpha), Inside(a, alpha)))| $x44)))
(assert
 (let (($x49 (forall ((a Point) (alpha Circle) )(let (($x46 (Onc a alpha)))
 (let (($x47 (not $x46)))
 (let (($x20 (Inside a alpha)))
 (=> $x20 $x47)))))
 ))
 (=> |ForAll([a, alpha],
       Implies(Inside(a, alpha), Not(Onc(a, alpha))))| $x49)))
(assert
 (let (($x66 (forall ((a Point) (b Point) (c Point) )(let (($x57 (Between b a c)))
 (let (($x58 (not $x57)))
 (let (($x59 (= a c)))
 (let (($x60 (not $x59)))
 (let (($x24 (= a b)))
 (let (($x61 (not $x24)))
 (let (($x62 (Between c b a)))
 (let (($x64 (Between a b c)))
 (=> $x64 (and $x62 $x61 $x60 $x58)))))))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(Between(a, b, c),
               And(Between(c, b, a),
                   Not(a == b),
                   Not(a == c),
                   Not(Between(b, a, c)))))| $x66)))
(assert
 (let (($x67 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x52 (On c L)))
 (=> (and (Between a b c) (On a L) (On b L)) $x52)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(a, L), On(b, L)),
               On(c, L)))| $x67)))
(assert
 (let (($x70 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x31 (On b L)))
 (=> (and (Between a b c) (On a L) (On c L)) $x31)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(a, L), On(c, L)),
               On(b, L)))| $x70)))
(assert
 (let (($x74 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x51 (Between a d c)))
 (=> (and (Between a b c) (Between a d b)) $x51)))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, d, b)),
               Between(a, d, c)))| $x74)))
(assert
 (let (($x78 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x75 (Between a b d)))
 (=> (and (Between a b c) (Between b c d)) $x75)))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(b, c, d)),
               Between(a, b, d)))| $x78)))
(assert
 (let (($x88 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x83 (Between a c b)))
 (let (($x84 (Between b a c)))
 (let (($x53 (Between a b c)))
 (=> (and (On a L) (On b L) (On c L)) (or $x53 $x84 $x83))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(On(a, L), On(b, L), On(c, L)),
               Or(Between(a, b, c),
                  Between(b, a, c),
                  Between(a, c, b))))| $x88)))
(assert
 (let (($x82 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x57 (Between c b d)))
 (let (($x58 (not $x57)))
 (=> (and (Between a b c) (Between a b d)) $x58))))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, b, d)),
               Not(Between(c, b, d))))| $x82)))
(assert
 (let (($x90 (forall ((a Point) (L Line) )(let (($x50 (SameSide a a L)))
 (let (($x52 (On a L)))
 (let (($x79 (not $x52)))
 (=> $x79 $x50)))))
 ))
 (=> |ForAll([a, L], Implies(Not(On(a, L)), SameSide(a, a, L)))| $x90)))
(assert
 (let (($x93 (forall ((a Point) (b Point) (L Line) )(let (($x45 (SameSide b a L)))
 (let (($x91 (SameSide a b L)))
 (=> $x91 $x45))))
 ))
 (=> |ForAll([a, b, L],
       Implies(SameSide(a, b, L), SameSide(b, a, L)))| $x93)))
(assert
 (let (($x97 (forall ((a Point) (b Point) (L Line) )(let (($x31 (On a L)))
 (let (($x95 (not $x31)))
 (let (($x91 (SameSide a b L)))
 (=> $x91 $x95)))))
 ))
 (=> |ForAll([a, b, L], Implies(SameSide(a, b, L), Not(On(a, L))))| $x97)))
(assert
 (let (($x103 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x91 (SameSide b c L)))
 (=> (and (SameSide a b L) (SameSide a c L)) $x91)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(SameSide(a, b, L), SameSide(a, c, L)),
               SameSide(b, c, L)))| $x103)))
(assert
 (let (($x117 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x100 (SameSide a b L)))
 (let (($x113 (not $x100)))
 (let (($x52 (On c L)))
 (let (($x79 (not $x52)))
 (let (($x31 (On b L)))
 (let (($x95 (not $x31)))
 (let (($x32 (On a L)))
 (let (($x114 (not $x32)))
 (=> (and $x114 $x95 $x79 $x113) (or (SameSide a c L) (SameSide b c L))))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Not(On(a, L)),
                   Not(On(b, L)),
                   Not(On(c, L)),
                   Not(SameSide(a, b, L))),
               Or(SameSide(a, c, L), SameSide(b, c, L))))| $x117)))
(assert
 (let (($x106 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x100 (SameSide a b L)))
 (=> (and (Between a b c) (SameSide a c L)) $x100)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), SameSide(a, c, L)),
               SameSide(a, b, L)))| $x106)))
(assert
 (let (($x111 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x91 (SameSide b c L)))
 (=> (and (Between a b c) (On a L) (not (On b L))) $x91)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c),
                   On(a, L),
                   Not(On(b, L))),
               SameSide(b, c, L)))| $x111)))
(assert
 (let (($x120 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x99 (SameSide a c L)))
 (let (($x108 (not $x99)))
 (=> (and (Between a b c) (On b L)) $x108))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(b, L)),
               Not(SameSide(a, c, L))))| $x120)))
(assert
 (let (($x146 (forall ((a Point) (b Point) (c Point) (L Line) (M Line) )(let (($x134 (Between a b c)))
 (let (($x35 (= b c)))
 (let (($x36 (not $x35)))
 (let (($x137 (= a b)))
 (let (($x138 (not $x137)))
 (let (($x31 (On c M)))
 (let (($x141 (On a M)))
 (let (($x32 (On b M)))
 (let (($x34 (On b L)))
 (let (($x142 (Intersectsll L M)))
 (let (($x30 (= L M)))
 (let (($x143 (not $x30)))
 (let (($x144 (and $x143 $x142 $x34 $x32 $x141 $x31 (not (= c a)) $x138 $x36 (not (SameSide a c L)))))
 (=> $x144 $x134)))))))))))))))
 ))
 (=> |ForAll([a, b, c, L, M],
       Implies(And(Not(L == M),
                   Intersectsll(L, M),
                   On(b, L),
                   On(b, M),
                   On(a, M),
                   On(c, M),
                   Not(c == a),
                   Not(a == b),
                   Not(b == c),
                   Not(SameSide(a, c, L))),
               Between(a, b, c)))| $x146)))
(assert
 (let (($x170 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) (N Line) )(let (($x153 (SameSide b d M)))
 (let (($x154 (not $x153)))
 (let (($x155 (SameSide b c N)))
 (let (($x156 (SameSide c d L)))
 (let (($x32 (On d N)))
 (let (($x157 (On c M)))
 (let (($x158 (On b L)))
 (let (($x159 (On a N)))
 (let (($x160 (On a M)))
 (let (($x161 (On a L)))
 (let (($x162 (Intersectsll L N)))
 (let (($x142 (Intersectsll M N)))
 (let (($x163 (Intersectsll L M)))
 (let (($x30 (= M N)))
 (let (($x143 (not $x30)))
 (let (($x164 (= L N)))
 (let (($x165 (not $x164)))
 (let (($x166 (= L M)))
 (let (($x167 (not $x166)))
 (let (($x168 (and $x167 $x165 $x143 $x163 $x142 $x162 $x161 $x160 $x159 $x158 $x157 $x32 $x156 $x155)))
 (=> $x168 $x154))))))))))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L, M, N],
       Implies(And(Not(L == M),
                   Not(L == N),
                   Not(M == N),
                   Intersectsll(L, M),
                   Intersectsll(M, N),
                   Intersectsll(L, N),
                   On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   SameSide(b, c, N)),
               Not(SameSide(b, d, M))))| $x170)))
(assert
 (let (($x180 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) (N Line) )(let (($x155 (SameSide b c N)))
 (let (($x175 (= b a)))
 (let (($x176 (not $x175)))
 (let (($x34 (On d M)))
 (let (($x177 (not $x34)))
 (let (($x153 (SameSide b d M)))
 (let (($x154 (not $x153)))
 (let (($x156 (SameSide c d L)))
 (let (($x32 (On d N)))
 (let (($x157 (On c M)))
 (let (($x158 (On b L)))
 (let (($x159 (On a N)))
 (let (($x160 (On a M)))
 (let (($x161 (On a L)))
 (let (($x162 (Intersectsll L N)))
 (let (($x142 (Intersectsll M N)))
 (let (($x163 (Intersectsll L M)))
 (let (($x30 (= M N)))
 (let (($x143 (not $x30)))
 (let (($x164 (= L N)))
 (let (($x165 (not $x164)))
 (let (($x166 (= L M)))
 (let (($x167 (not $x166)))
 (let (($x178 (and $x167 $x165 $x143 $x163 $x142 $x162 $x161 $x160 $x159 $x158 $x157 $x32 $x156 $x154 $x177 $x176)))
 (=> $x178 $x155))))))))))))))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L, M, N],
       Implies(And(Not(L == M),
                   Not(L == N),
                   Not(M == N),
                   Intersectsll(L, M),
                   Intersectsll(M, N),
                   Intersectsll(L, N),
                   On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   Not(SameSide(b, d, M)),
                   Not(On(d, M)),
                   Not(b == a)),
               SameSide(b, c, N)))| $x180)))
(assert
 (let (($x190 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) (N Line) )(let (($x173 (SameSide c e L)))
 (let (($x174 (SameSide c e N)))
 (let (($x181 (SameSide d e M)))
 (let (($x182 (SameSide b c N)))
 (let (($x183 (SameSide c d L)))
 (let (($x141 (On d N)))
 (let (($x184 (On c M)))
 (let (($x161 (On b L)))
 (let (($x185 (On a N)))
 (let (($x186 (On a M)))
 (let (($x187 (On a L)))
 (let (($x162 (Intersectsll L N)))
 (let (($x142 (Intersectsll M N)))
 (let (($x163 (Intersectsll L M)))
 (let (($x30 (= M N)))
 (let (($x143 (not $x30)))
 (let (($x164 (= L N)))
 (let (($x165 (not $x164)))
 (let (($x166 (= L M)))
 (let (($x167 (not $x166)))
 (let (($x188 (and $x167 $x165 $x143 $x163 $x142 $x162 $x187 $x186 $x185 $x161 $x184 $x141 $x183 $x182 $x181 $x174)))
 (=> $x188 $x173)))))))))))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, e, L, M, N],
       Implies(And(Not(L == M),
                   Not(L == N),
                   Not(M == N),
                   Intersectsll(L, M),
                   Intersectsll(M, N),
                   Intersectsll(L, N),
                   On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   SameSide(b, c, N),
                   SameSide(d, e, M),
                   SameSide(c, e, N)),
               SameSide(c, e, L)))| $x190)))
(assert
 (let (($x132 (forall ((a Point) (b Point) (c Point) (L Line) (alpha Circle) )(let (($x126 (Between b a c)))
 (let (($x35 (= b c)))
 (let (($x36 (not $x35)))
 (let (($x127 (Onc c alpha)))
 (let (($x128 (Onc b alpha)))
 (let (($x129 (Inside a alpha)))
 (let (($x33 (On c L)))
 (let (($x34 (On b L)))
 (let (($x157 (On a L)))
 (=> (and $x157 $x34 $x33 $x129 $x128 $x127 $x36) $x126)))))))))))
 ))
 (=> |ForAll([a, b, c, L, alpha],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Inside(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha),
                   Not(b == c)),
               Between(b, a, c)))| $x132)))
(assert
 (let (($x192 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x20 (Inside c alpha)))
 (let (($x83 (Between a c b)))
 (let (($x125 (Inside b alpha)))
 (let (($x127 (Onc b alpha)))
 (let (($x147 (or $x127 $x125)))
 (let (($x148 (Inside a alpha)))
 (let (($x128 (Onc a alpha)))
 (let (($x149 (or $x128 $x148)))
 (=> (and $x149 $x147 $x83) $x20))))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Or(Onc(a, alpha), Inside(a, alpha)),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Between(a, c, b)),
               Inside(c, alpha)))| $x192)))
(assert
 (let (($x201 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x196 (not (or (Inside b alpha) (Onc b alpha)))))
 (let (($x83 (Between a c b)))
 (let (($x20 (Inside c alpha)))
 (let (($x197 (not $x20)))
 (let (($x128 (Onc a alpha)))
 (let (($x148 (Inside a alpha)))
 (let (($x198 (or $x148 $x128)))
 (=> (and $x198 $x197 $x83) $x196)))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Not(Inside(c, alpha)),
                   Between(a, c, b)),
               Not(Or(Inside(b, alpha), Onc(b, alpha)))))| $x201)))
(assert
 (let (($x219 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (alpha Circle) (beta Circle) )(let (($x156 (SameSide c d L)))
 (let (($x208 (not $x156)))
 (let (($x158 (On b L)))
 (let (($x161 (On a L)))
 (let (($x209 (Center b beta)))
 (let (($x210 (Center a alpha)))
 (let (($x137 (= c d)))
 (let (($x138 (not $x137)))
 (let (($x128 (Onc d beta)))
 (let (($x211 (Onc d alpha)))
 (let (($x212 (Onc c beta)))
 (let (($x213 (Onc c alpha)))
 (let (($x214 (Intersectscc alpha beta)))
 (let (($x217 (and (not (= alpha beta)) $x214 $x213 $x212 $x211 $x128 $x138 $x210 $x209 $x161 $x158)))
 (=> $x217 $x208))))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L, alpha, beta],
       Implies(And(Not(alpha == beta),
                   Intersectscc(alpha, beta),
                   Onc(c, alpha),
                   Onc(c, beta),
                   Onc(d, alpha),
                   Onc(d, beta),
                   Not(c == d),
                   Center(a, alpha),
                   Center(b, beta),
                   On(a, L),
                   On(b, L)),
               Not(SameSide(c, d, L))))| $x219)))
(assert
 (let (($x194 (forall ((a Point) (b Point) (L Line) (M Line) )(let (($x142 (Intersectsll L M)))
 (=> (and (not (SameSide a b L)) (On a M) (On b M)) $x142)))
 ))
 (=> |ForAll([a, b, L, M],
       Implies(And(Not(SameSide(a, b, L)),
                   On(a, M),
                   On(b, M)),
               Intersectsll(L, M)))| $x194)))
(assert
 (let (($x222 (forall ((a Point) (b Point) (L Line) (alpha Circle) )(let (($x206 (Intersectslc L alpha)))
 (let (($x122 (SameSide a b L)))
 (let (($x123 (not $x122)))
 (let (($x125 (Inside b alpha)))
 (let (($x127 (Onc b alpha)))
 (let (($x147 (or $x127 $x125)))
 (let (($x148 (Inside a alpha)))
 (let (($x128 (Onc a alpha)))
 (let (($x149 (or $x128 $x148)))
 (=> (and $x149 $x147 $x123) $x206)))))))))))
 ))
 (=> |ForAll([a, b, L, alpha],
       Implies(And(Or(Onc(a, alpha), Inside(a, alpha)),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Not(SameSide(a, b, L))),
               Intersectslc(L, alpha)))| $x222)))
(assert
 (let (($x202 (forall ((a Point) (L Line) (alpha Circle) )(let (($x206 (Intersectslc L alpha)))
 (=> (and (Inside a alpha) (On a L)) $x206)))
 ))
 (=> |ForAll([a, L, alpha],
       Implies(And(Inside(a, alpha), On(a, L)),
               Intersectslc(L, alpha)))| $x202)))
(assert
 (let (($x234 (forall ((a Point) (b Point) (alpha Circle) (beta Circle) )(let (($x214 (Intersectscc alpha beta)))
 (let (($x125 (Inside b beta)))
 (let (($x227 (not $x125)))
 (let (($x127 (Onc b beta)))
 (let (($x228 (not $x127)))
 (let (($x148 (Inside a beta)))
 (let (($x211 (Onc a alpha)))
 (=> (and $x211 (or (Onc b alpha) (Inside b alpha)) $x148 $x228 $x227) $x214)))))))))
 ))
 (=> |ForAll([a, b, alpha, beta],
       Implies(And(Onc(a, alpha),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Inside(a, beta),
                   Not(Onc(b, beta)),
                   Not(Inside(b, beta))),
               Intersectscc(alpha, beta)))| $x234)))
(assert
 (let (($x224 (forall ((a Point) (b Point) (alpha Circle) (beta Circle) )(let (($x214 (Intersectscc alpha beta)))
 (let (($x127 (Onc b beta)))
 (let (($x148 (Inside a beta)))
 (let (($x229 (Inside b alpha)))
 (let (($x211 (Onc a alpha)))
 (=> (and $x211 $x229 $x148 $x127) $x214)))))))
 ))
 (=> |ForAll([a, b, alpha, beta],
       Implies(And(Onc(a, alpha),
                   Inside(b, alpha),
                   Inside(a, beta),
                   Onc(b, beta)),
               Intersectscc(alpha, beta)))| $x224)))
(assert
 (let (($x239 (forall ((a Point) (b Point) )(and (=> (= a b) (= 0.0 (Segment a b))) (=> (= 0.0 (Segment a b)) (= a b))))
 ))
 (=> |ForAll([a, b],
       And(Implies(a == b, 0 == Segment(a, b)),
           Implies(0 == Segment(a, b), a == b)))| $x239)))
(assert
 (let (($x98 (forall ((a Point) (b Point) )(let ((?x226 (Segment a b)))
 (<= 0.0 ?x226)))
 ))
 (=> |ForAll([a, b], 0 <= Segment(a, b))| $x98)))
(assert
 (let (($x241 (forall ((a Point) (b Point) )(let ((?x204 (Segment b a)))
 (let ((?x226 (Segment a b)))
 (= ?x226 ?x204))))
 ))
 (=> |ForAll([a, b], Segment(a, b) == Segment(b, a))| $x241)))
(assert
 (let (($x253 (forall ((a Point) (b Point) (c Point) )(let ((?x248 (Angle c b a)))
 (let ((?x249 (Angle a b c)))
 (let (($x250 (= ?x249 ?x248)))
 (=> (and (not (= a b)) (not (= a c))) $x250)))))
 ))
 (=> |ForAll([a, b, c],
       Implies(And(Not(a == b), Not(a == c)),
               Angle(a, b, c) == Angle(c, b, a)))| $x253)))
(assert
 (let (($x247 (forall ((a Point) (b Point) (c Point) )(and (<= 0.0 (Angle a b c)) (<= (Angle a b c) (+ RightAngle RightAngle))))
 ))
 (=> |ForAll([a, b, c],
       And(0 <= Angle(a, b, c),
           Angle(a, b, c) <= RightAngle + RightAngle))| $x247)))
(assert
 (let (($x254 (forall ((a Point) (b Point) )(let ((?x242 (Area a a b)))
 (= 0.0 ?x242)))
 ))
 (=> |ForAll([a, b], 0 == Area(a, a, b))| $x254)))
(assert
 (let (($x257 (forall ((a Point) (b Point) (c Point) )(let ((?x255 (Area a b c)))
 (<= 0.0 ?x255)))
 ))
 (=> |ForAll([a, b, c], 0 <= Area(a, b, c))| $x257)))
(assert
 (let (($x267 (forall ((a Point) (b Point) (c Point) )(let ((?x262 (Area a c b)))
 (let ((?x255 (Area a b c)))
 (let (($x263 (= ?x255 ?x262)))
 (let ((?x264 (Area c a b)))
 (let (($x265 (= ?x255 ?x264)))
 (and $x265 $x263)))))))
 ))
 (=> |ForAll([a, b, c],
       And(Area(a, b, c) == Area(c, a, b),
           Area(a, b, c) == Area(a, c, b)))| $x267)))
(assert
 (let (($x305 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (f Point) )(let ((?x255 (Area d e f)))
 (let ((?x285 (Area a b c)))
 (let (($x286 (= ?x285 ?x255)))
 (let (($x289 (= (Angle c a b) (Angle f d e))))
 (let (($x292 (= (Angle b c a) (Angle e f d))))
 (let ((?x249 (Angle d e f)))
 (let (($x294 (= (Angle a b c) ?x249)))
 (let (($x297 (= (Segment c a) (Segment f d))))
 (let ((?x226 (Segment e f)))
 (let ((?x298 (Segment b c)))
 (let (($x299 (= ?x298 ?x226)))
 (let ((?x300 (Segment d e)))
 (let (($x302 (= (Segment a b) ?x300)))
 (=> (and $x302 $x299 $x297 $x294 $x292 $x289) $x286)))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, e, f],
       Implies(And(Segment(a, b) == Segment(d, e),
                   Segment(b, c) == Segment(e, f),
                   Segment(c, a) == Segment(f, d),
                   Angle(a, b, c) == Angle(d, e, f),
                   Angle(b, c, a) == Angle(e, f, d),
                   Angle(c, a, b) == Angle(f, d, e)),
               Area(a, b, c) == Area(d, e, f)))| $x305)))
(assert
 (let (($x273 (forall ((a Point) (b Point) (c Point) )(let (($x64 (Between a b c)))
 (=> $x64 (= (Segment a c) (+ (Segment a b) (Segment b c))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(Between(a, b, c),
               Segment(a, c) ==
               Segment(a, b) + Segment(b, c)))| $x273)))
(assert
 (let (($x283 (forall ((a Point) (b Point) (c Point) (alpha Circle) (beta Circle) )(let (($x215 (= alpha beta)))
 (let ((?x298 (Segment a b)))
 (let (($x278 (= ?x298 (Segment a c))))
 (let (($x127 (Onc c beta)))
 (let (($x211 (Onc b alpha)))
 (let (($x279 (Center a beta)))
 (let (($x280 (Center a alpha)))
 (=> (and $x280 $x279 $x211 $x127 $x278) $x215)))))))))
 ))
 (=> |ForAll([a, b, c, alpha, beta],
       Implies(And(Center(a, alpha),
                   Center(a, beta),
                   Onc(b, alpha),
                   Onc(c, beta),
                   Segment(a, b) == Segment(a, c)),
               alpha == beta))| $x283)))
(assert
 (let (($x315 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x311 (and (=> (Onc c alpha) (= (Segment a b) (Segment a c))) (=> (= (Segment a b) (Segment a c)) (Onc c alpha)))))
 (let (($x127 (Onc b alpha)))
 (let (($x312 (Center a alpha)))
 (let (($x313 (and $x312 $x127)))
 (=> $x313 $x311))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha), Onc(b, alpha)),
               And(Implies(Onc(c, alpha),
                           Segment(a, b) == Segment(a, c)),
                   Implies(Segment(a, b) == Segment(a, c),
                           Onc(c, alpha)))))| $x315)))
(assert
 (let (($x321 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x319 (and (=> (Inside c alpha) (< (Segment a c) (Segment a b))) (=> (< (Segment a c) (Segment a b)) (Inside c alpha)))))
 (let (($x127 (Onc b alpha)))
 (let (($x312 (Center a alpha)))
 (let (($x313 (and $x312 $x127)))
 (=> $x313 $x319))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha), Onc(b, alpha)),
               And(Implies(Inside(c, alpha),
                           Segment(a, c) < Segment(a, b)),
                   Implies(Segment(a, c) < Segment(a, b),
                           Inside(c, alpha)))))| $x321)))
(assert
 (let (($x339 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x52 (On c L)))
 (let (($x329 (and $x52 (not (Between b a c)))))
 (let ((?x330 (Angle b a c)))
 (let (($x331 (= 0.0 ?x330)))
 (let (($x31 (On b L)))
 (let (($x32 (On a L)))
 (let (($x35 (= a b)))
 (let (($x36 (not $x35)))
 (=> (and $x36 (not (= a c)) $x32 $x31) (and (=> $x329 $x331) (=> $x331 $x329))))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Not(a == b),
                   Not(a == c),
                   On(a, L),
                   On(b, L)),
               And(Implies(And(On(c, L),
                               Not(Between(b, a, c))),
                           0 == Angle(b, a, c)),
                   Implies(0 == Angle(b, a, c),
                           And(On(c, L),
                               Not(Between(b, a, c)))))))| $x339)))
(assert
 (let (($x369 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) )(let ((?x354 (Angle b a c)))
 (let (($x355 (= ?x354 (+ (Angle b a d) (Angle d a c)))))
 (let (($x122 (SameSide c d L)))
 (let (($x356 (SameSide b d M)))
 (let (($x357 (and $x356 $x122)))
 (let (($x30 (= L M)))
 (let (($x143 (not $x30)))
 (let (($x31 (On d M)))
 (let (($x95 (not $x31)))
 (let (($x33 (On d L)))
 (let (($x361 (not $x33)))
 (let (($x32 (On c M)))
 (let (($x157 (On b L)))
 (let (($x142 (Intersectsll L M)))
 (let (($x366 (On a M)))
 (let (($x184 (On a L)))
 (let (($x367 (and $x184 $x366 $x142 $x157 $x32 (not (= a b)) (not (= a c)) $x361 $x95 $x143)))
 (=> $x367 (and (=> $x355 $x357) (=> $x357 $x355)))))))))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L, M],
       Implies(And(On(a, L),
                   On(a, M),
                   Intersectsll(L, M),
                   On(b, L),
                   On(c, M),
                   Not(a == b),
                   Not(a == c),
                   Not(On(d, L)),
                   Not(On(d, M)),
                   Not(L == M)),
               And(Implies(Angle(b, a, c) ==
                           Angle(b, a, d) + Angle(d, a, c),
                           And(SameSide(b, d, M),
                               SameSide(c, d, L))),
                   Implies(And(SameSide(b, d, M),
                               SameSide(c, d, L)),
                           Angle(b, a, c) ==
                           Angle(b, a, d) + Angle(d, a, c)))))| $x369)))
(assert
 (let (($x347 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) )(let ((?x326 (Angle a c d)))
 (let (($x327 (= ?x326 (Angle d c b))))
 (let (($x340 (= ?x326 RightAngle)))
 (let (($x52 (On d L)))
 (let (($x79 (not $x52)))
 (let (($x344 (Between a c b)))
 (let (($x32 (On b L)))
 (let (($x141 (On a L)))
 (=> (and $x141 $x32 $x344 $x79) (and (=> $x327 $x340) (=> $x340 $x327))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   Between(a, c, b),
                   Not(On(d, L))),
               And(Implies(Angle(a, c, d) == Angle(d, c, b),
                           Angle(a, c, d) == RightAngle),
                   Implies(Angle(a, c, d) == RightAngle,
                           Angle(a, c, d) == Angle(d, c, b)))))| $x347)))
(assert
 (let (($x391 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) )(let ((?x376 (Angle d a e)))
 (let ((?x377 (Angle b a c)))
 (let (($x378 (= ?x377 ?x376)))
 (let (($x175 (= b a)))
 (let (($x176 (not $x175)))
 (let (($x31 (On e M)))
 (let (($x141 (On c M)))
 (let (($x159 (On a M)))
 (let (($x34 (On d L)))
 (let (($x184 (On b L)))
 (let (($x160 (On a L)))
 (let (($x389 (and $x160 $x184 $x34 $x159 $x141 $x31 $x176 (not (= d a)) (not (= c a)) (not (= e a)) (not (Between b a d)) (not (Between c a e)))))
 (=> $x389 $x378))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, e, L, M],
       Implies(And(On(a, L),
                   On(b, L),
                   On(d, L),
                   On(a, M),
                   On(c, M),
                   On(e, M),
                   Not(b == a),
                   Not(d == a),
                   Not(c == a),
                   Not(e == a),
                   Not(Between(b, a, d)),
                   Not(Between(c, a, e))),
               Angle(b, a, c) == Angle(d, a, e)))| $x391)))
(assert
 (let (($x405 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) (N Line) )(let (($x162 (Intersectsll L N)))
 (let (($x395 (and $x162 (=> (and (On e L) (On e N)) (SameSide a e M)))))
 (let ((?x203 (+ RightAngle RightAngle)))
 (let (($x400 (SameSide a d N)))
 (let (($x141 (On d N)))
 (let (($x366 (On c N)))
 (let (($x184 (On c M)))
 (let (($x160 (On b M)))
 (let (($x161 (On b L)))
 (let (($x187 (On a L)))
 (let (($x403 (and $x187 $x161 $x160 $x184 $x366 $x141 (not (= b c)) $x400 (< (+ (Angle a b c) (Angle b c d)) ?x203))))
 (=> $x403 $x395)))))))))))))
 ))
 (=> |ForAll([a, b, c, d, e, L, M, N],
       Implies(And(On(a, L),
                   On(b, L),
                   On(b, M),
                   On(c, M),
                   On(c, N),
                   On(d, N),
                   Not(b == c),
                   SameSide(a, d, N),
                   Angle(a, b, c) + Angle(b, c, d) <
                   RightAngle + RightAngle),
               And(Intersectsll(L, N),
                   Implies(And(On(e, L), On(e, N)),
                           SameSide(a, e, M)))))| $x405)))
(assert
 (let (($x372 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x350 (and (=> (On c L) (= 0.0 (Area a b c))) (=> (= 0.0 (Area a b c)) (On c L)))))
 (=> (and (On a L) (On b L) (not (= a b))) $x350)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(On(a, L), On(b, L), Not(a == b)),
               And(Implies(On(c, L), 0 == Area(a, b, c)),
                   Implies(0 == Area(a, b, c), On(c, L)))))| $x372)))
(assert
 (let (($x426 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) )(let (($x344 (Between a c b)))
 (let ((?x414 (Area a d b)))
 (let (($x418 (= (+ (Area a c d) (Area d c b)) ?x414)))
 (let (($x52 (On d L)))
 (let (($x79 (not $x52)))
 (let (($x35 (= b c)))
 (let (($x36 (not $x35)))
 (let (($x137 (= a b)))
 (let (($x138 (not $x137)))
 (let (($x31 (On c L)))
 (let (($x32 (On b L)))
 (let (($x141 (On a L)))
 (=> (and $x141 $x32 $x31 $x138 (not (= a c)) $x36 $x79) (and (=> $x344 $x418) (=> $x418 $x344))))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Not(a == b),
                   Not(a == c),
                   Not(b == c),
                   Not(On(d, L))),
               And(Implies(Between(a, c, b),
                           Area(a, c, d) + Area(d, c, b) ==
                           Area(a, d, b)),
                   Implies(Area(a, c, d) + Area(d, c, b) ==
                           Area(a, d, b),
                           Between(a, c, b)))))| $x426)))
(assert
 (let (($x413 (not (= E1 F1))))
 (let (($x411 (not (= D1 F1))))
 (let (($x433 (not (= D1 E1))))
 (let (($x431 (not (= C1 F1))))
 (let (($x453 (not (= C1 E1))))
 (let (($x462 (not (= C1 D1))))
 (let (($x459 (not (= B1 F1))))
 (let (($x476 (not (= B1 E1))))
 (let (($x855 (not (= B1 D1))))
 (let (($x469 (not (= B1 C1))))
 (let (($x483 (not (= A1 F1))))
 (let (($x473 (not (= A1 E1))))
 (let (($x854 (not (= A1 D1))))
 (let (($x474 (not (= A1 C1))))
 (let (($x466 (not (= A1 B1))))
 (and $x466 $x474 $x854 $x473 $x483 $x469 $x855 $x476 $x459 $x462 $x453 $x431 $x433 $x411 $x413)))))))))))))))))
(assert
 (let (($x1097 (not (= BF1 CG1))))
 (let (($x1095 (not (= GE1 CG1))))
 (let (($x1093 (not (= GE1 BF1))))
 (let (($x1091 (not (= FD1 CG1))))
 (let (($x1089 (not (= FD1 BF1))))
 (let (($x1087 (not (= FD1 GE1))))
 (let (($x1085 (not (= CA1 CG1))))
 (let (($x1083 (not (= CA1 BF1))))
 (let (($x1081 (not (= CA1 GE1))))
 (let (($x1079 (not (= CA1 FD1))))
 (let (($x1077 (not (= BC1 CG1))))
 (let (($x1075 (not (= BC1 BF1))))
 (let (($x1067 (not (= BC1 GE1))))
 (let (($x998 (not (= BC1 FD1))))
 (let (($x1028 (not (= BC1 CA1))))
 (let (($x660 (not (= AB1 CG1))))
 (let (($x952 (not (= AB1 BF1))))
 (let (($x924 (not (= AB1 GE1))))
 (let (($x910 (not (= AB1 FD1))))
 (let (($x896 (not (= AB1 CA1))))
 (let (($x891 (not (= AB1 BC1))))
 (and $x891 $x896 $x910 $x924 $x952 $x660 $x1028 $x998 $x1067 $x1075 $x1077 $x1079 $x1081 $x1083 $x1085 $x1087 $x1089 $x1091 $x1093 $x1095 $x1097)))))))))))))))))))))))
(assert
 true)
(assert
 (let (($x1099 (Intersectsll AB1 BC1)))
 (=> |Intersectsll(AB1, BC1)| $x1099)))
(assert
 (let (($x1100 (Intersectsll BC1 CA1)))
 (=> |Intersectsll(BC1, CA1)| $x1100)))
(assert
 (let (($x1101 (Intersectsll CA1 AB1)))
 (=> |Intersectsll(CA1, AB1)| $x1101)))
(assert
 (let (($x1102 (On A1 AB1)))
 (=> |On(A1, AB1)| $x1102)))
(assert
 (let (($x1103 (On B1 AB1)))
 (=> |On(B1, AB1)| $x1103)))
(assert
 (let (($x1105 (not (On C1 AB1))))
 (=> |Not(On(C1, AB1))| $x1105)))
(assert
 (let (($x1106 (On B1 BC1)))
 (=> |On(B1, BC1)| $x1106)))
(assert
 (let (($x1107 (On C1 BC1)))
 (=> |On(C1, BC1)| $x1107)))
(assert
 (let (($x1109 (not (On A1 BC1))))
 (=> |Not(On(A1, BC1))| $x1109)))
(assert
 (let (($x1110 (On C1 CA1)))
 (=> |On(C1, CA1)| $x1110)))
(assert
 (let (($x1111 (On A1 CA1)))
 (=> |On(A1, CA1)| $x1111)))
(assert
 (let (($x1113 (not (On B1 CA1))))
 (=> |Not(On(B1, CA1))| $x1113)))
(assert
 (let (($x1114 (On D1 BC1)))
 (=> |On(D1, BC1)| $x1114)))
(assert
 (let (($x1117 (= (Angle D1 A1 B1) (Angle B1 C1 A1))))
 (=> |Angle(D1, A1, B1) == Angle(B1, C1, A1)| $x1117)))
(assert
 (let (($x1118 (On E1 BC1)))
 (=> |On(E1, BC1)| $x1118)))
(assert
 (let (($x1121 (= (Angle E1 A1 C1) (Angle C1 B1 A1))))
 (=> |Angle(E1, A1, C1) == Angle(C1, B1, A1)| $x1121)))
(assert
 (let (($x1122 (On F1 FD1)))
 (=> |On(F1, FD1)| $x1122)))
(assert
 (let (($x1123 (On D1 FD1)))
 (=> |On(D1, FD1)| $x1123)))
(assert
 (let (($x1124 (On A1 FD1)))
 (=> |On(A1, FD1)| $x1124)))
(assert
 (let (($x1127 (= (Segment F1 D1) (Segment D1 A1))))
 (=> |Segment(F1, D1) == Segment(D1, A1)| $x1127)))
(assert
 (let (($x1128 (On G1 GE1)))
 (=> |On(G1, GE1)| $x1128)))
(assert
 (let (($x1129 (On E1 GE1)))
 (=> |On(E1, GE1)| $x1129)))
(assert
 (let (($x1130 (On A1 GE1)))
 (=> |On(A1, GE1)| $x1130)))
(assert
 (let (($x1133 (= (Segment G1 E1) (Segment E1 A1))))
 (=> |Segment(G1, E1) == Segment(E1, A1)| $x1133)))
(assert
 (let (($x1134 (On B1 BF1)))
 (=> |On(B1, BF1)| $x1134)))
(assert
 (let (($x1135 (On F1 BF1)))
 (=> |On(F1, BF1)| $x1135)))
(assert
 (let (($x1136 (On C1 CG1)))
 (=> |On(C1, CG1)| $x1136)))
(assert
 (let (($x1137 (On G1 CG1)))
 (=> |On(G1, CG1)| $x1137)))
(assert
 (let (($x1138 (On H1 BF1)))
 (=> |On(H1, BF1)| $x1138)))
(assert
 (let (($x1139 (Center I1 OABC)))
 (=> |Center(I1, OABC)| $x1139)))
(assert
 (let (($x1140 (Onc A1 OABC)))
 (=> |Onc(A1, OABC)| $x1140)))
(assert
 (let (($x1141 (Onc B1 OABC)))
 (=> |Onc(B1, OABC)| $x1141)))
(assert
 (let (($x1142 (Onc C1 OABC)))
 (=> |Onc(C1, OABC)| $x1142)))
(assert
 (not (= (Segment I1 H1) (Segment I1 A1))))
(check-sat)
