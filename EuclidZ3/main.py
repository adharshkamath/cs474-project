from z3 import *
from core import *


print("=== Loading Core ===")    

set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)
solver.push()
for ax in language.axioms:
    solver.assert_and_track(ax, str(ax))


print("=== Finished Loading Core ===")

# a b c = triangle a b c; p = on_line p b c, on_aline p a b b c a; q = on_line q b c, on_aline q a c c b a; m = mirror m a p; 
# n = mirror n a q; x = on_line x b m, on_line x c n; o = circle o a b c ? cong o x o a

# a, b, c, p, q, m, n, x, o
# A, B, C, D, E, F, G, H, I

A1, B1, C1, D1, E1, F1, G1, H1, I1 = Consts('A1 B1 C1 D1 E1 F1 G1 H1 I1', language.PointSort)
solver.add(simplify(Distinct(A1,B1,C1,D1,E1,F1), blast_distinct=True))

assumptions = []

AB1, BC1, CA1 = Consts('AB1 BC1 CA1', language.LineSort)
solver.add(simplify(Distinct(AB1,BC1,CA1), blast_distinct=True))

assumptions.append(language.OnLine(A1,AB1))
assumptions.append(language.OnLine(B1,AB1))
assumptions.append(Not(language.OnLine(C1,AB1)))

assumptions.append(language.OnLine(B1,BC1))
assumptions.append(language.OnLine(C1,BC1))

assumptions.append(language.OnLine(C1,CA1))
assumptions.append(language.OnLine(A1,CA1))

assumptions.append(language.OnLine(D1, BC1))
assumptions.append(language.Angle(D1, A1, B1) == language.Angle(B1, C1, A1))

assumptions.append(language.OnLine(E1, BC1))
assumptions.append(language.Angle(E1, A1, C1) == language.Angle(C1, B1, A1))

FD1, GE1 = Consts('FD1 GE1', language.LineSort)
solver.add(simplify(Distinct(FD1,GE1), blast_distinct=True))


assumptions.append(language.OnLine(F1,FD1))
assumptions.append(language.OnLine(D1,FD1))
assumptions.append(language.OnLine(A1,FD1))
assumptions.append(language.Segment(F1, D1) == language.Segment(D1, A1))


assumptions.append(language.OnLine(G1,GE1))
assumptions.append(language.OnLine(E1,GE1))
assumptions.append(language.OnLine(A1,GE1))
assumptions.append(language.Segment(G1, E1) == language.Segment(E1, A1))

BF1, CG1 = Consts('BF1 CG1', language.LineSort)
solver.add(simplify(Distinct(BF1,CG1), blast_distinct=True))

assumptions.append(language.OnLine(B1,BF1))
assumptions.append(language.OnLine(F1,BF1))
assumptions.append(language.OnLine(C1,CG1))
assumptions.append(language.OnLine(G1,CG1))

assumptions.append(language.OnLine(H1,BF1))

OABC = Const('OABC', language.CircleSort)
solver.add(simplify(Distinct(OABC), blast_distinct=True))

assumptions.append(language.Center(I1, OABC))
assumptions.append(language.OnCircle(A1, OABC))
assumptions.append(language.OnCircle(B1, OABC))
assumptions.append(language.OnCircle(C1, OABC))


print(">> Assume " + str(assumptions))
for a in assumptions:
    solver.assert_and_track(a, str(a))

solver.push()
solver.add(Not(language.Segment(I1, H1) == language.Segment(I1, A1)))

with open('raw1.smt2', 'w') as f:
    f.write(solver.to_smt2())

result = solver.check()
print("<< z3: " + str(result))

if result == sat:
    with open('model1.smt2', 'w') as f:
        f.write(str(solver.model()))
else:
    with open('unsat_core.smt2', 'w') as f:
        f.write(str(solver.unsat_core()))

print("==== Unloading Core ====")
solver.pop()
print("==== Exiting ====")


