import sys
sys.path.append("../../../")
from z3 import *
from system_e import *
from datetime import datetime

time = "test" #datetime.now().strftime("%Y_%m_%d_%H_%M_%S")
#set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)

systemE = SystemE(solver)

A, B, C, O, M, N = Consts("A B C O M N", systemE.PointSort)
solver.add(simplify(Distinct(A, B, C, O, M, N), blast_distinct=True))

AB, BC, CA, OM, ON, CN = Consts("AB BC CA OM ON CN", systemE.LineSort)
solver.add(simplify(Distinct(AB, BC, CA, OM, ON, CN), blast_distinct=True))

OABC = Const("OABC", systemE.CircleSort)
solver.add(simplify(Distinct(OABC), blast_distinct=True))

assumptions = []
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

assumptions.append(systemE.Angle(A, C, B) < systemE.RightAngle)

assumptions.append(systemE.OnLine(M, AB))
assumptions.append(systemE.Between(A, M, B))
assumptions.append(systemE.Segment(A, M) == systemE.Segment(M, B))

assumptions.append(systemE.Center(O, OABC))
assumptions.append(systemE.OnCircle(A, OABC))
assumptions.append(systemE.OnCircle(B, OABC))
assumptions.append(systemE.OnCircle(C, OABC))

assumptions.append(systemE.OnLine(N, OM))
assumptions.append(systemE.Between(O, M, N))
assumptions.append(systemE.OnCircle(N, OABC))

assumptions.append(
    Not(
        systemE.Angle(A,C,N) == systemE.Angle(B,C,N)
    )
)

print(">> Assume " + str(assumptions))
for a in assumptions:
    solver.assert_and_track(a, str(a))

result = solver.check()
print("<< z3: " + str(result))

with open(f"raw_{time}.smt2", "w") as f:
    f.write(solver.to_smt2())

statistics = solver.statistics()
with open(f"statistics_{time}.txt", "w") as f:
    f.write(str(statistics))

if result == sat:
    with open(f"model_{time}.smt2", "w") as f:
        model = solver.model()
        f.write(repr(model))
else:
    with open(f"unsat_core_{time}.smt2", "w") as f:
        f.write(str(solver.unsat_core()))
