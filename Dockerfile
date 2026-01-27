# Single-line build
FROM rust:alpine

WORKDIR /app
COPY . .
RUN apk add musl-dev && cargo build --release && \
    cp target/release/shortener /usr/local/bin/ && \
    rm -rf /app
ENTRYPOINT ["shortener"]
