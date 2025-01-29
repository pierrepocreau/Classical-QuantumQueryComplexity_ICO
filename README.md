Code for the paper "Query Complexity of Boolean Functions under Indefinite Causal Order" by Alastair A. Abbott, Mehdi Mhalla, and Pierre Pocreau

This Matlab project requires:
  - [Yalmip](https://yalmip.github.io/): a Matlab package for convex optimizaton.
  - [MOSEK](https://www.mosek.com/): an optimisation software to solve semidefinite programs
    
The semidefinite program formulation is due to Ashley Montanaro, Richard Jozsa and Graeme Mitchison for their paper "[On exact quantum query complexity](https://people.maths.bris.ac.uk/~csxam/qc/)".
We adapted their semidefinite program formulation in _main.m_ for the Yalmip package.

The semidefinite program in _main.m_ computes the minimum error with which one can compute the boolean function $f_{6q}$ in 3 quantum queries.
