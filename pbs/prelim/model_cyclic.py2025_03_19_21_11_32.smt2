[Onc(C, circle) = True,
 Center(O, circle) = True,
 circle = Circle!val!0,
 Not(Angle(B, A, C) == Angle(B, D, C)) = True,
 Onc(B, circle) = True,
 B = Point!val!1,
 Onc(A, circle) = True,
 C = Point!val!2,
 Onc(D, circle) = True,
 RightAngle = 3/8,
 A = Point!val!0,
 D = Point!val!3,
 O = Point!val!4,
 Intersectscc = [else -> True],
 Between = [else -> False],
 On = [else ->
       Or(Var(0) == Point!val!4,
          And(Var(0) == Point!val!3,
              Not(Var(0) == Point!val!1),
              Not(Var(0) == Point!val!4)))],
 Intersectsll = [else -> True],
 Segment = [else ->
            If(And(Var(0) == Point!val!0,
                   Not(Var(0) == Point!val!3),
                   Not(Var(0) == Point!val!1),
                   Not(Var(0) == Point!val!4),
                   Not(Var(1) == Point!val!0),
                   Not(Var(1) == Point!val!3),
                   Not(Var(1) == Point!val!1),
                   Not(Var(1) == Point!val!4)),
               1/16,
               If(And(Not(Var(0) == Point!val!0),
                      Not(Var(0) == Point!val!3),
                      Not(Var(0) == Point!val!1),
                      Not(Var(0) == Point!val!4),
                      Not(Var(1) == Point!val!0),
                      Not(Var(1) == Point!val!3),
                      Not(Var(1) == Point!val!1),
                      Not(Var(1) == Point!val!4)),
                  0,
                  If(And(Var(0) == Point!val!0,
                         Not(Var(0) == Point!val!3),
                         Not(Var(0) == Point!val!1),
                         Not(Var(0) == Point!val!4),
                         Var(1) == Point!val!3,
                         Not(Var(1) == Point!val!1),
                         Not(Var(1) == Point!val!4)),
                     3/16,
                     If(And(Not(Var(0) == Point!val!0),
                            Not(Var(0) == Point!val!3),
                            Not(Var(0) == Point!val!1),
                            Not(Var(0) == Point!val!4),
                            Var(1) == Point!val!0,
                            Not(Var(1) == Point!val!3),
                            Not(Var(1) == Point!val!1),
                            Not(Var(1) == Point!val!4)),
                        1/16,
                        If(And(Var(0) == Point!val!3,
                               Not(Var(0) == Point!val!1),
                               Not(Var(0) == Point!val!4),
                               Var(1) == Point!val!0,
                               Not(Var(1) == Point!val!3),
                               Not(Var(1) == Point!val!1),
                               Not(Var(1) == Point!val!4)),
                           3/16,
                           If(Or(And(Var(0) == Point!val!1,
                                     Not(Var(0) ==
                                        Point!val!4),
                                     Var(1) == Point!val!1,
                                     Not(Var(1) ==
                                        Point!val!4)),
                                 And(Var(0) == Point!val!3,
                                     Not(Var(0) ==
                                        Point!val!1),
                                     Not(Var(0) ==
                                        Point!val!4),
                                     Var(1) == Point!val!3,
                                     Not(Var(1) ==
                                        Point!val!1),
                                     Not(Var(1) ==
                                        Point!val!4)),
                                 And(Var(0) == Point!val!0,
                                     Not(Var(0) ==
                                        Point!val!3),
                                     Not(Var(0) ==
                                        Point!val!1),
                                     Not(Var(0) ==
                                        Point!val!4),
                                     Var(1) == Point!val!0,
                                     Not(Var(1) ==
                                        Point!val!3),
                                     Not(Var(1) ==
                                        Point!val!1),
                                     Not(Var(1) ==
                                        Point!val!4))),
                              0,
                              If(Or(And(Var(0) ==
                                        Point!val!3,
                                        Not(Var(0) ==
                                        Point!val!1),
                                        Not(Var(0) ==
                                        Point!val!4),
                                        Var(1) ==
                                        Point!val!4),
                                    And(Var(0) ==
                                        Point!val!1,
                                        Not(Var(0) ==
                                        Point!val!4),
                                        Var(1) ==
                                        Point!val!4),
                                    And(Var(0) ==
                                        Point!val!4,
                                        Var(1) ==
                                        Point!val!1,
                                        Not(Var(1) ==
                                        Point!val!4)),
                                    And(Var(0) ==
                                        Point!val!4,
                                        Var(1) ==
                                        Point!val!3,
                                        Not(Var(1) ==
                                        Point!val!1),
                                        Not(Var(1) ==
                                        Point!val!4)),
                                    And(Var(0) ==
                                        Point!val!0,
                                        Not(Var(0) ==
                                        Point!val!3),
                                        Not(Var(0) ==
                                        Point!val!1),
                                        Not(Var(0) ==
                                        Point!val!4),
                                        Var(1) ==
                                        Point!val!4),
                                    And(Var(0) ==
                                        Point!val!4,
                                        Not(Var(1) ==
                                        Point!val!0),
                                        Not(Var(1) ==
                                        Point!val!3),
                                        Not(Var(1) ==
                                        Point!val!1),
                                        Not(Var(1) ==
                                        Point!val!4)),
                                    And(Not(Var(0) ==
                                        Point!val!0),
                                        Not(Var(0) ==
                                        Point!val!3),
                                        Not(Var(0) ==
                                        Point!val!1),
                                        Not(Var(0) ==
                                        Point!val!4),
                                        Var(1) ==
                                        Point!val!4)),
                                 1/8,
                                 If(And(Var(0) ==
                                        Point!val!4,
                                        Var(1) ==
                                        Point!val!4),
                                    0,
                                    If(And(Var(0) ==
                                        Point!val!4,
                                        Var(1) ==
                                        Point!val!0,
                                        Not(Var(1) ==
                                        Point!val!3),
                                        Not(Var(1) ==
                                        Point!val!1),
                                        Not(Var(1) ==
                                        Point!val!4)),
                                       1/8,
                                       101)))))))))],
 Center = [else -> Var(0) == Point!val!4],
 Area = [else ->
         If(Or(And(Var(0) == Point!val!1,
                   Not(Var(0) == Point!val!4),
                   Var(1) == Point!val!1,
                   Not(Var(1) == Point!val!4),
                   Var(2) == Point!val!4),
               And(Var(0) == Point!val!0,
                   Not(Var(0) == Point!val!3),
                   Not(Var(0) == Point!val!1),
                   Not(Var(0) == Point!val!4),
                   Var(1) == Point!val!3,
                   Not(Var(1) == Point!val!1),
                   Not(Var(1) == Point!val!4),
                   Var(2) == Point!val!0,
                   Not(Var(2) == Point!val!3),
                   Not(Var(2) == Point!val!1),
                   Not(Var(2) == Point!val!4)),
               And(Var(0) == Point!val!0,
                   Not(Var(0) == Point!val!3),
                   Not(Var(0) == Point!val!1),
                   Not(Var(0) == Point!val!4),
                   Var(1) == Point!val!1,
                   Not(Var(1) == Point!val!4),
                   Var(2) == Point!val!1,
                   Not(Var(2) == Point!val!4)),
               And(Var(0) == Point!val!3,
                   Not(Var(0) == Point!val!1),
...