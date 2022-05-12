# Finetune-over-Multi-GPUs-with-Tmux
Auto helper script to assign individual tmux-session for each local GPU (auto script on login)


# Who might find it useful?
+ Have multi-gpus available on **local** side.
+ (not appliable) For industry usage, there exist much better solutions for servers equipped with a _massive_ number of GPUs I bet :).
+ Wish to manually assign tasks to each specific GPU, in a more convinient manner, such as a series of quick parameter finetunings with multi-gpus, i.e., **1 run per 1 gpu**.
+ Basically, CS students who (1) have muiltiple cards on their local side and (2) feel sick about hundreds of **meaningless time wasted on typing "CUDA_VISIBLE_DEVICES=2 python train.py" or "python train.py --gpu 3"**. 
+ After a 5-min proper setup, it would be **automatically launched on reboot and login** - you could totally forget about its existance.

# How it works, briefly?
+ Very easy. We just auto-assign 1 tmux-session for 1 GPU (on login) and restrict the avaiable_gpu_id within each tmux-session scope. 
+ After then, for example, we could simply use "tmux attach -t G0" to swith to the tmux-session *'G0'* bond with *'GPU 0'*. 
+ Now, the only available gpu (under this tmux-session 'G0') is 'GPU0', and there is no need in typing *"CUDA_VISIBLE_DEVICES=0 python train.py" or "python train.py --gpu 0"* any more. You can simply treat it as a machine with only 1 gpu equipped, and launch the experiment/finetuning manually.
+ To quickly switch to another tmux-session (bond with another GPU), you could use this [shortcut](https://stackoverflow.com/questions/32790061/switch-between-sessions-in-tmux). 


# Setup
Do it once and forget it then.
1. Install Tmux and be familiar with it. Here is another warmup [post](https://www.notion.so/02bc5a1251d64ac0846b28eef9b67155#ec346bf4ecc546e2b7856c2f14aef76e).
2. Download script [startup.sh](https://github.com/chaoyivision/Finetune-over-Multi-GPUs-with-Tmux/blob/main/startup.sh) into '~/.tmux', and change its accessible mode by *chmod*.
3. Set it auto-run when login or reboot, according to this [answer](https://stackoverflow.com/questions/12973777/how-to-run-a-shell-script-at-startup).
```
#crontab -e
@reboot ~/.tmux/startup.sh
```

Or, you could simple run this script within ~/.bashrc or ~/.zshrc (everytime a new terminal is created)

# To Use it?
Suppose there are 4 gpus available on your local side, the tmux-sessions would be automatically initialized and named from 'G0' to 'G3'. You could now simply do:
```
tmux attach -t G2
```
Have fun.

# DEMO
![demo](https://user-images.githubusercontent.com/79236307/163664538-b94e64f3-9091-4f1e-bdc9-ed886bf92d23.png)
+ launch experiment on GPU2 only (within tmux-session 'G2') - only GPU2 is occuiped.

+ Customized tmux status bar:
  + top: current running command with arguments.
  + bottom (from left to right): \[Session ID - PID\], available sessions, GPU usage, CPU and RAM status.

