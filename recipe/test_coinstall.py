from importlib.metadata import files, version


def installed_files(distribution: str) -> set[str]:
    return {str(path) for path in files(distribution) or ()}


flash_attn_2_files = installed_files("flash-attn")
flash_attn_3_files = installed_files("flash-attn-3")
overlap = sorted(flash_attn_2_files & flash_attn_3_files)

assert version("flash-attn").startswith("2.")
assert version("flash-attn-3").startswith("3.")
assert not overlap, f"FlashAttention 2 and 3 install overlapping files: {overlap}"

import flash_attn  # noqa: E402, F401
import flash_attn_3  # noqa: E402, F401
