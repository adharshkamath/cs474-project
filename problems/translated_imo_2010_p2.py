"""
translated_imo_2010_p2
a b c = triangle a b c; o = circle o a b c; i = incenter i a b c; d = on_line d a i, on_circle d o a; 
f = on_line f b c; e = on_aline e a c b a f, on_circle e o a; g = midpoint g i f; k = on_line k d g, on_line k e i ? cong o a o k
"""

from z3 import *
from system_e import *


def translated_imo_2010_p2(systemE: SystemE):
    solver = systemE.solver
    a, b, c, o, i, d, f, e, g, k = Consts("a b c o i d f e g k", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, o, i, d, f, e, g, k), blast_distinct=True))