sess="main"
tmux has-session -t $sess 2>/dev/null
if [ $? != 0 ]; then
    tmux new -d -s "$sess"; # the main session with all gpus available.
fi


num_gpus=`nvidia-smi -L | wc -l`
#echo $num_gpus

for i in $(seq 0 $((num_gpus-1)))
do
   sess="G$i"
   
   tmux has-session -t $sess 2>/dev/null
   if [ $? != 0 ]; then
        tmux new -d -s "$sess";
        tmux send-keys -t "$sess.0" "export CUDA_VISIBLE_DEVICES=$i" ENTER;
   fi
done
