#!/usr/bin/env sh

set -xe


MINISIGN_VERSION="$2"
MINISIGN_URL="https://github.com/jedisct1/minisign/releases/download/${MINISIGN_VERSION}/minisign-${MINISIGN_VERSION}-linux.tar.gz"
MINISIGN_SIGNATURE_URL="https://github.com/jedisct1/minisign/releases/download/${MINISIGN_VERSION}/minisign-${MINISIGN_VERSION}-linux.tar.gz.minisig"
MINISIGN_PUBKEY="RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3"

ZIG_VERSION="$1"
ZIG_URL="https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz"
ZIG_SIGNATURE_URL="https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz.minisig"
ZIG_PUBKEY="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

ZLS_URL="https://builds.zigtools.org/zls-linux-x86_64-${ZIG_VERSION}.tar.xz"
ZLS_SIGNATURE_URL="https://builds.zigtools.org/zls-linux-x86_64-${ZIG_VERSION}.tar.xz.minisig"
ZLS_PUBKEY="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"


mkdir -p "/home/vscode/.local/bin"

curl -OsL ${MINISIGN_URL}
tar -xzf "minisign-${MINISIGN_VERSION}-linux.tar.gz"
ln -s /home/vscode/minisign-linux/x86_64/minisign /home/vscode/.local/bin/minisign

curl -OsL ${MINISIGN_SIGNATURE_URL}
minisign -Vm minisign-${MINISIGN_VERSION}-linux.tar.gz -P ${MINISIGN_PUBKEY}

curl -OsL ${ZIG_URL}
curl -OsL ${ZIG_SIGNATURE_URL}
minisign -Vm zig-linux-x86_64-${ZIG_VERSION}.tar.xz -P ${ZIG_PUBKEY}

tar -xf "zig-linux-x86_64-${ZIG_VERSION}.tar.xz"
ln -s "/home/vscode/zig-linux-x86_64-${ZIG_VERSION}/zig" /home/vscode/.local/bin/zig

curl -OsL ${ZLS_URL}
curl -OsL ${ZLS_SIGNATURE_URL}
minisign -Vm zls-linux-x86_64-${ZIG_VERSION}.tar.xz -P ${ZLS_PUBKEY}

tar -xf "zls-linux-x86_64-${ZIG_VERSION}.tar.xz"
ln -s "/home/vscode/zls" /home/vscode/.local/bin/zls