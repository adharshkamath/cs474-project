"""
translated_imo_2008_p6
x@4.96_-0.13 y@-1.0068968328888160_-1.2534881080682770 z@-2.8402847238575120_-4.9117762734006830 = triangle x y z; 
o = circle o x y z; w@6.9090049230038776_-1.3884003936987552 = on_circle w o x; a = on_tline a z o z, on_tline a x o x; 
b = on_tline b z o z, on_tline b w o w; c = on_tline c y o y, on_tline c w o w; d = on_tline d x o x, on_tline d y o y; 
i1 = incenter i1 a b c; i2 = incenter i2 a c d; f1 = foot f1 i1 a c; f2 = foot f2 i2 a c; q t p s = cc_tangent q t p s i1 f1 i2 f2; 
k = on_line k q t, on_line k p s ? cong o k o x
"""

from z3 import *
from system_e import *


def translated_imo_2008_p6(systemE: SystemE):
    solver = systemE.solver
    x, y, z, o, w, a, b, c, d, i1, i2, f1, f2, q, t, p, s, k = Consts("x y z o w a b c d i1 i2 f1 f2 q t p s k", systemE.PointSort)
    solver.add(simplify(Distinct(x, y, z, o, w, a, b, c, d, i1, i2, f1, f2, q, t, p, s, k), blast_distinct=True))

    