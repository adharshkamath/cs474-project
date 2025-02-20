"""
translated_imo_2014_p4
a b c = triangle a b c; p = on_line p b c, on_aline p a b b c a; q = on_line q b c, on_aline q a c c b a; 
m = mirror m a p; n = mirror n a q; x = on_line x b m, on_line x c n; o = circle o a b c ? cong o x o a
"""

from z3 import *
from system_e import *


def translated_imo_2014_p4(systemE: SystemE):
    solver = systemE.solver
    a, b, c, p, q, m, n, x, o = Consts("a b c p q m n x o", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, c, p, q, m, n, x, o), blast_distinct=True))