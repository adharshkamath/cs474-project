"""
translated_imo_2009_p2
m l k = triangle m l k; w = circle w m l k; q = on_tline q m w m; 
p = mirror p q m; b = mirror b p k; c = mirror c q l; a = on_line a b q, on_line a c p; o = circle o a b c ? cong o p o q
"""

from z3 import *
from system_e import *


def translated_imo_2009_p2(systemE: SystemE):
    solver = systemE.solver
    m, l, k, w, q, p, b, c, a, o = Consts("m l k w q p b c a o", systemE.PointSort)
    solver.add(simplify(Distinct(m, l, k, w, q, p, b, c, a, o), blast_distinct=True))
