"""
translated_imo_2003_p4
a b c = triangle a b c; o = circle o a b c; b1 = on_circle b1 o a, on_bline b1 c a; 
d1 = on_circle d1 o a, on_bline d1 c a; x = on_line x b b1, on_line x a c; d = on_line d d1 x, on_circle d o a; 
p = foot p d b c; q = foot q d c a; r = foot r d a b ? cong p q q r
"""

from z3 import *
from system_e import *


def translated_imo_2003_p4(systemE: SystemE):
    solver = systemE.solver
    a, b, c, o, b1, d1, x, d, p, q, r = Consts("a b c o b1 d1 x d p q r", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, o, b1, d1, x, d, p, q, r), blast_distinct=True))