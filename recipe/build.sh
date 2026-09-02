#!/usr/bin/env bash

set -euxo pipefail

"${PYTHON}" -m pip install ./hopper -v --no-deps --no-build-isolation
