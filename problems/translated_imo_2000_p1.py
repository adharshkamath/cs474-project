"""
translated_imo_2000_p1
a b = segment a b; g1 = on_tline g1 a a b; g2 = on_tline g2 b b a; 
m = on_circle m g1 a, on_circle m g2 b; n = on_circle n g1 a, on_circle n g2 b; 
c = on_pline c m a b, on_circle c g1 a; d = on_pline d m a b, on_circle d g2 b; e = on_line e a c, on_line e b d; 
p = on_line p a n, on_line p c d; q = on_line q b n, on_line q c d ? cong e p e q

The original problem has an extra condition: "M lies closer to AB than X" which is not present in the translation.
But it is not necessary for the proof of the original problem.
"""

from z3 import *
from system_e import *
from datetime import datetime

time = datetime.now().strftime("%Y_%m_%d_%H_%M_%S")
set_param("parallel.enable", True)
solver = Solver()
solver.set(unsat_core=True)

systemE = SystemE(solver)

# G1 G2 A B C D E M N P Q
G1, G2, A, B, C, D, E, M, N, P, Q = Consts(
    "G1 G2 A B C D E M N P Q", systemE.PointSort
)
solver.add(simplify(Distinct(G1, G2, A, B, C, D, E, M, N, P, Q), blast_distinct=True))

AB, CD, CE, DE, AN, BN, EP, EQ = Consts(
    "AB CD CE DE AN BN EP EQ", systemE.LineSort
)
solver.add(simplify(Distinct(AB, CD, CE, DE, AN, BN, EP, EQ), blast_distinct=True))

OG1, On2 = Consts("OG1 On2", systemE.CircleSort)
solver.add(simplify(Distinct(OG1, On2), blast_distinct=True
))

assumptions = []

print(">> Assume " + str(assumptions))
for a in assumptions:
    solver.assert_and_track(a, str(a))


solver.add(Not(systemE.Segment(I1, H1) == systemE.Segment(I1, A1)))

with open(f'raw_1_{time}.smt2', 'w') as f:
    f.write(solver.to_smt2())

result = solver.check()
print("<< z3: " + str(result))

statistics = solver.statistics()
with open(f"statistics_{time}.txt", "w") as f:
    f.write(str(statistics))

if result == sat:
    with open(f'model_1_{time}.smt2', 'w') as f:
        f.write(str(solver.model()))
else:
    with open(f'unsat_core_{time}.smt2', 'w') as f:
        f.write(str(solver.unsat_core()))


    






