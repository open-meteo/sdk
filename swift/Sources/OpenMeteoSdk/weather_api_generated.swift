// automatically generated by the FlatBuffers compiler, do not modify
// swiftlint:disable all
// swiftformat:disable all

import FlatBuffers

public enum openmeteo_sdk_Unit: UInt8, Enum, Verifiable {
  public typealias T = UInt8
  public static var byteSize: Int { return MemoryLayout<UInt8>.size }
  public var value: UInt8 { return self.rawValue }
  case undefined = 0
  case celsius = 1
  case centimetre = 2
  case cubicMetrePerCubicMetre = 3
  case cubicMetrePerSecond = 4
  case degreeDirection = 5
  case dimensionlessInteger = 6
  case dimensionless = 7
  case europeanAirQualityIndex = 8
  case fahrenheit = 9
  case feet = 10
  case fraction = 11
  case gddCelsius = 12
  case geopotentialMetre = 13
  case grainsPerCubicMetre = 14
  case gramPerKilogram = 15
  case hectopascal = 16
  case hours = 17
  case inch = 18
  case iso8601 = 19
  case joulePerKilogram = 20
  case kelvin = 21
  case kilopascal = 22
  case kilogramPerSquareMetre = 23
  case kilometresPerHour = 24
  case knots = 25
  case megajoulePerSquareMetre = 26
  case metrePerSecondNotUnitConverted = 27
  case metrePerSecond = 28
  case metre = 29
  case microgramsPerCubicMetre = 30
  case milesPerHour = 31
  case millimetre = 32
  case pascal = 33
  case perSecond = 34
  case percentage = 35
  case seconds = 36
  case unixTime = 37
  case usAirQualityIndex = 38
  case wattPerSquareMetre = 39
  case wmoCode = 40
  case partsPerMillion = 41

  public static var max: openmeteo_sdk_Unit { return .partsPerMillion }
  public static var min: openmeteo_sdk_Unit { return .undefined }
}


public enum openmeteo_sdk_Model: UInt8, Enum, Verifiable {
  public typealias T = UInt8
  public static var byteSize: Int { return MemoryLayout<UInt8>.size }
  public var value: UInt8 { return self.rawValue }
  case undefined = 0
  case bestMatch = 1
  case gfsSeamless = 2
  case gfsGlobal = 3
  case gfsHrrr = 4
  case meteofranceSeamless = 5
  case meteofranceArpegeSeamless = 6
  case meteofranceArpegeWorld = 7
  case meteofranceArpegeEurope = 8
  case meteofranceAromeSeamless = 9
  case meteofranceAromeFrance = 10
  case meteofranceAromeFranceHd = 11
  case jmaSeamless = 12
  case jmaMsm = 13
  case jmsGsm = 14
  case jmaGsm = 15
  case gemSeamless = 16
  case gemGlobal = 17
  case gemRegional = 18
  case gemHrdpsContinental = 19
  case iconSeamless = 20
  case iconGlobal = 21
  case iconEu = 22
  case iconD2 = 23
  case ecmwfIfs04 = 24
  case metnoNordic = 25
  case era5Seamless = 26
  case era5 = 27
  case cerra = 28
  case era5Land = 29
  case ecmwfIfs = 30
  case gwam = 31
  case ewam = 32
  case glofasSeamlessV3 = 33
  case glofasForecastV3 = 34
  case glofasConsolidatedV3 = 35
  case glofasSeamlessV4 = 36
  case glofasForecastV4 = 37
  case glofasConsolidatedV4 = 38
  case gfs025 = 39
  case gfs05 = 40
  case cmccCm2Vhr4 = 41
  case fgoalsF3HHighressst = 42
  case fgoalsF3H = 43
  case hiramSitHr = 44
  case mriAgcm32S = 45
  case ecEarth3pHr = 46
  case mpiEsm12Xr = 47
  case nicam168s = 48
  case camsEurope = 49
  case camsGlobal = 50
  case cfsv2 = 51
  case era5Ocean = 52
  case cmaGrapesGlobal = 53
  case bomAccessGlobal = 54
  case bomAccessGlobalEnsemble = 55
  case arpaeCosmoSeamless = 56
  case arpaeCosmo2i = 57
  case arpaeCosmo2iRuc = 58
  case arpaeCosmo5m = 59
  case ecmwfIfs025 = 60
  case ecmwfAifs025 = 61
  case gfs013 = 62
  case gfsGraphcast025 = 63
  case ecmwfWam025 = 64
  case meteofranceWave = 65
  case meteofranceCurrents = 66
  case ecmwfWam025Ensemble = 67
  case ncepGfswave025 = 68
  case ncepGefswave025 = 69
  case knmiSeamless = 70
  case knmiHarmonieAromeEurope = 71
  case knmiHarmonieAromeNetherlands = 72
  case dmiSeamless = 73
  case dmiHarmonieAromeEurope = 74
  case metnoSeamless = 75
  case era5Ensemble = 76
  case ecmwfIfsAnalysis = 77
  case ecmwfIfsLongWindow = 78
  case ecmwfIfsAnalysisLongWindow = 79
  case ukmoGlobalDeterministic10km = 80
  case ukmoUkDeterministic2km = 81
  case ukmoSeamless = 82
  case ncepGfswave016 = 83
  case ncepNbmConus = 84
  case ukmoGlobalEnsemble20km = 85
  case ecmwfAifs025Single = 86
  case jmaJaxaHimawari = 87
  case eumetsatSarah3 = 88
  case eumetsatLsaSafMsg = 89
  case eumetsatLsaSafIodc = 90
  case satelliteRadiationSeamless = 91
  case kmaGdps = 92
  case kmaLdps = 93

  public static var max: openmeteo_sdk_Model { return .kmaLdps }
  public static var min: openmeteo_sdk_Model { return .undefined }
}


public enum openmeteo_sdk_Variable: UInt8, Enum, Verifiable {
  public typealias T = UInt8
  public static var byteSize: Int { return MemoryLayout<UInt8>.size }
  public var value: UInt8 { return self.rawValue }
  case undefined = 0
  case apparentTemperature = 1
  case cape = 2
  case cloudCover = 3
  case cloudCoverHigh = 4
  case cloudCoverLow = 5
  case cloudCoverMid = 6
  case daylightDuration = 7
  case dewPoint = 8
  case diffuseRadiation = 9
  case diffuseRadiationInstant = 10
  case directNormalIrradiance = 11
  case directNormalIrradianceInstant = 12
  case directRadiation = 13
  case directRadiationInstant = 14
  case et0FaoEvapotranspiration = 15
  case evapotranspiration = 16
  case freezingLevelHeight = 17
  case growingDegreeDays = 18
  case isDay = 19
  case latentHeatFlux = 20
  case leafWetnessProbability = 21
  case liftedIndex = 22
  case lightningPotential = 23
  case precipitation = 24
  case precipitationHours = 25
  case precipitationProbability = 26
  case pressureMsl = 27
  case rain = 28
  case relativeHumidity = 29
  case runoff = 30
  case sensibleHeatFlux = 31
  case shortwaveRadiation = 32
  case shortwaveRadiationInstant = 33
  case showers = 34
  case snowDepth = 35
  case snowHeight = 36
  case snowfall = 37
  case snowfallHeight = 38
  case snowfallWaterEquivalent = 39
  case sunrise = 40
  case sunset = 41
  case soilMoisture = 42
  case soilMoistureIndex = 43
  case soilTemperature = 44
  case surfacePressure = 45
  case surfaceTemperature = 46
  case temperature = 47
  case terrestrialRadiation = 48
  case terrestrialRadiationInstant = 49
  case totalColumnIntegratedWaterVapour = 50
  case updraft = 51
  case uvIndex = 52
  case uvIndexClearSky = 53
  case vapourPressureDeficit = 54
  case visibility = 55
  case weatherCode = 56
  case windDirection = 57
  case windGusts = 58
  case windSpeed = 59
  case verticalVelocity = 60
  case geopotentialHeight = 61
  case wetBulbTemperature = 62
  case riverDischarge = 63
  case waveHeight = 64
  case wavePeriod = 65
  case waveDirection = 66
  case windWaveHeight = 67
  case windWavePeriod = 68
  case windWavePeakPeriod = 69
  case windWaveDirection = 70
  case swellWaveHeight = 71
  case swellWavePeriod = 72
  case swellWavePeakPeriod = 73
  case swellWaveDirection = 74
  case pm10 = 75
  case pm2p5 = 76
  case dust = 77
  case aerosolOpticalDepth = 78
  case carbonMonoxide = 79
  case nitrogenDioxide = 80
  case ammonia = 81
  case ozone = 82
  case sulphurDioxide = 83
  case alderPollen = 84
  case birchPollen = 85
  case grassPollen = 86
  case mugwortPollen = 87
  case olivePollen = 88
  case ragweedPollen = 89
  case europeanAqi = 90
  case europeanAqiPm2p5 = 91
  case europeanAqiPm10 = 92
  case europeanAqiNitrogenDioxide = 93
  case europeanAqiOzone = 94
  case europeanAqiSulphurDioxide = 95
  case usAqi = 96
  case usAqiPm2p5 = 97
  case usAqiPm10 = 98
  case usAqiNitrogenDioxide = 99
  case usAqiOzone = 100
  case usAqiSulphurDioxide = 101
  case usAqiCarbonMonoxide = 102
  case sunshineDuration = 103
  case convectiveInhibition = 104
  case shortwaveRadiationClearSky = 105
  case globalTiltedIrradiance = 106
  case globalTiltedIrradianceInstant = 107
  case oceanCurrentVelocity = 108
  case oceanCurrentDirection = 109
  case cloudBase = 110
  case cloudTop = 111
  case massDensity = 112
  case boundaryLayerHeight = 113
  case formaldehyde = 114
  case glyoxal = 115
  case nonMethaneVolatileOrganicCompounds = 116
  case pm10Wildfires = 117
  case peroxyacylNitrates = 118
  case secondaryInorganicAerosol = 119
  case residentialElementaryCarbon = 120
  case totalElementaryCarbon = 121
  case pm25TotalOrganicMatter = 122
  case seaSaltAerosol = 123
  case nitrogenMonoxide = 124
  case thunderstormProbability = 125
  case rainProbability = 126
  case freezingRainProbability = 127
  case icePelletsProbability = 128
  case snowfallProbability = 129
  case carbonDioxide = 130
  case methane = 131
  case seaLevelHeightMsl = 132
  case seaSurfaceTemperature = 133
  case invertBarometerHeight = 134
  case hail = 135
  case albedo = 136
  case precipitationType = 137
  case convectiveCloudBase = 138
  case convectiveCloudTop = 139
  case snowDepthWaterEquivalent = 140

  public static var max: openmeteo_sdk_Variable { return .snowDepthWaterEquivalent }
  public static var min: openmeteo_sdk_Variable { return .undefined }
}


public enum openmeteo_sdk_Aggregation: UInt8, Enum, Verifiable {
  public typealias T = UInt8
  public static var byteSize: Int { return MemoryLayout<UInt8>.size }
  public var value: UInt8 { return self.rawValue }
  case none_ = 0
  case minimum = 1
  case maximum = 2
  case mean = 3
  case p10 = 4
  case p25 = 5
  case median = 6
  case p75 = 7
  case p90 = 8
  case dominant = 9
  case sum = 10
  case spread = 11

  public static var max: openmeteo_sdk_Aggregation { return .spread }
  public static var min: openmeteo_sdk_Aggregation { return .none_ }
}


public struct openmeteo_sdk_VariableWithValues: FlatBufferObject, Verifiable {

  static func validateVersion() { FlatBuffersVersion_25_2_10() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case variable = 4
    case unit = 6
    case value = 8
    case values = 10
    case valuesInt64 = 12
    case altitude = 14
    case aggregation = 16
    case pressureLevel = 18
    case depth = 20
    case depthTo = 22
    case ensembleMember = 24
    case previousDay = 26
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var variable: openmeteo_sdk_Variable { let o = _accessor.offset(VTOFFSET.variable.v); return o == 0 ? .undefined : openmeteo_sdk_Variable(rawValue: _accessor.readBuffer(of: UInt8.self, at: o)) ?? .undefined }
  public var unit: openmeteo_sdk_Unit { let o = _accessor.offset(VTOFFSET.unit.v); return o == 0 ? .undefined : openmeteo_sdk_Unit(rawValue: _accessor.readBuffer(of: UInt8.self, at: o)) ?? .undefined }
  public var value: Float32 { let o = _accessor.offset(VTOFFSET.value.v); return o == 0 ? 0.0 : _accessor.readBuffer(of: Float32.self, at: o) }
  public var hasValues: Bool { let o = _accessor.offset(VTOFFSET.values.v); return o == 0 ? false : true }
  public var valuesCount: Int32 { let o = _accessor.offset(VTOFFSET.values.v); return o == 0 ? 0 : _accessor.vector(count: o) }
  public func values(at index: Int32) -> Float32 { let o = _accessor.offset(VTOFFSET.values.v); return o == 0 ? 0 : _accessor.directRead(of: Float32.self, offset: _accessor.vector(at: o) + index * 4) }
  public var values: [Float32] { return _accessor.getVector(at: VTOFFSET.values.v) ?? [] }
  public var hasValuesInt64: Bool { let o = _accessor.offset(VTOFFSET.valuesInt64.v); return o == 0 ? false : true }
  public var valuesInt64Count: Int32 { let o = _accessor.offset(VTOFFSET.valuesInt64.v); return o == 0 ? 0 : _accessor.vector(count: o) }
  public func valuesInt64(at index: Int32) -> Int64 { let o = _accessor.offset(VTOFFSET.valuesInt64.v); return o == 0 ? 0 : _accessor.directRead(of: Int64.self, offset: _accessor.vector(at: o) + index * 8) }
  public var valuesInt64: [Int64] { return _accessor.getVector(at: VTOFFSET.valuesInt64.v) ?? [] }
  public var altitude: Int16 { let o = _accessor.offset(VTOFFSET.altitude.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int16.self, at: o) }
  public var aggregation: openmeteo_sdk_Aggregation { let o = _accessor.offset(VTOFFSET.aggregation.v); return o == 0 ? .none_ : openmeteo_sdk_Aggregation(rawValue: _accessor.readBuffer(of: UInt8.self, at: o)) ?? .none_ }
  public var pressureLevel: Int16 { let o = _accessor.offset(VTOFFSET.pressureLevel.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int16.self, at: o) }
  public var depth: Int16 { let o = _accessor.offset(VTOFFSET.depth.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int16.self, at: o) }
  public var depthTo: Int16 { let o = _accessor.offset(VTOFFSET.depthTo.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int16.self, at: o) }
  public var ensembleMember: Int16 { let o = _accessor.offset(VTOFFSET.ensembleMember.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int16.self, at: o) }
  public var previousDay: Int16 { let o = _accessor.offset(VTOFFSET.previousDay.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int16.self, at: o) }
  public static func startVariableWithValues(_ fbb: inout FlatBufferBuilder) -> UOffset { fbb.startTable(with: 12) }
  public static func add(variable: openmeteo_sdk_Variable, _ fbb: inout FlatBufferBuilder) { fbb.add(element: variable.rawValue, def: 0, at: VTOFFSET.variable.p) }
  public static func add(unit: openmeteo_sdk_Unit, _ fbb: inout FlatBufferBuilder) { fbb.add(element: unit.rawValue, def: 0, at: VTOFFSET.unit.p) }
  public static func add(value: Float32, _ fbb: inout FlatBufferBuilder) { fbb.add(element: value, def: 0.0, at: VTOFFSET.value.p) }
  public static func addVectorOf(values: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: values, at: VTOFFSET.values.p) }
  public static func addVectorOf(valuesInt64: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: valuesInt64, at: VTOFFSET.valuesInt64.p) }
  public static func add(altitude: Int16, _ fbb: inout FlatBufferBuilder) { fbb.add(element: altitude, def: 0, at: VTOFFSET.altitude.p) }
  public static func add(aggregation: openmeteo_sdk_Aggregation, _ fbb: inout FlatBufferBuilder) { fbb.add(element: aggregation.rawValue, def: 0, at: VTOFFSET.aggregation.p) }
  public static func add(pressureLevel: Int16, _ fbb: inout FlatBufferBuilder) { fbb.add(element: pressureLevel, def: 0, at: VTOFFSET.pressureLevel.p) }
  public static func add(depth: Int16, _ fbb: inout FlatBufferBuilder) { fbb.add(element: depth, def: 0, at: VTOFFSET.depth.p) }
  public static func add(depthTo: Int16, _ fbb: inout FlatBufferBuilder) { fbb.add(element: depthTo, def: 0, at: VTOFFSET.depthTo.p) }
  public static func add(ensembleMember: Int16, _ fbb: inout FlatBufferBuilder) { fbb.add(element: ensembleMember, def: 0, at: VTOFFSET.ensembleMember.p) }
  public static func add(previousDay: Int16, _ fbb: inout FlatBufferBuilder) { fbb.add(element: previousDay, def: 0, at: VTOFFSET.previousDay.p) }
  public static func endVariableWithValues(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset { let end = Offset(offset: fbb.endTable(at: start)); return end }
  public static func createVariableWithValues(
    _ fbb: inout FlatBufferBuilder,
    variable: openmeteo_sdk_Variable = .undefined,
    unit: openmeteo_sdk_Unit = .undefined,
    value: Float32 = 0.0,
    valuesVectorOffset values: Offset = Offset(),
    valuesInt64VectorOffset valuesInt64: Offset = Offset(),
    altitude: Int16 = 0,
    aggregation: openmeteo_sdk_Aggregation = .none_,
    pressureLevel: Int16 = 0,
    depth: Int16 = 0,
    depthTo: Int16 = 0,
    ensembleMember: Int16 = 0,
    previousDay: Int16 = 0
  ) -> Offset {
    let __start = openmeteo_sdk_VariableWithValues.startVariableWithValues(&fbb)
    openmeteo_sdk_VariableWithValues.add(variable: variable, &fbb)
    openmeteo_sdk_VariableWithValues.add(unit: unit, &fbb)
    openmeteo_sdk_VariableWithValues.add(value: value, &fbb)
    openmeteo_sdk_VariableWithValues.addVectorOf(values: values, &fbb)
    openmeteo_sdk_VariableWithValues.addVectorOf(valuesInt64: valuesInt64, &fbb)
    openmeteo_sdk_VariableWithValues.add(altitude: altitude, &fbb)
    openmeteo_sdk_VariableWithValues.add(aggregation: aggregation, &fbb)
    openmeteo_sdk_VariableWithValues.add(pressureLevel: pressureLevel, &fbb)
    openmeteo_sdk_VariableWithValues.add(depth: depth, &fbb)
    openmeteo_sdk_VariableWithValues.add(depthTo: depthTo, &fbb)
    openmeteo_sdk_VariableWithValues.add(ensembleMember: ensembleMember, &fbb)
    openmeteo_sdk_VariableWithValues.add(previousDay: previousDay, &fbb)
    return openmeteo_sdk_VariableWithValues.endVariableWithValues(&fbb, start: __start)
  }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws where T: Verifiable {
    var _v = try verifier.visitTable(at: position)
    try _v.visit(field: VTOFFSET.variable.p, fieldName: "variable", required: false, type: openmeteo_sdk_Variable.self)
    try _v.visit(field: VTOFFSET.unit.p, fieldName: "unit", required: false, type: openmeteo_sdk_Unit.self)
    try _v.visit(field: VTOFFSET.value.p, fieldName: "value", required: false, type: Float32.self)
    try _v.visit(field: VTOFFSET.values.p, fieldName: "values", required: false, type: ForwardOffset<Vector<Float32, Float32>>.self)
    try _v.visit(field: VTOFFSET.valuesInt64.p, fieldName: "valuesInt64", required: false, type: ForwardOffset<Vector<Int64, Int64>>.self)
    try _v.visit(field: VTOFFSET.altitude.p, fieldName: "altitude", required: false, type: Int16.self)
    try _v.visit(field: VTOFFSET.aggregation.p, fieldName: "aggregation", required: false, type: openmeteo_sdk_Aggregation.self)
    try _v.visit(field: VTOFFSET.pressureLevel.p, fieldName: "pressureLevel", required: false, type: Int16.self)
    try _v.visit(field: VTOFFSET.depth.p, fieldName: "depth", required: false, type: Int16.self)
    try _v.visit(field: VTOFFSET.depthTo.p, fieldName: "depthTo", required: false, type: Int16.self)
    try _v.visit(field: VTOFFSET.ensembleMember.p, fieldName: "ensembleMember", required: false, type: Int16.self)
    try _v.visit(field: VTOFFSET.previousDay.p, fieldName: "previousDay", required: false, type: Int16.self)
    _v.finish()
  }
}

public struct openmeteo_sdk_VariablesWithTime: FlatBufferObject, Verifiable {

  static func validateVersion() { FlatBuffersVersion_25_2_10() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case time = 4
    case timeEnd = 6
    case interval = 8
    case variables = 10
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var time: Int64 { let o = _accessor.offset(VTOFFSET.time.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int64.self, at: o) }
  public var timeEnd: Int64 { let o = _accessor.offset(VTOFFSET.timeEnd.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int64.self, at: o) }
  public var interval: Int32 { let o = _accessor.offset(VTOFFSET.interval.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int32.self, at: o) }
  public var hasVariables: Bool { let o = _accessor.offset(VTOFFSET.variables.v); return o == 0 ? false : true }
  public var variablesCount: Int32 { let o = _accessor.offset(VTOFFSET.variables.v); return o == 0 ? 0 : _accessor.vector(count: o) }
  public func variables(at index: Int32) -> openmeteo_sdk_VariableWithValues? { let o = _accessor.offset(VTOFFSET.variables.v); return o == 0 ? nil : openmeteo_sdk_VariableWithValues(_accessor.bb, o: _accessor.indirect(_accessor.vector(at: o) + index * 4)) }
  public static func startVariablesWithTime(_ fbb: inout FlatBufferBuilder) -> UOffset { fbb.startTable(with: 4) }
  public static func add(time: Int64, _ fbb: inout FlatBufferBuilder) { fbb.add(element: time, def: 0, at: VTOFFSET.time.p) }
  public static func add(timeEnd: Int64, _ fbb: inout FlatBufferBuilder) { fbb.add(element: timeEnd, def: 0, at: VTOFFSET.timeEnd.p) }
  public static func add(interval: Int32, _ fbb: inout FlatBufferBuilder) { fbb.add(element: interval, def: 0, at: VTOFFSET.interval.p) }
  public static func addVectorOf(variables: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: variables, at: VTOFFSET.variables.p) }
  public static func endVariablesWithTime(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset { let end = Offset(offset: fbb.endTable(at: start)); return end }
  public static func createVariablesWithTime(
    _ fbb: inout FlatBufferBuilder,
    time: Int64 = 0,
    timeEnd: Int64 = 0,
    interval: Int32 = 0,
    variablesVectorOffset variables: Offset = Offset()
  ) -> Offset {
    let __start = openmeteo_sdk_VariablesWithTime.startVariablesWithTime(&fbb)
    openmeteo_sdk_VariablesWithTime.add(time: time, &fbb)
    openmeteo_sdk_VariablesWithTime.add(timeEnd: timeEnd, &fbb)
    openmeteo_sdk_VariablesWithTime.add(interval: interval, &fbb)
    openmeteo_sdk_VariablesWithTime.addVectorOf(variables: variables, &fbb)
    return openmeteo_sdk_VariablesWithTime.endVariablesWithTime(&fbb, start: __start)
  }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws where T: Verifiable {
    var _v = try verifier.visitTable(at: position)
    try _v.visit(field: VTOFFSET.time.p, fieldName: "time", required: false, type: Int64.self)
    try _v.visit(field: VTOFFSET.timeEnd.p, fieldName: "timeEnd", required: false, type: Int64.self)
    try _v.visit(field: VTOFFSET.interval.p, fieldName: "interval", required: false, type: Int32.self)
    try _v.visit(field: VTOFFSET.variables.p, fieldName: "variables", required: false, type: ForwardOffset<Vector<ForwardOffset<openmeteo_sdk_VariableWithValues>, openmeteo_sdk_VariableWithValues>>.self)
    _v.finish()
  }
}

public struct openmeteo_sdk_WeatherApiResponse: FlatBufferObject, Verifiable {

  static func validateVersion() { FlatBuffersVersion_25_2_10() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case latitude = 4
    case longitude = 6
    case elevation = 8
    case generationTimeMilliseconds = 10
    case locationId = 12
    case model = 14
    case utcOffsetSeconds = 16
    case timezone = 18
    case timezoneAbbreviation = 20
    case current = 22
    case daily = 24
    case hourly = 26
    case minutely15 = 28
    case sixHourly = 30
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var latitude: Float32 { let o = _accessor.offset(VTOFFSET.latitude.v); return o == 0 ? 0.0 : _accessor.readBuffer(of: Float32.self, at: o) }
  public var longitude: Float32 { let o = _accessor.offset(VTOFFSET.longitude.v); return o == 0 ? 0.0 : _accessor.readBuffer(of: Float32.self, at: o) }
  public var elevation: Float32 { let o = _accessor.offset(VTOFFSET.elevation.v); return o == 0 ? 0.0 : _accessor.readBuffer(of: Float32.self, at: o) }
  public var generationTimeMilliseconds: Float32 { let o = _accessor.offset(VTOFFSET.generationTimeMilliseconds.v); return o == 0 ? 0.0 : _accessor.readBuffer(of: Float32.self, at: o) }
  public var locationId: Int64 { let o = _accessor.offset(VTOFFSET.locationId.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int64.self, at: o) }
  public var model: openmeteo_sdk_Model { let o = _accessor.offset(VTOFFSET.model.v); return o == 0 ? .undefined : openmeteo_sdk_Model(rawValue: _accessor.readBuffer(of: UInt8.self, at: o)) ?? .undefined }
  public var utcOffsetSeconds: Int32 { let o = _accessor.offset(VTOFFSET.utcOffsetSeconds.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int32.self, at: o) }
  public var timezone: String? { let o = _accessor.offset(VTOFFSET.timezone.v); return o == 0 ? nil : _accessor.string(at: o) }
  public var timezoneSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.timezone.v) }
  public var timezoneAbbreviation: String? { let o = _accessor.offset(VTOFFSET.timezoneAbbreviation.v); return o == 0 ? nil : _accessor.string(at: o) }
  public var timezoneAbbreviationSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.timezoneAbbreviation.v) }
  public var current: openmeteo_sdk_VariablesWithTime? { let o = _accessor.offset(VTOFFSET.current.v); return o == 0 ? nil : openmeteo_sdk_VariablesWithTime(_accessor.bb, o: _accessor.indirect(o + _accessor.position)) }
  public var daily: openmeteo_sdk_VariablesWithTime? { let o = _accessor.offset(VTOFFSET.daily.v); return o == 0 ? nil : openmeteo_sdk_VariablesWithTime(_accessor.bb, o: _accessor.indirect(o + _accessor.position)) }
  public var hourly: openmeteo_sdk_VariablesWithTime? { let o = _accessor.offset(VTOFFSET.hourly.v); return o == 0 ? nil : openmeteo_sdk_VariablesWithTime(_accessor.bb, o: _accessor.indirect(o + _accessor.position)) }
  public var minutely15: openmeteo_sdk_VariablesWithTime? { let o = _accessor.offset(VTOFFSET.minutely15.v); return o == 0 ? nil : openmeteo_sdk_VariablesWithTime(_accessor.bb, o: _accessor.indirect(o + _accessor.position)) }
  public var sixHourly: openmeteo_sdk_VariablesWithTime? { let o = _accessor.offset(VTOFFSET.sixHourly.v); return o == 0 ? nil : openmeteo_sdk_VariablesWithTime(_accessor.bb, o: _accessor.indirect(o + _accessor.position)) }
  public static func startWeatherApiResponse(_ fbb: inout FlatBufferBuilder) -> UOffset { fbb.startTable(with: 14) }
  public static func add(latitude: Float32, _ fbb: inout FlatBufferBuilder) { fbb.add(element: latitude, def: 0.0, at: VTOFFSET.latitude.p) }
  public static func add(longitude: Float32, _ fbb: inout FlatBufferBuilder) { fbb.add(element: longitude, def: 0.0, at: VTOFFSET.longitude.p) }
  public static func add(elevation: Float32, _ fbb: inout FlatBufferBuilder) { fbb.add(element: elevation, def: 0.0, at: VTOFFSET.elevation.p) }
  public static func add(generationTimeMilliseconds: Float32, _ fbb: inout FlatBufferBuilder) { fbb.add(element: generationTimeMilliseconds, def: 0.0, at: VTOFFSET.generationTimeMilliseconds.p) }
  public static func add(locationId: Int64, _ fbb: inout FlatBufferBuilder) { fbb.add(element: locationId, def: 0, at: VTOFFSET.locationId.p) }
  public static func add(model: openmeteo_sdk_Model, _ fbb: inout FlatBufferBuilder) { fbb.add(element: model.rawValue, def: 0, at: VTOFFSET.model.p) }
  public static func add(utcOffsetSeconds: Int32, _ fbb: inout FlatBufferBuilder) { fbb.add(element: utcOffsetSeconds, def: 0, at: VTOFFSET.utcOffsetSeconds.p) }
  public static func add(timezone: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: timezone, at: VTOFFSET.timezone.p) }
  public static func add(timezoneAbbreviation: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: timezoneAbbreviation, at: VTOFFSET.timezoneAbbreviation.p) }
  public static func add(current: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: current, at: VTOFFSET.current.p) }
  public static func add(daily: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: daily, at: VTOFFSET.daily.p) }
  public static func add(hourly: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: hourly, at: VTOFFSET.hourly.p) }
  public static func add(minutely15: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: minutely15, at: VTOFFSET.minutely15.p) }
  public static func add(sixHourly: Offset, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: sixHourly, at: VTOFFSET.sixHourly.p) }
  public static func endWeatherApiResponse(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset { let end = Offset(offset: fbb.endTable(at: start)); return end }
  public static func createWeatherApiResponse(
    _ fbb: inout FlatBufferBuilder,
    latitude: Float32 = 0.0,
    longitude: Float32 = 0.0,
    elevation: Float32 = 0.0,
    generationTimeMilliseconds: Float32 = 0.0,
    locationId: Int64 = 0,
    model: openmeteo_sdk_Model = .undefined,
    utcOffsetSeconds: Int32 = 0,
    timezoneOffset timezone: Offset = Offset(),
    timezoneAbbreviationOffset timezoneAbbreviation: Offset = Offset(),
    currentOffset current: Offset = Offset(),
    dailyOffset daily: Offset = Offset(),
    hourlyOffset hourly: Offset = Offset(),
    minutely15Offset minutely15: Offset = Offset(),
    sixHourlyOffset sixHourly: Offset = Offset()
  ) -> Offset {
    let __start = openmeteo_sdk_WeatherApiResponse.startWeatherApiResponse(&fbb)
    openmeteo_sdk_WeatherApiResponse.add(latitude: latitude, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(longitude: longitude, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(elevation: elevation, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(generationTimeMilliseconds: generationTimeMilliseconds, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(locationId: locationId, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(model: model, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(utcOffsetSeconds: utcOffsetSeconds, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(timezone: timezone, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(timezoneAbbreviation: timezoneAbbreviation, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(current: current, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(daily: daily, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(hourly: hourly, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(minutely15: minutely15, &fbb)
    openmeteo_sdk_WeatherApiResponse.add(sixHourly: sixHourly, &fbb)
    return openmeteo_sdk_WeatherApiResponse.endWeatherApiResponse(&fbb, start: __start)
  }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws where T: Verifiable {
    var _v = try verifier.visitTable(at: position)
    try _v.visit(field: VTOFFSET.latitude.p, fieldName: "latitude", required: false, type: Float32.self)
    try _v.visit(field: VTOFFSET.longitude.p, fieldName: "longitude", required: false, type: Float32.self)
    try _v.visit(field: VTOFFSET.elevation.p, fieldName: "elevation", required: false, type: Float32.self)
    try _v.visit(field: VTOFFSET.generationTimeMilliseconds.p, fieldName: "generationTimeMilliseconds", required: false, type: Float32.self)
    try _v.visit(field: VTOFFSET.locationId.p, fieldName: "locationId", required: false, type: Int64.self)
    try _v.visit(field: VTOFFSET.model.p, fieldName: "model", required: false, type: openmeteo_sdk_Model.self)
    try _v.visit(field: VTOFFSET.utcOffsetSeconds.p, fieldName: "utcOffsetSeconds", required: false, type: Int32.self)
    try _v.visit(field: VTOFFSET.timezone.p, fieldName: "timezone", required: false, type: ForwardOffset<String>.self)
    try _v.visit(field: VTOFFSET.timezoneAbbreviation.p, fieldName: "timezoneAbbreviation", required: false, type: ForwardOffset<String>.self)
    try _v.visit(field: VTOFFSET.current.p, fieldName: "current", required: false, type: ForwardOffset<openmeteo_sdk_VariablesWithTime>.self)
    try _v.visit(field: VTOFFSET.daily.p, fieldName: "daily", required: false, type: ForwardOffset<openmeteo_sdk_VariablesWithTime>.self)
    try _v.visit(field: VTOFFSET.hourly.p, fieldName: "hourly", required: false, type: ForwardOffset<openmeteo_sdk_VariablesWithTime>.self)
    try _v.visit(field: VTOFFSET.minutely15.p, fieldName: "minutely15", required: false, type: ForwardOffset<openmeteo_sdk_VariablesWithTime>.self)
    try _v.visit(field: VTOFFSET.sixHourly.p, fieldName: "sixHourly", required: false, type: ForwardOffset<openmeteo_sdk_VariablesWithTime>.self)
    _v.finish()
  }
}

