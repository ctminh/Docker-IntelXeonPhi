docker run --privileged=true --net=none -itd --cpuset-cpus 0 --name mic_container1 -v /opt/share:/opt/share mic_cont_image:1.2 && sudo pipework br0 mic_container1 10.1.6.63/17@10.1.1.28
