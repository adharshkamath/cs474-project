"""
translated_imo_2008_p1b
a b c = triangle a b c; h = orthocenter h a b c; d = midpoint d b c; e = midpoint e a c; 
f = midpoint f a b; a1 = on_circle a1 d h, on_line a1 b c; a2 = on_circle a2 d h, on_line a2 b c; 
b1 = on_circle b1 e h, on_line b1 c a; b2 = on_circle b2 e h, on_line b2 c a; c1 = on_circle c1 f h, on_line c1 a b; 
c2 = on_circle c2 f h, on_line c2 a b ? cyclic c1 c2 b1 a1
"""

from z3 import *
from system_e import *

def translated_imo_2008_p1b(systemE: SystemE):
    solver = systemE.solver
    a, b, c, h, d, e, f, a1, a2, b1, b2, c1, c2 = Consts("a b c h d e f a1 a2 b1 b2 c1 c2", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, h, d, e, f, a1, a2, b1, b2, c1, c2), blast_distinct=True))

