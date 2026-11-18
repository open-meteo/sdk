from __future__ import annotations

import flatbuffers
import numpy as np

import typing
from typing import cast

uoffset: typing.TypeAlias = flatbuffers.number_types.UOffsetTFlags.py_type

class Percentile(object):
  none = cast(int, ...)
  p10 = cast(int, ...)
  p25 = cast(int, ...)
  p50 = cast(int, ...)
  p75 = cast(int, ...)
  p90 = cast(int, ...)

