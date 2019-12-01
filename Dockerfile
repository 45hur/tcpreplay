FROM debian

RUN export DEBIAN_FRONTEND=noninteractive	
RUN export EDITOR=nano

RUN apt-get update
RUN apt-get install -qq apt-utils
RUN apt-get install -qq net-tools
RUN apt-get install -qq libpcap-dev curl wget python perl gpg cron nano arping
RUN apt-get install -qq liblmdb-dev
RUN apt-get install -qq tcpdump tcpreplay


RUN mkdir /app
WORKDIR /app

COPY /*.pcap /app
COPY /*.sh /app

RUN chmod +x /app/startup.sh

RUN tcprewrite -v --infile=/app/rout2.pcap --outfile=/app/output.pcap --dstipmap=89.145.160.250:172.17.0.2 --enet-dmac=02:42:AC:11:00:02 --fixcsum

ENTRYPOINT ["/app/startup.sh"]
