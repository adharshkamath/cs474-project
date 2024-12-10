from z3 import *
from core import *


o = Point("o")
a = Point("a")
alpha = Circle("alpha")
alpha.centerThrough(o,a)
print(str(alpha))

print("=== Loading Core ===")    

set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)
solver.push()
solver.add(language.axioms)


print("=== Finished Loading Core ===")

# a b = segment a b; c = on_bline c a b; d = on_line d a c; e = eqdistance e b a d, on_line e b c; f = on_line f a b, on_line f d e; 
# g = on_line g b c, on_pline g d a b ? cong d f f e

# a b c = triangle a b c; p = on_line p b c, on_aline p a b b c a; q = on_line q b c, on_aline q a c c b a; m = mirror m a p; 
# n = mirror n a q; x = on_line x b m, on_line x c n; o = circle o a b c ? cong o x o a

# a, b, c, p, q, m, n, x, o
# A, B, C, D, E, F, G, H, I

A1, B1, C1, D1, E1, F1, G1, H1, I1 = Consts('A1 B1 C1 D1 E1 F1 G1 H1 I1', language.PointSort)
solver.add(simplify(Distinct(A1,B1,C1,D1,E1,F1), blast_distinct=True))

# BCA, FAE, DF, BE = Consts('BCA FAE DF BE', language.LineSort)
# solver.add(simplify(Distinct(BCA,FAE), blast_distinct=True))

assumptions = []

AB1, BC1, CA1 = Consts('AB1 BC1 CA1', language.LineSort)
solver.add(simplify(Distinct(AB1,BC1,CA1), blast_distinct=True))

# assumptions.append(language.OnLine(A1,AB1))
# assumptions.append(language.OnLine(B1,AB1))
# assumptions.append(Not(language.OnLine(C1,AB1)))

# assumptions.append(language.OnLine(B1,BC1))
# assumptions.append(language.OnLine(C1,BC1))

# assumptions.append(language.OnLine(C1,CA1))
# assumptions.append(language.OnLine(A1,CA1))

# assumptions.append(language.OnLine(D1, BC1))
# assumptions.append(language.Angle(D1, A1, B1) == language.Angle(B1, C1, A1))

# assumptions.append(language.OnLine(E1, BC1))
# assumptions.append(language.Angle(E1, A1, C1) == language.Angle(C1, B1, A1))

# FD1, GE1 = Consts('FD1 GE1', language.LineSort)
# solver.add(simplify(Distinct(FD1,GE1), blast_distinct=True))

# assumptions.append(language.Segment(F1, D1) == language.Segment(D1, A1))

# assumptions.append(language.OnLine(F1,FD1))
# assumptions.append(language.OnLine(D1,FD1))
# assumptions.append(language.OnLine(A1,FD1))

# assumptions.append(language.Segment(G1, E1) == language.Segment(E1, A1))

# assumptions.append(language.OnLine(G1,GE1))
# assumptions.append(language.OnLine(E1,GE1))
# assumptions.append(language.OnLine(A1,GE1))

OABC = Const('OABC', language.CircleSort)
solver.add(simplify(Distinct(OABC), blast_distinct=True))

# assumptions.append(language.Center(I1, OABC))
# assumptions.append(language.OnCircle(A1, OABC))
# assumptions.append(language.OnCircle(B1, OABC))


# assumptions.append(language.Segment(C1, A1) == language.Segment(C1, B1))

# assumptions.append(language.OnLine(A1,BCA))
# assumptions.append(language.OnLine(B1,BCA))
# assumptions.append(language.OnLine(C1,BCA))

# assumptions.append(language.Segment(C1, D1) == language.Segment(C1, A1))
# assumptions.append(language.Angle(D1, B1, A1) == language.Angle(E1, B1, D1))

# assumptions.append(language.OnLine(F1,FAE))
# assumptions.append(language.OnLine(A1,FAE))
# assumptions.append(language.OnLine(E1,FAE))

# assumptions.append(language.Segment(F1, A1) == language.Segment(F1, E1))

# assumptions.append(language.OnLine(D1,DF))
# assumptions.append(language.OnLine(F1,DF))

# assumptions.append(language.OnLine(B1,BE))
# assumptions.append(language.OnLine(E1,BE))

print(">> Assume " + str(assumptions))
solver.add(assumptions)
print("<< z3: " + str(solver.check()))

# goal = Not(language.Intersectsll(DF, BE))

# print(">> Goal: " + str(goal))
# solver.add(goal)
# print("<< z3: " + str(solver.check()))
# print(solver.model())


print("==== Unloading Core ====")
solver.pop()
print("==== Exiting ====")

