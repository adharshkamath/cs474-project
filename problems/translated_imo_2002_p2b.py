"""
translated_imo_2002_p2b
b c = segment b c; o = midpoint o b c; a = on_circle a o b; d = on_circle d o b, on_bline d a b; 
e = on_bline e o a, on_circle e o b; f = on_bline f o a, on_circle f o b; j = on_pline j o a d, on_line j a c ? eqangle c e c j c j c f
"""

from z3 import *
from system_e import *


def translated_imo_2002_p2b(systemE: SystemE):
    solver = systemE.solver
    b, c, o, a, d, e, f, j = Consts("b c o a d e f j", systemE.PointSort)
    solver.add(simplify(Distinct(b, c, o, a, d, e, f, j), blast_distinct=True))