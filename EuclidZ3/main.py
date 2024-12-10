from z3 import *
from core import *
 
print("=== Loading Core ===")    

set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)
solver.push()
solver.add(language.axioms)


print("=== Finished Loading Core ===")

# a b c = triangle a b c; p = on_line p b c, on_aline p a b b c a; q = on_line q b c, on_aline q a c c b a; m = mirror m a p; 
# n = mirror n a q; x = on_line x b m, on_line x c n; o = circle o a b c ? cong o x o a

A1, B1, C1, M1, N1, P1, Q1, X1, O1 = Consts('A1 B1 C1 M1 N1 P1 Q1 X1 O1', language.PointSort)
solver.add(simplify(Distinct(A1,B1,C1,M1,N1,P1,Q1,X1,O1), blast_distinct=True))

AB1, BC1, CA1 = Consts('AB1 BC1 CA1', language.LineSort)
solver.add(simplify(Distinct(AB1,BC1,CA1), blast_distinct=True))

BM1, CN1 = Consts('BM1 CN1', language.LineSort)
solver.add(simplify(Distinct(BM1,CN1), blast_distinct=True))

OABC = Const('OABC', language.CircleSort)
solver.add(simplify(Distinct(OABC), blast_distinct=True))

assumptions = []

# assumptions.append(ForAll([A1, C1, AB1], Implies(And(language.OnLine(A1, AB1), Not(language.OnLine(C1, AB1))), Not(A1 == C1))))

assumptions.append(language.OnLine(A1,AB1))
assumptions.append(language.OnLine(B1,AB1))
assumptions.append(Not(language.OnLine(C1,AB1)))

assumptions.append(language.OnLine(B1,BC1))
assumptions.append(language.OnLine(C1,BC1))
assumptions.append(Not(language.OnLine(A1,BC1)))

assumptions.append(language.OnLine(C1,CA1))
assumptions.append(language.OnLine(A1,CA1))
assumptions.append(Not(language.OnLine(B1,CA1)))

# assumptions.append(language.OnLine(P,BC))
# assumptions.append(language.Angle(P, A, B) == language.Angle(B, C, A))

# assumptions.append(language.OnLine(Q,BC))
# assumptions.append(language.Angle(Q, A, C) == language.Angle(C, B, A))

# assumptions.append(language.Segment(P, A) == language.Segment(P, M))
# assumptions.append(language.Segment(Q, A) == language.Segment(Q, N))


# assumptions.append(language.Center(O, OABC))
# assumptions.append(language.OnCircle(A, OABC))
# assumptions.append(language.OnCircle(B, OABC))
# assumptions.append(language.OnCircle(C, OABC))


solver.add(assumptions)
solver.push()
print(">> Assume " + str(assumptions))
solver.add(True)
res = solver.check()
print("<< z3: " + str(res))
if res == unsat:
    print(solver.unsat_core())
if res == sat:
    print(solver.model())
solver.pop()

print("==== Unloading Core ====")
solver.pop()
print("==== Exiting ====")

