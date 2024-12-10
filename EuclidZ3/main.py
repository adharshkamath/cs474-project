from z3 import *
from core import *
 
print("=== Loading Core ===")    

set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)
solver.push()
solver.add(language.axioms)


print("=== Finished Loading Core ===")

# a b = segment a b; c = on_bline c a b; d = on_line d a c; e = eqdistance e b a d, on_line e b c; f = on_line f a b, on_line f d e; 
# g = on_line g b c, on_pline g d a b ? cong d f f e

A1, B1, C1, D1, E1, F1 = Consts('A1 B1 C1 D1 E1 F1', language.PointSort)
solver.add(simplify(Distinct(A1,B1,C1,D1,E1,F1), blast_distinct=True))

BCA, FAE = Consts('BCA FAE', language.LineSort)
solver.add(simplify(Distinct(BCA,FAE), blast_distinct=True))

assumptions = []

assumptions.append(language.Segment(C1, A1) == language.Segment(C1, B1))

assumptions.append(language.OnLine(A1,BCA))
assumptions.append(language.OnLine(B1,BCA))
assumptions.append(language.OnLine(C1,BCA))

assumptions.append(language.Segment(C1, D1) == language.Segment(C1, A1))
assumptions.append(language.Angle(D1, B1, A1) == language.Angle(E1, B1, D1))

assumptions.append(language.OnLine(F1,FAE))
assumptions.append(language.OnLine(A1,FAE))
assumptions.append(language.OnLine(E1,FAE))

assumptions.append(language.Segment(F1, A1) == language.Segment(F1, E1))

assumptions.append(language.OnLine(A1,ADC))
assumptions.append(language.OnLine(D1,ADC))
assumptions.append(language.OnLine(C1,ADC))

assumptions.append(language.Segment(E1, B1) == language.Segment(A1, D1))

assumptions.append(language.OnLine(E1,ECB))
assumptions.append(language.OnLine(B1,ECB))
assumptions.append(language.OnLine(C1,ECB))

assumptions.append(language.OnLine(A1,AFB))
assumptions.append(language.OnLine(B1,AFB))
assumptions.append(language.OnLine(F1,AFB))

assumptions.append(language.OnLine(E1,EFD))
assumptions.append(language.OnLine(F1,EFD))
assumptions.append(language.OnLine(D1,EFD))

print(">> Assume " + str(assumptions))
solver.add(assumptions)
print("<< z3: " + str(solver.check()))

goal = language.Segment(D1, F1) == language.Segment(F1, E1)

print(">> Goal: " + str(goal))
solver.add(goal)
print("<< z3: " + str(solver.check()))
print(solver.model())


print("==== Unloading Core ====")
solver.pop()
print("==== Exiting ====")

