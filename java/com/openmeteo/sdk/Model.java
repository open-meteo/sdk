// automatically generated by the FlatBuffers compiler, do not modify

package com.openmeteo.sdk;

@SuppressWarnings("unused")
public final class Model {
  private Model() { }
  public static final int undefined = 0;
  public static final int best_match = 1;
  public static final int gfs_seamless = 2;
  public static final int gfs_global = 3;
  public static final int gfs_hrrr = 4;
  public static final int meteofrance_seamless = 5;
  public static final int meteofrance_arpege_seamless = 6;
  public static final int meteofrance_arpege_world = 7;
  public static final int meteofrance_arpege_europe = 8;
  public static final int meteofrance_arome_seamless = 9;
  public static final int meteofrance_arome_france = 10;
  public static final int meteofrance_arome_france_hd = 11;
  public static final int jma_seamless = 12;
  public static final int jma_msm = 13;
  public static final int jms_gsm = 14;
  public static final int jma_gsm = 15;
  public static final int gem_seamless = 16;
  public static final int gem_global = 17;
  public static final int gem_regional = 18;
  public static final int gem_hrdps_continental = 19;
  public static final int icon_seamless = 20;
  public static final int icon_global = 21;
  public static final int icon_eu = 22;
  public static final int icon_d2 = 23;
  public static final int ecmwf_ifs04 = 24;
  public static final int metno_nordic = 25;
  public static final int era5_seamless = 26;
  public static final int era5 = 27;
  public static final int cerra = 28;
  public static final int era5_land = 29;
  public static final int ecmwf_ifs = 30;
  public static final int gwam = 31;
  public static final int ewam = 32;
  public static final int glofas_seamless_v3 = 33;
  public static final int glofas_forecast_v3 = 34;
  public static final int glofas_consolidated_v3 = 35;
  public static final int glofas_seamless_v4 = 36;
  public static final int glofas_forecast_v4 = 37;
  public static final int glofas_consolidated_v4 = 38;
  public static final int gfs025 = 39;
  public static final int gfs05 = 40;
  public static final int CMCC_CM2_VHR4 = 41;
  public static final int FGOALS_f3_H_highresSST = 42;
  public static final int FGOALS_f3_H = 43;
  public static final int HiRAM_SIT_HR = 44;
  public static final int MRI_AGCM3_2_S = 45;
  public static final int EC_Earth3P_HR = 46;
  public static final int MPI_ESM1_2_XR = 47;
  public static final int NICAM16_8S = 48;
  public static final int cams_europe = 49;
  public static final int cams_global = 50;
  public static final int cfsv2 = 51;
  public static final int era5_ocean = 52;
  public static final int cma_grapes_global = 53;
  public static final int bom_access_global = 54;
  public static final int bom_access_global_ensemble = 55;
  public static final int arpae_cosmo_seamless = 56;
  public static final int arpae_cosmo_2i = 57;
  public static final int arpae_cosmo_2i_ruc = 58;
  public static final int arpae_cosmo_5m = 59;
  public static final int ecmwf_ifs025 = 60;
  public static final int ecmwf_aifs025 = 61;
  public static final int gfs013 = 62;
  public static final int gfs_graphcast025 = 63;
  public static final int ecmwf_wam025 = 64;
  public static final int meteofrance_wave = 65;
  public static final int meteofrance_currents = 66;
  public static final int ecmwf_wam025_ensemble = 67;
  public static final int ncep_gfswave025 = 68;
  public static final int ncep_gefswave025 = 69;
  public static final int knmi_seamless = 70;
  public static final int knmi_harmonie_arome_europe = 71;
  public static final int knmi_harmonie_arome_netherlands = 72;
  public static final int dmi_seamless = 73;
  public static final int dmi_harmonie_arome_europe = 74;
  public static final int metno_seamless = 75;
  public static final int era5_ensemble = 76;
  public static final int ecmwf_ifs_analysis = 77;
  public static final int ecmwf_ifs_long_window = 78;
  public static final int ecmwf_ifs_analysis_long_window = 79;
  public static final int ukmo_global_deterministic_10km = 80;
  public static final int ukmo_uk_deterministic_2km = 81;
  public static final int ukmo_seamless = 82;
  public static final int ncep_gfswave016 = 83;
  public static final int ncep_nbm_conus = 84;
  public static final int ukmo_global_ensemble_20km = 85;
  public static final int ecmwf_aifs025_single = 86;
  public static final int jma_jaxa_himawari = 87;
  public static final int eumetsat_sarah3 = 88;
  public static final int eumetsat_lsa_saf_msg = 89;
  public static final int eumetsat_lsa_saf_iodc = 90;
  public static final int satellite_radiation_seamless = 91;

  public static final String[] names = { "undefined", "best_match", "gfs_seamless", "gfs_global", "gfs_hrrr", "meteofrance_seamless", "meteofrance_arpege_seamless", "meteofrance_arpege_world", "meteofrance_arpege_europe", "meteofrance_arome_seamless", "meteofrance_arome_france", "meteofrance_arome_france_hd", "jma_seamless", "jma_msm", "jms_gsm", "jma_gsm", "gem_seamless", "gem_global", "gem_regional", "gem_hrdps_continental", "icon_seamless", "icon_global", "icon_eu", "icon_d2", "ecmwf_ifs04", "metno_nordic", "era5_seamless", "era5", "cerra", "era5_land", "ecmwf_ifs", "gwam", "ewam", "glofas_seamless_v3", "glofas_forecast_v3", "glofas_consolidated_v3", "glofas_seamless_v4", "glofas_forecast_v4", "glofas_consolidated_v4", "gfs025", "gfs05", "CMCC_CM2_VHR4", "FGOALS_f3_H_highresSST", "FGOALS_f3_H", "HiRAM_SIT_HR", "MRI_AGCM3_2_S", "EC_Earth3P_HR", "MPI_ESM1_2_XR", "NICAM16_8S", "cams_europe", "cams_global", "cfsv2", "era5_ocean", "cma_grapes_global", "bom_access_global", "bom_access_global_ensemble", "arpae_cosmo_seamless", "arpae_cosmo_2i", "arpae_cosmo_2i_ruc", "arpae_cosmo_5m", "ecmwf_ifs025", "ecmwf_aifs025", "gfs013", "gfs_graphcast025", "ecmwf_wam025", "meteofrance_wave", "meteofrance_currents", "ecmwf_wam025_ensemble", "ncep_gfswave025", "ncep_gefswave025", "knmi_seamless", "knmi_harmonie_arome_europe", "knmi_harmonie_arome_netherlands", "dmi_seamless", "dmi_harmonie_arome_europe", "metno_seamless", "era5_ensemble", "ecmwf_ifs_analysis", "ecmwf_ifs_long_window", "ecmwf_ifs_analysis_long_window", "ukmo_global_deterministic_10km", "ukmo_uk_deterministic_2km", "ukmo_seamless", "ncep_gfswave016", "ncep_nbm_conus", "ukmo_global_ensemble_20km", "ecmwf_aifs025_single", "jma_jaxa_himawari", "eumetsat_sarah3", "eumetsat_lsa_saf_msg", "eumetsat_lsa_saf_iodc", "satellite_radiation_seamless", };

  public static String name(int e) { return names[e]; }
}

