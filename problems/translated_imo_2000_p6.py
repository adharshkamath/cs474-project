"""
translated_imo_2000_p6
a b c = triangle a b c; h = orthocenter h a b c; t1 t2 t3 i = incenter2 t1 t2 t3 i a b c; 
h1 = foot h1 a b c; h2 = foot h2 b c a; h3 = foot h3 c a b; x1 = reflect x1 h1 t1 t2; 
x2 = reflect x2 h2 t1 t2; y2 = reflect y2 h2 t2 t3; y3 = reflect y3 h3 t2 t3; z = on_line z x1 x2, on_line z y2 y3 ? cong i z i t1
"""

from z3 import *
from system_e import *


def translated_imo_2000_p6(systemE: SystemE):
    solver = systemE.solver
    a, b, c, h, t1, t2, t3, i, h1, h2, h3, x1, x2, y2, y3, z = Consts("a b c h t1 t2 t3 i h1 h2 h3 x1 x2 y2 y3 z", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, h, t1, t2, t3, i, h1, h2, h3, x1, x2, y2, y3, z), blast_distinct=True))