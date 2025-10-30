from __future__ import annotations

import flatbuffers
import numpy as np

import typing
from typing import cast

uoffset: typing.TypeAlias = flatbuffers.number_types.UOffsetTFlags.py_type

class Unit(object):
  undefined = cast(int, ...)
  celsius = cast(int, ...)
  centimetre = cast(int, ...)
  cubic_metre_per_cubic_metre = cast(int, ...)
  cubic_metre_per_second = cast(int, ...)
  degree_direction = cast(int, ...)
  dimensionless_integer = cast(int, ...)
  dimensionless = cast(int, ...)
  european_air_quality_index = cast(int, ...)
  fahrenheit = cast(int, ...)
  feet = cast(int, ...)
  fraction = cast(int, ...)
  gdd_celsius = cast(int, ...)
  geopotential_metre = cast(int, ...)
  grains_per_cubic_metre = cast(int, ...)
  gram_per_kilogram = cast(int, ...)
  hectopascal = cast(int, ...)
  hours = cast(int, ...)
  inch = cast(int, ...)
  iso8601 = cast(int, ...)
  joule_per_kilogram = cast(int, ...)
  kelvin = cast(int, ...)
  kilopascal = cast(int, ...)
  kilogram_per_square_metre = cast(int, ...)
  kilometres_per_hour = cast(int, ...)
  knots = cast(int, ...)
  megajoule_per_square_metre = cast(int, ...)
  metre_per_second_not_unit_converted = cast(int, ...)
  metre_per_second = cast(int, ...)
  metre = cast(int, ...)
  micrograms_per_cubic_metre = cast(int, ...)
  miles_per_hour = cast(int, ...)
  millimetre = cast(int, ...)
  pascal = cast(int, ...)
  per_second = cast(int, ...)
  percentage = cast(int, ...)
  seconds = cast(int, ...)
  unix_time = cast(int, ...)
  us_air_quality_index = cast(int, ...)
  watt_per_square_metre = cast(int, ...)
  wmo_code = cast(int, ...)
  parts_per_million = cast(int, ...)
  kilogram_per_cubic_metre = cast(int, ...)

