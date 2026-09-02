#!/usr/bin/env bash

set -euxo pipefail

# Keep Ninja progress and full compiler commands, but drop ptxas informational
# diagnostics that can add hundreds of long, non-actionable lines per build.
"${PYTHON}" -m pip install ./hopper -v --no-deps --no-build-isolation 2>&1 |
    sed -u '/ptxas info[[:space:]]*:/d'
