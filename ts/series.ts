// automatically generated by the FlatBuffers compiler, do not modify

import * as flatbuffers from 'flatbuffers';

import { Aggregation } from './aggregation.js';
import { SiUnit } from './si-unit.js';
import { Variable } from './variable.js';


export class Series {
  bb: flatbuffers.ByteBuffer|null = null;
  bb_pos = 0;
  __init(i:number, bb:flatbuffers.ByteBuffer):Series {
  this.bb_pos = i;
  this.bb = bb;
  return this;
}

static getRootAsSeries(bb:flatbuffers.ByteBuffer, obj?:Series):Series {
  return (obj || new Series()).__init(bb.readInt32(bb.position()) + bb.position(), bb);
}

static getSizePrefixedRootAsSeries(bb:flatbuffers.ByteBuffer, obj?:Series):Series {
  bb.setPosition(bb.position() + flatbuffers.SIZE_PREFIX_LENGTH);
  return (obj || new Series()).__init(bb.readInt32(bb.position()) + bb.position(), bb);
}

variable():Variable {
  const offset = this.bb!.__offset(this.bb_pos, 4);
  return offset ? this.bb!.readInt8(this.bb_pos + offset) : Variable.undefined;
}

unit():SiUnit {
  const offset = this.bb!.__offset(this.bb_pos, 6);
  return offset ? this.bb!.readInt8(this.bb_pos + offset) : SiUnit.undefined;
}

aggregation():Aggregation {
  const offset = this.bb!.__offset(this.bb_pos, 8);
  return offset ? this.bb!.readInt8(this.bb_pos + offset) : Aggregation.none;
}

altitude():number {
  const offset = this.bb!.__offset(this.bb_pos, 10);
  return offset ? this.bb!.readInt16(this.bb_pos + offset) : 0;
}

pressureLevel():number {
  const offset = this.bb!.__offset(this.bb_pos, 12);
  return offset ? this.bb!.readInt16(this.bb_pos + offset) : 0;
}

depth():number {
  const offset = this.bb!.__offset(this.bb_pos, 14);
  return offset ? this.bb!.readInt16(this.bb_pos + offset) : 0;
}

depthTo():number {
  const offset = this.bb!.__offset(this.bb_pos, 16);
  return offset ? this.bb!.readInt16(this.bb_pos + offset) : 0;
}

ensembleMember():number {
  const offset = this.bb!.__offset(this.bb_pos, 18);
  return offset ? this.bb!.readInt16(this.bb_pos + offset) : 0;
}

values(index: number):number|null {
  const offset = this.bb!.__offset(this.bb_pos, 20);
  return offset ? this.bb!.readFloat32(this.bb!.__vector(this.bb_pos + offset) + index * 4) : 0;
}

valuesLength():number {
  const offset = this.bb!.__offset(this.bb_pos, 20);
  return offset ? this.bb!.__vector_len(this.bb_pos + offset) : 0;
}

valuesArray():Float32Array|null {
  const offset = this.bb!.__offset(this.bb_pos, 20);
  return offset ? new Float32Array(this.bb!.bytes().buffer, this.bb!.bytes().byteOffset + this.bb!.__vector(this.bb_pos + offset), this.bb!.__vector_len(this.bb_pos + offset)) : null;
}

valuesInt64(index: number):bigint|null {
  const offset = this.bb!.__offset(this.bb_pos, 22);
  return offset ? this.bb!.readInt64(this.bb!.__vector(this.bb_pos + offset) + index * 8) : BigInt(0);
}

valuesInt64Length():number {
  const offset = this.bb!.__offset(this.bb_pos, 22);
  return offset ? this.bb!.__vector_len(this.bb_pos + offset) : 0;
}

static startSeries(builder:flatbuffers.Builder) {
  builder.startObject(10);
}

static addVariable(builder:flatbuffers.Builder, variable:Variable) {
  builder.addFieldInt8(0, variable, Variable.undefined);
}

static addUnit(builder:flatbuffers.Builder, unit:SiUnit) {
  builder.addFieldInt8(1, unit, SiUnit.undefined);
}

static addAggregation(builder:flatbuffers.Builder, aggregation:Aggregation) {
  builder.addFieldInt8(2, aggregation, Aggregation.none);
}

static addAltitude(builder:flatbuffers.Builder, altitude:number) {
  builder.addFieldInt16(3, altitude, 0);
}

static addPressureLevel(builder:flatbuffers.Builder, pressureLevel:number) {
  builder.addFieldInt16(4, pressureLevel, 0);
}

static addDepth(builder:flatbuffers.Builder, depth:number) {
  builder.addFieldInt16(5, depth, 0);
}

static addDepthTo(builder:flatbuffers.Builder, depthTo:number) {
  builder.addFieldInt16(6, depthTo, 0);
}

static addEnsembleMember(builder:flatbuffers.Builder, ensembleMember:number) {
  builder.addFieldInt16(7, ensembleMember, 0);
}

static addValues(builder:flatbuffers.Builder, valuesOffset:flatbuffers.Offset) {
  builder.addFieldOffset(8, valuesOffset, 0);
}

static createValuesVector(builder:flatbuffers.Builder, data:number[]|Float32Array):flatbuffers.Offset;
/**
 * @deprecated This Uint8Array overload will be removed in the future.
 */
static createValuesVector(builder:flatbuffers.Builder, data:number[]|Uint8Array):flatbuffers.Offset;
static createValuesVector(builder:flatbuffers.Builder, data:number[]|Float32Array|Uint8Array):flatbuffers.Offset {
  builder.startVector(4, data.length, 4);
  for (let i = data.length - 1; i >= 0; i--) {
    builder.addFloat32(data[i]!);
  }
  return builder.endVector();
}

static startValuesVector(builder:flatbuffers.Builder, numElems:number) {
  builder.startVector(4, numElems, 4);
}

static addValuesInt64(builder:flatbuffers.Builder, valuesInt64Offset:flatbuffers.Offset) {
  builder.addFieldOffset(9, valuesInt64Offset, 0);
}

static createValuesInt64Vector(builder:flatbuffers.Builder, data:bigint[]):flatbuffers.Offset {
  builder.startVector(8, data.length, 8);
  for (let i = data.length - 1; i >= 0; i--) {
    builder.addInt64(data[i]!);
  }
  return builder.endVector();
}

static startValuesInt64Vector(builder:flatbuffers.Builder, numElems:number) {
  builder.startVector(8, numElems, 8);
}

static endSeries(builder:flatbuffers.Builder):flatbuffers.Offset {
  const offset = builder.endObject();
  return offset;
}

static createSeries(builder:flatbuffers.Builder, variable:Variable, unit:SiUnit, aggregation:Aggregation, altitude:number, pressureLevel:number, depth:number, depthTo:number, ensembleMember:number, valuesOffset:flatbuffers.Offset, valuesInt64Offset:flatbuffers.Offset):flatbuffers.Offset {
  Series.startSeries(builder);
  Series.addVariable(builder, variable);
  Series.addUnit(builder, unit);
  Series.addAggregation(builder, aggregation);
  Series.addAltitude(builder, altitude);
  Series.addPressureLevel(builder, pressureLevel);
  Series.addDepth(builder, depth);
  Series.addDepthTo(builder, depthTo);
  Series.addEnsembleMember(builder, ensembleMember);
  Series.addValues(builder, valuesOffset);
  Series.addValuesInt64(builder, valuesInt64Offset);
  return Series.endSeries(builder);
}
}