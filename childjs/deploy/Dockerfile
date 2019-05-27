FROM ubuntu:18.04
RUN apt-get -y update && apt-get -y dist-upgrade && \
    apt-get -y install xinetd cgroup-tools python libicu60 lib32z1 

RUN groupadd -g 1000 ctf && useradd -g ctf -m -u 1000 ctf -s /bin/bash

RUN mkdir /chall

# copy flag to the chall dir
COPY flag /chall/f1ag_1s_h3r3_sasdfjklASHGKLsdg

# copy your executable to the chall dir
COPY mjs /chall/mjs

# add execution privelege 
RUN chmod +x /chall/mjs

# copy python scripts
COPY server.py /opt/server.py
COPY starter.sh /opt/starter.sh
COPY start_server.sh /opt/start_server.sh
COPY pow.py /opt/pow.py

# banner fail
RUN echo "SORRY" > /etc/banner_fail

COPY xinetd.conf /etc/xinetd.d/chall
RUN chown -R root:ctf /chall && \
    chmod -R 750 /chall && \
    chmod 740 /chall/f1ag_1s_h3r3_sasdfjklASHGKLsdg

# start server
CMD /opt/starter.sh ctf
