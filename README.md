# Resilient projection-based consensus actor-critic (RPBCAC) algorithm

We implement the RPBCAC algorithm with nonlinear approximation from [[1]](#1)
and focus on training performance of cooperative agents in the presence of adversaries. We aim to validate the analytical
results presented in the paper and prevent adversarial attacks that can arbitrarily hurt cooperative network performance 
including the one studied in [[2]](#2). The repository contains folders whose description is provided below:

1) agents - contains RPBCAC and adversarial agents
2) environments - contains a grid world environment for the cooperative navigation task
3) simulation_results - contains plots that show training performance
4) training - contains functions for training agents

To train agents and plot results, execute main.py and plot_results.py, respectively.

## Multi-agent grid world: cooperative navigation
We train four agents in a grid-world environment. Their original goal is to approach their desired position without colliding with other agents in the network.
We design a grid world of dimension (6 x 6) and consider a reward function that penalizes the agents for distance from the target and colliding with other agents.
We compare the cooperative network performance under the RPBCAC algorithm with truncation parameter H=0 and H=1, which represents the number
of adversarial agents assumed to be present in the network. We consider four scenarios:
1) All agents are cooperative. They maximize the team-average expected returns.
2) One agent is greedy as it maximizes its own expected returns. It shares parameters with other agents but does not apply consensus updates.
3) One agent is faulty and does not have a well-defined objective. It shares fixed parameter values with other agents.
4) One agent is malicious as it maximizes its own returns and minimizes the cooperative team's returns. It has knowledge of other agents' rewards and
updates two critic estimates (one critic is used to improve the adversary's policy and the other to hurt the cooperative agents' performance).

The simulation results are presented below. They show the true returns of both the adversary and cooperative agents as well as the estimated returns of the cooperative agents.

### 1) All cooperative
<img src="https://github.com/mfigura/Resilient-consensus-actor-critic/blob/main/simulation_results/figures/coop_h0.png" width="300" align="left">
<img src="https://github.com/mfigura/Resilient-consensus-actor-critic/blob/main/simulation_results/figures/coop_h1.png" width="300" >

### 2) Three cooperative + one greedy
<img src="https://github.com/mfigura/Resilient-consensus-actor-critic/blob/main/simulation_results/figures/greedy_h0.png" width="300" align="left">
<img src="https://github.com/mfigura/Resilient-consensus-actor-critic/blob/main/simulation_results/figures/greedy_h1.png" width="300" >

### 3) Three cooperative + one faulty
<img src="https://github.com/mfigura/Resilient-consensus-actor-critic/blob/main/simulation_results/figures/faulty_h0.png" width="300" align="left">
<img src="https://github.com/mfigura/Resilient-consensus-actor-critic/blob/main/simulation_results/figures/faulty_h1.png" width="300" >

### 4) Three cooperative + one malicious
<img src="https://github.com/mfigura/Resilient-consensus-actor-critic/blob/main/simulation_results/figures/malicious_h0.png" width="300" align="left">
<img src="https://github.com/mfigura/Resilient-consensus-actor-critic/blob/main/simulation_results/figures/malicious_h1.png" width="300" >

The simulation results demonstrate great performance of the RPBCAC with H=1 (right) compared to the non-resilient case with H=0 (left). The cooperative agents successfully achieve their learning goals in spite of the adversarial attacks.

## References

<a id="2">[2]</a> 
Figura, M., Kosaraju, K. C., and Gupta, V.
Adversarial attacks in consensus-based multi-agent reinforcement learning.
arXiv preprint arXiv:2103.06967, 2021.