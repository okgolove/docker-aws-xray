FROM ubuntu:18.04
LABEL org.opencontainers.image.source https://github.com/okgolove/docker-aws-xray

RUN apt update && \
    apt install -y unzip curl && \
    cd /tmp/ && \
    curl https://s3.dualstack.us-west-2.amazonaws.com/aws-xray-assets.us-west-2/xray-daemon/aws-xray-daemon-linux-3.2.0.zip > aws-xray-daemon-linux-3.2.0.zip && \
    unzip aws-xray-daemon-linux-3.2.0.zip && \
    cp xray /usr/bin/xray && \
    rm aws-xray-daemon-linux-3.2.0.zip && \
    rm cfg.yaml

EXPOSE 2000/udp

ENTRYPOINT ["/usr/bin/xray", "-b", "0.0.0.0:2000"]
