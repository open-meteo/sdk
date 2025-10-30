from __future__ import annotations

import flatbuffers
import numpy as np

import typing
from typing import cast

uoffset: typing.TypeAlias = flatbuffers.number_types.UOffsetTFlags.py_type

class Aggregation(object):
  none = cast(int, ...)
  minimum = cast(int, ...)
  maximum = cast(int, ...)
  mean = cast(int, ...)
  p10 = cast(int, ...)
  p25 = cast(int, ...)
  median = cast(int, ...)
  p75 = cast(int, ...)
  p90 = cast(int, ...)
  dominant = cast(int, ...)
  sum = cast(int, ...)
  spread = cast(int, ...)
  anomaly = cast(int, ...)
  sot10 = cast(int, ...)
  sot90 = cast(int, ...)
  efi = cast(int, ...)

