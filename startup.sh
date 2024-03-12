<<<<<<< HEAD
echo -n project name?\ 
read pj
echo -n interface name?\ 
=======
echo -n project name?
read pj
echo -n interface name?
>>>>>>> fcfd75fa133561da70db0fbe65e27a8fdc1238dd
read int
#path="${PWD}/caps/$pj"
path="./caps/$pj"
mkdir -p $path
chgrp tcpdump $path
screen -S tcpdump.$pj -d -m bash -c "sleep 1; tcpdump -nni $int -w $path/$pj.pcap; sleep 41"
<<<<<<< HEAD
screen -S airodump.$pj -d -m bash -c "airodump-ng -c 1,6,11 -t wep -w $path/$pj $int; sleep 40"
#screen -S airodump.$pj -d -m bash -c "airodump-ng -t wep -w $path/$pj $int; sleep 40"
=======
#screen -S airodump.$pj -d -m bash -c "airodump-ng -c 6 -t wep -w $path/$pj $int; sleep 40"
screen -S airodump.$pj -d -m bash -c "airodump-ng -t wep -w $path/$pj $int; sleep 40"
>>>>>>> fcfd75fa133561da70db0fbe65e27a8fdc1238dd

#screen -S bettercap.$pj -d -m bash -c "bettercap -eval 'proxbox; wifi.recon.channel 6; api.rest on' -iface $int; sleep 40" 
screen -S bettercap.$pj -d -m bash -c "bettercap -eval 'proxbox;  api.rest on' -iface $int; sleep 40"


# Start a new Tmux session
tmux new-session -d -s mysession

# Split the first window into three panes
tmux split-window -v -t mysession:0
#tmux split-window -v -t mysession:0

# Select the first pane and start ping in it
tmux split-window -h -t mysession:0.0

tmux send-keys -t mysession:0.0 './window_1/1stline.sh' C-m

# Select the second pane and start ping in it
tmux select-pane -t mysession:0.1
tmux send-keys './window_2/2ndline.sh' C-m

# Select the third pane and start ping in it
tmux select-pane -t mysession:0.2
tmux send-keys "./window_3/3rdline.sh $path" C-m

# Attach to the session
tmux attach-session -t mysession

