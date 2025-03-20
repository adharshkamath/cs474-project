import sys
sys.path.append("../")
from z3 import *
from system_e import *
from datetime import datetime

time = sys.argv[0] + datetime.now().strftime("%Y_%m_%d_%H_%M_%S")
set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)

systemE = SystemE(solver)

A, B, C, D, O = Consts("A B C D O", systemE.PointSort)
solver.add(simplify(Distinct(A, B, C, D, O), blast_distinct=True))

circle = Const("circle", systemE.CircleSort)
solver.add(simplify(Distinct(circle), blast_distinct=True))

assumptions = []
assumptions.append(systemE.Center(O, circle))
assumptions.append(systemE.OnCircle(A, circle))
assumptions.append(systemE.OnCircle(B, circle))
assumptions.append(systemE.OnCircle(C, circle))
assumptions.append(systemE.OnCircle(D, circle))

# negation of the conclusion
assumptions.append(
    Not(
        systemE.Angle(B,A,C) == systemE.Angle(B,D,C)
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

