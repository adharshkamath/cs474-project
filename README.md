# CS 474 course project

The source code is in the src/ directory.

The encoding of Euclidean axioms is in src/e.smt

For each theorem, there is a .smt file and a .llm file.

The .smt file contains the encoding of the theorem in SMT-LIB format.

The .llm file contains the LLM responses to the quantifier instantiation queries.

The prompt is in src/prompts/template.txt

To run the SMT files, download CVC4 from here: https://cvc4.cs.stanford.edu/downloads/builds/x86_64-linux-opt/
Please download CVC4 version 1.6

To run the SMT files, use the following command:

```bash
./cvc4 p1.smt
```