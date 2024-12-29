default: do-all

.PHONY: do-all
do-all: add-windows-support-on-mac add-linux-support-on-mac add-all-targets build-all

.PHONY: build-all
build-all: mac-arm mac-intel linux-arm linux-intel

.PHONY: add-linux-support-on-mac
add-linux-support-on-mac:
	brew install FiloSottile/musl-cross/musl-cross

.PHONY: add-windows-support-on-mac
add-windows-support-on-mac:
	brew install mingw-w64

# Suggested rustup target list. 
# To list all installed targets, `rustup target list.`
# To list available targets: `rustc --print target-list`
# To remove a previously-added target, rustup target remove.
# @TODO: support aarch64-pc-windows-gnu with a dockerfile
.PHONY: add-all-targets
add-all-targets:
	rustup target add aarch64-apple-darwin
	rustup target add x86_64-apple-darwin
	rustup target add x86_64-pc-windows-gnu
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

.PHONY: windows-intel
windows-intel:
	cargo build --release --target=x86_64-pc-windows-gnu

