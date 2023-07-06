# Code for "Perfect Synchronization in Complex Networks with Higher Order Interactions" 
***
This repository contains Matlab code for integrating a coupled networked system and calculating the order parameter.
# Required software:
+ MATLAB2020

# How to use the code?
**final_integration**: Run this file to get the results. It contains the code for simulating a network system by changing the parameter values. The order parameter is calculated as a function of pairwise coupling $K_1$ (one can also vary triadic coupling $K_2$, and phase-lag $\alpha$). The parameter m (sigma) is varied to calculate the deviation $\rho$ from the synchronization.  

**Create_omega**: In this file the frequency is genereted by calculating the degrees of the considered network.

**Create_Sys_kuramoto**: In this file the equations for the networked system is written explicitly. After running this file a new file named as SK_model.m will be generated where the equations will be printed.  
# Sample network:
**Sample_network.mat**: We provide the adjacency matrix of a random network of size 1000 as a sample. One can replace this network by any other network to run this code.  
