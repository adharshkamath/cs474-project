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
                   Not(a == c),
                   Not(a == b),
                   Not(Between(b, a, c)))))| () Bool)
(declare-fun L () Line)
(declare-fun |ForAll([a, b, c],
       Implies(And(Between(a, b, c), On(a, L), On(b, L)),
               On(c, L)))| () Bool)
(declare-fun |ForAll([a, b, c],
       Implies(And(Between(a, b, c), On(a, L), On(c, L)),
               On(b, L)))| () Bool)
(declare-fun d () Point)
(declare-fun |ForAll([a, b, c],
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
               Not(Between(d, b, c))))| () Bool)
(declare-fun SameSide (Point Point Line) Bool)
(declare-fun |ForAll([a, L], Implies(Not(On(a, L)), SameSide(a, a, L)))| () Bool)
(declare-fun |ForAll([a, b, L],
       Implies(SameSide(a, b, L), And(Not(On(a, L)))))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(SameSide(a, b, L), SameSide(a, c, L)),
               SameSide(b, c, L)))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Not(On(a, L)),
                   Not(On(b, L)),
                   Not(On(c, L))),
               Or(SameSide(a, b, L),
                  SameSide(a, c, L),
                  SameSide(b, c, L))))| () Bool)
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
(declare-fun |ForAll([a, b, c, L, M],
       Implies(And(Not(a == b),
                   Not(b == c),
                   Not(L == M),
                   On(a, M),
                   On(b, M),
                   On(c, M),
                   Not(SameSide(a, c, L)),
                   On(b, L)),
               Between(a, b, c)))| () Bool)
(declare-fun |ForAll([a, b, c, d, L, M, N],
       Implies(And(On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   SameSide(b, c, N)),
               Not(SameSide(b, d, M))))| () Bool)
(declare-fun N () Line)
(declare-fun M () Line)
(declare-fun |ForAll([a, b, c, d],
       Implies(And(On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   Not(SameSide(d, b, M)),
                   Not(On(d, M)),
                   Not(b == a)),
               SameSide(b, c, N)))| () Bool)
(declare-fun |ForAll([a, b, c, d, e, L, M, N],
       Implies(And(On(a, L),
                   On(c, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(b, c, N),
                   SameSide(d, c, L),
                   SameSide(d, e, M),
                   SameSide(c, e, N)),
               SameSide(c, e, L)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha, L],
       Implies(And(Inside(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha),
                   On(a, L),
                   On(b, L),
                   On(c, L),
                   Not(b == c)),
               Between(b, a, c)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Or(Inside(b, alpha), Onc(b, alpha)),
                   Between(a, c, b)),
               Inside(c, alpha)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Not(Inside(c, alpha)),
                   Between(a, c, b)),
               And(Not(Inside(b, alpha)),
                   Not(Onc(b, alpha)))))| () Bool)
(declare-fun |ForAll([a, b, c, d, alpha, beta],
       Implies(And(Onc(c, alpha),
                   Onc(c, beta),
                   Onc(d, alpha),
                   Onc(d, beta),
                   Not(alpha == beta),
                   Not(c == d),
                   On(a, L),
                   On(b, L),
                   Center(a, alpha),
                   Center(a, beta)),
               Not(SameSide(c, d, L))))| () Bool)
(declare-fun Intersectsll (Line Line) Bool)
(declare-fun |ForAll([L, M, a, b],
       Implies(And(On(a, M),
                   On(b, M),
                   Not(SameSide(a, b, L))),
               Intersectsll(L, M)))| () Bool)
(declare-fun Intersectslc (Line Circle) Bool)
(declare-fun |ForAll([alpha, L, a, b],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Or(Inside(b, alpha), Onc(b, alpha)),
                   Not(On(a, L)),
                   Not(On(b, L)),
                   Not(SameSide(a, b, L))),
               Intersectslc(L, alpha)))| () Bool)
(declare-fun |ForAll([L, alpha, a],
       Implies(And(Inside(a, alpha), On(a, L)),
               Intersectslc(L, alpha)))| () Bool)
(declare-fun Intersectscc (Circle Circle) Bool)
(declare-fun |ForAll([alpha, beta, a, b],
       Implies(And(Onc(a, alpha),
                   Or(Inside(b, alpha), Onc(b, alpha)),
                   Inside(a, beta),
                   Not(Inside(b, beta)),
                   Not(Onc(b, beta))),
               Intersectscc(alpha, beta)))| () Bool)
(declare-fun |ForAll([alpha, beta, a, b],
       Implies(And(Onc(a, alpha),
                   Inside(b, beta),
                   Inside(a, beta),
                   Onc(b, beta)),
               Intersectscc(alpha, beta)))| () Bool)
(declare-fun Segment (Point Point) Real)
(declare-fun |ForAll([a, b], Implies(0 == Segment(a, b), a == b))| () Bool)
(declare-fun |ForAll(a, 0 == Segment(a, a))| () Bool)
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
           Area(a, b, c) == Area(b, a, c)))| () Bool)
(declare-fun |ForAll([a, b, c],
       Implies(Between(a, b, c),
               Segment(a, b) + Segment(b, c) ==
               Segment(a, c)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha, beta],
       Implies(And(Center(a, alpha),
                   Center(a, beta),
                   Onc(b, alpha),
                   Onc(c, beta),
                   Segment(a, b) == Segment(a, c)),
               alpha == beta))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha),
                   Onc(b, alpha),
                   Segment(a, c) == Segment(a, b)),
               Onc(c, alpha)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Not(a == b),
                   Not(a == c),
                   Not(b == c),
                   Center(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha)),
               Segment(a, c) == Segment(a, b)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha),
                   Onc(b, alpha),
                   Segment(a, c) < Segment(a, b)),
               Inside(c, alpha)))| () Bool)
(declare-fun |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha),
                   Onc(b, alpha),
                   Inside(c, alpha)),
               Segment(a, c) < Segment(a, b)))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(Not(a == b),
                   Not(a == c),
                   On(a, L),
                   On(b, L)),
               And(On(c, L), Not(Between(c, a, b))) ==
               (0 == Angle(b, a, c))))| () Bool)
(declare-fun |ForAll([a, b], Implies(Not(a == b), 0 == Angle(a, b, a)))| () Bool)
(declare-fun |ForAll([a, b, c, d, L, M],
       Implies(And(On(a, L),
                   On(b, L),
                   On(a, M),
                   On(c, M),
                   Not(a == b),
                   Not(a == c),
                   Not(On(d, L)),
                   Not(On(d, M)),
                   Not(L == M)),
               (Angle(b, a, c) ==
                Angle(b, a, d) + Angle(d, a, c)) ==
               And(SameSide(b, d, M), SameSide(d, c, L))))| () Bool)
(declare-fun |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   Between(a, c, b),
                   Not(On(d, L))),
               (Angle(a, c, d) == Angle(d, c, b)) ==
               (Angle(a, c, d) == RightAngle)))| () Bool)
(declare-fun |ForAll([a, b, c, L],
       Implies(And(On(a, L), On(b, L), Not(a == b)),
               (0 == Area(a, b, c)) == On(c, L)))| () Bool)
(declare-fun |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Not(On(d, L)),
                   Not(a == b),
                   Not(c == a),
                   Not(c == b)),
               Between(a, c, b) ==
               (Area(a, c, d) + Area(d, c, b) ==
                Area(a, d, b))))| () Bool)
(declare-fun F1 () Point)
(declare-fun E1 () Point)
(declare-fun D1 () Point)
(declare-fun C1 () Point)
(declare-fun B1 () Point)
(declare-fun A1 () Point)
(declare-fun CA1 () Line)
(declare-fun BC1 () Line)
(declare-fun AB1 () Line)
(declare-fun GE1 () Line)
(declare-fun FD1 () Line)
(declare-fun CG1 () Line)
(declare-fun BF1 () Line)
(declare-fun |On(A1, AB1)| () Bool)
(declare-fun |On(B1, AB1)| () Bool)
(declare-fun |Not(On(C1, AB1))| () Bool)
(declare-fun |On(B1, BC1)| () Bool)
(declare-fun |On(C1, BC1)| () Bool)
(declare-fun |On(C1, CA1)| () Bool)
(declare-fun |On(A1, CA1)| () Bool)
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
 (let (($x38 (forall ((a Point) (b Point) (L Line) (M Line) )(let (($x29 (= L M)))
 (let (($x30 (On b M)))
 (let (($x31 (On a M)))
 (let (($x32 (On b L)))
 (let (($x33 (On a L)))
 (let (($x35 (not (= a b))))
 (let (($x36 (and $x35 $x33 $x32 $x31 $x30)))
 (=> $x36 $x29)))))))))
 ))
 (=> |ForAll([a, b, L, M],
       Implies(And(Not(a == b),
                   On(a, L),
                   On(b, L),
                   On(a, M),
                   On(b, M)),
               L == M))| $x38)))
(assert
 (let (($x42 (forall ((a Point) (b Point) (alpha Circle) )(let (($x23 (= a b)))
 (let (($x24 (Center b alpha)))
 (let (($x40 (and (Center a alpha) $x24)))
 (=> $x40 $x23)))))
 ))
 (=> |ForAll([a, b, alpha],
       Implies(And(Center(a, alpha), Center(b, alpha)),
               a == b))| $x42)))
(assert
 (let (($x43 (forall ((a Point) (alpha Circle) )(let (($x19 (Inside a alpha)))
 (let (($x24 (Center a alpha)))
 (=> $x24 $x19))))
 ))
 (=> |ForAll([a, alpha],
       Implies(Center(a, alpha), Inside(a, alpha)))| $x43)))
(assert
 (let (($x48 (forall ((a Point) (alpha Circle) )(let (($x45 (Onc a alpha)))
 (let (($x46 (not $x45)))
 (let (($x19 (Inside a alpha)))
 (=> $x19 $x46)))))
 ))
 (=> |ForAll([a, alpha],
       Implies(Inside(a, alpha), Not(Onc(a, alpha))))| $x48)))
(assert
 (let (($x65 (forall ((a Point) (b Point) (c Point) )(let (($x23 (= a b)))
 (let (($x58 (not $x23)))
 (let (($x60 (not (= a c))))
 (let (($x62 (and (Between c b a) $x60 $x58 (not (Between b a c)))))
 (let (($x63 (Between a b c)))
 (=> $x63 $x62)))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(Between(a, b, c),
               And(Between(c, b, a),
                   Not(a == c),
                   Not(a == b),
                   Not(Between(b, a, c)))))| $x65)))
(assert
 (let (($x67 (forall ((a Point) (b Point) (c Point) )(let (($x51 (On c L)))
 (let (($x52 (On b L)))
 (let (($x53 (On a L)))
 (let (($x63 (Between a b c)))
 (let (($x54 (and $x63 $x53 $x52)))
 (=> $x54 $x51)))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(And(Between(a, b, c), On(a, L), On(b, L)),
               On(c, L)))| $x67)))
(assert
 (let (($x70 (forall ((a Point) (b Point) (c Point) )(let (($x52 (On b L)))
 (let (($x51 (On c L)))
 (let (($x53 (On a L)))
 (let (($x63 (Between a b c)))
 (let (($x68 (and $x63 $x53 $x51)))
 (=> $x68 $x52)))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(And(Between(a, b, c), On(a, L), On(c, L)),
               On(b, L)))| $x70)))
(assert
 (let (($x74 (forall ((a Point) (b Point) (c Point) )(let (($x50 (Between a d c)))
 (let (($x63 (Between a b c)))
 (let (($x72 (and $x63 (Between a d b))))
 (=> $x72 $x50)))))
 ))
 (=> |ForAll([a, b, c],
       Implies(And(Between(a, b, c), Between(a, d, b)),
               Between(a, d, c)))| $x74)))
(assert
 (let (($x79 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x75 (Between a b d)))
 (let (($x63 (Between b c d)))
 (let (($x76 (Between a b c)))
 (let (($x77 (and $x76 $x63)))
 (=> $x77 $x75))))))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(b, c, d)),
               Between(a, b, d)))| $x79)))
(assert
 (let (($x98 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x90 (Between a c b)))
 (let (($x91 (Between b a c)))
 (let (($x76 (Between a b c)))
 (let (($x23 (= b c)))
 (let (($x58 (not $x23)))
 (let (($x94 (not (= a c))))
 (let (($x35 (not (= a b))))
 (let (($x95 (On c L)))
 (let (($x30 (On b L)))
 (let (($x31 (On a L)))
 (let (($x96 (and $x31 $x30 $x95 $x35 $x94 $x58)))
 (=> $x96 (or $x76 $x91 $x90))))))))))))))
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
 (let (($x85 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x82 (not (Between d b c))))
 (let (($x75 (Between a b d)))
 (let (($x76 (Between a b c)))
 (let (($x83 (and $x76 $x75)))
 (=> $x83 $x82))))))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, b, d)),
               Not(Between(d, b, c))))| $x85)))
(assert
 (let (($x87 (forall ((a Point) (L Line) )(let (($x49 (SameSide a a L)))
 (let (($x95 (On a L)))
 (let (($x80 (not $x95)))
 (=> $x80 $x49)))))
 ))
 (=> |ForAll([a, L], Implies(Not(On(a, L)), SameSide(a, a, L)))| $x87)))
(assert
 (let (($x102 (forall ((a Point) (b Point) (L Line) )(let (($x100 (SameSide a b L)))
 (=> $x100 (and (not (On a L))))))
 ))
 (=> |ForAll([a, b, L],
       Implies(SameSide(a, b, L), And(Not(On(a, L)))))| $x102)))
(assert
 (let (($x107 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x100 (SameSide b c L)))
 (let (($x103 (SameSide a c L)))
 (let (($x104 (SameSide a b L)))
 (let (($x105 (and $x104 $x103)))
 (=> $x105 $x100))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(SameSide(a, b, L), SameSide(a, c, L)),
               SameSide(b, c, L)))| $x107)))
(assert
 (let (($x119 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x100 (SameSide b c L)))
 (let (($x103 (SameSide a c L)))
 (let (($x104 (SameSide a b L)))
 (let (($x95 (On c L)))
 (let (($x80 (not $x95)))
 (let (($x30 (On b L)))
 (let (($x89 (not $x30)))
 (let (($x31 (On a L)))
 (let (($x116 (not $x31)))
 (let (($x117 (and $x116 $x89 $x80)))
 (=> $x117 (or $x104 $x103 $x100)))))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Not(On(a, L)),
                   Not(On(b, L)),
                   Not(On(c, L))),
               Or(SameSide(a, b, L),
                  SameSide(a, c, L),
                  SameSide(b, c, L))))| $x119)))
(assert
 (let (($x125 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x95 (On c L)))
 (let (($x80 (not $x95)))
 (let (($x30 (On b L)))
 (let (($x89 (not $x30)))
 (let (($x31 (On a L)))
 (let (($x116 (not $x31)))
 (let (($x123 (and $x116 $x89 $x80 (not (SameSide a b L)))))
 (=> $x123 (or (SameSide a c L) (SameSide b c L)))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Not(On(a, L)),
                   Not(On(b, L)),
                   Not(On(c, L)),
                   Not(SameSide(a, b, L))),
               Or(SameSide(a, c, L), SameSide(b, c, L))))| $x125)))
(assert
 (let (($x110 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x104 (SameSide a b L)))
 (let (($x103 (SameSide a c L)))
 (let (($x76 (Between a b c)))
 (let (($x108 (and $x76 $x103)))
 (=> $x108 $x104))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), SameSide(a, c, L)),
               SameSide(a, b, L)))| $x110)))
(assert
 (let (($x120 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x100 (SameSide b c L)))
 (let (($x30 (On b L)))
 (let (($x89 (not $x30)))
 (let (($x31 (On a L)))
 (let (($x76 (Between a b c)))
 (let (($x113 (and $x76 $x31 $x89)))
 (=> $x113 $x100))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c),
                   On(a, L),
                   Not(On(b, L))),
               SameSide(b, c, L)))| $x120)))
(assert
 (let (($x128 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x103 (SameSide a c L)))
 (let (($x112 (not $x103)))
 (let (($x30 (On b L)))
 (let (($x76 (Between a b c)))
 (let (($x126 (and $x76 $x30)))
 (=> $x126 $x112)))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Between(a, b, c), On(b, L)),
               Not(SameSide(a, c, L))))| $x128)))
(assert
 (let (($x148 (forall ((a Point) (b Point) (c Point) (L Line) (M Line) )(let (($x139 (Between a b c)))
 (let (($x33 (On b L)))
 (let (($x30 (On c M)))
 (let (($x31 (On b M)))
 (let (($x142 (On a M)))
 (let (($x29 (= L M)))
 (let (($x143 (not $x29)))
 (let (($x35 (not (= b c))))
 (let (($x145 (not (= a b))))
 (let (($x146 (and $x145 $x35 $x143 $x142 $x31 $x30 (not (SameSide a c L)) $x33)))
 (=> $x146 $x139))))))))))))
 ))
 (=> |ForAll([a, b, c, L, M],
       Implies(And(Not(a == b),
                   Not(b == c),
                   Not(L == M),
                   On(a, M),
                   On(b, M),
                   On(c, M),
                   Not(SameSide(a, c, L)),
                   On(b, L)),
               Between(a, b, c)))| $x148)))
(assert
 (let (($x160 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) (N Line) )(let (($x150 (not (SameSide b d M))))
 (let (($x31 (On d N)))
 (let (($x153 (On c M)))
 (let (($x157 (On a L)))
 (let (($x158 (and $x157 (On a M) (On a N) (On b L) $x153 $x31 (SameSide c d L) (SameSide b c N))))
 (=> $x158 $x150)))))))
 ))
 (=> |ForAll([a, b, c, d, L, M, N],
       Implies(And(On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   SameSide(b, c, N)),
               Not(SameSide(b, d, M))))| $x160)))
(assert
 (let (($x180 (forall ((a Point) (b Point) (c Point) (d Point) )(let (($x165 (SameSide b c N)))
 (let (($x167 (not (= b a))))
 (let (($x53 (On b L)))
 (let (($x178 (and (On a L) (On a M) (On a N) $x53 (On c M) (On d N) (SameSide c d L) (not (SameSide d b M)) (not (On d M)) $x167)))
 (=> $x178 $x165))))))
 ))
 (=> |ForAll([a, b, c, d],
       Implies(And(On(a, L),
                   On(a, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(c, d, L),
                   Not(SameSide(d, b, M)),
                   Not(On(d, M)),
                   Not(b == a)),
               SameSide(b, c, N)))| $x180)))
(assert
 (let (($x188 (forall ((a Point) (b Point) (c Point) (d Point) (e Point) (L Line) (M Line) (N Line) )(let (($x162 (SameSide c e L)))
 (let (($x163 (SameSide c e N)))
 (let (($x164 (SameSide d e M)))
 (let (($x181 (SameSide d c L)))
 (let (($x182 (SameSide b c N)))
 (let (($x142 (On d N)))
 (let (($x183 (On c M)))
 (let (($x157 (On b L)))
 (let (($x184 (On a N)))
 (let (($x185 (On a L)))
 (=> (and $x185 $x183 $x184 $x157 $x183 $x142 $x182 $x181 $x164 $x163) $x162))))))))))))
 ))
 (=> |ForAll([a, b, c, d, e, L, M, N],
       Implies(And(On(a, L),
                   On(c, M),
                   On(a, N),
                   On(b, L),
                   On(c, M),
                   On(d, N),
                   SameSide(b, c, N),
                   SameSide(d, c, L),
                   SameSide(d, e, M),
                   SameSide(c, e, N)),
               SameSide(c, e, L)))| $x188)))
(assert
 (let (($x195 (forall ((a Point) (b Point) (c Point) (alpha Circle) (L Line) )(let (($x189 (Between b a c)))
 (let (($x35 (not (= b c))))
 (let (($x30 (On c L)))
 (let (($x31 (On b L)))
 (let (($x142 (On a L)))
 (let (($x190 (Onc c alpha)))
 (let (($x191 (Onc b alpha)))
 (let (($x193 (and (Inside a alpha) $x191 $x190 $x142 $x31 $x30 $x35)))
 (=> $x193 $x189))))))))))
 ))
 (=> |ForAll([a, b, c, alpha, L],
       Implies(And(Inside(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha),
                   On(a, L),
                   On(b, L),
                   On(c, L),
                   Not(b == c)),
               Between(b, a, c)))| $x195)))
(assert
 (let (($x203 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x19 (Inside c alpha)))
 (let (($x90 (Between a c b)))
 (let (($x198 (Onc a alpha)))
 (let (($x200 (or (Inside a alpha) $x198)))
 (let (($x201 (and $x200 (or (Inside b alpha) (Onc b alpha)) $x90)))
 (=> $x201 $x19)))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Or(Inside(b, alpha), Onc(b, alpha)),
                   Between(a, c, b)),
               Inside(c, alpha)))| $x203)))
(assert
 (let (($x213 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x209 (and (not (Inside b alpha)) (not (Onc b alpha)))))
 (let (($x90 (Between a c b)))
 (let (($x19 (Inside c alpha)))
 (let (($x210 (not $x19)))
 (let (($x198 (Onc a alpha)))
 (let (($x200 (or (Inside a alpha) $x198)))
 (let (($x211 (and $x200 $x210 $x90)))
 (=> $x211 $x209)))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Not(Inside(c, alpha)),
                   Between(a, c, b)),
               And(Not(Inside(b, alpha)),
                   Not(Onc(b, alpha)))))| $x213)))
(assert
 (let (($x227 (forall ((a Point) (b Point) (c Point) (d Point) (alpha Circle) (beta Circle) )(let (($x218 (not (SameSide c d L))))
 (let (($x35 (not (= c d))))
 (let (($x133 (Onc d beta)))
 (let (($x190 (Onc d alpha)))
 (let (($x198 (Onc c beta)))
 (let (($x191 (Onc c alpha)))
 (let (($x225 (and $x191 $x198 $x190 $x133 (not (= alpha beta)) $x35 (On a L) (On b L) (Center a alpha) (Center a beta))))
 (=> $x225 $x218)))))))))
 ))
 (=> |ForAll([a, b, c, d, alpha, beta],
       Implies(And(Onc(c, alpha),
                   Onc(c, beta),
                   Onc(d, alpha),
                   Onc(d, beta),
                   Not(alpha == beta),
                   Not(c == d),
                   On(a, L),
                   On(b, L),
                   Center(a, alpha),
                   Center(a, beta)),
               Not(SameSide(c, d, L))))| $x227)))
(assert
 (let (($x216 (forall ((L Line) (M Line) (a Point) (b Point) )(let (($x131 (Intersectsll L M)))
 (let (($x205 (On b M)))
 (let (($x206 (On a M)))
 (let (($x214 (and $x206 $x205 (not (SameSide a b L)))))
 (=> $x214 $x131))))))
 ))
 (=> |ForAll([L, M, a, b],
       Implies(And(On(a, M),
                   On(b, M),
                   Not(SameSide(a, b, L))),
               Intersectsll(L, M)))| $x216)))
(assert
 (let (($x250 (forall ((alpha Circle) (L Line) (a Point) (b Point) )(let (($x237 (Intersectslc L alpha)))
 (let (($x244 (or (Inside b alpha) (Onc b alpha))))
 (let (($x248 (and (or (Inside a alpha) (Onc a alpha)) $x244 (not (On a L)) (not (On b L)) (not (SameSide a b L)))))
 (=> $x248 $x237)))))
 ))
 (=> |ForAll([alpha, L, a, b],
       Implies(And(Or(Inside(a, alpha), Onc(a, alpha)),
                   Or(Inside(b, alpha), Onc(b, alpha)),
                   Not(On(a, L)),
                   Not(On(b, L)),
                   Not(SameSide(a, b, L))),
               Intersectslc(L, alpha)))| $x250)))
(assert
 (let (($x230 (forall ((L Line) (alpha Circle) (a Point) )(let (($x111 (Intersectslc L alpha)))
 (let (($x205 (On a L)))
 (let (($x228 (and (Inside a alpha) $x205)))
 (=> $x228 $x111)))))
 ))
 (=> |ForAll([L, alpha, a],
       Implies(And(Inside(a, alpha), On(a, L)),
               Intersectslc(L, alpha)))| $x230)))
(assert
 (let (($x262 (forall ((alpha Circle) (beta Circle) (a Point) (b Point) )(let (($x254 (Intersectscc alpha beta)))
 (let (($x259 (Inside a beta)))
 (let (($x244 (or (Inside b alpha) (Onc b alpha))))
 (let (($x245 (Onc a alpha)))
 (let (($x260 (and $x245 $x244 $x259 (not (Inside b beta)) (not (Onc b beta)))))
 (=> $x260 $x254)))))))
 ))
 (=> |ForAll([alpha, beta, a, b],
       Implies(And(Onc(a, alpha),
                   Or(Inside(b, alpha), Onc(b, alpha)),
                   Inside(a, beta),
                   Not(Inside(b, beta)),
                   Not(Onc(b, beta))),
               Intersectscc(alpha, beta)))| $x262)))
(assert
 (let (($x235 (forall ((alpha Circle) (beta Circle) (a Point) (b Point) )(let (($x254 (Intersectscc alpha beta)))
 (let (($x255 (Onc b beta)))
 (let (($x259 (Inside a beta)))
 (let (($x257 (Inside b beta)))
 (let (($x245 (Onc a alpha)))
 (let (($x233 (and $x245 $x257 $x259 $x255)))
 (=> $x233 $x254))))))))
 ))
 (=> |ForAll([alpha, beta, a, b],
       Implies(And(Onc(a, alpha),
                   Inside(b, beta),
                   Inside(a, beta),
                   Onc(b, beta)),
               Intersectscc(alpha, beta)))| $x235)))
(assert
 (let (($x263 (forall ((a Point) (b Point) )(let (($x231 (= a b)))
 (=> (= 0.0 (Segment a b)) $x231)))
 ))
 (=> |ForAll([a, b], Implies(0 == Segment(a, b), a == b))| $x263)))
(assert
 (let (($x264 (forall ((a Point) )(let ((?x17 (Segment a a)))
 (= 0.0 ?x17)))
 ))
 (=> |ForAll(a, 0 == Segment(a, a))| $x264)))
(assert
 (let (($x266 (forall ((a Point) (b Point) )(let ((?x232 (Segment a b)))
 (<= 0.0 ?x232)))
 ))
 (=> |ForAll([a, b], 0 <= Segment(a, b))| $x266)))
(assert
 (let (($x270 (forall ((a Point) (b Point) )(let ((?x232 (Segment a b)))
 (= ?x232 (Segment b a))))
 ))
 (=> |ForAll([a, b], Segment(a, b) == Segment(b, a))| $x270)))
(assert
 (let (($x282 (forall ((a Point) (b Point) (c Point) )(let ((?x278 (Angle a b c)))
 (let (($x279 (= ?x278 (Angle c b a))))
 (let (($x60 (not (= a c))))
 (let (($x23 (= a b)))
 (let (($x58 (not $x23)))
 (let (($x280 (and $x58 $x60)))
 (=> $x280 $x279))))))))
 ))
 (=> |ForAll([a, b, c],
       Implies(And(Not(a == b), Not(a == c)),
               Angle(a, b, c) == Angle(c, b, a)))| $x282)))
(assert
 (let (($x276 (forall ((a Point) (b Point) (c Point) )(and (<= 0.0 (Angle a b c)) (<= (Angle a b c) (+ RightAngle RightAngle))))
 ))
 (=> |ForAll([a, b, c],
       And(0 <= Angle(a, b, c),
           Angle(a, b, c) <= RightAngle + RightAngle))| $x276)))
(assert
 (let (($x283 (forall ((a Point) (b Point) )(let ((?x271 (Area a a b)))
 (= 0.0 ?x271)))
 ))
 (=> |ForAll([a, b], 0 == Area(a, a, b))| $x283)))
(assert
 (let (($x286 (forall ((a Point) (b Point) (c Point) )(let ((?x284 (Area a b c)))
 (<= 0.0 ?x284)))
 ))
 (=> |ForAll([a, b, c], 0 <= Area(a, b, c))| $x286)))
(assert
 (let (($x296 (forall ((a Point) (b Point) (c Point) )(and (= (Area a b c) (Area c a b)) (= (Area a b c) (Area b a c))))
 ))
 (=> |ForAll([a, b, c],
       And(Area(a, b, c) == Area(c, a, b),
           Area(a, b, c) == Area(b, a, c)))| $x296)))
(assert
 (let (($x303 (forall ((a Point) (b Point) (c Point) )(let (($x63 (Between a b c)))
 (=> $x63 (= (+ (Segment a b) (Segment b c)) (Segment a c)))))
 ))
 (=> |ForAll([a, b, c],
       Implies(Between(a, b, c),
               Segment(a, b) + Segment(b, c) ==
               Segment(a, c)))| $x303)))
(assert
 (let (($x314 (forall ((a Point) (b Point) (c Point) (alpha Circle) (beta Circle) )(let (($x223 (= alpha beta)))
 (let (($x133 (Onc c beta)))
 (let (($x191 (Onc b alpha)))
 (let (($x312 (and (Center a alpha) (Center a beta) $x191 $x133 (= (Segment a b) (Segment a c)))))
 (=> $x312 $x223))))))
 ))
 (=> |ForAll([a, b, c, alpha, beta],
       Implies(And(Center(a, alpha),
                   Center(a, beta),
                   Onc(b, alpha),
                   Onc(c, beta),
                   Segment(a, b) == Segment(a, c)),
               alpha == beta))| $x314)))
(assert
 (let (($x319 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x45 (Onc c alpha)))
 (let ((?x305 (Segment a b)))
 (let ((?x306 (Segment a c)))
 (let (($x315 (= ?x306 ?x305)))
 (let (($x133 (Onc b alpha)))
 (let (($x316 (Center a alpha)))
 (let (($x317 (and $x316 $x133 $x315)))
 (=> $x317 $x45)))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha),
                   Onc(b, alpha),
                   Segment(a, c) == Segment(a, b)),
               Onc(c, alpha)))| $x319)))
(assert
 (let (($x328 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let ((?x305 (Segment a b)))
 (let ((?x306 (Segment a c)))
 (let (($x315 (= ?x306 ?x305)))
 (let (($x45 (Onc c alpha)))
 (let (($x133 (Onc b alpha)))
 (let (($x316 (Center a alpha)))
 (let (($x23 (= b c)))
 (let (($x58 (not $x23)))
 (let (($x94 (not (= a c))))
 (let (($x35 (not (= a b))))
 (let (($x326 (and $x35 $x94 $x58 $x316 $x133 $x45)))
 (=> $x326 $x315)))))))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Not(a == b),
                   Not(a == c),
                   Not(b == c),
                   Center(a, alpha),
                   Onc(b, alpha),
                   Onc(c, alpha)),
               Segment(a, c) == Segment(a, b)))| $x328)))
(assert
 (let (($x323 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let (($x19 (Inside c alpha)))
 (let ((?x305 (Segment a b)))
 (let ((?x306 (Segment a c)))
 (let (($x320 (< ?x306 ?x305)))
 (let (($x133 (Onc b alpha)))
 (let (($x316 (Center a alpha)))
 (=> (and $x316 $x133 $x320) $x19))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha),
                   Onc(b, alpha),
                   Segment(a, c) < Segment(a, b)),
               Inside(c, alpha)))| $x323)))
(assert
 (let (($x329 (forall ((a Point) (b Point) (c Point) (alpha Circle) )(let ((?x305 (Segment a b)))
 (let ((?x306 (Segment a c)))
 (let (($x320 (< ?x306 ?x305)))
 (let (($x19 (Inside c alpha)))
 (let (($x133 (Onc b alpha)))
 (let (($x316 (Center a alpha)))
 (let (($x324 (and $x316 $x133 $x19)))
 (=> $x324 $x320)))))))))
 ))
 (=> |ForAll([a, b, c, alpha],
       Implies(And(Center(a, alpha),
                   Onc(b, alpha),
                   Inside(c, alpha)),
               Segment(a, c) < Segment(a, b)))| $x329)))
(assert
 (let (($x345 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x95 (On c L)))
 (let (($x341 (and $x95 (not (Between c a b)))))
 (let (($x30 (On b L)))
 (let (($x31 (On a L)))
 (let (($x94 (not (= a c))))
 (let (($x35 (not (= a b))))
 (let (($x343 (and $x35 $x94 $x31 $x30)))
 (=> $x343 (= $x341 (= 0.0 (Angle b a c))))))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(Not(a == b),
                   Not(a == c),
                   On(a, L),
                   On(b, L)),
               And(On(c, L), Not(Between(c, a, b))) ==
               (0 == Angle(b, a, c))))| $x345)))
(assert
 (let (($x331 (forall ((a Point) (b Point) )(=> (not (= a b)) (= 0.0 (Angle a b a))))
 ))
 (=> |ForAll([a, b], Implies(Not(a == b), 0 == Angle(a, b, a)))| $x331)))
(assert
 (let (($x378 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) (M Line) )(let (($x363 (and (SameSide b d M) (SameSide d c L))))
 (let ((?x367 (Angle b a c)))
 (let (($x29 (= L M)))
 (let (($x143 (not $x29)))
 (let (($x30 (On d M)))
 (let (($x89 (not $x30)))
 (let (($x31 (On c M)))
 (let (($x153 (On b L)))
 (let (($x183 (On a L)))
 (let (($x376 (and $x183 $x153 (On a M) $x31 (not (= a b)) (not (= a c)) (not (On d L)) $x89 $x143)))
 (=> $x376 (= (= ?x367 (+ (Angle b a d) (Angle d a c))) $x363)))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L, M],
       Implies(And(On(a, L),
                   On(b, L),
                   On(a, M),
                   On(c, M),
                   Not(a == b),
                   Not(a == c),
                   Not(On(d, L)),
                   Not(On(d, M)),
                   Not(L == M)),
               (Angle(b, a, c) ==
                Angle(b, a, d) + Angle(d, a, c)) ==
               And(SameSide(b, d, M), SameSide(d, c, L))))| $x378)))
(assert
 (let (($x356 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) )(let (($x352 (= (= (Angle a c d) (Angle d c b)) (= (Angle a c d) RightAngle))))
 (let (($x95 (On d L)))
 (let (($x80 (not $x95)))
 (let (($x353 (Between a c b)))
 (let (($x31 (On b L)))
 (let (($x142 (On a L)))
 (let (($x354 (and $x142 $x31 $x353 $x80)))
 (=> $x354 $x352)))))))))
 ))
 (=> |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   Between(a, c, b),
                   Not(On(d, L))),
               (Angle(a, c, d) == Angle(d, c, b)) ==
               (Angle(a, c, d) == RightAngle)))| $x356)))
(assert
 (let (($x360 (forall ((a Point) (b Point) (c Point) (L Line) )(let (($x35 (not (= a b))))
 (let (($x30 (On b L)))
 (let (($x31 (On a L)))
 (let (($x358 (and $x31 $x30 $x35)))
 (=> $x358 (= (= 0.0 (Area a b c)) (On c L))))))))
 ))
 (=> |ForAll([a, b, c, L],
       Implies(And(On(a, L), On(b, L), Not(a == b)),
               (0 == Area(a, b, c)) == On(c, L)))| $x360)))
(assert
 (let (($x399 (forall ((a Point) (b Point) (c Point) (d Point) (L Line) )(let ((?x389 (Area a d b)))
 (let (($x353 (Between a c b)))
 (let (($x167 (not (= c b))))
 (let (($x145 (not (= a b))))
 (let (($x95 (On d L)))
 (let (($x80 (not $x95)))
 (let (($x30 (On c L)))
 (let (($x31 (On b L)))
 (let (($x142 (On a L)))
 (let (($x397 (and $x142 $x31 $x30 $x80 $x145 (not (= c a)) $x167)))
 (=> $x397 (= $x353 (= (+ (Area a c d) (Area d c b)) ?x389))))))))))))))
 ))
 (=> |ForAll([a, b, c, d, L],
       Implies(And(On(a, L),
                   On(b, L),
                   On(c, L),
                   Not(On(d, L)),
                   Not(a == b),
                   Not(c == a),
                   Not(c == b)),
               Between(a, c, b) ==
               (Area(a, c, d) + Area(d, c, b) ==
                Area(a, d, b))))| $x399)))
(assert
 (let (($x847 (not (= E1 F1))))
 (let (($x666 (not (= D1 F1))))
 (let (($x664 (not (= D1 E1))))
 (let (($x662 (not (= C1 F1))))
 (let (($x629 (not (= C1 E1))))
 (let (($x869 (not (= C1 D1))))
 (let (($x867 (not (= B1 F1))))
 (let (($x865 (not (= B1 E1))))
 (let (($x863 (not (= B1 D1))))
 (let (($x861 (not (= B1 C1))))
 (let (($x859 (not (= A1 F1))))
 (let (($x669 (not (= A1 E1))))
 (let (($x879 (not (= A1 D1))))
 (let (($x877 (not (= A1 C1))))
 (let (($x875 (not (= A1 B1))))
 (and $x875 $x877 $x879 $x669 $x859 $x861 $x863 $x865 $x867 $x869 $x629 $x662 $x664 $x666 $x847)))))))))))))))))
(assert
 (let (($x857 (not (= BC1 CA1))))
 (let (($x855 (not (= AB1 CA1))))
 (let (($x853 (not (= AB1 BC1))))
 (and $x853 $x855 $x857)))))
(assert
 (not (= FD1 GE1)))
(assert
 (not (= BF1 CG1)))
(assert
 true)
(assert
 (let (($x851 (On A1 AB1)))
 (=> |On(A1, AB1)| $x851)))
(assert
 (let (($x612 (On B1 AB1)))
 (=> |On(B1, AB1)| $x612)))
(assert
 (let (($x651 (not (On C1 AB1))))
 (=> |Not(On(C1, AB1))| $x651)))
(assert
 (let (($x654 (On B1 BC1)))
 (=> |On(B1, BC1)| $x654)))
(assert
 (let (($x655 (On C1 BC1)))
 (=> |On(C1, BC1)| $x655)))
(assert
 (let (($x656 (On C1 CA1)))
 (=> |On(C1, CA1)| $x656)))
(assert
 (let (($x657 (On A1 CA1)))
 (=> |On(A1, CA1)| $x657)))
(assert
 (let (($x660 (On D1 BC1)))
 (=> |On(D1, BC1)| $x660)))
(assert
 (let (($x837 (= (Angle D1 A1 B1) (Angle B1 C1 A1))))
 (=> |Angle(D1, A1, B1) == Angle(B1, C1, A1)| $x837)))
(assert
 (let (($x838 (On E1 BC1)))
 (=> |On(E1, BC1)| $x838)))
(assert
 (let (($x841 (= (Angle E1 A1 C1) (Angle C1 B1 A1))))
 (=> |Angle(E1, A1, C1) == Angle(C1, B1, A1)| $x841)))
(assert
 (let (($x844 (On F1 FD1)))
 (=> |On(F1, FD1)| $x844)))
(assert
 (let (($x642 (On D1 FD1)))
 (=> |On(D1, FD1)| $x642)))
(assert
 (let (($x645 (On A1 FD1)))
 (=> |On(A1, FD1)| $x645)))
(assert
 (let (($x649 (= (Segment F1 D1) (Segment D1 A1))))
 (=> |Segment(F1, D1) == Segment(D1, A1)| $x649)))
(assert
 (let (($x652 (On G1 GE1)))
 (=> |On(G1, GE1)| $x652)))
(assert
 (let (($x823 (On E1 GE1)))
 (=> |On(E1, GE1)| $x823)))
(assert
 (let (($x824 (On A1 GE1)))
 (=> |On(A1, GE1)| $x824)))
(assert
 (let (($x827 (= (Segment G1 E1) (Segment E1 A1))))
 (=> |Segment(G1, E1) == Segment(E1, A1)| $x827)))
(assert
 (let (($x830 (On B1 BF1)))
 (=> |On(B1, BF1)| $x830)))
(assert
 (let (($x833 (On F1 BF1)))
 (=> |On(F1, BF1)| $x833)))
(assert
 (let (($x834 (On C1 CG1)))
 (=> |On(C1, CG1)| $x834)))
(assert
 (let (($x607 (On G1 CG1)))
 (=> |On(G1, CG1)| $x607)))
(assert
 (let (($x643 (On H1 BF1)))
 (=> |On(H1, BF1)| $x643)))
(assert
 (let (($x812 (Center I1 OABC)))
 (=> |Center(I1, OABC)| $x812)))
(assert
 (let (($x813 (Onc A1 OABC)))
 (=> |Onc(A1, OABC)| $x813)))
(assert
 (let (($x814 (Onc B1 OABC)))
 (=> |Onc(B1, OABC)| $x814)))
(assert
 (let (($x815 (Onc C1 OABC)))
(=> |Onc(C1, OABC)| $x815)))
(check-sat)
