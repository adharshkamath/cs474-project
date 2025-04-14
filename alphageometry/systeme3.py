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
        self.solver = solver

        self.PointSort = DeclareSort("Point")
        self.LineSort = DeclareSort("Line")
        self.CircleSort = DeclareSort("Circle")

        self.OnLine = Function("OnLine", self.PointSort, self.LineSort, BoolSort())
        self.SameSide = Function(
            "SameSide", self.PointSort, self.PointSort, self.LineSort, BoolSort()
        )
        self.Between = Function(
            "Between", self.PointSort, self.PointSort, self.PointSort, BoolSort()
        )
        self.OnCircle = Function("OnCircle", self.PointSort, self.CircleSort, BoolSort())
        self.InsideCircle = Function(
            "InsideCircle", self.PointSort, self.CircleSort, BoolSort()
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
        self.Triangle = Function(
            "Triangle", self.PointSort, self.PointSort, self.PointSort, BoolSort()
        )

        # Terms to define axioms over
        self.RightAngle = Const("RightAngle", RealSort())
        a, b, c, d, e, f = Consts("a b c d e f", self.PointSort)
        L, M, N = Consts("L M N", self.LineSort)
        alpha, beta = Consts("alpha beta", self.CircleSort)

        self.axioms = []
        self.axioms.append(self.RightAngle > RealVal(0.0))

        # Diagrammatic rules
        self.axioms.append(
            ForAll(
                [a, b, L, M],
                Implies(
                    And(self.distinctPointsOnLine(L, a, b),
                    self.OnLine(a, M),
                    self.OnLine(b, M)),
                ),
                L == M
            )
        )

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

    def distinctPointsOnLine(self, Line, *points):
        expressions = []
        for i in range(len(points)):
            for j in range(i + 1, len(points)):
                expressions.append(Not(points[i] == points[j]))
        for point in points:
            expressions.append(self.OnLine(point, Line))
        return expressions

if __name__ == "__main__":
    solver = Solver()
    SystemE(solver)
