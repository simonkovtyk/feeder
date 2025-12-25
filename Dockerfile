FROM rust:1.92.0-alpine

COPY ./ ./app
RUN cargo build --release
CMD ["./target/release/feeder", "--config", "/var/feeder/config.json"]
