default: build-all

.PHONY: build-all
build-all: 
	cargo build --bins

# rustup target list. 
# To remove a previously-added target, rustup target remove.
.PHONY: add-all-targets
add-all-targets:
	rustup target add aarch64-apple-darwin
	rustup target add x86_64-apple-darwin
	rustup target add aarch64-unknown-linux-gnu
	rustup target add x86_64-unknown-linux-gnu


.PHONY: mac-arm
mac-arm:
	cargo build --target=aarch64-apple-darwin

.PHONY: mac-intel
mac-intel:
	cargo build --target=x86_64-apple-darwin

.PHONY: linux-arm
linux-arm:
	cargo build --release --target=aarch64-unknown-linux-gnu

.PHONY: linux-intel
linux-intel:
	cargo build --release --target=x86_64-unknown-linux-gnu

