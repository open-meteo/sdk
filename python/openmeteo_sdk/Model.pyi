from __future__ import annotations

import flatbuffers
import numpy as np

import flatbuffers
import typing

uoffset: typing.TypeAlias = flatbuffers.number_types.UOffsetTFlags.py_type

class Model(object):
  undefined: int
  best_match: int
  gfs_seamless: int
  gfs_global: int
  gfs_hrrr: int
  meteofrance_seamless: int
  meteofrance_arpege_seamless: int
  meteofrance_arpege_world: int
  meteofrance_arpege_europe: int
  meteofrance_arome_seamless: int
  meteofrance_arome_france: int
  meteofrance_arome_france_hd: int
  jma_seamless: int
  jma_msm: int
  jms_gsm: int
  jma_gsm: int
  gem_seamless: int
  gem_global: int
  gem_regional: int
  gem_hrdps_continental: int
  icon_seamless: int
  icon_global: int
  icon_eu: int
  icon_d2: int
  ecmwf_ifs04: int
  metno_nordic: int
  era5_seamless: int
  era5: int
  cerra: int
  era5_land: int
  ecmwf_ifs: int
  gwam: int
  ewam: int
  glofas_seamless_v3: int
  glofas_forecast_v3: int
  glofas_consolidated_v3: int
  glofas_seamless_v4: int
  glofas_forecast_v4: int
  glofas_consolidated_v4: int
  gfs025: int
  gfs05: int
  CMCC_CM2_VHR4: int
  FGOALS_f3_H_highresSST: int
  FGOALS_f3_H: int
  HiRAM_SIT_HR: int
  MRI_AGCM3_2_S: int
  EC_Earth3P_HR: int
  MPI_ESM1_2_XR: int
  NICAM16_8S: int
  cams_europe: int
  cams_global: int
  cfsv2: int
  era5_ocean: int
  cma_grapes_global: int
  bom_access_global: int
  bom_access_global_ensemble: int
  arpae_cosmo_seamless: int
  arpae_cosmo_2i: int
  arpae_cosmo_2i_ruc: int
  arpae_cosmo_5m: int
  ecmwf_ifs025: int
  ecmwf_aifs025: int
  gfs013: int
  gfs_graphcast025: int
  ecmwf_wam025: int
  meteofrance_wave: int
  meteofrance_currents: int
  ecmwf_wam025_ensemble: int
  ncep_gfswave025: int
  ncep_gefswave025: int
  knmi_seamless: int
  knmi_harmonie_arome_europe: int
  knmi_harmonie_arome_netherlands: int
  dmi_seamless: int
  dmi_harmonie_arome_europe: int
  metno_seamless: int
  era5_ensemble: int
  ecmwf_ifs_analysis: int
  ecmwf_ifs_long_window: int
  ecmwf_ifs_analysis_long_window: int
  ukmo_global_deterministic_10km: int
  ukmo_uk_deterministic_2km: int
  ukmo_seamless: int
  ncep_gfswave016: int
  ncep_nbm_conus: int
  ukmo_global_ensemble_20km: int
  ecmwf_aifs025_single: int
  jma_jaxa_himawari: int
  eumetsat_sarah3: int
  eumetsat_lsa_saf_msg: int
  eumetsat_lsa_saf_iodc: int
  satellite_radiation_seamless: int
  kma_gdps: int
  kma_ldps: int

