"""
translated_imo_2005_p5
a b c = triangle a b c; d = eqdistance d a b c; e = on_line e b c; f = on_line f a d, eqdistance f d e b; 
p = on_line p a c, on_line p b d; q = on_line q e f, on_line q b d; r = on_line r e f, on_line r a c; 
o1 = circle o1 a p d; o2 = circle o2 b p c; m = on_circle m o1 p, on_circle m o2 p ? cyclic p q r m
"""

from z3 import *
from system_e import *


def translated_imo_2005_p5(systemE: SystemE):
    solver = systemE.solver
    a, b, c, d, e, f, p, q, r, o1, o2, m = Consts("a b c d e f p q r o1 o2 m", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, d, e, f, p, q, r, o1, o2, m), blast_distinct=True))
