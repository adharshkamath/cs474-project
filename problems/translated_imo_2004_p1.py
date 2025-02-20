"""
translated_imo_2004_p1
a b c = triangle a b c; o = midpoint o b c; m = on_circle m o b, on_line m a b; 
n = on_circle n o b, on_line n a c; r = angle_bisector r b a c, angle_bisector r m o n; 
o1 = circle o1 b m r; o2 = circle o2 c n r; p = on_circle p o1 r, on_circle p o2 r ? coll p b c
"""

from z3 import *
from system_e import *


def translated_imo_2004_p1(systemE: SystemE):
    solver = systemE.solver
    a, b, c, o, m, n, r, o1, o2, p = Consts("a b c o m n r o1 o2 p", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, o, m, n, r, o1, o2, p), blast_distinct=True))
