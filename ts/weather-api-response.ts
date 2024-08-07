// automatically generated by the FlatBuffers compiler, do not modify

import * as flatbuffers from 'flatbuffers';

import { Model } from './model.js';
import { VariablesWithTime } from './variables-with-time.js';


export class WeatherApiResponse {
  bb: flatbuffers.ByteBuffer|null = null;
  bb_pos = 0;
  __init(i:number, bb:flatbuffers.ByteBuffer):WeatherApiResponse {
  this.bb_pos = i;
  this.bb = bb;
  return this;
}

static getRootAsWeatherApiResponse(bb:flatbuffers.ByteBuffer, obj?:WeatherApiResponse):WeatherApiResponse {
  return (obj || new WeatherApiResponse()).__init(bb.readInt32(bb.position()) + bb.position(), bb);
}

static getSizePrefixedRootAsWeatherApiResponse(bb:flatbuffers.ByteBuffer, obj?:WeatherApiResponse):WeatherApiResponse {
  bb.setPosition(bb.position() + flatbuffers.SIZE_PREFIX_LENGTH);
  return (obj || new WeatherApiResponse()).__init(bb.readInt32(bb.position()) + bb.position(), bb);
}

latitude():number {
  const offset = this.bb!.__offset(this.bb_pos, 4);
  return offset ? this.bb!.readFloat32(this.bb_pos + offset) : 0.0;
}

longitude():number {
  const offset = this.bb!.__offset(this.bb_pos, 6);
  return offset ? this.bb!.readFloat32(this.bb_pos + offset) : 0.0;
}

elevation():number {
  const offset = this.bb!.__offset(this.bb_pos, 8);
  return offset ? this.bb!.readFloat32(this.bb_pos + offset) : 0.0;
}

generationTimeMilliseconds():number {
  const offset = this.bb!.__offset(this.bb_pos, 10);
  return offset ? this.bb!.readFloat32(this.bb_pos + offset) : 0.0;
}

locationId():bigint {
  const offset = this.bb!.__offset(this.bb_pos, 12);
  return offset ? this.bb!.readInt64(this.bb_pos + offset) : BigInt('0');
}

model():Model {
  const offset = this.bb!.__offset(this.bb_pos, 14);
  return offset ? this.bb!.readUint8(this.bb_pos + offset) : Model.undefined;
}

utcOffsetSeconds():number {
  const offset = this.bb!.__offset(this.bb_pos, 16);
  return offset ? this.bb!.readInt32(this.bb_pos + offset) : 0;
}

timezone():string|null
timezone(optionalEncoding:flatbuffers.Encoding):string|Uint8Array|null
timezone(optionalEncoding?:any):string|Uint8Array|null {
  const offset = this.bb!.__offset(this.bb_pos, 18);
  return offset ? this.bb!.__string(this.bb_pos + offset, optionalEncoding) : null;
}

timezoneAbbreviation():string|null
timezoneAbbreviation(optionalEncoding:flatbuffers.Encoding):string|Uint8Array|null
timezoneAbbreviation(optionalEncoding?:any):string|Uint8Array|null {
  const offset = this.bb!.__offset(this.bb_pos, 20);
  return offset ? this.bb!.__string(this.bb_pos + offset, optionalEncoding) : null;
}

current(obj?:VariablesWithTime):VariablesWithTime|null {
  const offset = this.bb!.__offset(this.bb_pos, 22);
  return offset ? (obj || new VariablesWithTime()).__init(this.bb!.__indirect(this.bb_pos + offset), this.bb!) : null;
}

daily(obj?:VariablesWithTime):VariablesWithTime|null {
  const offset = this.bb!.__offset(this.bb_pos, 24);
  return offset ? (obj || new VariablesWithTime()).__init(this.bb!.__indirect(this.bb_pos + offset), this.bb!) : null;
}

hourly(obj?:VariablesWithTime):VariablesWithTime|null {
  const offset = this.bb!.__offset(this.bb_pos, 26);
  return offset ? (obj || new VariablesWithTime()).__init(this.bb!.__indirect(this.bb_pos + offset), this.bb!) : null;
}

minutely15(obj?:VariablesWithTime):VariablesWithTime|null {
  const offset = this.bb!.__offset(this.bb_pos, 28);
  return offset ? (obj || new VariablesWithTime()).__init(this.bb!.__indirect(this.bb_pos + offset), this.bb!) : null;
}

sixHourly(obj?:VariablesWithTime):VariablesWithTime|null {
  const offset = this.bb!.__offset(this.bb_pos, 30);
  return offset ? (obj || new VariablesWithTime()).__init(this.bb!.__indirect(this.bb_pos + offset), this.bb!) : null;
}

}
