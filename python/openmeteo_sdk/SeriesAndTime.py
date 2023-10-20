# automatically generated by the FlatBuffers compiler, do not modify

# namespace: openmeteo_sdk

import flatbuffers
from flatbuffers.compat import import_numpy
from typing import Any
from openmeteo_sdk.Series import Series
from Variable import Variable
from Aggregation import Aggregation
from typing import Generator
from typing import Optional
np = import_numpy()

class SeriesAndTime(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAs(cls, buf, offset: int = 0):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = SeriesAndTime()
        x.Init(buf, n + offset)
        return x

    @classmethod
    def GetRootAsSeriesAndTime(cls, buf, offset=0):
        """This method is deprecated. Please switch to GetRootAs."""
        return cls.GetRootAs(buf, offset)
    # SeriesAndTime
    def Init(self, buf: bytes, pos: int):
        self._tab = flatbuffers.table.Table(buf, pos)

    # SeriesAndTime
    def Start(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int64Flags, o + self._tab.Pos)
        return 0

    # SeriesAndTime
    def End(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int64Flags, o + self._tab.Pos)
        return 0

    # SeriesAndTime
    def Interval(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int32Flags, o + self._tab.Pos)
        return 0

    # SeriesAndTime
    def Series(self, j: int) -> Optional[Series]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            x = self._tab.Vector(o)
            x += flatbuffers.number_types.UOffsetTFlags.py_type(j) * 4
            x = self._tab.Indirect(x)
            obj = Series()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # SeriesAndTime
    def SeriesLength(self) -> int:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # SeriesAndTime
    def SeriesIsNone(self) -> bool:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        return o == 0

    # Manually added
    def first(self, 
            variable: Variable, 
            altitude: int = None, 
            pressure_level: int = None, 
            depth: int = None,
            depth_to: int = None,
            aggregation: Aggregation = None
            ) -> Series:
        """Get a given data series by its variable name otherwise raise Error"""
        for s in self.filter(variable, altitude=altitude, pressure_level=pressure_level, depth=depth, depth_to=depth_to, aggregation=aggregation):
            return s
        raise ReferenceError()
    
    # Manually added
    def filter(self, 
                variable: Variable, 
                altitude: int = None, 
                pressure_level: int = None, 
                depth: int = None,
                depth_to: int = None,
                aggregation: Aggregation = None
                ) -> Generator[Series, None, None]:
        """Get all data series by its variable name"""
        for i in range(0, self.SeriesLength):
            s = self.Series(i)
            if s.Variable() != variable:
                continue
            if altitude != None and s.Altitude() != altitude:
                continue
            if pressure_level != None and s.PressureLevel() != pressure_level:
                continue
            if depth != None and s.Depth() != depth:
                continue
            if depth_to != None and s.DepthTo() != depth_to:
                continue
            if aggregation != None and s.Aggregation() != aggregation:
                continue
            yield s
