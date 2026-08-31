#!/usr/bin/env bash

set -euxo pipefail

# CUDA 13's AArch64 compiler repeatedly exhausted or starved the 32 GiB runner
# with four concurrent nvcc jobs, causing GitHub to lose runner communication.
if [[ "${target_platform:-}" == "linux-aarch64" && "${cuda_compiler_version:-}" == "13.0" ]]; then
    export MAX_JOBS=2
fi

"${PYTHON}" -m pip install ./hopper -vv --no-deps --no-build-isolation
