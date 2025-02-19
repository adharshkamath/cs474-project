from z3 import *
from system_e import *
from datetime import datetime

time = datetime.now().strftime("%Y_%m_%d_%H_%M_%S")
set_param("parallel.enable", True)
set_param("model.compact", False)
set_param("verbose", 1)
set_param("trace", True)
set_param("trace_file_name", f"trace_{time}.log")

solver = Solver()
solver.set(unsat_core=True)

systemE = SystemE(solver)

# Points $D$ and $E$ lie on side $BC$ of acute-angled $\triangle{ABC}$ so that $\angle{DAB}=\angle{BCA}$
# and $\angle{CAE}=\angle{ABC}$. Points $F$ and $G$ lie on lines $AD$ and $AE$, respectively, such that
# $D$ is the midpoint of $AF$, and $E$ is the midpoint of $AG$. Prove that lines $BF$ and $CG$ intersect
# on the circumcircle of $\triangle{ABC}$.

# a, b, c, p, q, m, n, x, o
# A, B, C, D, E, F, G, H, I, J

A1, B1, C1, D1, E1, F1, G1, H1, I1, J1 = Consts(
    "A1 B1 C1 D1 E1 F1 G1 H1 I1 J1", systemE.PointSort
)
solver.add(simplify(Distinct(A1, B1, C1, D1, E1, F1), blast_distinct=True))

AB1, BC1, CA1, AD1, AE1, BF1, CG1, IA1 = Consts(
    "AB1 BC1 CA1 AD1 AE1 BF1 CG1 IA1", systemE.LineSort
)
solver.add(simplify(Distinct(AB1, BC1, CA1, AD1, AE1, BF1, CG1), blast_distinct=True))

OABC = Const("OABC", systemE.CircleSort)
solver.add(simplify(Distinct(OABC), blast_distinct=True))


assumptions = []


assumptions.append(systemE.Intersectsll(AB1, BC1))
assumptions.append(systemE.Intersectsll(BC1, CA1))
assumptions.append(systemE.Intersectsll(CA1, AB1))

assumptions.append(systemE.OnLine(A1, AB1))
assumptions.append(systemE.OnLine(B1, AB1))
assumptions.append(Not(systemE.OnLine(C1, AB1)))

assumptions.append(systemE.OnLine(B1, BC1))
assumptions.append(systemE.OnLine(C1, BC1))
assumptions.append(Not(systemE.OnLine(A1, BC1)))

assumptions.append(systemE.OnLine(C1, CA1))
assumptions.append(systemE.OnLine(A1, CA1))
assumptions.append(Not(systemE.OnLine(B1, CA1)))

assumptions.append(systemE.Angle(A1, B1, C1) < systemE.RightAngle)
assumptions.append(systemE.Angle(B1, A1, C1) < systemE.RightAngle)
assumptions.append(systemE.Angle(A1, C1, B1) < systemE.RightAngle)

assumptions.append(systemE.OnLine(D1, BC1))
assumptions.append(systemE.Between(B1, D1, C1))
assumptions.append(systemE.Angle(D1, A1, B1) == systemE.Angle(B1, C1, A1))

assumptions.append(systemE.OnLine(A1, AD1))
assumptions.append(systemE.OnLine(D1, AD1))
assumptions.append(systemE.Intersectsll(AD1, BC1))


assumptions.append(systemE.OnLine(E1, BC1))
assumptions.append(systemE.Between(B1, E1, C1))
assumptions.append(systemE.Angle(E1, A1, C1) == systemE.Angle(C1, B1, A1))

assumptions.append(systemE.OnLine(A1, AE1))
assumptions.append(systemE.OnLine(E1, AE1))
assumptions.append(systemE.Intersectsll(AE1, BC1))

assumptions.append(systemE.OnLine(F1, AD1))
assumptions.append(systemE.Between(A1, D1, F1))
assumptions.append(systemE.Segment(F1, D1) == systemE.Segment(D1, A1))


assumptions.append(systemE.OnLine(G1, AE1))
assumptions.append(systemE.Between(A1, E1, G1))
assumptions.append(systemE.Segment(G1, E1) == systemE.Segment(E1, A1))


assumptions.append(systemE.OnLine(B1, BF1))
assumptions.append(systemE.OnLine(F1, BF1))
assumptions.append(systemE.OnLine(C1, CG1))
assumptions.append(systemE.OnLine(G1, CG1))


assumptions.append(systemE.Center(I1, OABC))
assumptions.append(systemE.OnCircle(A1, OABC))
assumptions.append(systemE.OnCircle(B1, OABC))
assumptions.append(systemE.OnCircle(C1, OABC))

assumptions.append(
    Not(
        And(
            systemE.Intersectsll(BF1, CG1),
            systemE.Intersectslc(BF1, OABC),
            systemE.Intersectslc(CG1, OABC),
            Exists(
                [H1],
                And(
                    systemE.OnLine(H1, BF1),
                    systemE.OnLine(H1, CG1),
                    systemE.OnCircle(H1, OABC),
                ),
            ),
        )
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
