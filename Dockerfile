FROM rust:1.65.0

RUN rustup component add rustfmt
RUN rustup component add clippy
RUN apt-get update && apt-get install -y \
    lld \
    clang \
 && rm -rf /var/lib/apt/lists/*
RUN cargo install --version="~0.6" sqlx-cli --no-default-features --features rustls,postgres

WORKDIR /app
COPY . /app
RUN cargo build
