# intervalowa_code
Code for the paper "An extension of Ordered Weighted Averaging over intervals with application to optimization under uncertainty" by Werner Baak, Marc Goerigk, Adam Kasperski, Paweł Zieliński, see the technical report https://arxiv.org/abs/2410.09786.

Source files: C++ code to compile with Gurobi. The main file is configured to take four arguments:
- n: dimension of the optimization problem
- p: parameter for BUM function
- seed: random seed for instance generation and sampling
- type: either "knapsack" or "assignment", depending on the problem to be generated

The main file runs six different heuristics, and reports computation times as welll as 100 repetitions of randomized evaluation.

In the folder "scripts", we give a shell script used to generate tasks for our experiments, and an evaluation script to take the output and produce summary files. These can be plotted with the python scripts in the same folder.

In the folder "results", we placed the summary files generated in our run of the experiments.
