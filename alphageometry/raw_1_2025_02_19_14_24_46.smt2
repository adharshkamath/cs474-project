; benchmark generated from python API
(set-info :status unknown)
(declare-sort Line 0)
(declare-sort Point 0)
(declare-sort Circle 0)
(declare-fun RightAngle () Real)
(declare-fun |0 < RightAngle| () Bool)
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
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Not(a == b),
                   Not(a == c),
                   Not(b == c)),
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
(declare-fun |ForAll([a, L, M],
       Implies(And(Not(L == M), Intersectsll(L, M)),
               Exists(a, And(On(a, L), On(a, M)))))| () Bool)
(declare-fun |ForAll([a, b], Implies(Not(a == b), 0 < Segment(a, b)))| () Bool)
(declare-fun |ForAll([L, a, b],
       Implies(And(On(a, L), On(b, L), Not(a == b)),
               0 < Segment(a, b)))| () Bool)
(declare-fun |ForAll([a, alpha], Exists(a, Onc(a, alpha)))| () Bool)
(declare-fun |ForAll([a, alpha, c],
       Implies(Center(c, alpha),
               Exists(a,
                      And(Onc(a, alpha), 0 <= Segment(c, a)))))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha),
                   Not(b == c)),
               And(Between(b, a, c),
                   Segment(a, b) == Segment(a, c))))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Not(a == b),
                   Not(b == c),
                   Not(a == c),
                   Not(Or(Between(a, b, c),
                          Between(b, a, c),
                          Between(a, c, b)))),
               0 < Angle(a, b, c)))| () Bool)
(declare-fun F1 () Point)
(declare-fun E1 () Point)
(declare-fun D1 () Point)
(declare-fun C1 () Point)
(declare-fun B1 () Point)
(declare-fun A1 () Point)
(declare-fun CG1 () Line)
(declare-fun BF1 () Line)
(declare-fun AE1 () Line)
(declare-fun AD1 () Line)
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
(declare-fun |Angle(A1, B1, C1) < RightAngle| () Bool)
(declare-fun |Angle(B1, A1, C1) < RightAngle| () Bool)
(declare-fun |Angle(A1, C1, B1) < RightAngle| () Bool)
(declare-fun |On(D1, BC1)| () Bool)
(declare-fun |Between(B1, D1, C1)| () Bool)
(declare-fun |Angle(D1, A1, B1) == Angle(B1, C1, A1)| () Bool)
(declare-fun |On(A1, AD1)| () Bool)
(declare-fun |On(D1, AD1)| () Bool)
(declare-fun |Intersectsll(AD1, BC1)| () Bool)
(declare-fun |On(E1, BC1)| () Bool)
(declare-fun |Between(B1, E1, C1)| () Bool)
(declare-fun |Angle(E1, A1, C1) == Angle(C1, B1, A1)| () Bool)
(declare-fun |On(A1, AE1)| () Bool)
(declare-fun |On(E1, AE1)| () Bool)
(declare-fun |Intersectsll(AE1, BC1)| () Bool)
(declare-fun |On(F1, AD1)| () Bool)
(declare-fun |Between(A1, D1, F1)| () Bool)
(declare-fun |Segment(F1, D1) == Segment(D1, A1)| () Bool)
(declare-fun G1 () Point)
(declare-fun |On(G1, AE1)| () Bool)
(declare-fun |Between(A1, E1, G1)| () Bool)
(declare-fun |Segment(G1, E1) == Segment(E1, A1)| () Bool)
(declare-fun |On(B1, BF1)| () Bool)
(declare-fun |On(F1, BF1)| () Bool)
(declare-fun |On(C1, CG1)| () Bool)
(declare-fun |On(G1, CG1)| () Bool)
(declare-fun OABC () Circle)
(declare-fun I1 () Point)
(declare-fun |Center(I1, OABC)| () Bool)
(declare-fun |Onc(A1, OABC)| () Bool)
(declare-fun |Onc(B1, OABC)| () Bool)
(declare-fun |Onc(C1, OABC)| () Bool)
(declare-fun J1 () Point)
(declare-fun |On(J1, BC1)| () Bool)
(declare-fun |Between(B1, J1, C1)| () Bool)
(declare-fun |Segment(J1, B1) == Segment(J1, C1)| () Bool)
(declare-fun AJ1 () Line)
(declare-fun |On(J1, AJ1)| () Bool)
(declare-fun |On(A1, AJ1)| () Bool)
(declare-fun |Not(And(Intersectsll(BF1, CG1),
        Intersectslc(BF1, OABC),
        Intersectslc(CG1, OABC),
        Exists(H1,
               And(On(H1, BF1), On(H1, CG1), Onc(H1, OABC)))))| () Bool)
(assert
 (let (($x18 (< 0.0 RightAngle)))
 (=> |0 < RightAngle| $x18)))
(assert
 (let (($x41 (forall ((a Point) (b Point) (L Line) (M Line) )(let (($x32 (= L M)))
 (let (($x33 (On b M)))
 (let (($x34 (On a M)))
 (let (($x35 (On b L)))
 (let (($x36 (On a L)))
 (let (($x37 (= a b)))
 (let (($x38 (not $x37)))
 (=> (and $x38 $x36 $x35 $x34 $x33) $x32)))))))))
 ))
 (=> |ForAll([a, b, L, M],
       Implies(And(Not(a == b),
                   On(a, L),
                   On(b, L),
                   On(a, M),
                   On(b, M)),
               L == M))| $x41)))
(assert
 (let (($x45 (forall ((a Point) (b Point) (alpha Circle) )(let (($x26 (= a b)))
 (=> (and (Center a alpha) (Center b alpha)) $x26)))
 ))
 (=> |ForAll([a, b, alpha],
       Implies(And(Center(a, alpha), Center(b, alpha)),
               a == b))| $x45)))
(assert
 (let (($x46 (forall ((a Point) (alpha Circle) )(let (($x22 (Inside a alpha)))
 (let (($x27 (Center a alpha)))
 (=> $x27 $x22))))
 ))
 (=> |ForAll([a, alpha],
       Implies(Center(a, alpha), Inside(a, alpha)))| $x46)))
(assert
 (let (($x51 (forall ((a Point) (alpha Circle) )(let (($x48 (Onc a alpha)))
 (let (($x49 (not $x48)))
 (let (($x22 (Inside a alpha)))
 (=> $x22 $x49)))))
 ))
 (=> |ForAll([a, alpha],
       Implies(Inside(a, alpha), Not(Onc(a, alpha))))| $x51)))
(assert
 (let (($x68 (forall ((a Point) (b Point) (c Point) )(let (($x59 (Between b a c)))
 (let (($x60 (not $x59)))
 (let (($x61 (= a c)))
 (let (($x62 (not $x61)))
 (let (($x26 (= a b)))
 (let (($x63 (not $x26)))
 (let (($x64 (Between c b a)))
 (let (($x66 (Between a b c)))
 (=> $x66 (and $x64 $x63 $x62 $x60)))))))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(Between(a, b, c),
               And(Between(c, b, a),
                   Not(a == b),
                   Not(a == c),
                   Not(Between(b, a, c)))))| $x68)))
(assert
 (let (($x69 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x54 (On c L)))
 (=> (and (Between a b c) (On a L) (On b L)) $x54)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(a, L), On(b, L)),
               On(c, L)))| $x69)))
(assert
 (let (($x72 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x33 (On b L)))
 (=> (and (Between a b c) (On a L) (On c L)) $x33)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(a, L), On(c, L)),
               On(b, L)))| $x72)))
(assert
 (let (($x76 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x53 (Between a d c)))
 (=> (and (Between a b c) (Between a d b)) $x53)))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, d, b)),
               Between(a, d, c)))| $x76)))
(assert
 (let (($x80 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x77 (Between a b d)))
 (=> (and (Between a b c) (Between b c d)) $x77)))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(b, c, d)),
               Between(a, b, d)))| $x80)))
(assert
 (let (($x98 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x91 (Between a c b)))
 (let (($x92 (Between b a c)))
 (let (($x55 (Between a b c)))
 (let (($x93 (or $x55 $x92 $x91)))
 (let (($x26 (= b c)))
 (let (($x63 (not $x26)))
 (let (($x94 (= a c)))
 (let (($x95 (not $x94)))
 (let (($x37 (= a b)))
 (let (($x38 (not $x37)))
 (let (($x54 (On c L)))
 (let (($x33 (On b L)))
 (let (($x34 (On a L)))
 (=> (and $x34 $x33 $x54 $x38 $x95 $x63) $x93)))))))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Not(a == b),
                   Not(a == c),
                   Not(b == c)),
               Or(Between(a, b, c),
                  Between(b, a, c),
                  Between(a, c, b))))| $x98)))
(assert
 (let (($x84 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x59 (Between c b d)))
 (let (($x60 (not $x59)))
 (=> (and (Between a b c) (Between a b d)) $x60))))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, b, d)),
               Not(Between(c, b, d))))| $x84)))
(assert
 (let (($x86 (forall ((a Point) (L Line) )(let (($x52 (SameSide a a L)))
 (let (($x54 (On a L)))
 (let (($x81 (not $x54)))
 (=> $x81 $x52)))))
 ))
 (=> |ForAll([a, L], Implies(Not(On(a, L)), SameSide(a, a, L)))| $x86)))
(assert
 (let (($x89 (forall ((a Point) (b Point) (L Line) )(let (($x47 (SameSide b a L)))
 (let (($x87 (SameSide a b L)))
 (=> $x87 $x47))))
 ))
 (=> |ForAll([a, b, L],
       Implies(SameSide(a, b, L), SameSide(b, a, L)))| $x89)))
(assert
 (let (($x101 (forall ((a Point) (b Point) (L Line) )(let (($x33 (On a L)))
 (let (($x99 (not $x33)))
 (let (($x87 (SameSide a b L)))
 (=> $x87 $x99)))))
 ))
 (=> |ForAll([a, b, L], Implies(SameSide(a, b, L), Not(On(a, L))))| $x101)))
(assert
 (let (($x107 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x87 (SameSide b c L)))
 (=> (and (SameSide a b L) (SameSide a c L)) $x87)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(SameSide(a, b, L), SameSide(a, c, L)),
               SameSide(b, c, L)))| $x107)))
(assert
 (let (($x121 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x104 (SameSide a b L)))
 (let (($x117 (not $x104)))
 (let (($x54 (On c L)))
 (let (($x81 (not $x54)))
 (let (($x33 (On b L)))
 (let (($x99 (not $x33)))
 (let (($x34 (On a L)))
 (let (($x118 (not $x34)))
 (=> (and $x118 $x99 $x81 $x117) (or (SameSide a c L) (SameSide b c L))))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Not(On(a, L)),
                   Not(On(b, L)),
                   Not(On(c, L)),
                   Not(SameSide(a, b, L))),
               Or(SameSide(a, c, L), SameSide(b, c, L))))| $x121)))
(assert
 (let (($x110 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x104 (SameSide a b L)))
 (=> (and (Between a b c) (SameSide a c L)) $x104)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), SameSide(a, c, L)),
               SameSide(a, b, L)))| $x110)))
(assert
 (let (($x115 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x87 (SameSide b c L)))
 (=> (and (Between a b c) (On a L) (not (On b L))) $x87)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c),
                   On(a, L),
                   Not(On(b, L))),
               SameSide(b, c, L)))| $x115)))
(assert
 (let (($x124 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x103 (SameSide a c L)))
 (let (($x112 (not $x103)))
 (=> (and (Between a b c) (On b L)) $x112))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(b, L)),
               Not(SameSide(a, c, L))))| $x124)))
(assert
 (let (($x150 (forall ((a Point) (b Point) (c Point) (L Line) (M Line) )(let (($x138 (Between a b c)))
 (let (($x37 (= b c)))
 (let (($x38 (not $x37)))
 (let (($x141 (= a b)))
 (let (($x142 (not $x141)))
 (let (($x33 (On c M)))
 (let (($x145 (On a M)))
 (let (($x34 (On b M)))
 (let (($x36 (On b L)))
 (let (($x146 (Intersectsll L M)))
 (let (($x32 (= L M)))
 (let (($x147 (not $x32)))
 (let (($x148 (and $x147 $x146 $x36 $x34 $x145 $x33 (not (= c a)) $x142 $x38 (not (SameSide a c L)))))
 (=> $x148 $x138)))))))))))))))
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
               Between(a, b, c)))| $x150)))
(assert
 (let (($x174 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) (N Line) )(let (($x157 (SameSide b d M)))
 (let (($x158 (not $x157)))
 (let (($x159 (SameSide b c N)))
 (let (($x160 (SameSide c d L)))
 (let (($x34 (On d N)))
 (let (($x161 (On c M)))
 (let (($x162 (On b L)))
 (let (($x163 (On a N)))
 (let (($x164 (On a M)))
 (let (($x165 (On a L)))
 (let (($x166 (Intersectsll L N)))
 (let (($x146 (Intersectsll M N)))
 (let (($x167 (Intersectsll L M)))
 (let (($x32 (= M N)))
 (let (($x147 (not $x32)))
 (let (($x168 (= L N)))
 (let (($x169 (not $x168)))
 (let (($x170 (= L M)))
 (let (($x171 (not $x170)))
 (let (($x172 (and $x171 $x169 $x147 $x167 $x146 $x166 $x165 $x164 $x163 $x162 $x161 $x34 $x160 $x159)))
 (=> $x172 $x158))))))))))))))))))))))
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
               Not(SameSide(b, d, M))))| $x174)))
(assert
 (let (($x184 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) (N Line) )(let (($x159 (SameSide b c N)))
 (let (($x179 (= b a)))
 (let (($x180 (not $x179)))
 (let (($x36 (On d M)))
 (let (($x181 (not $x36)))
 (let (($x157 (SameSide b d M)))
 (let (($x158 (not $x157)))
 (let (($x160 (SameSide c d L)))
 (let (($x34 (On d N)))
 (let (($x161 (On c M)))
 (let (($x162 (On b L)))
 (let (($x163 (On a N)))
 (let (($x164 (On a M)))
 (let (($x165 (On a L)))
 (let (($x166 (Intersectsll L N)))
 (let (($x146 (Intersectsll M N)))
 (let (($x167 (Intersectsll L M)))
 (let (($x32 (= M N)))
 (let (($x147 (not $x32)))
 (let (($x168 (= L N)))
 (let (($x169 (not $x168)))
 (let (($x170 (= L M)))
 (let (($x171 (not $x170)))
 (let (($x182 (and $x171 $x169 $x147 $x167 $x146 $x166 $x165 $x164 $x163 $x162 $x161 $x34 $x160 $x158 $x181 $x180)))
 (=> $x182 $x159))))))))))))))))))))))))))
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
               SameSide(b, c, N)))| $x184)))
(assert
 (let (($x194 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) (N Line) )(let (($x177 (SameSide c e L)))
 (let (($x178 (SameSide c e N)))
 (let (($x185 (SameSide d e M)))
 (let (($x186 (SameSide b c N)))
 (let (($x187 (SameSide c d L)))
 (let (($x145 (On d N)))
 (let (($x188 (On c M)))
 (let (($x165 (On b L)))
 (let (($x189 (On a N)))
 (let (($x190 (On a M)))
 (let (($x191 (On a L)))
 (let (($x166 (Intersectsll L N)))
 (let (($x146 (Intersectsll M N)))
 (let (($x167 (Intersectsll L M)))
 (let (($x32 (= M N)))
 (let (($x147 (not $x32)))
 (let (($x168 (= L N)))
 (let (($x169 (not $x168)))
 (let (($x170 (= L M)))
 (let (($x171 (not $x170)))
 (let (($x192 (and $x171 $x169 $x147 $x167 $x146 $x166 $x191 $x190 $x189 $x165 $x188 $x145 $x187 $x186 $x185 $x178)))
 (=> $x192 $x177)))))))))))))))))))))))
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
               SameSide(c, e, L)))| $x194)))
(assert
 (let (($x136 (forall ((a Point) (b Point) (c Point) (L Line) (alpha Circle) )(let (($x130 (Between b a c)))
 (let (($x37 (= b c)))
 (let (($x38 (not $x37)))
 (let (($x131 (Onc c alpha)))
 (let (($x132 (Onc b alpha)))
 (let (($x133 (Inside a alpha)))
 (let (($x35 (On c L)))
 (let (($x36 (On b L)))
 (let (($x161 (On a L)))
 (=> (and $x161 $x36 $x35 $x133 $x132 $x131 $x38) $x130)))))))))))
 ))
 (=> |ForAll([a, b, c, L, alpha],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Inside(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha),
                   Not(b == c)),
               Between(b, a, c)))| $x136)))
(assert
 (let (($x196 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x22 (Inside c alpha)))
 (let (($x91 (Between a c b)))
 (let (($x129 (Inside b alpha)))
 (let (($x131 (Onc b alpha)))
 (let (($x151 (or $x131 $x129)))
 (let (($x152 (Inside a alpha)))
 (let (($x132 (Onc a alpha)))
 (let (($x153 (or $x132 $x152)))
 (=> (and $x153 $x151 $x91) $x22))))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Or(Onc(a, alpha), Inside(a, alpha)),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Between(a, c, b)),
               Inside(c, alpha)))| $x196)))
(assert
 (let (($x205 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x200 (not (or (Inside b alpha) (Onc b alpha)))))
 (let (($x91 (Between a c b)))
 (let (($x22 (Inside c alpha)))
 (let (($x201 (not $x22)))
 (let (($x132 (Onc a alpha)))
 (let (($x152 (Inside a alpha)))
 (let (($x202 (or $x152 $x132)))
 (=> (and $x202 $x201 $x91) $x200)))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Not(Inside(c, alpha)),
                   Between(a, c, b)),
               Not(Or(Inside(b, alpha), Onc(b, alpha)))))| $x205)))
(assert
 (let (($x223 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (alpha Circle) (beta Circle) )(let (($x160 (SameSide c d L)))
 (let (($x212 (not $x160)))
 (let (($x162 (On b L)))
 (let (($x165 (On a L)))
 (let (($x213 (Center b beta)))
 (let (($x214 (Center a alpha)))
 (let (($x141 (= c d)))
 (let (($x142 (not $x141)))
 (let (($x132 (Onc d beta)))
 (let (($x215 (Onc d alpha)))
 (let (($x216 (Onc c beta)))
 (let (($x217 (Onc c alpha)))
 (let (($x218 (Intersectscc alpha beta)))
 (let (($x221 (and (not (= alpha beta)) $x218 $x217 $x216 $x215 $x132 $x142 $x214 $x213 $x165 $x162)))
 (=> $x221 $x212))))))))))))))))
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
               Not(SameSide(c, d, L))))| $x223)))
(assert
 (let (($x198 (forall ((a Point) (b Point) (L Line) (M Line) )(let (($x146 (Intersectsll L M)))
 (=> (and (not (SameSide a b L)) (On a M) (On b M)) $x146)))
 ))
 (=> |ForAll([a, b, L, M],
       Implies(And(Not(SameSide(a, b, L)),
                   On(a, M),
                   On(b, M)),
               Intersectsll(L, M)))| $x198)))
(assert
 (let (($x226 (forall ((a Point) (b Point) (L Line) (alpha Circle) )(let (($x210 (Intersectslc L alpha)))
 (let (($x126 (SameSide a b L)))
 (let (($x127 (not $x126)))
 (let (($x129 (Inside b alpha)))
 (let (($x131 (Onc b alpha)))
 (let (($x151 (or $x131 $x129)))
 (let (($x152 (Inside a alpha)))
 (let (($x132 (Onc a alpha)))
 (let (($x153 (or $x132 $x152)))
 (=> (and $x153 $x151 $x127) $x210)))))))))))
 ))
 (=> |ForAll([a, b, L, alpha],
       Implies(And(Or(Onc(a, alpha), Inside(a, alpha)),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Not(SameSide(a, b, L))),
               Intersectslc(L, alpha)))| $x226)))
(assert
 (let (($x206 (forall ((a Point) (L Line) (alpha Circle) )(let (($x210 (Intersectslc L alpha)))
 (=> (and (Inside a alpha) (On a L)) $x210)))
 ))
 (=> |ForAll([a, L, alpha],
       Implies(And(Inside(a, alpha), On(a, L)),
               Intersectslc(L, alpha)))| $x206)))
(assert
 (let (($x238 (forall ((a Point) (b Point) (alpha Circle) (beta Circle) )(let (($x218 (Intersectscc alpha beta)))
 (let (($x129 (Inside b beta)))
 (let (($x231 (not $x129)))
 (let (($x131 (Onc b beta)))
 (let (($x232 (not $x131)))
 (let (($x152 (Inside a beta)))
 (let (($x215 (Onc a alpha)))
 (=> (and $x215 (or (Onc b alpha) (Inside b alpha)) $x152 $x232 $x231) $x218)))))))))
 ))
 (=> |ForAll([a, b, alpha, beta],
       Implies(And(Onc(a, alpha),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Inside(a, beta),
                   Not(Onc(b, beta)),
                   Not(Inside(b, beta))),
               Intersectscc(alpha, beta)))| $x238)))
(assert
 (let (($x228 (forall ((a Point) (b Point) (alpha Circle) (beta Circle) )(let (($x218 (Intersectscc alpha beta)))
 (let (($x131 (Onc b beta)))
 (let (($x152 (Inside a beta)))
 (let (($x233 (Inside b alpha)))
 (let (($x215 (Onc a alpha)))
 (=> (and $x215 $x233 $x152 $x131) $x218)))))))
 ))
 (=> |ForAll([a, b, alpha, beta],
       Implies(And(Onc(a, alpha),
                   Inside(b, alpha),
                   Inside(a, beta),
                   Onc(b, beta)),
               Intersectscc(alpha, beta)))| $x228)))
(assert
 (let (($x242 (forall ((a Point) (b Point) )(and (=> (= a b) (= 0.0 (Segment a b))) (=> (= 0.0 (Segment a b)) (= a b))))
 ))
 (=> |ForAll([a, b],
       And(Implies(a == b, 0 == Segment(a, b)),
           Implies(0 == Segment(a, b), a == b)))| $x242)))
(assert
 (let (($x90 (forall ((a Point) (b Point) )(let ((?x229 (Segment a b)))
 (<= 0.0 ?x229)))
 ))
 (=> |ForAll([a, b], 0 <= Segment(a, b))| $x90)))
(assert
 (let (($x244 (forall ((a Point) (b Point) )(let ((?x207 (Segment b a)))
 (let ((?x229 (Segment a b)))
 (= ?x229 ?x207))))
 ))
 (=> |ForAll([a, b], Segment(a, b) == Segment(b, a))| $x244)))
(assert
 (let (($x256 (forall ((a Point) (b Point) (c Point) )(let ((?x251 (Angle c b a)))
 (let ((?x252 (Angle a b c)))
 (let (($x253 (= ?x252 ?x251)))
 (=> (and (not (= a b)) (not (= a c))) $x253)))))
 ))
 (=> |ForAll([a, b, c],
       Implies(And(Not(a == b), Not(a == c)),
               Angle(a, b, c) == Angle(c, b, a)))| $x256)))
(assert
 (let (($x250 (forall ((a Point) (b Point) (c Point) )(and (<= 0.0 (Angle a b c)) (<= (Angle a b c) (+ RightAngle RightAngle))))
 ))
 (=> |ForAll([a, b, c],
       And(0 <= Angle(a, b, c),
           Angle(a, b, c) <= RightAngle + RightAngle))| $x250)))
(assert
 (let (($x257 (forall ((a Point) (b Point) )(let ((?x245 (Area a a b)))
 (= 0.0 ?x245)))
 ))
 (=> |ForAll([a, b], 0 == Area(a, a, b))| $x257)))
(assert
 (let (($x260 (forall ((a Point) (b Point) (c Point) )(let ((?x258 (Area a b c)))
 (<= 0.0 ?x258)))
 ))
 (=> |ForAll([a, b, c], 0 <= Area(a, b, c))| $x260)))
(assert
 (let (($x270 (forall ((a Point) (b Point) (c Point) )(let ((?x265 (Area a c b)))
 (let ((?x258 (Area a b c)))
 (let (($x266 (= ?x258 ?x265)))
 (let ((?x267 (Area c a b)))
 (let (($x268 (= ?x258 ?x267)))
 (and $x268 $x266)))))))
 ))
 (=> |ForAll([a, b, c],
       And(Area(a, b, c) == Area(c, a, b),
           Area(a, b, c) == Area(a, c, b)))| $x270)))
(assert
 (let (($x308 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (f Point) )(let ((?x258 (Area d e f)))
 (let ((?x288 (Area a b c)))
 (let (($x289 (= ?x288 ?x258)))
 (let (($x292 (= (Angle c a b) (Angle f d e))))
 (let (($x295 (= (Angle b c a) (Angle e f d))))
 (let ((?x252 (Angle d e f)))
 (let (($x297 (= (Angle a b c) ?x252)))
 (let (($x300 (= (Segment c a) (Segment f d))))
 (let ((?x229 (Segment e f)))
 (let ((?x301 (Segment b c)))
 (let (($x302 (= ?x301 ?x229)))
 (let ((?x303 (Segment d e)))
 (let (($x305 (= (Segment a b) ?x303)))
 (=> (and $x305 $x302 $x300 $x297 $x295 $x292) $x289)))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, e, f],
       Implies(And(Segment(a, b) == Segment(d, e),
                   Segment(b, c) == Segment(e, f),
                   Segment(c, a) == Segment(f, d),
                   Angle(a, b, c) == Angle(d, e, f),
                   Angle(b, c, a) == Angle(e, f, d),
                   Angle(c, a, b) == Angle(f, d, e)),
               Area(a, b, c) == Area(d, e, f)))| $x308)))
(assert
 (let (($x276 (forall ((a Point) (b Point) (c Point) )(let (($x66 (Between a b c)))
 (=> $x66 (= (Segment a c) (+ (Segment a b) (Segment b c))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(Between(a, b, c),
               Segment(a, c) ==
               Segment(a, b) + Segment(b, c)))| $x276)))
(assert
 (let (($x286 (forall ((a Point) (b Point) (c Point) (alpha Circle) (beta Circle) )(let (($x219 (= alpha beta)))
 (let ((?x301 (Segment a b)))
 (let (($x281 (= ?x301 (Segment a c))))
 (let (($x131 (Onc c beta)))
 (let (($x215 (Onc b alpha)))
 (let (($x282 (Center a beta)))
 (let (($x283 (Center a alpha)))
 (=> (and $x283 $x282 $x215 $x131 $x281) $x219)))))))))
 ))
 (=> |ForAll([a, b, c, alpha, beta],
       Implies(And(Center(a, alpha),
                   Center(a, beta),
                   Onc(b, alpha),
                   Onc(c, beta),
                   Segment(a, b) == Segment(a, c)),
               alpha == beta))| $x286)))
(assert
 (let (($x318 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x314 (and (=> (Onc c alpha) (= (Segment a b) (Segment a c))) (=> (= (Segment a b) (Segment a c)) (Onc c alpha)))))
 (let (($x131 (Onc b alpha)))
 (let (($x315 (Center a alpha)))
 (let (($x316 (and $x315 $x131)))
 (=> $x316 $x314))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha), Onc(b, alpha)),
               And(Implies(Onc(c, alpha),
                           Segment(a, b) == Segment(a, c)),
                   Implies(Segment(a, b) == Segment(a, c),
                           Onc(c, alpha)))))| $x318)))
(assert
 (let (($x324 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x322 (and (=> (Inside c alpha) (< (Segment a c) (Segment a b))) (=> (< (Segment a c) (Segment a b)) (Inside c alpha)))))
 (let (($x131 (Onc b alpha)))
 (let (($x315 (Center a alpha)))
 (let (($x316 (and $x315 $x131)))
 (=> $x316 $x322))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha), Onc(b, alpha)),
               And(Implies(Inside(c, alpha),
                           Segment(a, c) < Segment(a, b)),
                   Implies(Segment(a, c) < Segment(a, b),
                           Inside(c, alpha)))))| $x324)))
(assert
 (let (($x340 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x92 (Between b a c)))
 (let (($x331 (not $x92)))
 (let (($x54 (On c L)))
 (let (($x332 (and $x54 $x331)))
 (let ((?x333 (Angle b a c)))
 (let (($x334 (= 0.0 ?x333)))
 (let (($x33 (On b L)))
 (let (($x34 (On a L)))
 (let (($x94 (= a c)))
 (let (($x95 (not $x94)))
 (let (($x37 (= a b)))
 (let (($x38 (not $x37)))
 (=> (and $x38 $x95 $x34 $x33) (and (=> $x332 $x334) (=> $x334 $x332))))))))))))))))
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
                               Not(Between(b, a, c)))))))| $x340)))
(assert
 (let (($x370 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) )(let ((?x355 (Angle b a c)))
 (let (($x356 (= ?x355 (+ (Angle b a d) (Angle d a c)))))
 (let (($x126 (SameSide c d L)))
 (let (($x357 (SameSide b d M)))
 (let (($x358 (and $x357 $x126)))
 (let (($x32 (= L M)))
 (let (($x147 (not $x32)))
 (let (($x33 (On d M)))
 (let (($x99 (not $x33)))
 (let (($x35 (On d L)))
 (let (($x362 (not $x35)))
 (let (($x34 (On c M)))
 (let (($x161 (On b L)))
 (let (($x146 (Intersectsll L M)))
 (let (($x367 (On a M)))
 (let (($x188 (On a L)))
 (let (($x368 (and $x188 $x367 $x146 $x161 $x34 (not (= a b)) (not (= a c)) $x362 $x99 $x147)))
 (=> $x368 (and (=> $x356 $x358) (=> $x358 $x356)))))))))))))))))))))
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
                           Angle(b, a, d) + Angle(d, a, c)))))| $x370)))
(assert
 (let (($x348 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) )(let ((?x329 (Angle a c d)))
 (let (($x330 (= ?x329 (Angle d c b))))
 (let (($x341 (= ?x329 RightAngle)))
 (let (($x54 (On d L)))
 (let (($x81 (not $x54)))
 (let (($x345 (Between a c b)))
 (let (($x34 (On b L)))
 (let (($x145 (On a L)))
 (=> (and $x145 $x34 $x345 $x81) (and (=> $x330 $x341) (=> $x341 $x330))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   Between(a, c, b),
                   Not(On(d, L))),
               And(Implies(Angle(a, c, d) == Angle(d, c, b),
                           Angle(a, c, d) == RightAngle),
                   Implies(Angle(a, c, d) == RightAngle,
                           Angle(a, c, d) == Angle(d, c, b)))))| $x348)))
(assert
 (let (($x392 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) )(let ((?x377 (Angle d a e)))
 (let ((?x378 (Angle b a c)))
 (let (($x379 (= ?x378 ?x377)))
 (let (($x179 (= b a)))
 (let (($x180 (not $x179)))
 (let (($x33 (On e M)))
 (let (($x145 (On c M)))
 (let (($x163 (On a M)))
 (let (($x36 (On d L)))
 (let (($x188 (On b L)))
 (let (($x164 (On a L)))
 (let (($x390 (and $x164 $x188 $x36 $x163 $x145 $x33 $x180 (not (= d a)) (not (= c a)) (not (= e a)) (not (Between b a d)) (not (Between c a e)))))
 (=> $x390 $x379))))))))))))))
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
               Angle(b, a, c) == Angle(d, a, e)))| $x392)))
(assert
 (let (($x406 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) (N Line) )(let (($x166 (Intersectsll L N)))
 (let (($x396 (and $x166 (=> (and (On e L) (On e N)) (SameSide a e M)))))
 (let ((?x102 (+ RightAngle RightAngle)))
 (let (($x401 (SameSide a d N)))
 (let (($x145 (On d N)))
 (let (($x367 (On c N)))
 (let (($x188 (On c M)))
 (let (($x164 (On b M)))
 (let (($x165 (On b L)))
 (let (($x191 (On a L)))
 (let (($x404 (and $x191 $x165 $x164 $x188 $x367 $x145 (not (= b c)) $x401 (< (+ (Angle a b c) (Angle b c d)) ?x102))))
 (=> $x404 $x396)))))))))))))
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
                           SameSide(a, e, M)))))| $x406)))
(assert
 (let (($x373 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x351 (and (=> (On c L) (= 0.0 (Area a b c))) (=> (= 0.0 (Area a b c)) (On c L)))))
 (=> (and (On a L) (On b L) (not (= a b))) $x351)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(On(a, L), On(b, L), Not(a == b)),
               And(Implies(On(c, L), 0 == Area(a, b, c)),
                   Implies(0 == Area(a, b, c), On(c, L)))))| $x373)))
(assert
 (let (($x427 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) )(let (($x345 (Between a c b)))
 (let ((?x415 (Area a d b)))
 (let (($x419 (= (+ (Area a c d) (Area d c b)) ?x415)))
 (let (($x54 (On d L)))
 (let (($x81 (not $x54)))
 (let (($x37 (= b c)))
 (let (($x38 (not $x37)))
 (let (($x141 (= a b)))
 (let (($x142 (not $x141)))
 (let (($x33 (On c L)))
 (let (($x34 (On b L)))
 (let (($x145 (On a L)))
 (=> (and $x145 $x34 $x33 $x142 (not (= a c)) $x38 $x81) (and (=> $x345 $x419) (=> $x419 $x345))))))))))))))))
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
                           Between(a, c, b)))))| $x427)))
(assert
 (let (($x408 (forall ((a Point) (L Line) (M Line) )(let (($x374 (exists ((a Point) )(let (($x271 (On a L)))
 (and $x271 (On a M))))
 ))
 (=> (and (not (= L M)) (Intersectsll L M)) $x374)))
 ))
 (=> |ForAll([a, L, M],
       Implies(And(Not(L == M), Intersectsll(L, M)),
               Exists(a, And(On(a, L), On(a, M)))))| $x408)))
(assert
 (let (($x263 (forall ((a Point) (b Point) )(let ((?x229 (Segment a b)))
 (let (($x277 (< 0.0 ?x229)))
 (let (($x208 (= a b)))
 (let (($x279 (not $x208)))
 (=> $x279 $x277))))))
 ))
 (=> |ForAll([a, b], Implies(Not(a == b), 0 < Segment(a, b)))| $x263)))
(assert
 (let (($x428 (forall ((L Line) (a Point) (b Point) )(let ((?x229 (Segment a b)))
 (let (($x277 (< 0.0 ?x229)))
 (=> (and (On a L) (On b L) (not (= a b))) $x277))))
 ))
 (=> |ForAll([L, a, b],
       Implies(And(On(a, L), On(b, L), Not(a == b)),
               0 < Segment(a, b)))| $x428)))
(assert
 (let (($x278 (forall ((a Point) (alpha Circle) )(exists ((a Point) )(Onc a alpha))
 )
 ))
 (=> |ForAll([a, alpha], Exists(a, Onc(a, alpha)))| $x278)))
(assert
 (let (($x437 (forall ((a Point) (alpha Circle) (c Point) )(let (($x434 (exists ((a Point) )(let ((?x229 (Segment c a)))
 (let (($x21 (<= 0.0 ?x229)))
 (and (Onc a alpha) $x21))))
 ))
 (let (($x435 (Center c alpha)))
 (=> $x435 $x434))))
 ))
 (=> |ForAll([a, alpha, c],
       Implies(Center(c, alpha),
               Exists(a,
                      And(Onc(a, alpha), 0 <= Segment(c, a)))))| $x437)))
(assert
 (let (($x446 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let ((?x309 (Segment a c)))
 (let ((?x310 (Segment a b)))
 (let (($x311 (= ?x310 ?x309)))
 (let (($x92 (Between b a c)))
 (let (($x26 (= b c)))
 (let (($x63 (not $x26)))
 (let (($x48 (Onc c alpha)))
 (let (($x131 (Onc b alpha)))
 (let (($x315 (Center a alpha)))
 (=> (and $x315 $x131 $x48 $x63) (and $x92 $x311))))))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha),
                   Not(b == c)),
               And(Between(b, a, c),
                   Segment(a, b) == Segment(a, c))))| $x446)))
(assert
 (let (($x455 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x91 (Between a c b)))
 (let (($x92 (Between b a c)))
 (let (($x55 (Between a b c)))
 (let (($x93 (or $x55 $x92 $x91)))
 (let (($x94 (= a c)))
 (let (($x95 (not $x94)))
 (let (($x26 (= b c)))
 (let (($x63 (not $x26)))
 (let (($x37 (= a b)))
 (let (($x38 (not $x37)))
 (=> (and $x38 $x63 $x95 (not $x93)) (< 0.0 (Angle a b c))))))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Not(a == b),
                   Not(b == c),
                   Not(a == c),
                   Not(Or(Between(a, b, c),
                          Between(b, a, c),
                          Between(a, c, b)))),
               0 < Angle(a, b, c)))| $x455)))
(assert
 (let (($x2422 (not (= E1 F1))))
 (let (($x2471 (not (= D1 F1))))
 (let (($x2289 (not (= D1 E1))))
 (let (($x2581 (not (= C1 F1))))
 (let (($x2613 (not (= C1 E1))))
 (let (($x2414 (not (= C1 D1))))
 (let (($x2467 (not (= B1 F1))))
 (let (($x2618 (not (= B1 E1))))
 (let (($x2443 (not (= B1 D1))))
 (let (($x2615 (not (= B1 C1))))
 (let (($x2458 (not (= A1 F1))))
 (let (($x1307 (not (= A1 E1))))
 (let (($x2021 (not (= A1 D1))))
 (let (($x2242 (not (= A1 C1))))
 (let (($x2012 (not (= A1 B1))))
 (and $x2012 $x2242 $x2021 $x1307 $x2458 $x2615 $x2443 $x2618 $x2467 $x2414 $x2613 $x2581 $x2289 $x2471 $x2422)))))))))))))))))
(assert
 (let (($x2358 (not (= BF1 CG1))))
 (let (($x2424 (not (= AE1 CG1))))
 (let (($x2428 (not (= AE1 BF1))))
 (let (($x2432 (not (= AD1 CG1))))
 (let (($x2426 (not (= AD1 BF1))))
 (let (($x2319 (not (= AD1 AE1))))
 (let (($x2015 (not (= CA1 CG1))))
 (let (($x731 (not (= CA1 BF1))))
 (let (($x1707 (not (= CA1 AE1))))
 (let (($x2438 (not (= CA1 AD1))))
 (let (($x2435 (not (= BC1 CG1))))
 (let (($x2376 (not (= BC1 BF1))))
 (let (($x2238 (not (= BC1 AE1))))
 (let (($x2255 (not (= BC1 AD1))))
 (let (($x2431 (not (= BC1 CA1))))
 (let (($x1681 (not (= AB1 CG1))))
 (let (($x1653 (not (= AB1 BF1))))
 (let (($x1643 (not (= AB1 AE1))))
 (let (($x1641 (not (= AB1 AD1))))
 (let (($x1639 (not (= AB1 CA1))))
 (let (($x1637 (not (= AB1 BC1))))
 (and $x1637 $x1639 $x1641 $x1643 $x1653 $x1681 $x2431 $x2255 $x2238 $x2376 $x2435 $x2438 $x1707 $x731 $x2015 $x2319 $x2426 $x2432 $x2428 $x2424 $x2358)))))))))))))))))))))))
(assert
 true)
(assert
 (let (($x2369 (Intersectsll AB1 BC1)))
 (=> |Intersectsll(AB1, BC1)| $x2369)))
(assert
 (let (($x1590 (Intersectsll BC1 CA1)))
 (=> |Intersectsll(BC1, CA1)| $x1590)))
(assert
 (let (($x2359 (Intersectsll CA1 AB1)))
 (=> |Intersectsll(CA1, AB1)| $x2359)))
(assert
 (let (($x2022 (On A1 AB1)))
 (=> |On(A1, AB1)| $x2022)))
(assert
 (let (($x2084 (On B1 AB1)))
 (=> |On(B1, AB1)| $x2084)))
(assert
 (let (($x1084 (not (On C1 AB1))))
 (=> |Not(On(C1, AB1))| $x1084)))
(assert
 (let (($x2339 (On B1 BC1)))
 (=> |On(B1, BC1)| $x2339)))
(assert
 (let (($x1709 (On C1 BC1)))
 (=> |On(C1, BC1)| $x1709)))
(assert
 (let (($x1697 (not (On A1 BC1))))
 (=> |Not(On(A1, BC1))| $x1697)))
(assert
 (let (($x1708 (On C1 CA1)))
 (=> |On(C1, CA1)| $x1708)))
(assert
 (let (($x1662 (On A1 CA1)))
 (=> |On(A1, CA1)| $x1662)))
(assert
 (let (($x1633 (not (On B1 CA1))))
 (=> |Not(On(B1, CA1))| $x1633)))
(assert
 (let ((?x1631 (Angle A1 B1 C1)))
 (let (($x1629 (< ?x1631 RightAngle)))
 (=> |Angle(A1, B1, C1) < RightAngle| $x1629))))
(assert
 (let ((?x1621 (Angle B1 A1 C1)))
 (let (($x1595 (< ?x1621 RightAngle)))
 (=> |Angle(B1, A1, C1) < RightAngle| $x1595))))
(assert
 (let ((?x1619 (Angle A1 C1 B1)))
 (let (($x1612 (< ?x1619 RightAngle)))
 (=> |Angle(A1, C1, B1) < RightAngle| $x1612))))
(assert
 (let (($x1606 (On D1 BC1)))
 (=> |On(D1, BC1)| $x1606)))
(assert
 (let (($x1604 (Between B1 D1 C1)))
 (=> |Between(B1, D1, C1)| $x1604)))
(assert
 (let (($x1075 (= (Angle D1 A1 B1) (Angle B1 C1 A1))))
 (=> |Angle(D1, A1, B1) == Angle(B1, C1, A1)| $x1075)))
(assert
 (let (($x1585 (On A1 AD1)))
 (=> |On(A1, AD1)| $x1585)))
(assert
 (let (($x1572 (On D1 AD1)))
 (=> |On(D1, AD1)| $x1572)))
(assert
 (let (($x1584 (Intersectsll AD1 BC1)))
 (=> |Intersectsll(AD1, BC1)| $x1584)))
(assert
 (let (($x1573 (On E1 BC1)))
 (=> |On(E1, BC1)| $x1573)))
(assert
 (let (($x1545 (Between B1 E1 C1)))
 (=> |Between(B1, E1, C1)| $x1545)))
(assert
 (let (($x1529 (= (Angle E1 A1 C1) (Angle C1 B1 A1))))
 (=> |Angle(E1, A1, C1) == Angle(C1, B1, A1)| $x1529)))
(assert
 (let (($x1526 (On A1 AE1)))
 (=> |On(A1, AE1)| $x1526)))
(assert
 (let (($x1523 (On E1 AE1)))
 (=> |On(E1, AE1)| $x1523)))
(assert
 (let (($x1513 (Intersectsll AE1 BC1)))
 (=> |Intersectsll(AE1, BC1)| $x1513)))
(assert
 (let (($x1119 (On F1 AD1)))
 (=> |On(F1, AD1)| $x1119)))
(assert
 (let (($x1470 (Between A1 D1 F1)))
 (=> |Between(A1, D1, F1)| $x1470)))
(assert
 (let (($x1467 (= (Segment F1 D1) (Segment D1 A1))))
 (=> |Segment(F1, D1) == Segment(D1, A1)| $x1467)))
(assert
 (let (($x1034 (On G1 AE1)))
 (=> |On(G1, AE1)| $x1034)))
(assert
 (let (($x1031 (Between A1 E1 G1)))
 (=> |Between(A1, E1, G1)| $x1031)))
(assert
 (let (($x1066 (= (Segment G1 E1) (Segment E1 A1))))
 (=> |Segment(G1, E1) == Segment(E1, A1)| $x1066)))
(assert
 (let (($x1072 (On B1 BF1)))
 (=> |On(B1, BF1)| $x1072)))
(assert
 (let (($x704 (On F1 BF1)))
 (=> |On(F1, BF1)| $x704)))
(assert
 (let (($x1079 (On C1 CG1)))
 (=> |On(C1, CG1)| $x1079)))
(assert
 (let (($x1081 (On G1 CG1)))
 (=> |On(G1, CG1)| $x1081)))
(assert
 (let (($x734 (Center I1 OABC)))
 (=> |Center(I1, OABC)| $x734)))
(assert
 (let (($x1112 (Onc A1 OABC)))
 (=> |Onc(A1, OABC)| $x1112)))
(assert
 (let (($x1170 (Onc B1 OABC)))
 (=> |Onc(B1, OABC)| $x1170)))
(assert
 (let (($x1160 (Onc C1 OABC)))
 (=> |Onc(C1, OABC)| $x1160)))
(assert
 (let (($x11 (On J1 BC1)))
 (=> |On(J1, BC1)| $x11)))
(assert
 (let (($x2470 (Between B1 J1 C1)))
 (=> |Between(B1, J1, C1)| $x2470)))
(assert
 (let (($x1018 (= (Segment J1 B1) (Segment J1 C1))))
 (=> |Segment(J1, B1) == Segment(J1, C1)| $x1018)))
(assert
 (let (($x1311 (On J1 AJ1)))
 (=> |On(J1, AJ1)| $x1311)))
(assert
 (let (($x1211 (On A1 AJ1)))
 (=> |On(A1, AJ1)| $x1211)))
(assert
 (let (($x2181 (exists ((H1 Point) )(and (On H1 BF1) (On H1 CG1) (Onc H1 OABC)))
))
(let (($x1973 (and (Intersectsll BF1 CG1) (Intersectslc BF1 OABC) (Intersectslc CG1 OABC) $x2181)))
(let (($x2183 (not $x1973)))
(=> |Not(And(Intersectsll(BF1, CG1),
        Intersectslc(BF1, OABC),
        Intersectslc(CG1, OABC),
        Exists(H1,
               And(On(H1, BF1), On(H1, CG1), Onc(H1, OABC)))))| $x2183)))))
(check-sat)
