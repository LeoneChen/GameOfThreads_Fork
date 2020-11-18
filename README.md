# I modified this POC that come from following git repository 

Original git repo is here (I modify it for making it work well):

- https://github.com/jose-sv/hogwild_pytorch

# Proof of concept APA Attack against SGX

This directory contains the code to run the proof-of-concept APA attack against real SGX hardware.
In particular, we provide two components:

- *nukemod*: this repository contains a Linux kernel module which contains the logic of our APA attack, including halting and rescheduling SGX threads.
- *sgx_scheduling*: this repository contains our C-based proof-of-concept SGX code which mimics the main operations in the PyTorch code.
