FROM rust:1.92.0-slim-bullseye
WORKDIR /app
RUN --mount=type=bind,source=src,target=src \
    --mount=type=bind,source=Cargo.toml,target=Cargo.toml \
    --mount=type=bind,source=Cargo.lock,target=Cargo.lock \
    --mount=type=cache,target=/app/target/ \
    --mount=type=cache,target=/usr/local/cargo/registry/ \
    <<EOF
set -e
cargo build --release --locked
cp ./target/release/feeder /bin/feeder
EOF
CMD ["/bin/feeder", "--config", "/var/feeder/config.json"]
