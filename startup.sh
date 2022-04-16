tmux new -d -s main; # the main session with all gpus available.

num_gpus=`nvidia-smi -L | wc -l`

#echo $num_gpus
 
for i in $(seq 0 $((num_gpus-1)))
do
   tmux new -d -s "G$i";
   tmux send-keys -t "G$i.0" "export CUDA_VISIBLE_DEVICES=$i" ENTER;
done
