# Docker-IntelXeonPhi

1. To be easily for configure and setup something in Docker container, I just create a Dockerfile with basic installation and configuration for ssh, account.
2. After, start docker container and log into the container, we then install the driver for Intel Xeon Phi.
    - Firtly, please to check the kernel version of host and build the suitable xeonphi-module packages.
    - Mount the directory containing driver packages to Docker container, for example:
        + $ docker run --privileged=true --net=none -itd --cpuset-cpus 0 --name mic_container1 -v /opt/share:/opt/share mic_cont_image:1.2
        + where, tag "-v /opt/share:/opt/share" to mount the folder /opt/share outside the container to the folder /opt/share inside the container.
        + tag "--privileged=true" allows to the container access all of hardware devices under the host.
        + tag "mic_cont_image:1.2" is image already created from Dockerfile
3. Log into the container and install the driver:
    - $ cd /opt/share
    - // for example, the driver is contained in /opt/share/mpss, go to there folder and install
    - $ yum install *.rpm
    - // go to the folder containing xeonphi-module packages and install, please remember the right version of host kernel
 
