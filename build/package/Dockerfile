FROM ubuntu AS build

WORKDIR /opt

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN gcc -Wall -o locktest cmd/locktest/locktest.c cmd/locktest/netsync.c

###############################################################################
# final stage
FROM ubuntu
COPY --from=build /opt/locktest /usr/local/bin/locktest

ENTRYPOINT ["/usr/local/bin/locktest"]
CMD ["-n", "50", "-f", "/mnt/locktest.tmp"]
