// automatically generated by the FlatBuffers compiler, do not modify

package com.openmeteo.sdk

import com.google.flatbuffers.BaseVector
import com.google.flatbuffers.BooleanVector
import com.google.flatbuffers.ByteVector
import com.google.flatbuffers.Constants
import com.google.flatbuffers.DoubleVector
import com.google.flatbuffers.FlatBufferBuilder
import com.google.flatbuffers.FloatVector
import com.google.flatbuffers.LongVector
import com.google.flatbuffers.StringVector
import com.google.flatbuffers.Struct
import com.google.flatbuffers.Table
import com.google.flatbuffers.UnionVector
import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.math.sign

@Suppress("unused")
class WeatherApiResponse : Table() {

    fun __init(_i: Int, _bb: ByteBuffer)  {
        __reset(_i, _bb)
    }
    fun __assign(_i: Int, _bb: ByteBuffer) : WeatherApiResponse {
        __init(_i, _bb)
        return this
    }
    val latitude : Float
        get() {
            val o = __offset(4)
            return if(o != 0) bb.getFloat(o + bb_pos) else 0.0f
        }
    val longitude : Float
        get() {
            val o = __offset(6)
            return if(o != 0) bb.getFloat(o + bb_pos) else 0.0f
        }
    val elevation : Float
        get() {
            val o = __offset(8)
            return if(o != 0) bb.getFloat(o + bb_pos) else 0.0f
        }
    val generationTimeMilliseconds : Float
        get() {
            val o = __offset(10)
            return if(o != 0) bb.getFloat(o + bb_pos) else 0.0f
        }
    val locationId : Long
        get() {
            val o = __offset(12)
            return if(o != 0) bb.getLong(o + bb_pos) else 0L
        }
    val model : UByte
        get() {
            val o = __offset(14)
            return if(o != 0) bb.get(o + bb_pos).toUByte() else 0u
        }
    val utcOffsetSeconds : Int
        get() {
            val o = __offset(16)
            return if(o != 0) bb.getInt(o + bb_pos) else 0
        }
    val timezone : String?
        get() {
            val o = __offset(18)
            return if (o != 0) {
                __string(o + bb_pos)
            } else {
                null
            }
        }
    val timezoneAsByteBuffer : ByteBuffer get() = __vector_as_bytebuffer(18, 1)
    fun timezoneInByteBuffer(_bb: ByteBuffer) : ByteBuffer = __vector_in_bytebuffer(_bb, 18, 1)
    val timezoneAbbreviation : String?
        get() {
            val o = __offset(20)
            return if (o != 0) {
                __string(o + bb_pos)
            } else {
                null
            }
        }
    val timezoneAbbreviationAsByteBuffer : ByteBuffer get() = __vector_as_bytebuffer(20, 1)
    fun timezoneAbbreviationInByteBuffer(_bb: ByteBuffer) : ByteBuffer = __vector_in_bytebuffer(_bb, 20, 1)
    val current : com.openmeteo.sdk.VariablesWithTime? get() = current(com.openmeteo.sdk.VariablesWithTime())
    fun current(obj: com.openmeteo.sdk.VariablesWithTime) : com.openmeteo.sdk.VariablesWithTime? {
        val o = __offset(22)
        return if (o != 0) {
            obj.__assign(__indirect(o + bb_pos), bb)
        } else {
            null
        }
    }
    val daily : com.openmeteo.sdk.VariablesWithTime? get() = daily(com.openmeteo.sdk.VariablesWithTime())
    fun daily(obj: com.openmeteo.sdk.VariablesWithTime) : com.openmeteo.sdk.VariablesWithTime? {
        val o = __offset(24)
        return if (o != 0) {
            obj.__assign(__indirect(o + bb_pos), bb)
        } else {
            null
        }
    }
    val hourly : com.openmeteo.sdk.VariablesWithTime? get() = hourly(com.openmeteo.sdk.VariablesWithTime())
    fun hourly(obj: com.openmeteo.sdk.VariablesWithTime) : com.openmeteo.sdk.VariablesWithTime? {
        val o = __offset(26)
        return if (o != 0) {
            obj.__assign(__indirect(o + bb_pos), bb)
        } else {
            null
        }
    }
    val minutely15 : com.openmeteo.sdk.VariablesWithTime? get() = minutely15(com.openmeteo.sdk.VariablesWithTime())
    fun minutely15(obj: com.openmeteo.sdk.VariablesWithTime) : com.openmeteo.sdk.VariablesWithTime? {
        val o = __offset(28)
        return if (o != 0) {
            obj.__assign(__indirect(o + bb_pos), bb)
        } else {
            null
        }
    }
    val sixHourly : com.openmeteo.sdk.VariablesWithTime? get() = sixHourly(com.openmeteo.sdk.VariablesWithTime())
    fun sixHourly(obj: com.openmeteo.sdk.VariablesWithTime) : com.openmeteo.sdk.VariablesWithTime? {
        val o = __offset(30)
        return if (o != 0) {
            obj.__assign(__indirect(o + bb_pos), bb)
        } else {
            null
        }
    }
    companion object {
        fun validateVersion() = Constants.FLATBUFFERS_25_2_10()
        fun getRootAsWeatherApiResponse(_bb: ByteBuffer): WeatherApiResponse = getRootAsWeatherApiResponse(_bb, WeatherApiResponse())
        fun getRootAsWeatherApiResponse(_bb: ByteBuffer, obj: WeatherApiResponse): WeatherApiResponse {
            _bb.order(ByteOrder.LITTLE_ENDIAN)
            return (obj.__assign(_bb.getInt(_bb.position()) + _bb.position(), _bb))
        }
        fun createWeatherApiResponse(builder: FlatBufferBuilder, latitude: Float, longitude: Float, elevation: Float, generationTimeMilliseconds: Float, locationId: Long, model: UByte, utcOffsetSeconds: Int, timezoneOffset: Int, timezoneAbbreviationOffset: Int, currentOffset: Int, dailyOffset: Int, hourlyOffset: Int, minutely15Offset: Int, sixHourlyOffset: Int) : Int {
            builder.startTable(14)
            addLocationId(builder, locationId)
            addSixHourly(builder, sixHourlyOffset)
            addMinutely15(builder, minutely15Offset)
            addHourly(builder, hourlyOffset)
            addDaily(builder, dailyOffset)
            addCurrent(builder, currentOffset)
            addTimezoneAbbreviation(builder, timezoneAbbreviationOffset)
            addTimezone(builder, timezoneOffset)
            addUtcOffsetSeconds(builder, utcOffsetSeconds)
            addGenerationTimeMilliseconds(builder, generationTimeMilliseconds)
            addElevation(builder, elevation)
            addLongitude(builder, longitude)
            addLatitude(builder, latitude)
            addModel(builder, model)
            return endWeatherApiResponse(builder)
        }
        fun startWeatherApiResponse(builder: FlatBufferBuilder) = builder.startTable(14)
        fun addLatitude(builder: FlatBufferBuilder, latitude: Float) = builder.addFloat(0, latitude, 0.0)
        fun addLongitude(builder: FlatBufferBuilder, longitude: Float) = builder.addFloat(1, longitude, 0.0)
        fun addElevation(builder: FlatBufferBuilder, elevation: Float) = builder.addFloat(2, elevation, 0.0)
        fun addGenerationTimeMilliseconds(builder: FlatBufferBuilder, generationTimeMilliseconds: Float) = builder.addFloat(3, generationTimeMilliseconds, 0.0)
        fun addLocationId(builder: FlatBufferBuilder, locationId: Long) = builder.addLong(4, locationId, 0L)
        fun addModel(builder: FlatBufferBuilder, model: UByte) = builder.addByte(5, model.toByte(), 0)
        fun addUtcOffsetSeconds(builder: FlatBufferBuilder, utcOffsetSeconds: Int) = builder.addInt(6, utcOffsetSeconds, 0)
        fun addTimezone(builder: FlatBufferBuilder, timezone: Int) = builder.addOffset(7, timezone, 0)
        fun addTimezoneAbbreviation(builder: FlatBufferBuilder, timezoneAbbreviation: Int) = builder.addOffset(8, timezoneAbbreviation, 0)
        fun addCurrent(builder: FlatBufferBuilder, current: Int) = builder.addOffset(9, current, 0)
        fun addDaily(builder: FlatBufferBuilder, daily: Int) = builder.addOffset(10, daily, 0)
        fun addHourly(builder: FlatBufferBuilder, hourly: Int) = builder.addOffset(11, hourly, 0)
        fun addMinutely15(builder: FlatBufferBuilder, minutely15: Int) = builder.addOffset(12, minutely15, 0)
        fun addSixHourly(builder: FlatBufferBuilder, sixHourly: Int) = builder.addOffset(13, sixHourly, 0)
        fun endWeatherApiResponse(builder: FlatBufferBuilder) : Int {
            val o = builder.endTable()
            return o
        }
        fun finishWeatherApiResponseBuffer(builder: FlatBufferBuilder, offset: Int) = builder.finish(offset)
        fun finishSizePrefixedWeatherApiResponseBuffer(builder: FlatBufferBuilder, offset: Int) = builder.finishSizePrefixed(offset)
    }
}
