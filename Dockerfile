FROM ubuntu AS build

WORKDIR /opt

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN gcc -Wall -o locktest locktest.c netsync.c

###############################################################################
# final stage
FROM ubuntu
COPY --from=build /opt/locktest /usr/local/bin/locktest

ENTRYPOINT ["/usr/local/bin/locktest", "-n", "50", "-f", "/mnt/locktest.tmp"]
