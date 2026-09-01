python -m pip install . -vvv --no-deps --no-build-isolation

# We compile with -Wl,--no-undefined in order to ensure that there are no undefined symbols,
# so we need to provide libpython to the linker. However, it is standard practice to not
# dynamically link to libpython because the python interpreter has already statically linked
# libpython, so all the symbols are already loaded into the process.
patchelf --remove-needed "libpython${PY_VER}.so.1.0" \
    lib/python*/site-packages/{flash_attn_2_cuda,fused_dense_lib,dropout_layer_norm}.cpython-*.so
