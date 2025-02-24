// automatically generated by the FlatBuffers compiler, do not modify

package com.openmeteo.sdk;

import com.google.flatbuffers.BaseVector;
import com.google.flatbuffers.BooleanVector;
import com.google.flatbuffers.ByteVector;
import com.google.flatbuffers.Constants;
import com.google.flatbuffers.DoubleVector;
import com.google.flatbuffers.FlatBufferBuilder;
import com.google.flatbuffers.FloatVector;
import com.google.flatbuffers.IntVector;
import com.google.flatbuffers.LongVector;
import com.google.flatbuffers.ShortVector;
import com.google.flatbuffers.StringVector;
import com.google.flatbuffers.Struct;
import com.google.flatbuffers.Table;
import com.google.flatbuffers.UnionVector;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import javax.annotation.Nullable;

@SuppressWarnings("unused")
public final class VariableWithValues extends Table {
  public static void ValidateVersion() { Constants.FLATBUFFERS_25_2_10(); }
  public static VariableWithValues getRootAsVariableWithValues(ByteBuffer _bb) { return getRootAsVariableWithValues(_bb, new VariableWithValues()); }
  public static VariableWithValues getRootAsVariableWithValues(ByteBuffer _bb, VariableWithValues obj) { _bb.order(ByteOrder.LITTLE_ENDIAN); return (obj.__assign(_bb.getInt(_bb.position()) + _bb.position(), _bb)); }
  public void __init(int _i, ByteBuffer _bb) { __reset(_i, _bb); }
  public VariableWithValues __assign(int _i, ByteBuffer _bb) { __init(_i, _bb); return this; }

  public int variable() { int o = __offset(4); return o != 0 ? bb.get(o + bb_pos) & 0xFF : 0; }
  public int unit() { int o = __offset(6); return o != 0 ? bb.get(o + bb_pos) & 0xFF : 0; }
  public float value() { int o = __offset(8); return o != 0 ? bb.getFloat(o + bb_pos) : 0.0f; }
  public float values(int j) { int o = __offset(10); return o != 0 ? bb.getFloat(__vector(o) + j * 4) : 0; }
  public int valuesLength() { int o = __offset(10); return o != 0 ? __vector_len(o) : 0; }
  public FloatVector valuesVector() { return valuesVector(new FloatVector()); }
  public FloatVector valuesVector(FloatVector obj) { int o = __offset(10); return o != 0 ? obj.__assign(__vector(o), bb) : null; }
  public ByteBuffer valuesAsByteBuffer() { return __vector_as_bytebuffer(10, 4); }
  public ByteBuffer valuesInByteBuffer(ByteBuffer _bb) { return __vector_in_bytebuffer(_bb, 10, 4); }
  public long valuesInt64(int j) { int o = __offset(12); return o != 0 ? bb.getLong(__vector(o) + j * 8) : 0; }
  public int valuesInt64Length() { int o = __offset(12); return o != 0 ? __vector_len(o) : 0; }
  public LongVector valuesInt64Vector() { return valuesInt64Vector(new LongVector()); }
  public LongVector valuesInt64Vector(LongVector obj) { int o = __offset(12); return o != 0 ? obj.__assign(__vector(o), bb) : null; }
  public ByteBuffer valuesInt64AsByteBuffer() { return __vector_as_bytebuffer(12, 8); }
  public ByteBuffer valuesInt64InByteBuffer(ByteBuffer _bb) { return __vector_in_bytebuffer(_bb, 12, 8); }
  public short altitude() { int o = __offset(14); return o != 0 ? bb.getShort(o + bb_pos) : 0; }
  public int aggregation() { int o = __offset(16); return o != 0 ? bb.get(o + bb_pos) & 0xFF : 0; }
  public short pressureLevel() { int o = __offset(18); return o != 0 ? bb.getShort(o + bb_pos) : 0; }
  public short depth() { int o = __offset(20); return o != 0 ? bb.getShort(o + bb_pos) : 0; }
  public short depthTo() { int o = __offset(22); return o != 0 ? bb.getShort(o + bb_pos) : 0; }
  public short ensembleMember() { int o = __offset(24); return o != 0 ? bb.getShort(o + bb_pos) : 0; }
  public short previousDay() { int o = __offset(26); return o != 0 ? bb.getShort(o + bb_pos) : 0; }

  public static int createVariableWithValues(FlatBufferBuilder builder,
      int variable,
      int unit,
      float value,
      int valuesOffset,
      int valuesInt64Offset,
      short altitude,
      int aggregation,
      short pressureLevel,
      short depth,
      short depthTo,
      short ensembleMember,
      short previousDay) {
    builder.startTable(12);
    VariableWithValues.addValuesInt64(builder, valuesInt64Offset);
    VariableWithValues.addValues(builder, valuesOffset);
    VariableWithValues.addValue(builder, value);
    VariableWithValues.addPreviousDay(builder, previousDay);
    VariableWithValues.addEnsembleMember(builder, ensembleMember);
    VariableWithValues.addDepthTo(builder, depthTo);
    VariableWithValues.addDepth(builder, depth);
    VariableWithValues.addPressureLevel(builder, pressureLevel);
    VariableWithValues.addAltitude(builder, altitude);
    VariableWithValues.addAggregation(builder, aggregation);
    VariableWithValues.addUnit(builder, unit);
    VariableWithValues.addVariable(builder, variable);
    return VariableWithValues.endVariableWithValues(builder);
  }

  public static void startVariableWithValues(FlatBufferBuilder builder) { builder.startTable(12); }
  public static void addVariable(FlatBufferBuilder builder, int variable) { builder.addByte(0, (byte) variable, (byte) 0); }
  public static void addUnit(FlatBufferBuilder builder, int unit) { builder.addByte(1, (byte) unit, (byte) 0); }
  public static void addValue(FlatBufferBuilder builder, float value) { builder.addFloat(2, value, 0.0f); }
  public static void addValues(FlatBufferBuilder builder, int valuesOffset) { builder.addOffset(3, valuesOffset, 0); }
  public static int createValuesVector(FlatBufferBuilder builder, float[] data) { builder.startVector(4, data.length, 4); for (int i = data.length - 1; i >= 0; i--) builder.addFloat(data[i]); return builder.endVector(); }
  public static void startValuesVector(FlatBufferBuilder builder, int numElems) { builder.startVector(4, numElems, 4); }
  public static void addValuesInt64(FlatBufferBuilder builder, int valuesInt64Offset) { builder.addOffset(4, valuesInt64Offset, 0); }
  public static int createValuesInt64Vector(FlatBufferBuilder builder, long[] data) { builder.startVector(8, data.length, 8); for (int i = data.length - 1; i >= 0; i--) builder.addLong(data[i]); return builder.endVector(); }
  public static void startValuesInt64Vector(FlatBufferBuilder builder, int numElems) { builder.startVector(8, numElems, 8); }
  public static void addAltitude(FlatBufferBuilder builder, short altitude) { builder.addShort(5, altitude, 0); }
  public static void addAggregation(FlatBufferBuilder builder, int aggregation) { builder.addByte(6, (byte) aggregation, (byte) 0); }
  public static void addPressureLevel(FlatBufferBuilder builder, short pressureLevel) { builder.addShort(7, pressureLevel, 0); }
  public static void addDepth(FlatBufferBuilder builder, short depth) { builder.addShort(8, depth, 0); }
  public static void addDepthTo(FlatBufferBuilder builder, short depthTo) { builder.addShort(9, depthTo, 0); }
  public static void addEnsembleMember(FlatBufferBuilder builder, short ensembleMember) { builder.addShort(10, ensembleMember, 0); }
  public static void addPreviousDay(FlatBufferBuilder builder, short previousDay) { builder.addShort(11, previousDay, 0); }
  public static int endVariableWithValues(FlatBufferBuilder builder) {
    int o = builder.endTable();
    return o;
  }

  public static final class Vector extends BaseVector {
    public Vector __assign(int _vector, int _element_size, ByteBuffer _bb) { __reset(_vector, _element_size, _bb); return this; }

    public VariableWithValues get(int j) { return get(new VariableWithValues(), j); }
    public VariableWithValues get(VariableWithValues obj, int j) {  return obj.__assign(__indirect(__element(j), bb), bb); }
  }
}

