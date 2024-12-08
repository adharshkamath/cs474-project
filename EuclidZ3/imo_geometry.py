from z3 import *
from core import *
 
print("=== Loading Core ===")    

solver = Solver()
solver.push()
solver.add(language.axioms)

print("=== Finished Loading Core ===")

