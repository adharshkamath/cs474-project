"""
translated_imo_2007_p4
a b c = triangle a b c; o = circle o a b c; r = on_circle r o a, on_bline r a b; 
l = midpoint l c a; k = midpoint k c b; p = on_line p o k, on_line p c r; q = on_line q o l, on_line q c r; 
l1 = foot l1 l c r; k1 = foot k1 k c r ? eqratio k k1 l l1 r q r p
"""

from z3 import *
from system_e import *


def translated_imo_2007_p4(systemE: SystemE):
    solver = systemE.solver
    a, b, c, o, r, l, k, p, q, l1, k1 = Consts("a b c o r l k p q l1 k1", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, o, r, l, k, p, q, l1, k1), blast_distinct=True))
