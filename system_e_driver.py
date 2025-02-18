from z3 import *
from system_e import *


set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)

systemE = SystemE(solver)

# a b c = triangle a b c; p = on_line p b c, on_aline p a b b c a; q = on_line q b c, on_aline q a c c b a; m = mirror m a p; 
# n = mirror n a q; x = on_line x b m, on_line x c n; o = circle o a b c ? cong o x o a

# a, b, c, p, q, m, n, x, o
# A, B, C, D, E, F, G, H, I

A1, B1, C1, D1, E1, F1, G1, H1, I1 = Consts('A1 B1 C1 D1 E1 F1 G1 H1 I1', systemE.PointSort)
solver.add(simplify(Distinct(A1,B1,C1,D1,E1,F1), blast_distinct=True))

assumptions = []

AB1, BC1, CA1 = Consts('AB1 BC1 CA1', systemE.LineSort)
solver.add(simplify(Distinct(AB1,BC1,CA1), blast_distinct=True))

assumptions.append(systemE.Intersectsll(AB1, BC1))
assumptions.append(systemE.Intersectsll(BC1, CA1))
assumptions.append(systemE.Intersectsll(CA1, AB1))

assumptions.append(systemE.OnLine(A1,AB1))
assumptions.append(systemE.OnLine(B1,AB1))
assumptions.append(Not(systemE.OnLine(C1,AB1)))

assumptions.append(systemE.OnLine(B1,BC1))
assumptions.append(systemE.OnLine(C1,BC1))
assumptions.append(Not(systemE.OnLine(A1,BC1)))

assumptions.append(systemE.OnLine(C1,CA1))
assumptions.append(systemE.OnLine(A1,CA1))
assumptions.append(Not(systemE.OnLine(B1,CA1)))

assumptions.append(systemE.OnLine(D1, BC1))
assumptions.append(systemE.Angle(D1, A1, B1) == systemE.Angle(B1, C1, A1))

assumptions.append(systemE.OnLine(E1, BC1))
assumptions.append(systemE.Angle(E1, A1, C1) == systemE.Angle(C1, B1, A1))

FD1, GE1 = Consts('FD1 GE1', systemE.LineSort)
solver.add(simplify(Distinct(FD1,GE1), blast_distinct=True))


assumptions.append(systemE.OnLine(F1,FD1))
assumptions.append(systemE.OnLine(D1,FD1))
assumptions.append(systemE.OnLine(A1,FD1))
assumptions.append(systemE.Segment(F1, D1) == systemE.Segment(D1, A1))


assumptions.append(systemE.OnLine(G1,GE1))
assumptions.append(systemE.OnLine(E1,GE1))
assumptions.append(systemE.OnLine(A1,GE1))
assumptions.append(systemE.Segment(G1, E1) == systemE.Segment(E1, A1))

BF1, CG1 = Consts('BF1 CG1', systemE.LineSort)
solver.add(simplify(Distinct(BF1,CG1), blast_distinct=True))

assumptions.append(systemE.OnLine(B1,BF1))
assumptions.append(systemE.OnLine(F1,BF1))
assumptions.append(systemE.OnLine(C1,CG1))
assumptions.append(systemE.OnLine(G1,CG1))

assumptions.append(systemE.OnLine(H1,BF1))

OABC = Const('OABC', systemE.CircleSort)
solver.add(simplify(Distinct(OABC), blast_distinct=True))

assumptions.append(systemE.Center(I1, OABC))
assumptions.append(systemE.OnCircle(A1, OABC))
assumptions.append(systemE.OnCircle(B1, OABC))
assumptions.append(systemE.OnCircle(C1, OABC))


print(">> Assume " + str(assumptions))
for a in assumptions:
    solver.assert_and_track(a, str(a))

solver.add(Not(systemE.Segment(I1, H1) == systemE.Segment(I1, A1)))

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



