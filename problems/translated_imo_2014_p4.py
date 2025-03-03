"""
translated_imo_2014_p4
a b c = triangle a b c; p = on_line p b c, on_aline p a b b c a; q = on_line q b c, on_aline q a c c b a; 
m = mirror m a p; n = mirror n a q; x = on_line x b m, on_line x c n; o = circle o a b c ? cong o x o a
"""

from z3 import *
from system_e import *
from datetime import datetime

time = "test" #datetime.now().strftime("%Y_%m_%d_%H_%M_%S")
set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)

systemE = SystemE(solver)

A, B, C, P, Q, M, N, D, O = Consts("A B C P Q M N D O", systemE.PointSort)
solver.add(simplify(Distinct(A, B, C, P, Q, M, N, D, O), blast_distinct=True))

AB, BC, CA, AM, AN, BM, CN = Consts("AB BC CA AM AN BM CN", systemE.LineSort)
solver.add(simplify(Distinct(AB, BC, CA, AM, AN, BM, CN), blast_distinct=True))

OABC = Const("OABC", systemE.CircleSort)
solver.add(simplify(Distinct(OABC), blast_distinct=True))

assumptions = []

# acute triangle ABC construction
assumptions.append(systemE.Intersectsll(AB, BC))
assumptions.append(systemE.Intersectsll(BC, CA))
assumptions.append(systemE.Intersectsll(CA, AB))
assumptions.append(systemE.OnLine(A, AB))
assumptions.append(systemE.OnLine(B, AB))
assumptions.append(Not(systemE.OnLine(C, AB)))
assumptions.append(systemE.OnLine(B, BC))
assumptions.append(systemE.OnLine(C, BC))
assumptions.append(Not(systemE.OnLine(A, BC)))
assumptions.append(systemE.OnLine(C, CA))
assumptions.append(systemE.OnLine(A, CA))
assumptions.append(Not(systemE.OnLine(B, CA)))
assumptions.append(systemE.Angle(A, B, C) < systemE.RightAngle)
assumptions.append(systemE.Angle(B, C, A) < systemE.RightAngle)
assumptions.append(systemE.Angle(C, A, B) < systemE.RightAngle)

#P & Q construction
assumptions.append(systemE.OnLine(P, BC)) #purposefully not retricting P to be on segment BC
assumptions.append(systemE.Angle(P, A, B) == systemE.Angle(B, C, A))

assumptions.append(systemE.OnLine(Q, BC))
assumptions.append(systemE.Angle(Q, A, C) == systemE.Angle(C, B, A))

#M & N construction
#AM:
assumptions.append(systemE.OnLine(A, AM))
assumptions.append(systemE.OnLine(M, AM))
assumptions.append(systemE.OnLine(P, AM))
assumptions.append(systemE.Between(A, P, M))
assumptions.append(systemE.Segment(A, P) == systemE.Segment(M, P))

#AN:
assumptions.append(systemE.OnLine(A, AN))
assumptions.append(systemE.OnLine(N, AN))
assumptions.append(systemE.OnLine(Q, AN))
assumptions.append(systemE.Between(A, Q, N))
assumptions.append(systemE.Segment(A, Q) == systemE.Segment(N, Q))

#BM:
assumptions.append(systemE.OnLine(B, BM))
assumptions.append(systemE.OnLine(M, BM))

#CN:
assumptions.append(systemE.OnLine(C, CN))
assumptions.append(systemE.OnLine(N, CN))

#intersection of BM and CN at D
assumptions.append(systemE.Intersectsll(BM, CN))
assumptions.append(systemE.OnLine(D, BM))
assumptions.append(systemE.OnLine(D, CN))
assumptions.append(systemE.Between(B, D, M))
assumptions.append(systemE.Between(C, D, N))

#assumptions.append(systemE.Center(O, OABC))
assumptions.append(systemE.OnCircle(A, OABC))
assumptions.append(systemE.OnCircle(B, OABC))
assumptions.append(systemE.OnCircle(C, OABC))

assumptions.append(
    Not(
        systemE.OnCircle( D, OABC)
    )
)

print(">> Assume " + str(assumptions))
for a in assumptions:
    solver.assert_and_track(a, str(a))


with open(f"raw_1_{time}.smt2", "w") as f:
    f.write(solver.to_smt2())

result = solver.check()
print("<< z3: " + str(result))

statistics = solver.statistics()
with open(f"statistics_{time}.txt", "w") as f:
    f.write(str(statistics))

if result == sat:
    with open(f"model_1_{time}.smt2", "w") as f:
        model = solver.model()
        f.write(repr(model))
else:
    with open(f"unsat_core_{time}.smt2", "w") as f:
        f.write(str(solver.unsat_core()))