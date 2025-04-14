from z3 import *
from system_e import SystemE

set_param("parallel.enable", True)
# set_param("model.compact", False)
solver = Solver()
solver.set(unsat_core=True)
systemE = SystemE(solver)
print(">> Let p q r be distinct points")
p, q, r = Consts('p q r', systemE.PointSort)
solver.add(simplify(Distinct(p,q,r), blast_distinct=True))


print(">> Let M N be distinct lines")
M, N = Consts('M N', systemE.LineSort)
solver.add(simplify(Distinct(M,N), blast_distinct=True))
print(solver.check())
assumptions = []
assumptions.append(systemE.OnLine(p, N))
assumptions.append(systemE.OnLine(q, N))
assumptions.append(systemE.OnLine(r, N))
assumptions.append(Not(p == q))
assumptions.append(Not(p == r))
assumptions.append(Not(q == r))
print(">> Assume " + str(assumptions))
solver.add(assumptions)
print("      << z3: " + str(solver.check()))
if solver.check() == sat:
    model = solver.model()
    with open("e.model", "w") as f:
        f.write(repr(model))
    # print(solver.model())
else:
    print(unsat)
    print(solver.unsat_core())