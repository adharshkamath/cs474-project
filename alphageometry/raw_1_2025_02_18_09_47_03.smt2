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
(declare-fun |Angle(D1, A1, B1) == Angle(B1, C1, A1)| () Bool)
(declare-fun |On(A1, AD1)| () Bool)
(declare-fun |On(D1, AD1)| () Bool)
(declare-fun |Intersectsll(AD1, BC1)| () Bool)
(declare-fun |On(E1, BC1)| () Bool)
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
(declare-fun |Not(And(Intersectsll(BF1, CG1),
        Intersectslc(BF1, OABC),
        Intersectslc(CG1, OABC),
        Exists(H1,
               And(On(H1, BF1), On(H1, CG1), Onc(H1, OABC)))))| () Bool)
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
 (let (($x96 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x89 (Between a c b)))
 (let (($x90 (Between b a c)))
 (let (($x53 (Between a b c)))
 (let (($x24 (= b c)))
 (let (($x61 (not $x24)))
 (let (($x92 (= a c)))
 (let (($x93 (not $x92)))
 (let (($x35 (= a b)))
 (let (($x36 (not $x35)))
 (let (($x52 (On c L)))
 (let (($x31 (On b L)))
 (let (($x32 (On a L)))
 (=> (and $x32 $x31 $x52 $x36 $x93 $x61) (or $x53 $x90 $x89)))))))))))))))
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
                  Between(a, c, b))))| $x96)))
(assert
 (let (($x82 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x57 (Between c b d)))
 (let (($x58 (not $x57)))
 (=> (and (Between a b c) (Between a b d)) $x58))))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, b, d)),
               Not(Between(c, b, d))))| $x82)))
(assert
 (let (($x84 (forall ((a Point) (L Line) )(let (($x50 (SameSide a a L)))
 (let (($x52 (On a L)))
 (let (($x79 (not $x52)))
 (=> $x79 $x50)))))
 ))
 (=> |ForAll([a, L], Implies(Not(On(a, L)), SameSide(a, a, L)))| $x84)))
(assert
 (let (($x87 (forall ((a Point) (b Point) (L Line) )(let (($x45 (SameSide b a L)))
 (let (($x85 (SameSide a b L)))
 (=> $x85 $x45))))
 ))
 (=> |ForAll([a, b, L],
       Implies(SameSide(a, b, L), SameSide(b, a, L)))| $x87)))
(assert
 (let (($x99 (forall ((a Point) (b Point) (L Line) )(let (($x31 (On a L)))
 (let (($x97 (not $x31)))
 (let (($x85 (SameSide a b L)))
 (=> $x85 $x97)))))
 ))
 (=> |ForAll([a, b, L], Implies(SameSide(a, b, L), Not(On(a, L))))| $x99)))
(assert
 (let (($x105 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x85 (SameSide b c L)))
 (=> (and (SameSide a b L) (SameSide a c L)) $x85)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(SameSide(a, b, L), SameSide(a, c, L)),
               SameSide(b, c, L)))| $x105)))
(assert
 (let (($x119 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x102 (SameSide a b L)))
 (let (($x115 (not $x102)))
 (let (($x52 (On c L)))
 (let (($x79 (not $x52)))
 (let (($x31 (On b L)))
 (let (($x97 (not $x31)))
 (let (($x32 (On a L)))
 (let (($x116 (not $x32)))
 (=> (and $x116 $x97 $x79 $x115) (or (SameSide a c L) (SameSide b c L))))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Not(On(a, L)),
                   Not(On(b, L)),
                   Not(On(c, L)),
                   Not(SameSide(a, b, L))),
               Or(SameSide(a, c, L), SameSide(b, c, L))))| $x119)))
(assert
 (let (($x108 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x102 (SameSide a b L)))
 (=> (and (Between a b c) (SameSide a c L)) $x102)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), SameSide(a, c, L)),
               SameSide(a, b, L)))| $x108)))
(assert
 (let (($x113 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x85 (SameSide b c L)))
 (=> (and (Between a b c) (On a L) (not (On b L))) $x85)))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c),
                   On(a, L),
                   Not(On(b, L))),
               SameSide(b, c, L)))| $x113)))
(assert
 (let (($x122 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x101 (SameSide a c L)))
 (let (($x110 (not $x101)))
 (=> (and (Between a b c) (On b L)) $x110))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(b, L)),
               Not(SameSide(a, c, L))))| $x122)))
(assert
 (let (($x148 (forall ((a Point) (b Point) (c Point) (L Line) (M Line) )(let (($x136 (Between a b c)))
 (let (($x35 (= b c)))
 (let (($x36 (not $x35)))
 (let (($x139 (= a b)))
 (let (($x140 (not $x139)))
 (let (($x31 (On c M)))
 (let (($x143 (On a M)))
 (let (($x32 (On b M)))
 (let (($x34 (On b L)))
 (let (($x144 (Intersectsll L M)))
 (let (($x30 (= L M)))
 (let (($x145 (not $x30)))
 (let (($x146 (and $x145 $x144 $x34 $x32 $x143 $x31 (not (= c a)) $x140 $x36 (not (SameSide a c L)))))
 (=> $x146 $x136)))))))))))))))
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
               Between(a, b, c)))| $x148)))
(assert
 (let (($x172 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) (N Line) )(let (($x155 (SameSide b d M)))
 (let (($x156 (not $x155)))
 (let (($x157 (SameSide b c N)))
 (let (($x158 (SameSide c d L)))
 (let (($x32 (On d N)))
 (let (($x159 (On c M)))
 (let (($x160 (On b L)))
 (let (($x161 (On a N)))
 (let (($x162 (On a M)))
 (let (($x163 (On a L)))
 (let (($x164 (Intersectsll L N)))
 (let (($x144 (Intersectsll M N)))
 (let (($x165 (Intersectsll L M)))
 (let (($x30 (= M N)))
 (let (($x145 (not $x30)))
 (let (($x166 (= L N)))
 (let (($x167 (not $x166)))
 (let (($x168 (= L M)))
 (let (($x169 (not $x168)))
 (let (($x170 (and $x169 $x167 $x145 $x165 $x144 $x164 $x163 $x162 $x161 $x160 $x159 $x32 $x158 $x157)))
 (=> $x170 $x156))))))))))))))))))))))
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
               Not(SameSide(b, d, M))))| $x172)))
(assert
 (let (($x182 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) (N Line) )(let (($x157 (SameSide b c N)))
 (let (($x177 (= b a)))
 (let (($x178 (not $x177)))
 (let (($x34 (On d M)))
 (let (($x179 (not $x34)))
 (let (($x155 (SameSide b d M)))
 (let (($x156 (not $x155)))
 (let (($x158 (SameSide c d L)))
 (let (($x32 (On d N)))
 (let (($x159 (On c M)))
 (let (($x160 (On b L)))
 (let (($x161 (On a N)))
 (let (($x162 (On a M)))
 (let (($x163 (On a L)))
 (let (($x164 (Intersectsll L N)))
 (let (($x144 (Intersectsll M N)))
 (let (($x165 (Intersectsll L M)))
 (let (($x30 (= M N)))
 (let (($x145 (not $x30)))
 (let (($x166 (= L N)))
 (let (($x167 (not $x166)))
 (let (($x168 (= L M)))
 (let (($x169 (not $x168)))
 (let (($x180 (and $x169 $x167 $x145 $x165 $x144 $x164 $x163 $x162 $x161 $x160 $x159 $x32 $x158 $x156 $x179 $x178)))
 (=> $x180 $x157))))))))))))))))))))))))))
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
               SameSide(b, c, N)))| $x182)))
(assert
 (let (($x192 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) (N Line) )(let (($x175 (SameSide c e L)))
 (let (($x176 (SameSide c e N)))
 (let (($x183 (SameSide d e M)))
 (let (($x184 (SameSide b c N)))
 (let (($x185 (SameSide c d L)))
 (let (($x143 (On d N)))
 (let (($x186 (On c M)))
 (let (($x163 (On b L)))
 (let (($x187 (On a N)))
 (let (($x188 (On a M)))
 (let (($x189 (On a L)))
 (let (($x164 (Intersectsll L N)))
 (let (($x144 (Intersectsll M N)))
 (let (($x165 (Intersectsll L M)))
 (let (($x30 (= M N)))
 (let (($x145 (not $x30)))
 (let (($x166 (= L N)))
 (let (($x167 (not $x166)))
 (let (($x168 (= L M)))
 (let (($x169 (not $x168)))
 (let (($x190 (and $x169 $x167 $x145 $x165 $x144 $x164 $x189 $x188 $x187 $x163 $x186 $x143 $x185 $x184 $x183 $x176)))
 (=> $x190 $x175)))))))))))))))))))))))
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
               SameSide(c, e, L)))| $x192)))
(assert
 (let (($x134 (forall ((a Point) (b Point) (c Point) (L Line) (alpha Circle) )(let (($x128 (Between b a c)))
 (let (($x35 (= b c)))
 (let (($x36 (not $x35)))
 (let (($x129 (Onc c alpha)))
 (let (($x130 (Onc b alpha)))
 (let (($x131 (Inside a alpha)))
 (let (($x33 (On c L)))
 (let (($x34 (On b L)))
 (let (($x159 (On a L)))
 (=> (and $x159 $x34 $x33 $x131 $x130 $x129 $x36) $x128)))))))))))
 ))
 (=> |ForAll([a, b, c, L, alpha],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Inside(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha),
                   Not(b == c)),
               Between(b, a, c)))| $x134)))
(assert
 (let (($x194 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x20 (Inside c alpha)))
 (let (($x89 (Between a c b)))
 (let (($x127 (Inside b alpha)))
 (let (($x129 (Onc b alpha)))
 (let (($x149 (or $x129 $x127)))
 (let (($x150 (Inside a alpha)))
 (let (($x130 (Onc a alpha)))
 (let (($x151 (or $x130 $x150)))
 (=> (and $x151 $x149 $x89) $x20))))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Or(Onc(a, alpha), Inside(a, alpha)),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Between(a, c, b)),
               Inside(c, alpha)))| $x194)))
(assert
 (let (($x203 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x198 (not (or (Inside b alpha) (Onc b alpha)))))
 (let (($x89 (Between a c b)))
 (let (($x20 (Inside c alpha)))
 (let (($x199 (not $x20)))
 (let (($x130 (Onc a alpha)))
 (let (($x150 (Inside a alpha)))
 (let (($x200 (or $x150 $x130)))
 (=> (and $x200 $x199 $x89) $x198)))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Not(Inside(c, alpha)),
                   Between(a, c, b)),
               Not(Or(Inside(b, alpha), Onc(b, alpha)))))| $x203)))
(assert
 (let (($x221 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (alpha Circle) (beta Circle) )(let (($x158 (SameSide c d L)))
 (let (($x210 (not $x158)))
 (let (($x160 (On b L)))
 (let (($x163 (On a L)))
 (let (($x211 (Center b beta)))
 (let (($x212 (Center a alpha)))
 (let (($x139 (= c d)))
 (let (($x140 (not $x139)))
 (let (($x130 (Onc d beta)))
 (let (($x213 (Onc d alpha)))
 (let (($x214 (Onc c beta)))
 (let (($x215 (Onc c alpha)))
 (let (($x216 (Intersectscc alpha beta)))
 (let (($x219 (and (not (= alpha beta)) $x216 $x215 $x214 $x213 $x130 $x140 $x212 $x211 $x163 $x160)))
 (=> $x219 $x210))))))))))))))))
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
               Not(SameSide(c, d, L))))| $x221)))
(assert
 (let (($x196 (forall ((a Point) (b Point) (L Line) (M Line) )(let (($x144 (Intersectsll L M)))
 (=> (and (not (SameSide a b L)) (On a M) (On b M)) $x144)))
 ))
 (=> |ForAll([a, b, L, M],
       Implies(And(Not(SameSide(a, b, L)),
                   On(a, M),
                   On(b, M)),
               Intersectsll(L, M)))| $x196)))
(assert
 (let (($x224 (forall ((a Point) (b Point) (L Line) (alpha Circle) )(let (($x208 (Intersectslc L alpha)))
 (let (($x124 (SameSide a b L)))
 (let (($x125 (not $x124)))
 (let (($x127 (Inside b alpha)))
 (let (($x129 (Onc b alpha)))
 (let (($x149 (or $x129 $x127)))
 (let (($x150 (Inside a alpha)))
 (let (($x130 (Onc a alpha)))
 (let (($x151 (or $x130 $x150)))
 (=> (and $x151 $x149 $x125) $x208)))))))))))
 ))
 (=> |ForAll([a, b, L, alpha],
       Implies(And(Or(Onc(a, alpha), Inside(a, alpha)),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Not(SameSide(a, b, L))),
               Intersectslc(L, alpha)))| $x224)))
(assert
 (let (($x204 (forall ((a Point) (L Line) (alpha Circle) )(let (($x208 (Intersectslc L alpha)))
 (=> (and (Inside a alpha) (On a L)) $x208)))
 ))
 (=> |ForAll([a, L, alpha],
       Implies(And(Inside(a, alpha), On(a, L)),
               Intersectslc(L, alpha)))| $x204)))
(assert
 (let (($x236 (forall ((a Point) (b Point) (alpha Circle) (beta Circle) )(let (($x216 (Intersectscc alpha beta)))
 (let (($x127 (Inside b beta)))
 (let (($x229 (not $x127)))
 (let (($x129 (Onc b beta)))
 (let (($x230 (not $x129)))
 (let (($x150 (Inside a beta)))
 (let (($x213 (Onc a alpha)))
 (=> (and $x213 (or (Onc b alpha) (Inside b alpha)) $x150 $x230 $x229) $x216)))))))))
 ))
 (=> |ForAll([a, b, alpha, beta],
       Implies(And(Onc(a, alpha),
                   Or(Onc(b, alpha), Inside(b, alpha)),
                   Inside(a, beta),
                   Not(Onc(b, beta)),
                   Not(Inside(b, beta))),
               Intersectscc(alpha, beta)))| $x236)))
(assert
 (let (($x226 (forall ((a Point) (b Point) (alpha Circle) (beta Circle) )(let (($x216 (Intersectscc alpha beta)))
 (let (($x129 (Onc b beta)))
 (let (($x150 (Inside a beta)))
 (let (($x231 (Inside b alpha)))
 (let (($x213 (Onc a alpha)))
 (=> (and $x213 $x231 $x150 $x129) $x216)))))))
 ))
 (=> |ForAll([a, b, alpha, beta],
       Implies(And(Onc(a, alpha),
                   Inside(b, alpha),
                   Inside(a, beta),
                   Onc(b, beta)),
               Intersectscc(alpha, beta)))| $x226)))
(assert
 (let (($x241 (forall ((a Point) (b Point) )(and (=> (= a b) (= 0.0 (Segment a b))) (=> (= 0.0 (Segment a b)) (= a b))))
 ))
 (=> |ForAll([a, b],
       And(Implies(a == b, 0 == Segment(a, b)),
           Implies(0 == Segment(a, b), a == b)))| $x241)))
(assert
 (let (($x100 (forall ((a Point) (b Point) )(let ((?x228 (Segment a b)))
 (<= 0.0 ?x228)))
 ))
 (=> |ForAll([a, b], 0 <= Segment(a, b))| $x100)))
(assert
 (let (($x243 (forall ((a Point) (b Point) )(let ((?x206 (Segment b a)))
 (let ((?x228 (Segment a b)))
 (= ?x228 ?x206))))
 ))
 (=> |ForAll([a, b], Segment(a, b) == Segment(b, a))| $x243)))
(assert
 (let (($x255 (forall ((a Point) (b Point) (c Point) )(let ((?x250 (Angle c b a)))
 (let ((?x251 (Angle a b c)))
 (let (($x252 (= ?x251 ?x250)))
 (=> (and (not (= a b)) (not (= a c))) $x252)))))
 ))
 (=> |ForAll([a, b, c],
       Implies(And(Not(a == b), Not(a == c)),
               Angle(a, b, c) == Angle(c, b, a)))| $x255)))
(assert
 (let (($x249 (forall ((a Point) (b Point) (c Point) )(and (<= 0.0 (Angle a b c)) (<= (Angle a b c) (+ RightAngle RightAngle))))
 ))
 (=> |ForAll([a, b, c],
       And(0 <= Angle(a, b, c),
           Angle(a, b, c) <= RightAngle + RightAngle))| $x249)))
(assert
 (let (($x256 (forall ((a Point) (b Point) )(let ((?x244 (Area a a b)))
 (= 0.0 ?x244)))
 ))
 (=> |ForAll([a, b], 0 == Area(a, a, b))| $x256)))
(assert
 (let (($x259 (forall ((a Point) (b Point) (c Point) )(let ((?x257 (Area a b c)))
 (<= 0.0 ?x257)))
 ))
 (=> |ForAll([a, b, c], 0 <= Area(a, b, c))| $x259)))
(assert
 (let (($x269 (forall ((a Point) (b Point) (c Point) )(let ((?x264 (Area a c b)))
 (let ((?x257 (Area a b c)))
 (let (($x265 (= ?x257 ?x264)))
 (let ((?x266 (Area c a b)))
 (let (($x267 (= ?x257 ?x266)))
 (and $x267 $x265)))))))
 ))
 (=> |ForAll([a, b, c],
       And(Area(a, b, c) == Area(c, a, b),
           Area(a, b, c) == Area(a, c, b)))| $x269)))
(assert
 (let (($x307 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (f Point) )(let ((?x257 (Area d e f)))
 (let ((?x287 (Area a b c)))
 (let (($x288 (= ?x287 ?x257)))
 (let (($x291 (= (Angle c a b) (Angle f d e))))
 (let (($x294 (= (Angle b c a) (Angle e f d))))
 (let ((?x251 (Angle d e f)))
 (let (($x296 (= (Angle a b c) ?x251)))
 (let (($x299 (= (Segment c a) (Segment f d))))
 (let ((?x228 (Segment e f)))
 (let ((?x300 (Segment b c)))
 (let (($x301 (= ?x300 ?x228)))
 (let ((?x302 (Segment d e)))
 (let (($x304 (= (Segment a b) ?x302)))
 (=> (and $x304 $x301 $x299 $x296 $x294 $x291) $x288)))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, e, f],
       Implies(And(Segment(a, b) == Segment(d, e),
                   Segment(b, c) == Segment(e, f),
                   Segment(c, a) == Segment(f, d),
                   Angle(a, b, c) == Angle(d, e, f),
                   Angle(b, c, a) == Angle(e, f, d),
                   Angle(c, a, b) == Angle(f, d, e)),
               Area(a, b, c) == Area(d, e, f)))| $x307)))
(assert
 (let (($x275 (forall ((a Point) (b Point) (c Point) )(let (($x64 (Between a b c)))
 (=> $x64 (= (Segment a c) (+ (Segment a b) (Segment b c))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(Between(a, b, c),
               Segment(a, c) ==
               Segment(a, b) + Segment(b, c)))| $x275)))
(assert
 (let (($x285 (forall ((a Point) (b Point) (c Point) (alpha Circle) (beta Circle) )(let (($x217 (= alpha beta)))
 (let ((?x300 (Segment a b)))
 (let (($x280 (= ?x300 (Segment a c))))
 (let (($x129 (Onc c beta)))
 (let (($x213 (Onc b alpha)))
 (let (($x281 (Center a beta)))
 (let (($x282 (Center a alpha)))
 (=> (and $x282 $x281 $x213 $x129 $x280) $x217)))))))))
 ))
 (=> |ForAll([a, b, c, alpha, beta],
       Implies(And(Center(a, alpha),
                   Center(a, beta),
                   Onc(b, alpha),
                   Onc(c, beta),
                   Segment(a, b) == Segment(a, c)),
               alpha == beta))| $x285)))
(assert
 (let (($x317 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x313 (and (=> (Onc c alpha) (= (Segment a b) (Segment a c))) (=> (= (Segment a b) (Segment a c)) (Onc c alpha)))))
 (let (($x129 (Onc b alpha)))
 (let (($x314 (Center a alpha)))
 (let (($x315 (and $x314 $x129)))
 (=> $x315 $x313))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha), Onc(b, alpha)),
               And(Implies(Onc(c, alpha),
                           Segment(a, b) == Segment(a, c)),
                   Implies(Segment(a, b) == Segment(a, c),
                           Onc(c, alpha)))))| $x317)))
(assert
 (let (($x323 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x321 (and (=> (Inside c alpha) (< (Segment a c) (Segment a b))) (=> (< (Segment a c) (Segment a b)) (Inside c alpha)))))
 (let (($x129 (Onc b alpha)))
 (let (($x314 (Center a alpha)))
 (let (($x315 (and $x314 $x129)))
 (=> $x315 $x321))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha), Onc(b, alpha)),
               And(Implies(Inside(c, alpha),
                           Segment(a, c) < Segment(a, b)),
                   Implies(Segment(a, c) < Segment(a, b),
                           Inside(c, alpha)))))| $x323)))
(assert
 (let (($x339 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x52 (On c L)))
 (let (($x331 (and $x52 (not (Between b a c)))))
 (let ((?x332 (Angle b a c)))
 (let (($x333 (= 0.0 ?x332)))
 (let (($x31 (On b L)))
 (let (($x32 (On a L)))
 (let (($x92 (= a c)))
 (let (($x93 (not $x92)))
 (let (($x35 (= a b)))
 (let (($x36 (not $x35)))
 (=> (and $x36 $x93 $x32 $x31) (and (=> $x331 $x333) (=> $x333 $x331))))))))))))))
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
 (let (($x124 (SameSide c d L)))
 (let (($x356 (SameSide b d M)))
 (let (($x357 (and $x356 $x124)))
 (let (($x30 (= L M)))
 (let (($x145 (not $x30)))
 (let (($x31 (On d M)))
 (let (($x97 (not $x31)))
 (let (($x33 (On d L)))
 (let (($x361 (not $x33)))
 (let (($x32 (On c M)))
 (let (($x159 (On b L)))
 (let (($x144 (Intersectsll L M)))
 (let (($x366 (On a M)))
 (let (($x186 (On a L)))
 (let (($x367 (and $x186 $x366 $x144 $x159 $x32 (not (= a b)) (not (= a c)) $x361 $x97 $x145)))
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
 (let (($x347 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) )(let ((?x328 (Angle a c d)))
 (let (($x329 (= ?x328 (Angle d c b))))
 (let (($x340 (= ?x328 RightAngle)))
 (let (($x52 (On d L)))
 (let (($x79 (not $x52)))
 (let (($x344 (Between a c b)))
 (let (($x32 (On b L)))
 (let (($x143 (On a L)))
 (=> (and $x143 $x32 $x344 $x79) (and (=> $x329 $x340) (=> $x340 $x329))))))))))))
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
 (let (($x177 (= b a)))
 (let (($x178 (not $x177)))
 (let (($x31 (On e M)))
 (let (($x143 (On c M)))
 (let (($x161 (On a M)))
 (let (($x34 (On d L)))
 (let (($x186 (On b L)))
 (let (($x162 (On a L)))
 (let (($x389 (and $x162 $x186 $x34 $x161 $x143 $x31 $x178 (not (= d a)) (not (= c a)) (not (= e a)) (not (Between b a d)) (not (Between c a e)))))
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
 (let (($x405 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) (N Line) )(let (($x164 (Intersectsll L N)))
 (let (($x395 (and $x164 (=> (and (On e L) (On e N)) (SameSide a e M)))))
 (let ((?x205 (+ RightAngle RightAngle)))
 (let (($x400 (SameSide a d N)))
 (let (($x143 (On d N)))
 (let (($x366 (On c N)))
 (let (($x186 (On c M)))
 (let (($x162 (On b M)))
 (let (($x163 (On b L)))
 (let (($x189 (On a L)))
 (let (($x403 (and $x189 $x163 $x162 $x186 $x366 $x143 (not (= b c)) $x400 (< (+ (Angle a b c) (Angle b c d)) ?x205))))
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
 (let (($x139 (= a b)))
 (let (($x140 (not $x139)))
 (let (($x31 (On c L)))
 (let (($x32 (On b L)))
 (let (($x143 (On a L)))
 (=> (and $x143 $x32 $x31 $x140 (not (= a c)) $x36 $x79) (and (=> $x344 $x418) (=> $x418 $x344))))))))))))))))
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
 (let (($x428 (not (= E1 F1))))
 (let (($x412 (not (= D1 F1))))
 (let (($x435 (not (= D1 E1))))
 (let (($x432 (not (= C1 F1))))
 (let (($x455 (not (= C1 E1))))
 (let (($x452 (not (= C1 D1))))
 (let (($x460 (not (= B1 F1))))
 (let (($x850 (not (= B1 E1))))
 (let (($x465 (not (= B1 D1))))
 (let (($x458 (not (= B1 C1))))
 (let (($x472 (not (= A1 F1))))
 (let (($x481 (not (= A1 E1))))
 (let (($x853 (not (= A1 D1))))
 (let (($x480 (not (= A1 C1))))
 (let (($x467 (not (= A1 B1))))
 (and $x467 $x480 $x853 $x481 $x472 $x458 $x465 $x850 $x460 $x452 $x455 $x432 $x435 $x412 $x428)))))))))))))))))
(assert
 (let (($x1099 (not (= BF1 CG1))))
 (let (($x1097 (not (= AE1 CG1))))
 (let (($x1095 (not (= AE1 BF1))))
 (let (($x1093 (not (= AD1 CG1))))
 (let (($x1091 (not (= AD1 BF1))))
 (let (($x1089 (not (= AD1 AE1))))
 (let (($x1087 (not (= CA1 CG1))))
 (let (($x1085 (not (= CA1 BF1))))
 (let (($x1083 (not (= CA1 AE1))))
 (let (($x1081 (not (= CA1 AD1))))
 (let (($x1079 (not (= BC1 CG1))))
 (let (($x1077 (not (= BC1 BF1))))
 (let (($x1075 (not (= BC1 AE1))))
 (let (($x6 (not (= BC1 AD1))))
 (let (($x992 (not (= BC1 CA1))))
 (let (($x719 (not (= AB1 CG1))))
 (let (($x667 (not (= AB1 BF1))))
 (let (($x948 (not (= AB1 AE1))))
 (let (($x926 (not (= AB1 AD1))))
 (let (($x908 (not (= AB1 CA1))))
 (let (($x899 (not (= AB1 BC1))))
 (and $x899 $x908 $x926 $x948 $x667 $x719 $x992 $x6 $x1075 $x1077 $x1079 $x1081 $x1083 $x1085 $x1087 $x1089 $x1091 $x1093 $x1095 $x1097 $x1099)))))))))))))))))))))))
(assert
 true)
(assert
 (let (($x1101 (Intersectsll AB1 BC1)))
 (=> |Intersectsll(AB1, BC1)| $x1101)))
(assert
 (let (($x1102 (Intersectsll BC1 CA1)))
 (=> |Intersectsll(BC1, CA1)| $x1102)))
(assert
 (let (($x1103 (Intersectsll CA1 AB1)))
 (=> |Intersectsll(CA1, AB1)| $x1103)))
(assert
 (let (($x1104 (On A1 AB1)))
 (=> |On(A1, AB1)| $x1104)))
(assert
 (let (($x1105 (On B1 AB1)))
 (=> |On(B1, AB1)| $x1105)))
(assert
 (let (($x1107 (not (On C1 AB1))))
 (=> |Not(On(C1, AB1))| $x1107)))
(assert
 (let (($x1108 (On B1 BC1)))
 (=> |On(B1, BC1)| $x1108)))
(assert
 (let (($x1109 (On C1 BC1)))
 (=> |On(C1, BC1)| $x1109)))
(assert
 (let (($x1111 (not (On A1 BC1))))
 (=> |Not(On(A1, BC1))| $x1111)))
(assert
 (let (($x1112 (On C1 CA1)))
 (=> |On(C1, CA1)| $x1112)))
(assert
 (let (($x1113 (On A1 CA1)))
 (=> |On(A1, CA1)| $x1113)))
(assert
 (let (($x1115 (not (On B1 CA1))))
 (=> |Not(On(B1, CA1))| $x1115)))
(assert
 (let ((?x1116 (Angle A1 B1 C1)))
 (let (($x1117 (< ?x1116 RightAngle)))
 (=> |Angle(A1, B1, C1) < RightAngle| $x1117))))
(assert
 (let ((?x1118 (Angle B1 A1 C1)))
 (let (($x1119 (< ?x1118 RightAngle)))
 (=> |Angle(B1, A1, C1) < RightAngle| $x1119))))
(assert
 (let ((?x1120 (Angle A1 C1 B1)))
 (let (($x1121 (< ?x1120 RightAngle)))
 (=> |Angle(A1, C1, B1) < RightAngle| $x1121))))
(assert
 (let (($x1122 (On D1 BC1)))
 (=> |On(D1, BC1)| $x1122)))
(assert
 (let (($x1125 (= (Angle D1 A1 B1) (Angle B1 C1 A1))))
 (=> |Angle(D1, A1, B1) == Angle(B1, C1, A1)| $x1125)))
(assert
 (let (($x1126 (On A1 AD1)))
 (=> |On(A1, AD1)| $x1126)))
(assert
 (let (($x1127 (On D1 AD1)))
 (=> |On(D1, AD1)| $x1127)))
(assert
 (let (($x1128 (Intersectsll AD1 BC1)))
 (=> |Intersectsll(AD1, BC1)| $x1128)))
(assert
 (let (($x1129 (On E1 BC1)))
 (=> |On(E1, BC1)| $x1129)))
(assert
 (let (($x1132 (= (Angle E1 A1 C1) (Angle C1 B1 A1))))
 (=> |Angle(E1, A1, C1) == Angle(C1, B1, A1)| $x1132)))
(assert
 (let (($x1133 (On A1 AE1)))
 (=> |On(A1, AE1)| $x1133)))
(assert
 (let (($x1134 (On E1 AE1)))
 (=> |On(E1, AE1)| $x1134)))
(assert
 (let (($x1135 (Intersectsll AE1 BC1)))
 (=> |Intersectsll(AE1, BC1)| $x1135)))
(assert
 (let (($x1136 (On F1 AD1)))
 (=> |On(F1, AD1)| $x1136)))
(assert
 (let (($x1137 (Between A1 D1 F1)))
 (=> |Between(A1, D1, F1)| $x1137)))
(assert
 (let (($x1140 (= (Segment F1 D1) (Segment D1 A1))))
 (=> |Segment(F1, D1) == Segment(D1, A1)| $x1140)))
(assert
 (let (($x1141 (On G1 AE1)))
 (=> |On(G1, AE1)| $x1141)))
(assert
 (let (($x1142 (Between A1 E1 G1)))
 (=> |Between(A1, E1, G1)| $x1142)))
(assert
 (let (($x1145 (= (Segment G1 E1) (Segment E1 A1))))
 (=> |Segment(G1, E1) == Segment(E1, A1)| $x1145)))
(assert
 (let (($x1146 (On B1 BF1)))
 (=> |On(B1, BF1)| $x1146)))
(assert
 (let (($x1147 (On F1 BF1)))
 (=> |On(F1, BF1)| $x1147)))
(assert
 (let (($x1148 (On C1 CG1)))
 (=> |On(C1, CG1)| $x1148)))
(assert
 (let (($x1149 (On G1 CG1)))
 (=> |On(G1, CG1)| $x1149)))
(assert
 (let (($x1150 (Center I1 OABC)))
 (=> |Center(I1, OABC)| $x1150)))
(assert
 (let (($x1151 (Onc A1 OABC)))
 (=> |Onc(A1, OABC)| $x1151)))
(assert
 (let (($x1152 (Onc B1 OABC)))
 (=> |Onc(B1, OABC)| $x1152)))
(assert
 (let (($x1153 (Onc C1 OABC)))
 (=> |Onc(C1, OABC)| $x1153)))
(assert
 (let (($x1165 (exists ((H1 Point) )(and (On H1 BF1) (On H1 CG1) (Onc H1 OABC)))
))
(let (($x1157 (and (Intersectsll BF1 CG1) (Intersectslc BF1 OABC) (Intersectslc CG1 OABC) $x1165)))
(let (($x1158 (not $x1157)))
(=> |Not(And(Intersectsll(BF1, CG1),
        Intersectslc(BF1, OABC),
        Intersectslc(CG1, OABC),
        Exists(H1,
               And(On(H1, BF1), On(H1, CG1), Onc(H1, OABC)))))| $x1158)))))
(check-sat)
