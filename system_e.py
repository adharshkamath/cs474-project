"""
This encoding of System is taken directly from 
"A FORMAL SYSTEM FOR EUCLID'S ELEMENTS" by Avigad et. al.
"""

from z3 import *


class SystemE:
    def __init__(self, solver: Solver):
        """
        There are six sorts in system E: points, lines, circles, segments, angles, and areas.
        There are six basic relations in system E: on-line, same-side, between, on-circle, inside-circle, and center.
        There are three additional relations: circles-intersect, line-intersect-circle, lines-intersect.
        There are also three magnitude sorts: segment, angle, area.
        """

        self.PointSort = DeclareSort("Point")
        self.LineSort = DeclareSort("Line")
        self.CircleSort = DeclareSort("Circle")

        self.OnLine = Function("On", self.PointSort, self.LineSort, BoolSort())
        self.SameSide = Function(
            "SameSide", self.PointSort, self.PointSort, self.LineSort, BoolSort()
        )
        self.Between = Function(
            "Between", self.PointSort, self.PointSort, self.PointSort, BoolSort()
        )
        self.OnCircle = Function("Onc", self.PointSort, self.CircleSort, BoolSort())
        self.InsideCircle = Function(
            "Inside", self.PointSort, self.CircleSort, BoolSort()
        )
        self.Center = Function("Center", self.PointSort, self.CircleSort, BoolSort())

        self.Intersectsll = Function(
            "Intersectsll", self.LineSort, self.LineSort, BoolSort()
        )
        self.Intersectslc = Function(
            "Intersectslc", self.LineSort, self.CircleSort, BoolSort()
        )
        self.Intersectscc = Function(
            "Intersectscc", self.CircleSort, self.CircleSort, BoolSort()
        )
        self.Segment = Function("Segment", self.PointSort, self.PointSort, RealSort())
        self.Angle = Function(
            "Angle", self.PointSort, self.PointSort, self.PointSort, RealSort()
        )
        self.Area = Function(
            "Area", self.PointSort, self.PointSort, self.PointSort, RealSort()
        )

        # Terms to define axioms over
        self.RightAngle = Const("RightAngle", RealSort())
        a, b, c, d, e, f = Consts("a b c d e f", self.PointSort)
        L, M, N = Consts("L M N", self.LineSort)
        alpha, beta = Consts("alpha beta", self.CircleSort)

        self.axioms = []
        self.axioms.append(self.RightAngle > RealVal(0.0))

        """
        Section 3.4
        Generalities
        """

            self.axioms.append(
                ForAll(
                    [a, b, L, M],
                    Implies(
                        And(
                            Not(a == b),
                            self.OnLine(a, L),
                            self.OnLine(b, L),
                            self.OnLine(a, M),
                            self.OnLine(b, M),
                        ),
                        L == M,
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, alpha],
                    Implies(
                        And(self.Center(a, alpha), self.Center(b, alpha)),
                        a == b,
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, alpha],
                    Implies(self.Center(a, alpha), self.InsideCircle(a, alpha)),
                )
            )
            # self.axioms.append(
            #     ForAll(
            #         [a, alpha],
            #         Implies(self.InsideCircle(a, alpha), Not(self.OnCircle(a, alpha))),
            #     )
            # )

            """
            Between axioms
            """
            self.axioms.append(
                ForAll(
                    [a, b, c],
                    Implies(
                        self.Between(a, b, c),
                        And(
                            self.Between(c, b, a),
                            Not(a == b),
                            Not(a == c),
                            Not(self.Between(b, a, c)),
                        ),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(self.Between(a, b, c), self.OnLine(a, L), self.OnLine(b, L)),
                        self.OnLine(c, L),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(self.Between(a, b, c), self.OnLine(a, L), self.OnLine(c, L)),
                        self.OnLine(b, L),
                    ),
                )
            )
        
            self.axioms.append(
                ForAll(
                    [a, b, c, d],
                    Implies(
                        And(self.Between(a, b, c), self.Between(a, d, b)),
                        self.Between(a, d, c),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, d],
                    Implies(
                        And(self.Between(a, b, c), self.Between(b, c, d)),
                        self.Between(a, b, d),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(
                            self.OnLine(a, L),
                            self.OnLine(b, L),
                            self.OnLine(c, L),
                            Not(a == b),
                            Not(a == c),
                            Not(b == c),
                        ),
                        Or(
                            self.Between(a, b, c),
                            self.Between(b, a, c),
                            self.Between(a, c, b),
                        ),
                    ),
                )
            )
            # self.axioms.append(
            #     ForAll(
            #         [a, b, c, d],
            #         Implies(
            #             And(self.Between(a, b, c), self.Between(a, b, d)),
            #             Not(self.Between(c, b, d)),
            #         ),
            #     )
            # )

            """
            Same-side axioms
            """
            self.axioms.append(
                ForAll([a, L], Implies(Not(self.OnLine(a, L)), self.SameSide(a, a, L)))
            )
            self.axioms.append(
                ForAll([a, b, L], Implies(self.SameSide(a, b, L), self.SameSide(b, a, L)))
            ) # Join with below
            self.axioms.append(
                ForAll([a, b, L], Implies(self.SameSide(a, b, L), Not(self.OnLine(a, L))))
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(self.SameSide(a, b, L), self.SameSide(a, c, L)),
                        self.SameSide(b, c, L),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(
                            Not(self.OnLine(a, L)),
                            Not(self.OnLine(b, L)),
                            Not(self.OnLine(c, L)),
                            Not(self.SameSide(a, b, L)),
                        ),
                        Or(self.SameSide(a, c, L), self.SameSide(b, c, L)),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(
                            Not(self.OnLine(a, L)),
                            Not(self.OnLine(b, L)),
                            Not(self.OnLine(c, L)),
                        ),
                        Or(self.SameSide(a, c, L), self.SameSide(b, c, L), self.SameSide(a, b, L)),
                    ),
                )
            ) # New
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(
                            Not(self.OnLine(a, L)),
                            Not(self.OnLine(b, L)),
                            Not(self.OnLine(c, L)),
                            Not(self.SameSide(a, c, L)),
                            Not(self.SameSide(b, c, L))
                        ),
                        self.SameSide(a, b, L),
                    ),
                )
            ) # New

            """
            Pasch axioms
            """
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(self.Between(a, b, c), self.SameSide(a, c, L)),
                        self.SameSide(a, b, L),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(
                            self.Between(a, b, c), self.OnLine(a, L), Not(self.OnLine(b, L))
                        ),
                        self.SameSide(b, c, L),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L],
                    Implies(
                        And(self.Between(a, b, c), self.OnLine(b, L)),
                        Not(self.SameSide(a, c, L)),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, L, M],
                    Implies(
                        And(
                            Not(L == M),
                            # self.Intersectsll(L, M), # from smt
                            self.OnLine(b, L),
                            self.OnLine(b, M),
                            self.OnLine(a, M),
                            self.OnLine(c, M),
                            # Not(c == a),              # from smt
                            Not(a == b),
                            Not(b == c),
                            Not(self.SameSide(a, c, L)),
                        ),
                        self.Between(a, b, c),
                    ),
                )
            )

            """
            Triple-incidence axioms
            """
            self.axioms.append(
                ForAll(
                    [a, b, c, d, L, M, N],
                    Implies(
                        And(
                            # Not(L == M),  # Not specified in the paper # from smt
                            # Not(L == N),  # Not specified in the paper # from smt
                            # Not(M == N),  # Not specified in the paper # from smt
                            # self.Intersectsll(L, M),      # from smt
                            # self.Intersectsll(M, N),      # from smt
                            # self.Intersectsll(L, N),      # from smt
                            self.OnLine(a, L),
                            self.OnLine(a, M),
                            self.OnLine(a, N),
                            self.OnLine(b, L),
                            self.OnLine(c, M),
                            self.OnLine(d, N),
                            self.SameSide(c, d, L),
                            self.SameSide(b, c, N),
                        ),
                        Not(self.SameSide(b, d, M)),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, d, L, M, N],
                    Implies(
                        And(
                            # Same as above
                            # Not(L == M),  # Not specified in the paper
                            # Not(L == N),  # Not specified in the paper
                            # Not(M == N),  # Not specified in the paper
                            # self.Intersectsll(L, M),
                            # self.Intersectsll(M, N),
                            # self.Intersectsll(L, N),
                            self.OnLine(a, L),
                            self.OnLine(a, M),
                            self.OnLine(a, N),
                            self.OnLine(b, L),
                            self.OnLine(c, M),
                            self.OnLine(d, N),
                            self.SameSide(c, d, L),
                            Not(self.SameSide(b, d, M)),
                            Not(self.OnLine(d, M)),
                            Not(b == a),
                        ),
                        self.SameSide(b, c, N),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, d, e, L, M, N],
                    Implies(
                        And(
                            # Same as above
                            # Not(L == M),  # Not specified in the paper
                            # Not(L == N),  # Not specified in the paper
                            # Not(M == N),  # Not specified in the paper
                            # self.Intersectsll(L, M),
                            # self.Intersectsll(M, N),
                            # self.Intersectsll(L, N),
                            self.OnLine(a, L),
                            self.OnLine(a, M),
                            self.OnLine(a, N),
                            self.OnLine(b, L),
                            self.OnLine(c, M),
                            self.OnLine(d, N),
                            self.SameSide(b, c, N),
                            self.SameSide(c, d, L),
                            self.SameSide(d, e, M),
                            self.SameSide(c, e, N),
                        ),
                        self.SameSide(c, e, L),
                    ),
                )
            )

            """
            Circle axioms
            """
            self.axioms.append(
                ForAll(
                    [a, b, c, L, alpha],
                    Implies(
                        And(
                            self.OnLine(a, L),
                            self.OnLine(b, L),
                            self.OnLine(c, L),
                            self.InsideCircle(a, alpha),
                            self.OnCircle(b, alpha),
                            self.OnCircle(c, alpha),
                            Not(b == c),
                        ),
                        self.Between(b, a, c),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, alpha],
                    Implies(
                        And(
                            Or(self.OnCircle(a, alpha), self.InsideCircle(a, alpha)),
                            Or(self.OnCircle(b, alpha), self.InsideCircle(b, alpha)),
                            self.Between(a, c, b),
                        ),
                        self.InsideCircle(c, alpha),
                    ),
                )
            )
            self.axioms.append(
                ForAll(
                    [a, b, c, alpha],
                    Implies(
                        And(
                            Or(self.InsideCircle(a, alpha), self.OnCircle(a, alpha)),
                            Not(self.InsideCircle(c, alpha)),
                            self.Between(a, c, b),
                        ),
                        And(Not(self.InsideCircle(b, alpha)), Not(self.OnCircle(b, alpha))),
                    ),
                )
            )
        self.axioms.append(
            ForAll(
                [a, b, c, d, L, alpha, beta],
                Implies(
                    And(
                        Not(alpha == beta),
                        self.Intersectscc(alpha, beta),
                        self.OnCircle(c, alpha),
                        self.OnCircle(c, beta),
                        self.OnCircle(d, alpha),
                        self.OnCircle(d, beta),
                        Not(c == d),
                        self.Center(a, alpha),
                        self.Center(b, beta),
                        self.OnLine(a, L),
                        self.OnLine(b, L),
                    ),
                    Not(self.SameSide(c, d, L)),
                ),
            )
        )

        """
        Intersection axioms
        """
        self.axioms.append(
            ForAll(
                [a, b, L, M],
                Implies(
                    And(
                        Not(self.SameSide(a, b, L)),
                        self.OnLine(a, M),
                        self.OnLine(b, M),
                    ),
                    self.Intersectsll(L, M),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, L, alpha],
                Implies(
                    And(
                        Or(self.OnCircle(a, alpha), self.InsideCircle(a, alpha)),
                        Or(self.OnCircle(b, alpha), self.InsideCircle(b, alpha)),
                        Not(self.SameSide(a, b, L)),
                    ),
                    self.Intersectslc(L, alpha),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, L, alpha],
                Implies(
                    And(
                        self.InsideCircle(a, alpha),
                        self.OnLine(a, L),
                    ),
                    self.Intersectslc(L, alpha),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, alpha, beta],
                Implies(
                    And(
                        self.OnCircle(a, alpha),
                        Or(self.OnCircle(b, alpha), self.InsideCircle(b, alpha)),
                        self.InsideCircle(a, beta),
                        Not(self.OnCircle(b, beta)),
                        Not(self.InsideCircle(b, beta)),
                    ),
                    self.Intersectscc(alpha, beta),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, alpha, beta],
                Implies(
                    And(
                        self.OnCircle(a, alpha),
                        self.InsideCircle(b, alpha),
                        self.InsideCircle(a, beta),
                        self.OnCircle(b, beta),
                    ),
                    self.Intersectscc(alpha, beta),
                ),
            )
        )

        """
        Section 3.5 Metric Inferences
        Metric axioms
        """
        self.axioms.append(
            ForAll(
                [a, b],
                And(
                    Implies(a == b, self.Segment(a, b) == RealVal(0.0)),
                    Implies(self.Segment(a, b) == RealVal(0.0), a == b),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b],
                self.Segment(a, b) >= RealVal(0.0),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b],
                self.Segment(a, b) == self.Segment(b, a),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c],
                Implies(
                    And(Not(a == b), Not(a == c)),
                    self.Angle(a, b, c) == self.Angle(c, b, a),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c],
                And(
                    self.Angle(a, b, c) >= RealVal(0.0),
                    self.Angle(a, b, c) <= self.RightAngle + self.RightAngle,
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b],
                self.Area(a, a, b) == RealVal(0.0),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c],
                self.Area(a, b, c) >= RealVal(0.0),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c],
                And(
                    self.Area(a, b, c) == self.Area(c, a, b),
                    self.Area(a, b, c) == self.Area(a, c, b),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, d, e, f],
                Implies(
                    And(
                        self.Segment(a, b) == self.Segment(d, e),
                        self.Segment(b, c) == self.Segment(e, f),
                        self.Segment(c, a) == self.Segment(f, d),
                        self.Angle(a, b, c) == self.Angle(d, e, f),
                        self.Angle(b, c, a) == self.Angle(e, f, d),
                        self.Angle(c, a, b) == self.Angle(f, d, e),
                    ),
                    self.Area(a, b, c) == self.Area(d, e, f),
                ),
            )
        )

        """
        Section 3.6 Transfer inferences
        Diagram segment transfer axioms
        """
        self.axioms.append(
            ForAll(
                [a, b, c],
                Implies(
                    self.Between(a, b, c),
                    self.Segment(a, c) == self.Segment(a, b) + self.Segment(b, c),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, alpha, beta],
                Implies(
                    And(
                        self.Center(a, alpha),
                        self.Center(a, beta),
                        self.OnCircle(b, alpha),
                        self.OnCircle(c, beta),
                        self.Segment(a, b) == self.Segment(a, c),
                    ),
                    alpha == beta,
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, alpha],
                Implies(
                    And(self.Center(a, alpha), self.OnCircle(b, alpha)),
                    And(
                        Implies(
                            self.OnCircle(c, alpha),
                            self.Segment(a, b) == self.Segment(a, c),
                        ),
                        Implies(
                            self.Segment(a, b) == self.Segment(a, c),
                            self.OnCircle(c, alpha),
                        ),
                    ),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, alpha],
                Implies(
                    And(self.Center(a, alpha), self.OnCircle(b, alpha)),
                    And(
                        Implies(
                            self.InsideCircle(c, alpha),
                            self.Segment(a, c) < self.Segment(a, b),
                        ),
                        Implies(
                            self.Segment(a, c) < self.Segment(a, b),
                            self.InsideCircle(c, alpha),
                        ),
                    ),
                ),
            )
        )

        """
        Diagram angle transfer axioms
        """
        self.axioms.append(
            ForAll(
                [a, b, c, L],
                Implies(
                    And(
                        Not(a == b),
                        Not(a == c),
                        self.OnLine(a, L),
                        self.OnLine(b, L),
                    ),
                    And(
                        Implies(
                            And(self.OnLine(c, L), Not(self.Between(b, a, c))),
                            self.Angle(b, a, c) == RealVal(0.0),
                        ),
                        Implies(
                            self.Angle(b, a, c) == RealVal(0.0),
                            And(self.OnLine(c, L), Not(self.Between(b, a, c))),
                        ),
                    ),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, d, L, M],
                Implies(
                    And(
                        self.OnLine(a, L),
                        self.OnLine(a, M),
                        self.Intersectsll(L, M),
                        self.OnLine(b, L),
                        self.OnLine(c, M),
                        Not(a == b),
                        Not(a == c),
                        Not(self.OnLine(d, L)),
                        Not(self.OnLine(d, M)),
                        Not(L == M),
                    ),
                    And(
                        Implies(
                            self.Angle(b, a, c)
                            == self.Angle(b, a, d) + self.Angle(d, a, c),
                            And(self.SameSide(b, d, M), self.SameSide(c, d, L)),
                        ),
                        Implies(
                            And(self.SameSide(b, d, M), self.SameSide(c, d, L)),
                            self.Angle(b, a, c)
                            == self.Angle(b, a, d) + self.Angle(d, a, c),
                        ),
                    ),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, d, L],
                Implies(
                    And(
                        self.OnLine(a, L),
                        self.OnLine(b, L),
                        self.Between(a, c, b),
                        Not(self.OnLine(d, L)),
                    ),
                    And(
                        Implies(
                            self.Angle(a, c, d) == self.Angle(d, c, b),
                            self.Angle(a, c, d) == self.RightAngle,
                        ),
                        Implies(
                            self.Angle(a, c, d) == self.RightAngle,
                            self.Angle(a, c, d) == self.Angle(d, c, b),
                        ),
                    ),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, d, e, L, M],
                Implies(
                    And(
                        self.OnLine(a, L),
                        self.OnLine(b, L),
                        self.OnLine(d, L),
                        self.OnLine(a, M),
                        self.OnLine(c, M),
                        self.OnLine(e, M),
                        Not(b == a),
                        Not(d == a),
                        Not(c == a),
                        Not(e == a),
                        Not(self.Between(b, a, d)),
                        Not(self.Between(c, a, e)),
                    ),
                    self.Angle(b, a, c) == self.Angle(d, a, e),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, d, e, L, M, N],
                Implies(
                    And(
                        self.OnLine(a, L),
                        self.OnLine(b, L),
                        self.OnLine(b, M),
                        self.OnLine(c, M),
                        self.OnLine(c, N),
                        self.OnLine(d, N),
                        Not(b == c),
                        self.SameSide(a, d, N),
                        self.Angle(a, b, c) + self.Angle(b, c, d)
                        < self.RightAngle + self.RightAngle,
                    ),
                    And(
                        self.Intersectsll(L, N),
                        Implies(
                            And(self.OnLine(e, L), self.OnLine(e, N)),
                            self.SameSide(a, e, M),
                        ),
                    ),
                ),
            )
        )

        """
        Diagram area transfer axioms
        """
        self.axioms.append(
            ForAll(
                [a, b, c, L],
                Implies(
                    And(self.OnLine(a, L), self.OnLine(b, L), Not(a == b)),
                    And(
                        Implies(
                            self.OnLine(c, L),
                            self.Area(a, b, c) == RealVal(0.0),
                        ),
                        Implies(
                            self.Area(a, b, c) == RealVal(0.0),
                            self.OnLine(c, L),
                        ),
                    ),
                ),
            )
        )
        self.axioms.append(
            ForAll(
                [a, b, c, d, L],
                Implies(
                    And(
                        self.OnLine(a, L),
                        self.OnLine(b, L),
                        self.OnLine(c, L),
                        Not(a == b),
                        Not(a == c),
                        Not(b == c),
                        Not(self.OnLine(d, L)),
                    ),
                    And(
                        Implies(
                            self.Between(a, c, b),
                            self.Area(a, c, d) + self.Area(d, c, b)
                            == self.Area(a, d, b),
                        ),
                        Implies(
                            self.Area(a, c, d) + self.Area(d, c, b)
                            == self.Area(a, d, b),
                            self.Between(a, c, b),
                        ),
                    ),
                ),
            ),
        )

        """
        Custom axioms
        """
        self.axioms.append(
            ForAll(
                [a, L, M],
                Implies(
                    self.Intersectsll(L, M),
                    Exists([a], And(self.OnLine(a, L), self.OnLine(a, M))),
                ),
            )
        )
        self.axioms.append(
            ForAll([a, b], Implies(Not(a == b), self.Segment(a, b) > RealVal(0.0)))
        )
        self.axioms.append(
            ForAll(
                [L, a, b],
                Implies(
                    And(self.OnLine(a, L), self.OnLine(b, L), Not(a == b)),
                    self.Segment(a, b) > RealVal(0.0),
                ),
            )
        )
        self.axioms.append(ForAll([a, alpha], Exists([a], self.OnCircle(a, alpha))))
        self.axioms.append(
            ForAll(
                [a, alpha, c],
                Implies(
                    self.Center(c, alpha),
                    Exists(
                        [a],
                        And(
                            self.OnCircle(a, alpha),
                            Not(self.Segment(c, a) == RealVal(0.0)),
                        ),
                    ),
                ),
            )
        )
        # self.axioms.append(
        #     ForAll(
        #         [a, b, c, L],
        #         Implies(
        #             And(
        #                 Not(a == b),
        #                 Not(b == c),
        #                 Not(a == c),
        #                 Not(
        #                     And(self.OnLine(a, L), self.OnLine(b, L), self.OnLine(c, L))
        #                 ),
        #             ),
        #             self.Angle(a, b, c) > RealVal(0.0),
        #         ),
        #     )
        # )

        for axiom in self.axioms:
            solver.add(axiom)

        check = solver.check()
        print(">> Axioms set: ", check)
        if check == sat:
            print(solver.model())
            model = solver.model()
            smt2 = solver.to_smt2()
            with open("e.smt2", "w") as f:
                f.write(smt2)
            with open("e.model", "w") as f:
                f.write(str(model))


if __name__ == "__main__":
    solver = Solver()
    SystemE(solver)
