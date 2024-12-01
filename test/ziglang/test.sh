#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "zig" [ "$(zig version)" == "0.12.0" ]

# Report result
reportResults
