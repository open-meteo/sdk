from __future__ import annotations

import flatbuffers
import numpy as np

import typing
from typing import cast

uoffset: typing.TypeAlias = flatbuffers.number_types.UOffsetTFlags.py_type

class Probability(object):
  none = cast(int, ...)
  gt0 = cast(int, ...)
  gt0p1 = cast(int, ...)
  gt1 = cast(int, ...)
  gt2 = cast(int, ...)
  gt3 = cast(int, ...)
  gt4 = cast(int, ...)
  gt5 = cast(int, ...)
  gt8 = cast(int, ...)
  gt10 = cast(int, ...)
  gt15 = cast(int, ...)
  gt20 = cast(int, ...)
  gt25 = cast(int, ...)
  gt30 = cast(int, ...)
  gt35 = cast(int, ...)
  gt40 = cast(int, ...)
  gt50 = cast(int, ...)
  gt60 = cast(int, ...)
  gt75 = cast(int, ...)
  gt80 = cast(int, ...)
  gt100 = cast(int, ...)
  lt0 = cast(int, ...)
  lt0p1 = cast(int, ...)
  lt1 = cast(int, ...)
  ltm1 = cast(int, ...)
  ltm2 = cast(int, ...)
  ltm3 = cast(int, ...)
  ltm4 = cast(int, ...)
  ltm5 = cast(int, ...)
  ltm8 = cast(int, ...)
  ltm10 = cast(int, ...)
  ltm15 = cast(int, ...)
  ltm20 = cast(int, ...)
  gt1stdev = cast(int, ...)
  gt1p5stdev = cast(int, ...)
  gt2stdev = cast(int, ...)
  lt1stdev = cast(int, ...)
  lt1p5stdev = cast(int, ...)
  lt2stdev = cast(int, ...)

