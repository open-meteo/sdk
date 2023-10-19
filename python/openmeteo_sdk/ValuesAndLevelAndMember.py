# automatically generated by the FlatBuffers compiler, do not modify

# namespace: openmeteo_sdk

import flatbuffers
from flatbuffers.compat import import_numpy
from typing import Any
from openmeteo_sdk.ValuesAndMember import ValuesAndMember
from typing import Optional
np = import_numpy()

class ValuesAndLevelAndMember(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAs(cls, buf, offset: int = 0):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = ValuesAndLevelAndMember()
        x.Init(buf, n + offset)
        return x

    @classmethod
    def GetRootAsValuesAndLevelAndMember(cls, buf, offset=0):
        """This method is deprecated. Please switch to GetRootAs."""
        return cls.GetRootAs(buf, offset)
    # ValuesAndLevelAndMember
    def Init(self, buf: bytes, pos: int):
        self._tab = flatbuffers.table.Table(buf, pos)

    # ValuesAndLevelAndMember
    def Level(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int32Flags, o + self._tab.Pos)
        return 0

    # ValuesAndLevelAndMember
    def Values(self, j: int) -> Optional[ValuesAndMember]:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            x = self._tab.Vector(o)
            x += flatbuffers.number_types.UOffsetTFlags.py_type(j) * 4
            x = self._tab.Indirect(x)
            obj = ValuesAndMember()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # ValuesAndLevelAndMember
    def ValuesLength(self) -> int:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # ValuesAndLevelAndMember
    def ValuesIsNone(self) -> bool:
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        return o == 0

def ValuesAndLevelAndMemberStart(builder: flatbuffers.Builder):
    builder.StartObject(2)

def Start(builder: flatbuffers.Builder):
    ValuesAndLevelAndMemberStart(builder)

def ValuesAndLevelAndMemberAddLevel(builder: flatbuffers.Builder, level: int):
    builder.PrependInt32Slot(0, level, 0)

def AddLevel(builder: flatbuffers.Builder, level: int):
    ValuesAndLevelAndMemberAddLevel(builder, level)

def ValuesAndLevelAndMemberAddValues(builder: flatbuffers.Builder, values: int):
    builder.PrependUOffsetTRelativeSlot(1, flatbuffers.number_types.UOffsetTFlags.py_type(values), 0)

def AddValues(builder: flatbuffers.Builder, values: int):
    ValuesAndLevelAndMemberAddValues(builder, values)

def ValuesAndLevelAndMemberStartValuesVector(builder, numElems: int) -> int:
    return builder.StartVector(4, numElems, 4)

def StartValuesVector(builder, numElems: int) -> int:
    return ValuesAndLevelAndMemberStartValuesVector(builder, numElems)

def ValuesAndLevelAndMemberEnd(builder: flatbuffers.Builder) -> int:
    return builder.EndObject()

def End(builder: flatbuffers.Builder) -> int:
    return ValuesAndLevelAndMemberEnd(builder)