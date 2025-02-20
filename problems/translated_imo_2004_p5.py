"""
translated_imo_2004_p5
a b c = triangle a b c; o = circle o a b c; d = on_circle d o a; p = on_aline p b c a b d, on_aline p d c a d b ? cong a p c p
"""

from z3 import *
from system_e import *


def translated_imo_2004_p5(systemE: SystemE):
    solver = systemE.solver
    a, b, c, o, d, p = Consts("a b c o d p", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, o, d, p), blast_distinct=True))