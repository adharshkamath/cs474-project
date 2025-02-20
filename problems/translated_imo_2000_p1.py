"""
translated_imo_2000_p1
a b = segment a b; g1 = on_tline g1 a a b; g2 = on_tline g2 b b a; 
m = on_circle m g1 a, on_circle m g2 b; n = on_circle n g1 a, on_circle n g2 b; 
c = on_pline c m a b, on_circle c g1 a; d = on_pline d m a b, on_circle d g2 b; e = on_line e a c, on_line e b d; 
p = on_line p a n, on_line p c d; q = on_line q b n, on_line q c d ? cong e p e q
"""

from z3 import *
from system_e import *


def translated_imc_2000_p1(systemE: SystemE):
    solver = systemE.solver
    a, b, g1, g2, m, n, c, d, e, p, q = Consts("a b g1 g2 m n c d e p q", systemE.PointSort)
    solver.add(simplify(Distinct(a, b, g1, g2, m, n, c, d, e, p, q), blast_distinct=True))

    






