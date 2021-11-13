FROM rust:latest
COPY ./ /
WORKDIR /
RUN cargo build

FROM debian:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y ca-certificates bash procps
COPY --from=0 target/debug/borg-prometheus-exporter /
COPY --from=0 config.yml /
ENTRYPOINT [ "/borg-prometheus-exporter", "/config.yml" ]
