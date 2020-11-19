# Proof of concept APA Attack against SGX

## I modified this POC that come from following git repository 

Original git repo is here (I modify it for making it work well):

- https://github.com/FPSG-UIUC/hogwild_pytorch/tree/master/sgx-poc

Related Issue:

- https://github.com/FPSG-UIUC/hogwild_pytorch/issues/10

I realize that notify_attack will catch all page faults and many of these are not relate with this POC (means many page faults are not Image's or Model's Faults), the original POC's driver restore all fault pages' present bit, which will cause new page fault (may be #PF: supervisor read access in kernel mode). 

I modified driver to treat fault-on-fault respectively, kindly metigate some new fualt( but still some page fualt thar I have no idea, fualt page is not about Images' or Model's page).

And I think using noticy_attack to catch all page faults is not a good idea to pause threads, and I think register a SIGSEGV handler to handle page faults is a better idea to pause threads.

Discuss: As there are logic about prot_none check in handle_pte_fault, so I think when undo page-flag-modify, we should clear prot_none as well.

Discuss: Because we don't kprobe do_page_fault, __do_page_fault, do_user_addr_fault, so it needn't to remove "NOKPROBE_SYMBOL" label.

Notice: %p parameter in printk will output a "hashed" address, so 0x%lx may helpful.(https://lwn.net/Articles/737451/)

## Original README

This directory contains the code to run the proof-of-concept APA attack against real SGX hardware.
In particular, we provide two components:

- *nukemod*: this repository contains a Linux kernel module which contains the logic of our APA attack, including halting and rescheduling SGX threads.
- *sgx_scheduling*: this repository contains our C-based proof-of-concept SGX code which mimics the main operations in the PyTorch code.
