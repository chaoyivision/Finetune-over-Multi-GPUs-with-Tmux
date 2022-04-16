# Finetune-over-Multi-GPUs-with-Tmux
Auto helper script to assign individual tmux-session for each local GPU (auto script on login)


# Who might find it useful?
+ Have multi-gpus available on **local** side.
+ (not appliable) For industry usage, there exist much better solutions for servers equipped with a massive number of GPUs I bet :).
+ Wish to manually assign tasks to each specific GPU, in a more convinient manner, such as a series of quick parameter finetunings with multi-gpus, i.e., **1 run per 1 gpu**.
+ Basically, CS students who (1) have roughfully 2-8 cards on their local side and (2) feel sick about hundreds of **meaningless time wasted on typing "CUDA_VISIBLE_DEVICES=2 python train.py" or "python train.py --gpu 3"**. 
+ After a 5-min proper setup, you can totally forget about it. It would be automatically done everytime the machine is reboot and logined.

# TBD
