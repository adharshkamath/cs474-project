[AB1 = Line!val!0,
 CA1 = Line!val!2,
 CG1 = Line!val!6,
 E1 = Point!val!4,
 B1 = Point!val!1,
 BF1 = Line!val!5,
 F1 = Point!val!5,
 AD1 = Line!val!3,
 RightAngle = 13/32,
 D1 = Point!val!3,
 BC1 = Line!val!1,
 C1 = Point!val!2,
 A1 = Point!val!0,
 AE1 = Line!val!4,
 Intersectscc = [else -> True],
 Between = [else ->
            Or(And(Not(Var(0) == Point!val!2),
                   Not(Var(0) == Point!val!0),
                   Not(Var(0) == Point!val!5),
                   Not(Var(0) == Point!val!3),
                   Not(Var(0) == Point!val!6),
                   Not(Var(0) == Point!val!4),
                   Var(1) == Point!val!3,
                   Not(Var(1) == Point!val!6),
                   Not(Var(1) == Point!val!4),
                   Var(2) == Point!val!0,
                   Not(Var(2) == Point!val!5),
                   Not(Var(2) == Point!val!3),
                   Not(Var(2) == Point!val!6),
                   Not(Var(2) == Point!val!4)),
               And(Var(0) == Point!val!0,
                   Not(Var(0) == Point!val!5),
                   Not(Var(0) == Point!val!3),
                   Not(Var(0) == Point!val!6),
                   Not(Var(0) == Point!val!4),
                   Var(1) == Point!val!3,
                   Not(Var(1) == Point!val!6),
                   Not(Var(1) == Point!val!4),
                   Not(Var(2) == Point!val!2),
                   Not(Var(2) == Point!val!0),
                   Not(Var(2) == Point!val!5),
                   Not(Var(2) == Point!val!3),
                   Not(Var(2) == Point!val!6),
                   Not(Var(2) == Point!val!4)))],
 On = [else -> False],
 Intersectsll = [else -> False],
 Segment = [else ->
            If(Or(And(Var(0) == Point!val!3,
                      Not(Var(0) == Point!val!6),
                      Not(Var(0) == Point!val!4),
                      Var(1) == Point!val!4),
                  And(Var(0) == Point!val!4,
                      Var(1) == Point!val!3,
                      Not(Var(1) == Point!val!6),
                      Not(Var(1) == Point!val!4))),
               1/32,
               If(Or(And(Var(0) == Point!val!0,
                         Not(Var(0) == Point!val!5),
                         Not(Var(0) == Point!val!3),
                         Not(Var(0) == Point!val!6),
                         Not(Var(0) == Point!val!4),
                         Var(1) == Point!val!3,
                         Not(Var(1) == Point!val!6),
                         Not(Var(1) == Point!val!4)),
                     And(Var(0) == Point!val!3,
                         Not(Var(0) == Point!val!6),
                         Not(Var(0) == Point!val!4),
                         Var(1) == Point!val!0,
                         Not(Var(1) == Point!val!5),
                         Not(Var(1) == Point!val!3),
                         Not(Var(1) == Point!val!6),
                         Not(Var(1) == Point!val!4))),
                  1/16,
                  If(And(Var(0) == Point!val!3,
                         Not(Var(0) == Point!val!6),
                         Not(Var(0) == Point!val!4),
                         Var(1) == Point!val!3,
                         Not(Var(1) == Point!val!6),
                         Not(Var(1) == Point!val!4)),
                     0,
                     If(And(Not(Var(0) == Point!val!2),
                            Not(Var(0) == Point!val!0),
                            Not(Var(0) == Point!val!5),
                            Not(Var(0) == Point!val!3),
                            Not(Var(0) == Point!val!6),
                            Not(Var(0) == Point!val!4),
                            Var(1) == Point!val!3,
                            Not(Var(1) == Point!val!6),
                            Not(Var(1) == Point!val!4)),
                        7/32,
                        If(Or(And(Not(Var(0) == Point!val!2),
                                  Not(Var(0) == Point!val!0),
                                  Not(Var(0) == Point!val!5),
                                  Not(Var(0) == Point!val!3),
                                  Not(Var(0) == Point!val!6),
                                  Not(Var(0) == Point!val!4),
                                  Var(1) == Point!val!4),
                              And(Var(0) == Point!val!4,
                                  Not(Var(1) == Point!val!2),
                                  Not(Var(1) == Point!val!0),
                                  Not(Var(1) == Point!val!5),
                                  Not(Var(1) == Point!val!3),
                                  Not(Var(1) == Point!val!6),
                                  Not(Var(1) == Point!val!4))),
                           1/16,
                           If(And(Var(0) == Point!val!2,
                                  Not(Var(0) == Point!val!0),
                                  Not(Var(0) == Point!val!5),
                                  Not(Var(0) == Point!val!3),
                                  Not(Var(0) == Point!val!6),
                                  Not(Var(0) == Point!val!4),
                                  Not(Var(1) == Point!val!2),
                                  Not(Var(1) == Point!val!0),
                                  Not(Var(1) == Point!val!5),
                                  Not(Var(1) == Point!val!3),
                                  Not(Var(1) == Point!val!6),
                                  Not(Var(1) == Point!val!4)),
                              3/32,
                              If(And(Var(0) == Point!val!0,
                                     Not(Var(0) ==
                                        Point!val!5),
                                     Not(Var(0) ==
                                        Point!val!3),
                                     Not(Var(0) ==
                                        Point!val!6),
                                     Not(Var(0) ==
                                        Point!val!4),
                                     Not(Var(1) ==
                                        Point!val!2),
                                     Not(Var(1) ==
                                        Point!val!0),
                                     Not(Var(1) ==
                                        Point!val!5),
                                     Not(Var(1) ==
                                        Point!val!3),
                                     Not(Var(1) ==
                                        Point!val!6),
                                     Not(Var(1) ==
                                        Point!val!4)),
                                 9/32,
                                 If(And(Not(Var(0) ==
                                        Point!val!2),
                                        Not(Var(0) ==
                                        Point!val!0),
                                        Not(Var(0) ==
                                        Point!val!5),
                                        Not(Var(0) ==
                                        Point!val!3),
                                        Not(Var(0) ==
                                        Point!val!6),
                                        Not(Var(0) ==
                                        Point!val!4),
                                        Var(1) ==
                                        Point!val!2,
                                        Not(Var(1) ==
                                        Point!val!0),
                                        Not(Var(1) ==
                                        Point!val!5),
                                        Not(Var(1) ==
                                        Point!val!3),
                                        Not(Var(1) ==
                                        Point!val!6),
                                        Not(Var(1) ==
                                        Point!val!4)),
                                    3/32,
                                    If(And(Not(Var(0) ==
                                        Point!val!2),
                                        Not(Var(0) ==
                                        Point!val!0),
                                        Not(Var(0) ==
                                        Point!val!5),
                                        Not(Var(0) ==
                                        Point!val!3),
                                        Not(Var(0) ==
                                        Point!val!6),
                                        Not(Var(0) ==
                                        Point!val!4),
                                        Var(1) ==
                                        Point!val!0,
                                        Not(Var(1) ==
                                        Point!val!5),
                                        Not(Var(1) ==
                                        Point!val!3),
                                        Not(Var(1) ==
                                        Point!val!6),
                                        Not(Var(1) ==
                                        Point!val!4)),
                                       9/32,
                                       If(And(Var(0) ==
                                        Point!val!3,
                                        Not(Var(0) ==
                                        Point!val!6),
                                        Not(Var(0) ==
                                        Point!val!4),
                                        Not(Var(1) ==
                                        Point!val!2),
                                        Not(Var(1) ==
                                        Point!val!0),
                                        Not(Var(1) ==
                                        Point!val!5),
...