# automatically generated by the FlatBuffers compiler, do not modify

# namespace: openmeteo_sdk

import flatbuffers
from flatbuffers.compat import import_numpy
from typing import Any
from openmeteo_sdk.SeriesAndTime import SeriesAndTime
from openmeteo_sdk.SingleValueAndTime import SingleValueAndTime
from typing import Optional
np = import_numpy()

class ApiResponse(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAs(cls, buf, offset: int = 0):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = ApiResponse()
        x.Init(buf, n + offset)
        return x

    @classmethod
    def GetRootAsApiResponse(cls, buf, offset=0):
        """This method is deprecated. Please switch to GetRootAs."""
        return cls.GetRootAs(buf, offset)
    # ApiResponse
    def Init(self, buf: bytes, pos: int):
        self._tab = flatbuffers.table.Table(buf, pos)

    # ApiResponse
    def Latitude(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Float32Flags, o + self._tab.Pos)
        return 0.0

    # ApiResponse
    def Longitude(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Float32Flags, o + self._tab.Pos)
        return 0.0

    # ApiResponse
    def Elevation(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Float32Flags, o + self._tab.Pos)
        return 0.0

    # ApiResponse
    def LocationId(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int32Flags, o + self._tab.Pos)
        return 0

    # ApiResponse
    def Model(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(12))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int8Flags, o + self._tab.Pos)
        return 0

    # ApiResponse
    def GenerationtimeMs(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(14))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Float32Flags, o + self._tab.Pos)
        return 0.0

    # ApiResponse
    def UtcOffsetSeconds(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(16))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int32Flags, o + self._tab.Pos)
        return 0

    # ApiResponse
    def Timezone(self) -> Optional[str]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(18))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # ApiResponse
    def TimezoneAbbreviation(self) -> Optional[str]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(20))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # ApiResponse
    def Current(self) -> Optional[SingleValueAndTime]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(22))
        if o != 0:
            x = self._tab.Indirect(o + self._tab.Pos)
            obj = SingleValueAndTime()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # ApiResponse
    def Daily(self) -> Optional[SeriesAndTime]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(24))
        if o != 0:
            x = self._tab.Indirect(o + self._tab.Pos)
            obj = SeriesAndTime()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # ApiResponse
    def Hourly(self) -> Optional[SeriesAndTime]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(26))
        if o != 0:
            x = self._tab.Indirect(o + self._tab.Pos)
            obj = SeriesAndTime()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # ApiResponse
    def SixHourly(self) -> Optional[SeriesAndTime]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(28))
        if o != 0:
            x = self._tab.Indirect(o + self._tab.Pos)
            obj = SeriesAndTime()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # ApiResponse
    def Minutely15(self) -> Optional[SeriesAndTime]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(30))
        if o != 0:
            x = self._tab.Indirect(o + self._tab.Pos)
            obj = SeriesAndTime()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

