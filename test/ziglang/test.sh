#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c

check "zig_version" zig version
check "zig_version_compare" [ "$(zig version)" == "0.13.0" ]

check "zls_version" zls --version
check "zls_version_compare" [ "$(zls --version)" == "0.13.0" ]


# Report result
reportResults
