# Finetune-over-Multi-GPUs-with-Tmux
Auto helper script to assign individual tmux-session for each local GPU (auto script on login)


# Who might find it useful?
+ Have multi-gpus available on **local** side.
+ (not appliable) For industry usage, there exist much better solutions for servers equipped with a massive number of GPUs I bet :).
+ Wish to manually assign tasks to each specific GPU, in a more convinient manner, such as a series of quick parameter finetunings with multi-gpus, i.e., **1 run per 1 gpu**.
+ Basically, CS students who (1) have roughfully 2-8 cards on their local side and (2) feel sick about hundreds of **meaningless time wasted on typing "CUDA_VISIBLE_DEVICES=2 python train.py" or "python train.py --gpu 3"**. 
+ After a 5-min proper setup, it would be *automatically launched* everytime the machine is reboot and logined - you could totally forget about it.

# How it works, briefly?
+ Very easy. We just auto-assign 1 tmux-session for 1 GPU (on login) and restrict the avaiable_gpu_id within each tmux-session scope. 
+ After then, for example, we could simply use "tmux attach -t G0" to swith to the tmux-session *'G0'* bond with *'GPU 0'*. 
+ Now, the only available gpu (under this tmux-session 'G0') is 'GPU0', and there is no need in typing *"CUDA_VISIBLE_DEVICES=0 python train.py" or "python train.py --gpu 0"* any more. You can simply treat it as a machine with only 1 gpu equipped, and launch the experiment/finetuning manually.
+ To quickly switch to another tmux-session (bond with another GPU), you could use this shortcut [https://stackoverflow.com/questions/32790061/switch-between-sessions-in-tmux]. 


### TBD
