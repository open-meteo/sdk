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
public final class VariablesWithTime extends Table {
  public static void ValidateVersion() { Constants.FLATBUFFERS_23_5_26(); }
  public static VariablesWithTime getRootAsVariablesWithTime(ByteBuffer _bb) { return getRootAsVariablesWithTime(_bb, new VariablesWithTime()); }
  public static VariablesWithTime getRootAsVariablesWithTime(ByteBuffer _bb, VariablesWithTime obj) { _bb.order(ByteOrder.LITTLE_ENDIAN); return (obj.__assign(_bb.getInt(_bb.position()) + _bb.position(), _bb)); }
  public void __init(int _i, ByteBuffer _bb) { __reset(_i, _bb); }
  public VariablesWithTime __assign(int _i, ByteBuffer _bb) { __init(_i, _bb); return this; }

  public long time() { int o = __offset(4); return o != 0 ? bb.getLong(o + bb_pos) : 0L; }
  public long timeEnd() { int o = __offset(6); return o != 0 ? bb.getLong(o + bb_pos) : 0L; }
  public int interval() { int o = __offset(8); return o != 0 ? bb.getInt(o + bb_pos) : 0; }
  public com.openmeteo.sdk.VariableWithValues variables(int j) { return variables(new com.openmeteo.sdk.VariableWithValues(), j); }
  public com.openmeteo.sdk.VariableWithValues variables(com.openmeteo.sdk.VariableWithValues obj, int j) { int o = __offset(10); return o != 0 ? obj.__assign(__indirect(__vector(o) + j * 4), bb) : null; }
  public int variablesLength() { int o = __offset(10); return o != 0 ? __vector_len(o) : 0; }
  public com.openmeteo.sdk.VariableWithValues.Vector variablesVector() { return variablesVector(new com.openmeteo.sdk.VariableWithValues.Vector()); }
  public com.openmeteo.sdk.VariableWithValues.Vector variablesVector(com.openmeteo.sdk.VariableWithValues.Vector obj) { int o = __offset(10); return o != 0 ? obj.__assign(__vector(o), 4, bb) : null; }

  public static int createVariablesWithTime(FlatBufferBuilder builder,
      long time,
      long timeEnd,
      int interval,
      int variablesOffset) {
    builder.startTable(4);
    VariablesWithTime.addTimeEnd(builder, timeEnd);
    VariablesWithTime.addTime(builder, time);
    VariablesWithTime.addVariables(builder, variablesOffset);
    VariablesWithTime.addInterval(builder, interval);
    return VariablesWithTime.endVariablesWithTime(builder);
  }

  public static void startVariablesWithTime(FlatBufferBuilder builder) { builder.startTable(4); }
  public static void addTime(FlatBufferBuilder builder, long time) { builder.addLong(0, time, 0L); }
  public static void addTimeEnd(FlatBufferBuilder builder, long timeEnd) { builder.addLong(1, timeEnd, 0L); }
  public static void addInterval(FlatBufferBuilder builder, int interval) { builder.addInt(2, interval, 0); }
  public static void addVariables(FlatBufferBuilder builder, int variablesOffset) { builder.addOffset(3, variablesOffset, 0); }
  public static int createVariablesVector(FlatBufferBuilder builder, int[] data) { builder.startVector(4, data.length, 4); for (int i = data.length - 1; i >= 0; i--) builder.addOffset(data[i]); return builder.endVector(); }
  public static void startVariablesVector(FlatBufferBuilder builder, int numElems) { builder.startVector(4, numElems, 4); }
  public static int endVariablesWithTime(FlatBufferBuilder builder) {
    int o = builder.endTable();
    return o;
  }

  public static final class Vector extends BaseVector {
    public Vector __assign(int _vector, int _element_size, ByteBuffer _bb) { __reset(_vector, _element_size, _bb); return this; }

    public VariablesWithTime get(int j) { return get(new VariablesWithTime(), j); }
    public VariablesWithTime get(VariablesWithTime obj, int j) {  return obj.__assign(__indirect(__element(j), bb), bb); }
  }
}
