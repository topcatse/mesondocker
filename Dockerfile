FROM phusion/baseimage:0.9.19

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ADD . /root

RUN apt-get -q update -y 
RUN apt-get -q install ninja-build 
RUN apt-get -q install -y python3 python3-dev python3-pip 
RUN pip3 install meson 

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
