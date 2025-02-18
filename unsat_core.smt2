[ForAll([a, b, c, L],
       Implies(And(On(a, L), On(b, L), On(c, L)),
               Or(Between(a, b, c),
                  Between(b, a, c),
                  Between(a, c, b)))),
 ForAll([a, b, c, d],
       Implies(And(Between(a, b, c), Between(a, b, d)),
               Not(Between(c, b, d)))),
 On(E1, GE1)]