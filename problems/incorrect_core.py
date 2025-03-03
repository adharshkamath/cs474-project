from z3 import *
from system_e import *
from datetime import datetime

time = "incorrect_core"

solver = Solver()
solver.set(unsat_core=True)

SystemE = SystemE(solver)

B, C, P = Consts("B C P", SystemE.PointSort)
solver.add(simplify(Distinct(B, C, P), blast_distinct=True))

BC = Const("BC", SystemE.LineSort)
solver.add(simplify(Distinct(BC), blast_distinct=True))

assumptions = []
assumptions.append(SystemE.OnLine(B, BC))
assumptions.append(SystemE.OnLine(C, BC))
assumptions.append(SystemE.OnLine(P, BC))

print(">> Assume " + str(assumptions))
for a in assumptions:
    solver.assert_and_track(a, str(a))

result = solver.check()
print("<< z3: " + str(result))

with open(f"raw_1_{time}.smt2", "w") as f:
    f.write(solver.to_smt2())

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