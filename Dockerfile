FROM ubuntu:20.04
MAINTAINER piesecurity <admin@pie-secure.org>
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:deluge-team/stable && \
	apt-get update && \
	apt-get install -y deluged deluge-web deluge-console && \
	adduser --system  --gecos "Deluge Service" --disabled-password --group --home /var/lib/deluge deluge
ADD deluged /etc/init.d/deluged
ADD deluge-daemon /etc/default/deluge-daemon
RUN chmod +x /etc/init.d/deluged
EXPOSE 8112
ENTRYPOINT chown deluge:deluge /var/lib/deluge && /etc/init.d/deluged start && su --shell /bin/bash -c deluge-console --login deluge && bash
