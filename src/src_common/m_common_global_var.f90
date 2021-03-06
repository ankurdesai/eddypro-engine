!***************************************************************************
! m_common_global_var.f90
! -----------------------
! Copyright (C) 2007-2011, Eco2s team, Gerardo Fratini
! Copyright (C) 2011-2014, LI-COR Biosciences
!
! This file is part of EddyPro (TM).
!
! EddyPro (TM) is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
!
! EddyPro (TM) is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.
!
! You should have received a copy of the GNU General Public License
! along with EddyPro (TM).  If not, see <http://www.gnu.org/licenses/>.
!
!***************************************************************************
!
! \brief       Contain declaration of all variables common to EddyPro projects.
! \author      Gerardo Fratini
! \note
! \sa
! \bug
! \deprecated
! \test
! \todo
!***************************************************************************
module m_common_global_var
    use m_typedef
    use m_dates
    use m_methane_tables
    use m_index_parameters
    use libdate
    use m_fp2_to_float
    implicit none
    save


    !> arrays and files defaults
    integer, parameter :: MaxNLinesIni = 2000
    integer, parameter :: MaxNumAnem = 7
    integer, parameter :: MaxNumAdc = 10
    integer, parameter :: MaxNumVar = MaxNumAnem + MaxNumAdc
    integer, parameter :: NumSpecVar = 3
    integer, parameter :: MaxSpecRow = 72000
    integer, parameter :: NumPar = 3
    integer, parameter :: MaxNumDP = 100
    integer, parameter :: NTlagH2Oclasses = 20
    integer, parameter :: Nt = 9

    !> Validated variables
    integer :: NumInstruments
    integer :: NumRawFlags
    integer :: NumCol
    integer :: NumBiometCol
    integer :: NumBiometVar
    integer :: NumAllVar
    integer :: NumVar
    integer :: NumDiag
    integer :: NumUserVar
    logical :: FileWithFlags
    integer :: n_cstm_biomet
    integer :: Gas4CalRefCol

    !> Platform management
    character(8) :: OS
    character(8) :: root
    character(1) :: slash
    character(1) :: escape
    character(16) :: comm_del
    character(16) :: comm_rmdir
    character(16) :: comm_err_redirect
    character(16) :: comm_out_redirect
    character(16) :: comm_7zip
    character(16) :: comm_7zip_x_opt
    character(16) :: comm_copy
    character(16) :: comm_move
    character(16) :: comm_force_opt
    character(15) :: comm_dir
    character(256) :: homedir
    character(256) :: IniDir
    character(256) :: LogDir
    character(256) :: TmpDir
    character(256) :: PrjPath

    character(18), parameter :: PrjFile   = 'processing.eddypro'
    character(6), parameter :: licor_appdata = '.licor'
    character(18)  :: Timestamp_FilePadding
    character(7), parameter  :: EDDYPRO_FilePadding    = 'eddypro'
    character(11), parameter :: RP_FilePadding = 'eddypro-rp_'
    character(12), parameter :: FX_FilePadding = 'eddypro-fcc_'
    character(8),  parameter :: SC_FilePadding = '_spectra'
    character(7),  parameter :: EC_FilePadding = '_fluxes'
    character(8),  parameter :: PF_FilePadding = '_tilting'
    character(8),  parameter :: TO_FilePadding = '_timelag'
    character(24), parameter :: SubDirBinCospectra      = 'eddypro_binned_cospectra'
    character(22), parameter :: SubDirCospectra         = 'eddypro_full_cospectra'
    character(22), parameter :: RS_flags_FilePadding    = '_statistical_screening'
    character(13), parameter :: RS_spike_FilePadding    = '_spike_counts'
    character(23), parameter :: Rot2D_FilePadding       = '_double_rotation_angles'
    character(9),  parameter :: Metadata_FilePadding    = '_metadata'
    character(11),  parameter :: QCdetails_FilePadding  = '_qc_details'
    character(16), parameter :: H2OCov_FilePadding      = '_h2o_covariances'
    character(9),  parameter :: Tlag_FilePadding        = '_timelags'
    character(14), parameter :: RH_FilePadding          = '_timelag_vs_rh'
    character(17), parameter :: Flux_FilePadding        = '_tentative_fluxes'
    character(17), parameter :: BinCospec_FilePadding   = '_binned_cospectra'
    character(14), parameter :: BinOgives_FilePadding   = '_binned_ogives'
    character(15), parameter :: Cospec_FilePadding      = '_full_cospectra'
    character(29), parameter :: DegT_FilePadding        = '_degraded_wt_covariances_time'
    character(24), parameter :: vDegT_FilePadding       = '_degraded_wt_covariances'
    character(18), parameter :: QC_FilePadding          = '_stationarity_test'
    character(12), parameter :: FullOut_FilePadding     = '_full_output'
    character(11), parameter :: PlanarFit_FilePadding   = '_planar_fit'
    character(12), parameter :: TimelagOpt_FilePadding   = '_timelag_opt'
    character(11), parameter :: GHGEUROPE_FilePadding   = '_ghg-europe'
    character(11), parameter :: Essentials_FilePadding  = '_essentials'
    character(7), parameter  :: Biomet_FilePadding        = '_biomet'
    character(14), parameter :: Quality_FilePadding     = '_quality_check'
    character(10), parameter :: Ameriflux_FilePadding   = '_ameriflux'
    character(18), parameter :: WPL_FilePadding         = '_wpl_contributions'
    character(20), parameter :: BPCF_FilePadding        = '_bandpass_correction'
    character(21), parameter :: H2OAvrg_FilePadding     = '_h2o_ensemble_spectra'
    character(27), parameter :: Cosp_FilePadding        = '_ensemble_cospectra_by_time'
    character(29), parameter :: Stability_FilePadding   = '_ensemble_and_model_cospectra'
    character(31), parameter :: PASGAS_Avrg_FilePadding = '_passive_gases_ensemble_spectra'
    character(21), parameter :: CH4Avrg_FilePadding     = '_ch4_ensemble_spectra'
    character(21), parameter :: N2OAvrg_FilePadding     = '_n2o_ensemble_spectra'
    character(23), parameter :: LPCF_FilePadding        = '_spec_corr_model_params'
    character(22), parameter :: RHFCO_FilePadding       = '_h2o_cutoff_freq_vs_rh'
    character(20), parameter :: SA_FilePadding          = '_spectral_assessment'
    character(12),  parameter  :: Raw_FilePadding        = '_raw_dataset'
    character(4),  parameter  :: Stats1_FilePadding     = '_st1'
    character(4),  parameter  :: Stats2_FilePadding     = '_st2'
    character(4),  parameter  :: Stats3_FilePadding     = '_st3'
    character(4),  parameter  :: Stats4_FilePadding     = '_st4'
    character(4),  parameter  :: Stats5_FilePadding     = '_st5'
    character(4),  parameter  :: Stats6_FilePadding     = '_st6'
    character(4),  parameter  :: Stats7_FilePadding     = '_st7'
    character(9),  parameter  :: UserStats1_FilePadding = '_user_st1'
    character(9),  parameter  :: UserStats2_FilePadding = '_user_st2'
    character(9),  parameter  :: UserStats3_FilePadding = '_user_st3'
    character(9),  parameter  :: UserStats4_FilePadding = '_user_st4'
    character(9),  parameter  :: UserStats5_FilePadding = '_user_st5'
    character(9),  parameter  :: UserStats6_FilePadding = '_user_st6'
    character(9),  parameter  :: UserStats7_FilePadding = '_user_st7'
    character(17), parameter  :: PF1FilePadding         = '_pf_fitting_plane'
    character(21), parameter  :: PF2FilePadding         = '_pf_rotation_matrices'
    character(17), parameter  :: TlagOpt_FilePadding    = '_optimal_timelags'
    character(52), parameter  :: BinnedFilePrototype    = 'yyyymmdd-HHMM_xxxxxx_xxxxxxxxx_xxxx-xx-xxTxxxxxx.csv'
    character(50), parameter  :: FullFilePrototype      = 'yyyymmdd-HHMM_xxxx_xxxxxxxxx_xxxx-xx-xxTxxxxxx.csv'

    character(256) :: GHGEUROPE_Path
    character(256) :: Ameriflux_Path
    character(256) :: FullOut_Path
    character(256) :: Metadata_Path

    !> physical params and other useful numbers
    integer :: mmm
    real(kind = dbl) :: Dc(E2NumVar) !< Diffus. coeff. of gases in air [m+2 s-1]
    data (Dc(mmm), mmm = co2, gas4) / 0.00001381d0, 0.00002178d0, 0.00001952d0, 0.00001436d0/ !--> Massman (1998, Atm Env, Table 2)
    real(kind = sgl) :: MW(E2NumVar) !< Molecular weights
    data (MW(mmm), mmm = co2, gas4) / 44.01e-3, 18.02e-3, 16.04e-3, 44.01e-3/
    real(kind = dbl), parameter :: p = 3.14159265358979323846d0 !< Greek pi
    real(kind = dbl), parameter :: StdVair = 0.02245d0  !< gas molar volume at 25 �C and 101.325 kPa
    real(kind = dbl), parameter :: vk = 0.41d0 !< Von Karman constant
    real(kind = dbl), parameter :: Md = 0.02897d0 !< molecular weight of dry air [kg_d/mol_d]
    real(kind = dbl), parameter :: mu = Md / 18.02d-3
    real(kind = dbl), parameter :: kg_gamma = 0.95d0 !< for H correction after Kaimal and Gaynor (1991).
    real(kind = dbl), parameter :: g  = 9.81d0 !< gravity
    real(kind = dbl), parameter :: Ru = 8.314d0 !< universal gas constant J/[mol K]
    real(kind = dbl), parameter :: Rd = 287.04d0 !< gas constant for dry air [J/kg K]
    real(kind = dbl), parameter :: Rw = 461.5d0 !< gas constant for water vapour [J/kg K]
    real(kind = dbl), parameter :: RHmax = 130d0 !< max acceptable RH for keep doing calculations
    real(kind = dbl), parameter :: kj_us_min = 0.2d0 !< minimum ustar for Kljun model
    real(kind = dbl), parameter :: kj_zL_min = -200d0 !< minimum zL for Kljun model
    real(kind = dbl), parameter :: kj_zL_max = 1d0 !< minimum zL for Kljun model
    real(kind = dbl), parameter :: error = -9999.d0 !< main error label
    real(kind = dbl), parameter :: aflx_error = -6999.d0 !< ameriflux error label
    real(kind = dbl), parameter :: MaxNormSpecValue = 1d4 !< maximum plausible value for a normalized spectral value
    real(kind = dbl), parameter :: MaxSpecValue = 1d4 !< maximum plausible value for an un-normalized spectral value
    real(kind = dbl), parameter :: MaxWindIntensity = 5d2 !< maximum plausible value for wind speed
    real(kind = dbl), parameter :: MaxWTCov = 100d0 !< maximum plausible value for wind speed
    real(kind = dbl), parameter :: MaxHFlux = 2d3 !< maximum plausible value for H (for spectra consideration)
    real(kind = dbl), parameter :: MaxLEFlux = 2d3 !< maximum plausible value for LE (for spectra consideration)
    real(kind = dbl), parameter :: MaxCO2Flux = 1d2 !< maximum plausible value for CO2 flux (for spectra consideration)
    real(kind = dbl), parameter :: MaxCH4Flux = 1d3 !< maximum plausible value for CH4 flux (for spectra consideration)
    real(kind = dbl), parameter :: MaxGAS4Flux = 1d3 !< maximum plausible value for GAS4 flux (for spectra consideration)
    real(kind = dbl), parameter :: MinUstar = 0.2d0 !< minimum value for ustar (for cospectra consideration)
    !> Co-spectral model parameters (Runkle et al. 2012, Eq. 3)
    real (kind = dbl), parameter :: beta1 = 1.05d0
    real (kind = dbl), parameter :: beta2 = 1.33d0
    real (kind = dbl), parameter :: beta3 = 0.387d0
    real (kind = dbl), parameter :: beta4 = 0.38d0
    real (kind = dbl), allocatable :: xFit(:)
    real (kind = dbl), allocatable :: yFit(:)
    real (kind = dbl), allocatable :: zFit(:)
    real (kind = dbl), allocatable :: zzFit(:)
    real (kind = dbl), allocatable :: ddum(:)

    type(FootType) :: Foot
    type(EddyProLogType)   :: EddyProLog
    type(EddyProProjType) :: EddyProProj
    type(SpectralType) :: BPCF
    type(SpectralType) :: ADDCF

    !> Variables to be validate
    real(kind = dbl) :: PFMat(3, 3, MaxNumWSect) = 0.d0
    real(kind = dbl) :: PFb(3, MaxNumWSect) = 0.d0
    real(kind = dbl) :: ITS(E2NumVar)

    !> Biomet-related variables
    integer :: numBiometDateCol
    real(kind = dbl) :: BiometSet(MaxNumBiometRow, MaxNumBiometCol)
    character(10) :: dvec(MaxNumBiometRow)
    character(5) :: tvec(MaxNumBiometRow)
    character(10) :: ddvec(MaxNumBiometRow)
    character(5) :: ttvec(MaxNumBiometRow)

    !> filename tools
    character(30), parameter :: ProgIniFile = 'eddypro_logging.ini'
    character(256) :: NativeFile
    character(30), parameter :: DelErrorFile = 'ene_converter_del.log'
    character(3), parameter  :: DataArchiveExt          = 'ene'
    character(3), parameter  :: DataFileExt             = 'ane'
    character(4), parameter  :: EcOutFileExt            = '.csv'
    character(4), parameter  :: CsvExt                  = '.csv'
    character(4), parameter  :: TmpExt                  = '.tmp'
    character(8), parameter  :: CsvTmpExt               = '.csv.tmp'
    character(4), parameter  :: TxtExt                  = '.txt'
    character(4), parameter  :: LogExt                  = '.log'

    !> logging variables and parameters
    character(10) :: LogInteger
    logical :: LogAll = .false. !< working variable, for debug only
    logical :: co2_new_sw_ver = .false.

    integer, parameter :: ErrLab1 = 2

    !> labels for standard global set
    integer, parameter :: gU   = 1
    integer, parameter :: gV   = 2
    integer, parameter :: gW   = 3
    integer, parameter :: gTs  = 4
    integer, parameter :: gSoS = 5
    integer, parameter :: gIntC= 6
    integer, parameter :: gTa  = 7

    integer, parameter :: gCO2 = 8
    integer, parameter :: gH2O = 9
    integer, parameter :: gCH4 = 10
    integer, parameter :: gN2O = 11
    integer, parameter :: gTc  = 12
    integer, parameter :: gTi1 = 13
    integer, parameter :: gTi2 = 14
    integer, parameter :: gPi  = 15
    integer, parameter :: gTe  = 16
    integer, parameter :: gPe  = 17

    type(SpectraSetType), parameter :: &
        ErrSpec = SpectraSetType(0, error, error, error)
    type(SpectraSetType), parameter :: &
        NullSpec = SpectraSetType(0, 0d0, 0d0, 0d0)
    type(MeanSpectraType), parameter :: &
        NullMeanSpec = MeanSpectraType(0, 0, 0d0, 0d0, 0d0)
    type(FitSpectraType), parameter :: &
        NullFitCosp = FitSpectraType(0d0, 0d0)

    real(kind = dbl) :: StdFco(9)
    data (StdFco(mmm), mmm = 1, 9) / 0.004d0, 0.008d0, 0.016d0, 0.032d0, 0.065d0, 0.133d0, &
                                0.277d0, 0.614d0, 1.626d0 /

    integer, parameter :: NumStdDynMDVars = 75
    character(64) :: StdDynMDVars(NumStdDynMDVars)
    data (StdDynMDVars(mmm), mmm = 1, NumStdDynMDVars) /'date', 'time', 'latitude', 'longitude', 'altitude',&
                'file_length', 'acquisition_frequency', &
                'canopy_height', 'displacement_height', 'roughness_length', &
                'master_sonic_manufacturer', 'master_sonic_model', 'master_sonic_height', &
                'master_sonic_wformat', 'master_sonic_wref', 'master_sonic_north_offset', &
                'master_sonic_hpath_length', 'master_sonic_vpath_length', 'master_sonic_tau', &
                'co2_irga_manufacturer', 'co2_irga_model', 'co2_measure_type', &
                'co2_irga_northward_separation', 'co2_irga_eastward_separation', 'co2_irga_vertical_separation', &
                'co2_irga_tube_length', 'co2_irga_tube_diameter', 'co2_irga_tube_flowrate',  &
                'co2_irga_kw', 'co2_irga_ko', 'co2_irga_hpath_length', 'co2_irga_vpath_length', 'co2_irga_tau',  &
                'h2o_irga_manufacturer', 'h2o_irga_model', 'h2o_measure_type', &
                'h2o_irga_northward_separation', 'h2o_irga_eastward_separation', 'h2o_irga_vertical_separation', &
                'h2o_irga_tube_length', 'h2o_irga_tube_diameter', 'h2o_irga_tube_flowrate',  &
                'h2o_irga_kw', 'h2o_irga_ko', 'h2o_irga_hpath_length', 'h2o_irga_vpath_length', 'h2o_irga_tau',  &
                'ch4_irga_manufacturer', 'ch4_irga_model', 'ch4_measure_type', &
                'ch4_irga_northward_separation', 'ch4_irga_eastward_separation', 'ch4_irga_vertical_separation', &
                'ch4_irga_tube_length', 'ch4_irga_tube_diameter', 'ch4_irga_tube_flowrate',  &
                'ch4_irga_kw', 'ch4_irga_ko', 'ch4_irga_hpath_length', 'ch4_irga_vpath_length', 'ch4_irga_tau',  &
                'gas4_irga_manufacturer', 'gas4_irga_model', 'gas4_measure_type', &
                'gas4_irga_northward_separation', 'gas4_irga_eastward_separation', 'gas4_irga_vertical_separation', &
                'gas4_irga_tube_length', 'gas4_irga_tube_diameter', 'gas4_irga_tube_flowrate',  &
                'gas4_irga_kw', 'gas4_irga_ko', 'gas4_irga_hpath_length', 'gas4_irga_vpath_length', 'gas4_irga_tau' /

    integer, parameter :: NumStdSlow = 397
    character(32) :: StdSlow(NumStdSlow)
    data (StdSlow(mmm), mmm = 1, NumStdSlow) &
    /'TIMESTAMP_1','TIMESTAMP_2','TIMESTAMP_3','TIMESTAMP_4', 'TIMESTAMP_5', 'TIMESTAMP_6', 'TIMESTAMP_7', &
     'TA_1_1_1','TA_2_1_1','TA_3_1_1','TA_4_1_1','TA_5_1_1','TA_6_1_1','TA_7_1_1','TA_8_1_1','TA_9_1_1','TA_10_1_1', &
     'PA_1_1_1','PA_2_1_1','PA_3_1_1','PA_4_1_1','PA_5_1_1','PA_6_1_1','PA_7_1_1','PA_8_1_1','PA_9_1_1','PA_10_1_1', &
     'RH_1_1_1','RH_2_1_1','RH_3_1_1','RH_4_1_1','RH_5_1_1','RH_6_1_1','RH_7_1_1','RH_8_1_1','RH_9_1_1','RH_10_1_1', &
     'RG_1_1_1','RG_2_1_1','RG_3_1_1','RG_4_1_1','RG_5_1_1','RG_6_1_1','RG_7_1_1','RG_8_1_1','RG_9_1_1','RG_10_1_1', &
     'RN_1_1_1','RN_2_1_1','RN_3_1_1','RN_4_1_1','RN_5_1_1','RN_6_1_1','RN_7_1_1','RN_8_1_1','RN_9_1_1','RN_10_1_1', &
     'RD_1_1_1','RD_2_1_1','RD_3_1_1','RD_4_1_1','RD_5_1_1','RD_6_1_1','RD_7_1_1','RD_8_1_1','RD_9_1_1','RD_10_1_1', &
     'RR_1_1_1','RR_2_1_1','RR_3_1_1','RR_4_1_1','RR_5_1_1','RR_6_1_1','RR_7_1_1','RR_8_1_1','RR_9_1_1','RR_10_1_1', &
     'R_UVA_1_1_1','R_UVA_2_1_1','R_UVA_3_1_1','R_UVA_4_1_1','R_UVA_5_1_1', &
     'R_UVA_6_1_1','R_UVA_7_1_1','R_UVA_8_1_1','R_UVA_9_1_1','R_UVA_10_1_1', &
     'R_UVB_1_1_1','R_UVB_2_1_1','R_UVB_3_1_1','R_UVB_4_1_1','R_UVB_5_1_1', &
     'R_UVB_6_1_1','R_UVB_7_1_1','R_UVB_8_1_1','R_UVB_9_1_1','R_UVB_10_1_1', &
     'LWIN_1_1_1','LWIN_2_1_1','LWIN_3_1_1','LWIN_4_1_1','LWIN_5_1_1', &
     'LWIN_6_1_1','LWIN_7_1_1','LWIN_8_1_1','LWIN_9_1_1','LWIN_10_1_1', &
     'LWOUT_1_1_1','LWOUT_2_1_1','LWOUT_3_1_1','LWOUT_4_1_1','LWOUT_5_1_1', &
     'LWOUT_6_1_1','LWOUT_7_1_1','LWOUT_8_1_1','LWOUT_9_1_1','LWOUT_10_1_1', &
     'TC_1_1_1','TC_2_1_1','TC_3_1_1','TC_4_1_1','TC_5_1_1','TC_6_1_1','TC_7_1_1','TC_8_1_1','TC_9_1_1','TC_10_1_1', &
     'TBOLE_1_1_1','TBOLE_2_1_1','TBOLE_3_1_1','TBOLE_4_1_1','TBOLE_5_1_1', &
     'TBOLE_6_1_1','TBOLE_7_1_1','TBOLE_8_1_1','TBOLE_9_1_1','TBOLE_10_1_1', &
     'P_1_1_1','P_2_1_1','P_3_1_1','P_4_1_1','P_5_1_1','P_6_1_1','P_7_1_1','P_8_1_1','P_9_1_1','P_10_1_1', &
     'P_RAIN_1_1_1','P_RAIN_2_1_1','P_RAIN_3_1_1','P_RAIN_4_1_1','P_RAIN_5_1_1', &
     'P_RAIN_6_1_1','P_RAIN_7_1_1','P_RAIN_8_1_1','P_RAIN_9_1_1','P_RAIN_10_1_1', &
     'P_SNOW_1_1_1','P_SNOW_2_1_1','P_SNOW_3_1_1','P_SNOW_4_1_1','P_SNOW_5_1_1', &
     'P_SNOW_6_1_1','P_SNOW_7_1_1','P_SNOW_8_1_1','P_SNOW_9_1_1','P_SNOW_10_1_1', &
     'PPFD_1_1_1','PPFD_2_1_1','PPFD_3_1_1','PPFD_4_1_1','PPFD_5_1_1', &
     'PPFD_6_1_1','PPFD_7_1_1','PPFD_8_1_1','PPFD_9_1_1','PPFD_10_1_1', &
     'PPFDD_1_1_1','PPFDD_2_1_1','PPFDD_3_1_1','PPFDD_4_1_1','PPFDD_5_1_1', &
     'PPFDD_6_1_1','PPFDD_7_1_1','PPFDD_8_1_1','PPFDD_9_1_1','PPFDD_10_1_1', &
     'PPFDR_1_1_1','PPFDR_2_1_1','PPFDR_3_1_1','PPFDR_4_1_1','PPFDR_5_1_1', &
     'PPFDR_6_1_1','PPFDR_7_1_1','PPFDR_8_1_1','PPFDR_9_1_1','PPFDR_10_1_1', &
     'PPFDBC_1_1_1','PPFDBC_2_1_1','PPFDBC_3_1_1','PPFDBC_4_1_1','PPFDBC_5_1_1', &
     'PPFDBC_6_1_1','PPFDBC_7_1_1','PPFDBC_8_1_1','PPFDBC_9_1_1','PPFDBC_10_1_1', &
     'APAR_1_1_1','APAR_2_1_1','APAR_3_1_1','APAR_4_1_1','APAR_5_1_1', &
     'APAR_6_1_1','APAR_7_1_1','APAR_8_1_1','APAR_9_1_1','APAR_10_1_1', &
     'ALB_1_1_1','ALB_2_1_1','ALB_3_1_1','ALB_4_1_1','ALB_5_1_1', &
     'ALB_6_1_1','ALB_7_1_1','ALB_8_1_1','ALB_9_1_1','ALB_10_1_1', &
     'PRI_1_1_1','PRI_2_1_1','PRI_3_1_1','PRI_4_1_1','PRI_5_1_1', &
     'PRI_6_1_1','PRI_7_1_1','PRI_8_1_1','PRI_9_1_1','PRI_10_1_1', &
     'SWIN_1_1_1','SWIN_2_1_1','SWIN_3_1_1','SWIN_4_1_1','SWIN_5_1_1', &
     'SWIN_6_1_1','SWIN_7_1_1','SWIN_8_1_1','SWIN_9_1_1','SWIN_10_1_1', &
     'SWOUT_1_1_1','SWOUT_2_1_1','SWOUT_3_1_1','SWOUT_4_1_1','SWOUT_5_1_1', &
     'SWOUT_6_1_1','SWOUT_7_1_1','SWOUT_8_1_1','SWOUT_9_1_1','SWOUT_10_1_1', &
     'SWBC_1_1_1','SWBC_2_1_1','SWBC_3_1_1','SWBC_4_1_1','SWBC_5_1_1', &
     'SWBC_6_1_1','SWBC_7_1_1','SWBC_8_1_1','SWBC_9_1_1','SWBC_10_1_1', &
     'WS_1_1_1','WS_2_1_1','WS_3_1_1','WS_4_1_1','WS_5_1_1', &
     'WS_6_1_1','WS_7_1_1','WS_8_1_1','WS_9_1_1','WS_10_1_1', &
     'SWDIF_1_1_1','SWDIF_2_1_1','SWDIF_3_1_1','SWDIF_4_1_1','SWDIF_5_1_1', &
     'SWDIF_6_1_1','SWDIF_7_1_1','SWDIF_8_1_1','SWDIF_9_1_1','SWDIF_10_1_1', &
     'MWS_1_1_1','MWS_2_1_1','MWS_3_1_1','MWS_4_1_1','MWS_5_1_1', &
     'MWS_6_1_1','MWS_7_1_1','MWS_8_1_1','MWS_9_1_1','MWS_10_1_1', &
     'WD_1_1_1','WD_2_1_1','WD_3_1_1','WD_4_1_1','WD_5_1_1', &
     'WD_6_1_1','WD_7_1_1','WD_8_1_1','WD_9_1_1','WD_10_1_1', &
     'TBC_1_1_1','TBC_2_1_1','TBC_3_1_1','TBC_4_1_1','TBC_5_1_1', &
     'TBC_6_1_1','TBC_7_1_1','TBC_8_1_1','TBC_9_1_1','TBC_10_1_1', &
     'TR_1_1_1','TR_2_1_1','TR_3_1_1','TR_4_1_1','TR_5_1_1', &
     'TR_6_1_1','TR_7_1_1','TR_8_1_1','TR_9_1_1','TR_10_1_1', &
     'LAI_1_1_1','LAI_2_1_1','LAI_3_1_1','LAI_4_1_1','LAI_5_1_1', &
     'LAI_6_1_1','LAI_7_1_1','LAI_8_1_1','LAI_9_1_1','LAI_10_1_1', &
     'SAPFLOW_1_1_1','SAPFLOW_2_1_1','SAPFLOW_3_1_1','SAPFLOW_4_1_1','SAPFLOW_5_1_1', &
     'SAPFLOW_6_1_1','SAPFLOW_7_1_1','SAPFLOW_8_1_1','SAPFLOW_9_1_1','SAPFLOW_10_1_1', &
     'STEMFLOW_1_1_1','STEMFLOW_2_1_1','STEMFLOW_3_1_1','STEMFLOW_4_1_1','STEMFLOW_5_1_1', &
     'STEMFLOW_6_1_1','STEMFLOW_7_1_1','STEMFLOW_8_1_1','STEMFLOW_9_1_1','STEMFLOW_10_1_1', &
     'SNOWD_1_1_1','SNOWD_2_1_1','SNOWD_3_1_1','SNOWD_4_1_1','SNOWD_5_1_1', &
     'SNOWD_6_1_1','SNOWD_7_1_1','SNOWD_8_1_1','SNOWD_9_1_1','SNOWD_10_1_1', &
     'SWC_1_1_1','SWC_2_1_1','SWC_3_1_1','SWC_4_1_1','SWC_5_1_1', &
     'SWC_6_1_1','SWC_7_1_1','SWC_8_1_1','SWC_9_1_1','SWC_10_1_1', &
     'SHF_1_1_1','SHF_2_1_1','SHF_3_1_1','SHF_4_1_1','SHF_5_1_1', &
     'SHF_6_1_1','SHF_7_1_1','SHF_8_1_1','SHF_9_1_1','SHF_10_1_1', &
     'TS_1_1_1','TS_2_1_1','TS_3_1_1','TS_4_1_1','TS_5_1_1', &
     'TS_6_1_1','TS_7_1_1','TS_8_1_1','TS_9_1_1','TS_10_1_1' /

    integer, parameter :: NumStdProfile = 280
    character(32) :: StdProfile(NumStdProfile)
    data (StdProfile(mmm), mmm = 1, NumStdProfile) &
    /'SWC_1_1_1','SWC_2_1_1','SWC_3_1_1','SWC_4_1_1','SWC_5_1_1', &
    'SWC_1_2_1','SWC_2_2_1','SWC_3_2_1','SWC_4_2_1','SWC_5_2_1', &
    'SWC_1_3_1','SWC_2_3_1','SWC_3_3_1','SWC_4_3_1','SWC_5_3_1', &
    'SWC_1_4_1','SWC_2_4_1','SWC_3_4_1','SWC_4_4_1','SWC_5_4_1', &
    'SWC_1_5_1','SWC_2_5_1','SWC_3_5_1','SWC_4_5_1','SWC_5_5_1', &
    'SWC_1_6_1','SWC_2_6_1','SWC_3_6_1','SWC_4_6_1','SWC_5_6_1', &
    'SWC_1_7_1','SWC_2_7_1','SWC_3_7_1','SWC_4_7_1','SWC_5_7_1', &
    'SHF_1_1_1','SHF_2_1_1','SHF_3_1_1','SHF_4_1_1','SHF_5_1_1', &
    'SHF_1_2_1','SHF_2_2_1','SHF_3_2_1','SHF_4_2_1','SHF_5_2_1', &
    'SHF_1_3_1','SHF_2_3_1','SHF_3_3_1','SHF_4_3_1','SHF_5_3_1', &
    'SHF_1_4_1','SHF_2_4_1','SHF_3_4_1','SHF_4_4_1','SHF_5_4_1', &
    'SHF_1_5_1','SHF_2_5_1','SHF_3_5_1','SHF_4_5_1','SHF_5_5_1', &
    'SHF_1_6_1','SHF_2_6_1','SHF_3_6_1','SHF_4_6_1','SHF_5_6_1', &
    'SHF_1_7_1','SHF_2_7_1','SHF_3_7_1','SHF_4_7_1','SHF_5_7_1', &
    'TS_1_1_1','TS_2_1_1','TS_3_1_1','TS_4_1_1','TS_5_1_1', &
    'TS_1_2_1','TS_2_2_1','TS_3_2_1','TS_4_2_1','TS_5_2_1', &
    'TS_1_3_1','TS_2_3_1','TS_3_3_1','TS_4_3_1','TS_5_3_1', &
    'TS_1_4_1','TS_2_4_1','TS_3_4_1','TS_4_4_1','TS_5_4_1', &
    'TS_1_5_1','TS_2_5_1','TS_3_5_1','TS_4_5_1','TS_5_5_1', &
    'TS_1_6_1','TS_2_6_1','TS_3_6_1','TS_4_6_1','TS_5_6_1', &
    'TS_1_7_1','TS_2_7_1','TS_3_7_1','TS_4_7_1','TS_5_7_1', &
    'CO2_1_1_1','CO2_2_1_1','CO2_3_1_1','CO2_4_1_1','CO2_5_1_1', &
    'CO2_1_2_1','CO2_2_2_1','CO2_3_2_1','CO2_4_2_1','CO2_5_2_1', &
    'CO2_1_3_1','CO2_2_3_1','CO2_3_3_1','CO2_4_3_1','CO2_5_3_1', &
    'CO2_1_4_1','CO2_2_4_1','CO2_3_4_1','CO2_4_4_1','CO2_5_4_1', &
    'CO2_1_5_1','CO2_2_5_1','CO2_3_5_1','CO2_4_5_1','CO2_5_5_1', &
    'CO2_1_6_1','CO2_2_6_1','CO2_3_6_1','CO2_4_6_1','CO2_5_6_1', &
    'CO2_1_7_1','CO2_2_7_1','CO2_3_7_1','CO2_4_7_1','CO2_5_7_1', &
    'H2O_1_1_1','H2O_2_1_1','H2O_3_1_1','H2O_4_1_1','H2O_5_1_1', &
    'H2O_1_2_1','H2O_2_2_1','H2O_3_2_1','H2O_4_2_1','H2O_5_2_1', &
    'H2O_1_3_1','H2O_2_3_1','H2O_3_3_1','H2O_4_3_1','H2O_5_3_1', &
    'H2O_1_4_1','H2O_2_4_1','H2O_3_4_1','H2O_4_4_1','H2O_5_4_1', &
    'H2O_1_5_1','H2O_2_5_1','H2O_3_5_1','H2O_4_5_1','H2O_5_5_1', &
    'H2O_1_6_1','H2O_2_6_1','H2O_3_6_1','H2O_4_6_1','H2O_5_6_1', &
    'H2O_1_7_1','H2O_2_7_1','H2O_3_7_1','H2O_4_7_1','H2O_5_7_1', &
    'CH4_1_1_1','CH4_2_1_1','CH4_3_1_1','CH4_4_1_1','CH4_5_1_1', &
    'CH4_1_2_1','CH4_2_2_1','CH4_3_2_1','CH4_4_2_1','CH4_5_2_1', &
    'CH4_1_3_1','CH4_2_3_1','CH4_3_3_1','CH4_4_3_1','CH4_5_3_1', &
    'CH4_1_4_1','CH4_2_4_1','CH4_3_4_1','CH4_4_4_1','CH4_5_4_1', &
    'CH4_1_5_1','CH4_2_5_1','CH4_3_5_1','CH4_4_5_1','CH4_5_5_1', &
    'CH4_1_6_1','CH4_2_6_1','CH4_3_6_1','CH4_4_6_1','CH4_5_6_1', &
    'CH4_1_7_1','CH4_2_7_1','CH4_3_7_1','CH4_4_7_1','CH4_5_7_1', &
    'GAS4_1_1_1','GAS4_2_1_1','GAS4_3_1_1','GAS4_4_1_1','GAS4_5_1_1', &
    'GAS4_1_2_1','GAS4_2_2_1','GAS4_3_2_1','GAS4_4_2_1','GAS4_5_2_1', &
    'GAS4_1_3_1','GAS4_2_3_1','GAS4_3_3_1','GAS4_4_3_1','GAS4_5_3_1', &
    'GAS4_1_4_1','GAS4_2_4_1','GAS4_3_4_1','GAS4_4_4_1','GAS4_5_4_1', &
    'GAS4_1_5_1','GAS4_2_5_1','GAS4_3_5_1','GAS4_4_5_1','GAS4_5_5_1', &
    'GAS4_1_6_1','GAS4_2_6_1','GAS4_3_6_1','GAS4_4_6_1','GAS4_5_6_1', &
    'GAS4_1_7_1','GAS4_2_7_1','GAS4_3_7_1','GAS4_4_7_1','GAS4_5_7_1', &
    'T_1_1_1','T_2_1_1','T_3_1_1','T_4_1_1','T_5_1_1', &
    'T_1_2_1','T_2_2_1','T_3_2_1','T_4_2_1','T_5_2_1', &
    'T_1_3_1','T_2_3_1','T_3_3_1','T_4_3_1','T_5_3_1', &
    'T_1_4_1','T_2_4_1','T_3_4_1','T_4_4_1','T_5_4_1', &
    'T_1_5_1','T_2_5_1','T_3_5_1','T_4_5_1','T_5_5_1', &
    'T_1_6_1','T_2_6_1','T_3_6_1','T_4_6_1','T_5_6_1', &
    'T_1_7_1','T_2_7_1','T_3_7_1','T_4_7_1','T_5_7_1' /

    integer, parameter :: NumStdUnits = 107
    character(32) :: StdUnits(NumStdUnits)
    data (StdUnits(mmm), mmm = 1, NumStdUnits) &
    /'K','PA','%','W+1M-2','UMOL+1M-2S-1','M','M+1S-1','PPM', 'PPT','PPB','DEG','NONE', &   !> standard units
    'N+1M-2','NM^-2','N/M2','N/M^2','M/S','MS^-1','MS-1',& !> units that don't need to be changed
    'WM^-2','W/M2','WM-2','W/M^2','WATTM^-2','WATT/M2','WATT/M^2',& !> units that don't need to be changed
    'J/M2S','JM-2S-1','JM^-2S^-1','J/(M^2*S)', & !> units that don't need to be changed
    'UMOLM-2S-1','UMOL/(M^2*S)','UMOLM^-2*S^-1','UMOL/M^2/S^1',  & !> units that don't need to be changed
    'UEM-2S-1','UE/(M^2*S)','UEM^-2*S^-1',  & !> units that don't need to be changed
    'MICROEINSTEIN+1M-2S-1','MICROEINSTEINM-2S-1','MICROEINSTEIN/(M^2*S)','MICROEINSTEINM^-2*S^-1',  &
    'UEINSTEIN+1M-2S-1','UEINSTEINM-2S-1','UEINSTEIN/(M^2*S)','UEINSTEINM^-2*S^-1',  &
    'PPMD','UMOLMOL-1','UMOL/MOL','UMOLMOL^-1', & !> units that don't need to be changed
    '�','�DEG','DEGREES','DEGREESFROMNORTH', & !> units that don't need to be changed
    '#','PERCENT','%VOL', & !> units that don't need to be changed
    'M+3M-3','M3/M3','M^3M^-3','M^3/M^3','M3M-3',& !> units that don't need to be changed
    'M+2M-2','M2/M2','M^2M^-2','M2M-2',& !> units that don't need to be changed
    'NUMBER','#','DIMENSIONLESS','OTHER' ,'OTHERS', & !> units that don't need to be changed
    'C','�C','F','�F','CK','CC','C�C','CF','C�F', & !> units that need change
    'HPA','KPA','MMHG','PSI', 'BAR', 'ATM', 'TORR', & !> units that need change
    'NM','UM','MM','CM','KM', & !> units that need change
    'CM+1S-1','CM/S','CMS^-1','CMS-1','MM+1S-1','MM/S','MMS^-1','MMS-1', & !> units that need change
    'PPTD','MMOLMOL-1','MMOL/MOL','MMOLMOL^-1', & !> units that need change
    'PPBD','NMOLMOL-1','NMOL/MOL','NMOLMOL^-1'/ !> units that need change

    !> indentations and other strings
    character(0) :: indent0 = ''
    character(1) :: indent1 = ' '
    character(2) :: indent2 = '  '
    character(3) :: indent3 = '   '
    character(4) :: indent4 = '    '
    character(1) :: separator = ','

    type(DateType), parameter :: &
        tsNull= DateType(0, 0, 0, 0, 0)
    type(InstrumentType), parameter :: &
        NullInstrument = InstrumentType('none', 'none', '0.0.1', 'none', error, error, error, error, &
        error, error, error, error, error, error, error, error, error, error, 'none', 'none', &
        'none', 'none', .false., .false.)
    type(RawFlagType), parameter :: NullRawFlag = RawFlagType(0, error, .false.)
    type(ColType), parameter :: &
        NullCol = Coltype('none', 'none', 'none', 'none', '', '', '', &
        0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, NullInstrument, NullRawFlag, .false., .false., 0d0)
    type(BiometColType), parameter :: &
        NullBiometCol = BiometColType('none', 'none', 'none', 'none', 'none', error, error)

    integer :: RowLags(E2NumVar)
    integer :: UserRowLags(MaxUserVar)
    type(MethType) :: Meth
    type(DirType) :: Dir
    type(FileType) :: AuxFile
    type(BinaryType) :: Binary
    type(MetadataType) :: Metadata
    type(BiometMetaType) :: BiometMeta

    !> variables from metadata file
    type(RawFlagType)   :: RawFlag(MaxNumRawFlags)
    type(InstrumentType)   :: Instr(MaxNumInstruments)
    type(FileInterpreterType)   :: FileInterpreter
    type(ColType) :: Col(MaxNumCol)
    type(ColType) :: E2Col(E2NumVar)
    type(ColType) :: SpecCol(E2NumVar)
    type(ColType), allocatable :: UserCol(:)
    type(EssentialsType)  :: Essentials
    logical :: ArchiveIsCreated = .false.

    !> other shared variables
    real (kind = dbl) :: PotRad(17568)
    real (kind = dbl) :: magnetic_declination
    real(kind = dbl) BuMultiPar(2, 3, 4)
    character(11)  :: app
    character(32)  :: TFShape
    character(32) :: foot_model_used
    Type(StatsType)  :: Stats
    Type(UserStatsType)  :: UserStats
    type(AmbientStateType)    :: Ambient
    type(RegParType) :: RegPar(GHGNumVar, MaxGasClasses)
    type(DateType)   :: DateStep
    type(DateType)   :: DatafileDateStep
    type(GenericE2Var) :: OptTLagDef
    type(GenericE2Var) :: OptTLagStDev
    type(Diag7200Type) :: Diag7200
    type(Diag7500Type) :: Diag7500
    type(Diag7700Type) :: Diag7700
    type (QCType) :: QCFlag
    real(kind = dbl) :: f_c(GHGNumVar)
    real(kind = dbl) :: f_2(GHGNumVar)
    real(kind = dbl) :: StPar(2) = error
    real(kind = dbl) :: UnPar(2) = error

    !> tags of the biomet metadata file
    integer, parameter :: Nbc = 1010
    integer, parameter :: Nbn = 1010
    logical :: BiometCTagFound(Nbc)
    logical :: BiometNTagFound(Nbn)
    type (Text)      :: BiometCTags(Nbc)
    type (Numerical) :: BiometNTags(Nbn)
    data BiometCTags(1)%Label    / 'biomet_1_variable'      / &
         BiometCTags(2)%Label    / 'biomet_1_id'            / &
         BiometCTags(3)%Label    / 'biomet_1_instrument'    / &
         BiometCTags(4)%Label    / 'biomet_1_unit_in'       / &
         BiometCTags(5)%Label    / 'biomet_1_unit_out'      / &
         BiometCTags(6)%Label    / 'biomet_1_aux1'          / &
         BiometCTags(7)%Label    / 'biomet_1_aux2'          / &
         BiometCTags(8)%Label    / 'biomet_2_variable'      / &
         BiometCTags(9)%Label    / 'biomet_2_id'            / &
         BiometCTags(10)%Label   / 'biomet_2_instrument'    / &
         BiometCTags(11)%Label   / 'biomet_2_unit_in'       / &
         BiometCTags(12)%Label   / 'biomet_2_unit_out'      / &
         BiometCTags(13)%Label   / 'biomet_2_aux1'          / &
         BiometCTags(14)%Label   / 'biomet_2_aux2'          / &
         BiometCTags(15)%Label   / 'biomet_3_variable'      / &
         BiometCTags(16)%Label   / 'biomet_3_id'            / &
         BiometCTags(17)%Label   / 'biomet_3_instrument'    / &
         BiometCTags(18)%Label   / 'biomet_3_unit_in'       / &
         BiometCTags(19)%Label   / 'biomet_3_unit_out'      / &
         BiometCTags(20)%Label   / 'biomet_3_aux1'          / &
         BiometCTags(21)%Label   / 'biomet_3_aux2'          / &
         BiometCTags(22)%Label   / 'biomet_4_variable'      / &
         BiometCTags(23)%Label   / 'biomet_4_id'            / &
         BiometCTags(24)%Label   / 'biomet_4_instrument'    / &
         BiometCTags(25)%Label   / 'biomet_4_unit_in'       / &
         BiometCTags(26)%Label   / 'biomet_4_unit_out'      / &
         BiometCTags(27)%Label   / 'biomet_4_aux1'          / &
         BiometCTags(28)%Label   / 'biomet_4_aux2'          / &
         BiometCTags(29)%Label   / 'biomet_5_variable'      / &
         BiometCTags(30)%Label   / 'biomet_5_id'            / &
         BiometCTags(31)%Label   / 'biomet_5_instrument'    / &
         BiometCTags(32)%Label   / 'biomet_5_unit_in'       / &
         BiometCTags(33)%Label   / 'biomet_5_unit_out'      / &
         BiometCTags(34)%Label   / 'biomet_5_aux1'          / &
         BiometCTags(35)%Label   / 'biomet_5_aux2'          / &
         BiometCTags(36)%Label   / 'biomet_6_variable'      / &
         BiometCTags(37)%Label   / 'biomet_6_id'            / &
         BiometCTags(38)%Label   / 'biomet_6_instrument'    / &
         BiometCTags(39)%Label   / 'biomet_6_unit_in'       / &
         BiometCTags(40)%Label   / 'biomet_6_unit_out'      / &
         BiometCTags(41)%Label   / 'biomet_6_aux1'          / &
         BiometCTags(42)%Label   / 'biomet_6_aux2'          / &
         BiometCTags(43)%Label   / 'biomet_7_variable'      / &
         BiometCTags(44)%Label   / 'biomet_7_id'            / &
         BiometCTags(45)%Label   / 'biomet_7_instrument'    / &
         BiometCTags(46)%Label   / 'biomet_7_unit_in'       / &
         BiometCTags(47)%Label   / 'biomet_7_unit_out'      / &
         BiometCTags(48)%Label   / 'biomet_7_aux1'          / &
         BiometCTags(49)%Label   / 'biomet_7_aux2'          / &
         BiometCTags(50)%Label   / 'biomet_8_variable'      / &
         BiometCTags(51)%Label   / 'biomet_8_id'            / &
         BiometCTags(52)%Label   / 'biomet_8_instrument'    / &
         BiometCTags(53)%Label   / 'biomet_8_unit_in'       / &
         BiometCTags(54)%Label   / 'biomet_8_unit_out'      / &
         BiometCTags(55)%Label   / 'biomet_8_aux1'          / &
         BiometCTags(56)%Label   / 'biomet_8_aux2'          / &
         BiometCTags(57)%Label   / 'biomet_9_variable'      / &
         BiometCTags(58)%Label   / 'biomet_9_id'            / &
         BiometCTags(59)%Label   / 'biomet_9_instrument'    / &
         BiometCTags(60)%Label   / 'biomet_9_unit_in'       / &
         BiometCTags(61)%Label   / 'biomet_9_unit_out'      / &
         BiometCTags(62)%Label   / 'biomet_9_aux1'          / &
         BiometCTags(63)%Label   / 'biomet_9_aux2'          / &
         BiometCTags(64)%Label   / 'biomet_10_variable'      / &
         BiometCTags(65)%Label   / 'biomet_10_id'            / &
         BiometCTags(66)%Label   / 'biomet_10_instrument'    / &
         BiometCTags(67)%Label   / 'biomet_10_unit_in'       / &
         BiometCTags(68)%Label   / 'biomet_10_unit_out'      / &
         BiometCTags(69)%Label   / 'biomet_10_aux1'          / &
         BiometCTags(70)%Label   / 'biomet_10_aux2'          / &
         BiometCTags(71)%Label   / 'biomet_11_variable'      / &
         BiometCTags(72)%Label   / 'biomet_11_id'            / &
         BiometCTags(73)%Label   / 'biomet_11_instrument'    / &
         BiometCTags(74)%Label   / 'biomet_11_unit_in'       / &
         BiometCTags(75)%Label   / 'biomet_11_unit_out'      / &
         BiometCTags(76)%Label   / 'biomet_11_aux1'          / &
         BiometCTags(77)%Label   / 'biomet_11_aux2'          / &
         BiometCTags(78)%Label   / 'biomet_12_variable'      / &
         BiometCTags(79)%Label   / 'biomet_12_id'            / &
         BiometCTags(80)%Label   / 'biomet_12_instrument'    / &
         BiometCTags(81)%Label   / 'biomet_12_unit_in'       / &
         BiometCTags(82)%Label   / 'biomet_12_unit_out'      / &
         BiometCTags(83)%Label   / 'biomet_12_aux1'          / &
         BiometCTags(84)%Label   / 'biomet_12_aux2'          / &
         BiometCTags(85)%Label   / 'biomet_13_variable'      / &
         BiometCTags(86)%Label   / 'biomet_13_id'            / &
         BiometCTags(87)%Label   / 'biomet_13_instrument'    / &
         BiometCTags(88)%Label   / 'biomet_13_unit_in'       / &
         BiometCTags(89)%Label   / 'biomet_13_unit_out'      / &
         BiometCTags(90)%Label   / 'biomet_13_aux1'          / &
         BiometCTags(91)%Label   / 'biomet_13_aux2'          / &
         BiometCTags(92)%Label   / 'biomet_14_variable'      / &
         BiometCTags(93)%Label   / 'biomet_14_id'            / &
         BiometCTags(94)%Label   / 'biomet_14_instrument'    / &
         BiometCTags(95)%Label   / 'biomet_14_unit_in'       / &
         BiometCTags(96)%Label   / 'biomet_14_unit_out'      / &
         BiometCTags(97)%Label   / 'biomet_14_aux1'          / &
         BiometCTags(98)%Label   / 'biomet_14_aux2'          / &
         BiometCTags(99)%Label   / 'biomet_15_variable'      / &
         BiometCTags(100)%Label   / 'biomet_15_id'            / &
         BiometCTags(101)%Label   / 'biomet_15_instrument'    / &
         BiometCTags(102)%Label   / 'biomet_15_unit_in'       / &
         BiometCTags(103)%Label   / 'biomet_15_unit_out'      / &
         BiometCTags(104)%Label   / 'biomet_15_aux1'          / &
         BiometCTags(105)%Label   / 'biomet_15_aux2'          / &
         BiometCTags(106)%Label   / 'biomet_16_variable'      / &
         BiometCTags(107)%Label   / 'biomet_16_id'            / &
         BiometCTags(108)%Label   / 'biomet_16_instrument'    / &
         BiometCTags(109)%Label   / 'biomet_16_unit_in'       / &
         BiometCTags(110)%Label   / 'biomet_16_unit_out'      / &
         BiometCTags(111)%Label   / 'biomet_16_aux1'          / &
         BiometCTags(112)%Label   / 'biomet_16_aux2'          / &
         BiometCTags(113)%Label   / 'biomet_17_variable'      / &
         BiometCTags(114)%Label   / 'biomet_17_id'            / &
         BiometCTags(115)%Label   / 'biomet_17_instrument'    / &
         BiometCTags(116)%Label   / 'biomet_17_unit_in'       / &
         BiometCTags(117)%Label   / 'biomet_17_unit_out'      / &
         BiometCTags(118)%Label   / 'biomet_17_aux1'          / &
         BiometCTags(119)%Label   / 'biomet_17_aux2'          / &
         BiometCTags(120)%Label   / 'biomet_18_variable'      / &
         BiometCTags(121)%Label   / 'biomet_18_id'            / &
         BiometCTags(122)%Label   / 'biomet_18_instrument'    / &
         BiometCTags(123)%Label   / 'biomet_18_unit_in'       / &
         BiometCTags(124)%Label   / 'biomet_18_unit_out'      / &
         BiometCTags(125)%Label   / 'biomet_18_aux1'          / &
         BiometCTags(126)%Label   / 'biomet_18_aux2'          / &
         BiometCTags(127)%Label   / 'biomet_19_variable'      / &
         BiometCTags(128)%Label   / 'biomet_19_id'            / &
         BiometCTags(129)%Label   / 'biomet_19_instrument'    / &
         BiometCTags(130)%Label   / 'biomet_19_unit_in'       / &
         BiometCTags(131)%Label   / 'biomet_19_unit_out'      / &
         BiometCTags(132)%Label   / 'biomet_19_aux1'          / &
         BiometCTags(133)%Label   / 'biomet_19_aux2'          / &
         BiometCTags(134)%Label   / 'biomet_20_variable'      / &
         BiometCTags(135)%Label   / 'biomet_20_id'            / &
         BiometCTags(136)%Label   / 'biomet_20_instrument'    / &
         BiometCTags(137)%Label   / 'biomet_20_unit_in'       / &
         BiometCTags(138)%Label   / 'biomet_20_unit_out'      / &
         BiometCTags(139)%Label   / 'biomet_20_aux1'          / &
         BiometCTags(140)%Label   / 'biomet_20_aux2'          / &
         BiometCTags(141)%Label   / 'biomet_21_variable'      / &
         BiometCTags(142)%Label   / 'biomet_21_id'            / &
         BiometCTags(143)%Label   / 'biomet_21_instrument'    / &
         BiometCTags(144)%Label   / 'biomet_21_unit_in'       / &
         BiometCTags(145)%Label   / 'biomet_21_unit_out'      / &
         BiometCTags(146)%Label   / 'biomet_21_aux1'          / &
         BiometCTags(147)%Label   / 'biomet_21_aux2'          / &
         BiometCTags(148)%Label   / 'biomet_22_variable'      / &
         BiometCTags(149)%Label   / 'biomet_22_id'            / &
         BiometCTags(150)%Label   / 'biomet_22_instrument'    / &
         BiometCTags(151)%Label   / 'biomet_22_unit_in'       / &
         BiometCTags(152)%Label   / 'biomet_22_unit_out'      / &
         BiometCTags(153)%Label   / 'biomet_22_aux1'          / &
         BiometCTags(154)%Label   / 'biomet_22_aux2'          / &
         BiometCTags(155)%Label   / 'biomet_23_variable'      / &
         BiometCTags(156)%Label   / 'biomet_23_id'            / &
         BiometCTags(157)%Label   / 'biomet_23_instrument'    / &
         BiometCTags(158)%Label   / 'biomet_23_unit_in'       / &
         BiometCTags(159)%Label   / 'biomet_23_unit_out'      / &
         BiometCTags(160)%Label   / 'biomet_23_aux1'          / &
         BiometCTags(161)%Label   / 'biomet_23_aux2'          / &
         BiometCTags(162)%Label   / 'biomet_24_variable'      / &
         BiometCTags(163)%Label   / 'biomet_24_id'            / &
         BiometCTags(164)%Label   / 'biomet_24_instrument'    / &
         BiometCTags(165)%Label   / 'biomet_24_unit_in'       / &
         BiometCTags(166)%Label   / 'biomet_24_unit_out'      / &
         BiometCTags(167)%Label   / 'biomet_24_aux1'          / &
         BiometCTags(168)%Label   / 'biomet_24_aux2'          / &
         BiometCTags(169)%Label   / 'biomet_25_variable'      / &
         BiometCTags(170)%Label   / 'biomet_25_id'            / &
         BiometCTags(171)%Label   / 'biomet_25_instrument'    / &
         BiometCTags(172)%Label   / 'biomet_25_unit_in'       / &
         BiometCTags(173)%Label   / 'biomet_25_unit_out'      / &
         BiometCTags(174)%Label   / 'biomet_25_aux1'          / &
         BiometCTags(175)%Label   / 'biomet_25_aux2'          / &
         BiometCTags(176)%Label   / 'biomet_26_variable'      / &
         BiometCTags(177)%Label   / 'biomet_26_id'            / &
         BiometCTags(178)%Label   / 'biomet_26_instrument'    / &
         BiometCTags(179)%Label   / 'biomet_26_unit_in'       / &
         BiometCTags(180)%Label   / 'biomet_26_unit_out'      / &
         BiometCTags(181)%Label   / 'biomet_26_aux1'          / &
         BiometCTags(182)%Label   / 'biomet_26_aux2'          / &
         BiometCTags(183)%Label   / 'biomet_27_variable'      / &
         BiometCTags(184)%Label   / 'biomet_27_id'            / &
         BiometCTags(185)%Label   / 'biomet_27_instrument'    / &
         BiometCTags(186)%Label   / 'biomet_27_unit_in'       / &
         BiometCTags(187)%Label   / 'biomet_27_unit_out'      / &
         BiometCTags(188)%Label   / 'biomet_27_aux1'          / &
         BiometCTags(189)%Label   / 'biomet_27_aux2'          / &
         BiometCTags(190)%Label   / 'biomet_28_variable'      / &
         BiometCTags(191)%Label   / 'biomet_28_id'            / &
         BiometCTags(192)%Label   / 'biomet_28_instrument'    / &
         BiometCTags(193)%Label   / 'biomet_28_unit_in'       / &
         BiometCTags(194)%Label   / 'biomet_28_unit_out'      / &
         BiometCTags(195)%Label   / 'biomet_28_aux1'          / &
         BiometCTags(196)%Label   / 'biomet_28_aux2'          / &
         BiometCTags(197)%Label   / 'biomet_29_variable'      / &
         BiometCTags(198)%Label   / 'biomet_29_id'            / &
         BiometCTags(199)%Label   / 'biomet_29_instrument'    / &
         BiometCTags(200)%Label   / 'biomet_29_unit_in'       / &
         BiometCTags(201)%Label   / 'biomet_29_unit_out'      / &
         BiometCTags(202)%Label   / 'biomet_29_aux1'          / &
         BiometCTags(203)%Label   / 'biomet_29_aux2'          / &
         BiometCTags(204)%Label   / 'biomet_30_variable'      / &
         BiometCTags(205)%Label   / 'biomet_30_id'            / &
         BiometCTags(206)%Label   / 'biomet_30_instrument'    / &
         BiometCTags(207)%Label   / 'biomet_30_unit_in'       / &
         BiometCTags(208)%Label   / 'biomet_30_unit_out'      / &
         BiometCTags(209)%Label   / 'biomet_30_aux1'          / &
         BiometCTags(210)%Label   / 'biomet_30_aux2'          /

    data BiometCTags(211)%Label   / 'biomet_31_variable'      / &
         BiometCTags(212)%Label   / 'biomet_31_id'            / &
         BiometCTags(213)%Label   / 'biomet_31_instrument'    / &
         BiometCTags(214)%Label   / 'biomet_31_unit_in'       / &
         BiometCTags(215)%Label   / 'biomet_31_unit_out'      / &
         BiometCTags(216)%Label   / 'biomet_31_aux1'          / &
         BiometCTags(217)%Label   / 'biomet_31_aux2'          / &
         BiometCTags(218)%Label   / 'biomet_32_variable'      / &
         BiometCTags(219)%Label   / 'biomet_32_id'            / &
         BiometCTags(220)%Label   / 'biomet_32_instrument'    / &
         BiometCTags(221)%Label   / 'biomet_32_unit_in'       / &
         BiometCTags(222)%Label   / 'biomet_32_unit_out'      / &
         BiometCTags(223)%Label   / 'biomet_32_aux1'          / &
         BiometCTags(224)%Label   / 'biomet_32_aux2'          / &
         BiometCTags(225)%Label   / 'biomet_33_variable'      / &
         BiometCTags(226)%Label   / 'biomet_33_id'            / &
         BiometCTags(227)%Label   / 'biomet_33_instrument'    / &
         BiometCTags(228)%Label   / 'biomet_33_unit_in'       / &
         BiometCTags(229)%Label   / 'biomet_33_unit_out'      / &
         BiometCTags(230)%Label   / 'biomet_33_aux1'          / &
         BiometCTags(231)%Label   / 'biomet_33_aux2'          / &
         BiometCTags(232)%Label   / 'biomet_34_variable'      / &
         BiometCTags(233)%Label   / 'biomet_34_id'            / &
         BiometCTags(234)%Label   / 'biomet_34_instrument'    / &
         BiometCTags(235)%Label   / 'biomet_34_unit_in'       / &
         BiometCTags(236)%Label   / 'biomet_34_unit_out'      / &
         BiometCTags(237)%Label   / 'biomet_34_aux1'          / &
         BiometCTags(238)%Label   / 'biomet_34_aux2'          / &
         BiometCTags(239)%Label   / 'biomet_35_variable'      / &
         BiometCTags(240)%Label   / 'biomet_35_id'            / &
         BiometCTags(241)%Label   / 'biomet_35_instrument'    / &
         BiometCTags(242)%Label   / 'biomet_35_unit_in'       / &
         BiometCTags(243)%Label   / 'biomet_35_unit_out'      / &
         BiometCTags(244)%Label   / 'biomet_35_aux1'          / &
         BiometCTags(245)%Label   / 'biomet_35_aux2'          / &
         BiometCTags(246)%Label   / 'biomet_36_variable'      / &
         BiometCTags(247)%Label   / 'biomet_36_id'            / &
         BiometCTags(248)%Label   / 'biomet_36_instrument'    / &
         BiometCTags(249)%Label   / 'biomet_36_unit_in'       / &
         BiometCTags(250)%Label   / 'biomet_36_unit_out'      / &
         BiometCTags(251)%Label   / 'biomet_36_aux1'          / &
         BiometCTags(252)%Label   / 'biomet_36_aux2'          / &
         BiometCTags(253)%Label   / 'biomet_37_variable'      / &
         BiometCTags(254)%Label   / 'biomet_37_id'            / &
         BiometCTags(255)%Label   / 'biomet_37_instrument'    / &
         BiometCTags(256)%Label   / 'biomet_37_unit_in'       / &
         BiometCTags(257)%Label   / 'biomet_37_unit_out'      / &
         BiometCTags(258)%Label   / 'biomet_37_aux1'          / &
         BiometCTags(259)%Label   / 'biomet_37_aux2'          / &
         BiometCTags(260)%Label   / 'biomet_38_variable'      / &
         BiometCTags(261)%Label   / 'biomet_38_id'            / &
         BiometCTags(262)%Label   / 'biomet_38_instrument'    / &
         BiometCTags(263)%Label   / 'biomet_38_unit_in'       / &
         BiometCTags(264)%Label   / 'biomet_38_unit_out'      / &
         BiometCTags(265)%Label   / 'biomet_38_aux1'          / &
         BiometCTags(266)%Label   / 'biomet_38_aux2'          / &
         BiometCTags(267)%Label   / 'biomet_39_variable'      / &
         BiometCTags(268)%Label   / 'biomet_39_id'            / &
         BiometCTags(269)%Label   / 'biomet_39_instrument'    / &
         BiometCTags(270)%Label   / 'biomet_39_unit_in'       / &
         BiometCTags(271)%Label   / 'biomet_39_unit_out'      / &
         BiometCTags(272)%Label   / 'biomet_39_aux1'          / &
         BiometCTags(273)%Label   / 'biomet_39_aux2'          / &
         BiometCTags(274)%Label   / 'biomet_40_variable'      / &
         BiometCTags(275)%Label   / 'biomet_40_id'            / &
         BiometCTags(276)%Label   / 'biomet_40_instrument'    / &
         BiometCTags(277)%Label   / 'biomet_40_unit_in'       / &
         BiometCTags(278)%Label   / 'biomet_40_unit_out'      / &
         BiometCTags(279)%Label   / 'biomet_40_aux1'          / &
         BiometCTags(280)%Label   / 'biomet_40_aux2'          / &
         BiometCTags(281)%Label   / 'biomet_41_variable'      / &
         BiometCTags(282)%Label   / 'biomet_41_id'            / &
         BiometCTags(283)%Label   / 'biomet_41_instrument'    / &
         BiometCTags(284)%Label   / 'biomet_41_unit_in'       / &
         BiometCTags(285)%Label   / 'biomet_41_unit_out'      / &
         BiometCTags(286)%Label   / 'biomet_41_aux1'          / &
         BiometCTags(287)%Label   / 'biomet_41_aux2'          / &
         BiometCTags(288)%Label   / 'biomet_42_variable'      / &
         BiometCTags(289)%Label   / 'biomet_42_id'            / &
         BiometCTags(290)%Label   / 'biomet_42_instrument'    / &
         BiometCTags(291)%Label   / 'biomet_42_unit_in'       / &
         BiometCTags(292)%Label   / 'biomet_42_unit_out'      / &
         BiometCTags(293)%Label   / 'biomet_42_aux1'          / &
         BiometCTags(294)%Label   / 'biomet_42_aux2'          / &
         BiometCTags(295)%Label   / 'biomet_43_variable'      / &
         BiometCTags(296)%Label   / 'biomet_43_id'            / &
         BiometCTags(297)%Label   / 'biomet_43_instrument'    / &
         BiometCTags(298)%Label   / 'biomet_43_unit_in'       / &
         BiometCTags(299)%Label   / 'biomet_43_unit_out'      / &
         BiometCTags(300)%Label   / 'biomet_43_aux1'          / &
         BiometCTags(301)%Label   / 'biomet_43_aux2'          / &
         BiometCTags(302)%Label   / 'biomet_44_variable'      / &
         BiometCTags(303)%Label   / 'biomet_44_id'            / &
         BiometCTags(304)%Label   / 'biomet_44_instrument'    / &
         BiometCTags(305)%Label   / 'biomet_44_unit_in'       / &
         BiometCTags(306)%Label   / 'biomet_44_unit_out'      / &
         BiometCTags(307)%Label   / 'biomet_44_aux1'          / &
         BiometCTags(308)%Label   / 'biomet_44_aux2'          / &
         BiometCTags(309)%Label   / 'biomet_45_variable'      / &
         BiometCTags(310)%Label   / 'biomet_45_id'            / &
         BiometCTags(311)%Label   / 'biomet_45_instrument'    / &
         BiometCTags(312)%Label   / 'biomet_45_unit_in'       / &
         BiometCTags(313)%Label   / 'biomet_45_unit_out'      / &
         BiometCTags(314)%Label   / 'biomet_45_aux1'          / &
         BiometCTags(315)%Label   / 'biomet_45_aux2'          / &
         BiometCTags(316)%Label   / 'biomet_46_variable'      / &
         BiometCTags(317)%Label   / 'biomet_46_id'            / &
         BiometCTags(318)%Label   / 'biomet_46_instrument'    / &
         BiometCTags(319)%Label   / 'biomet_46_unit_in'       / &
         BiometCTags(320)%Label   / 'biomet_46_unit_out'      / &
         BiometCTags(321)%Label   / 'biomet_46_aux1'          / &
         BiometCTags(322)%Label   / 'biomet_46_aux2'          / &
         BiometCTags(323)%Label   / 'biomet_47_variable'      / &
         BiometCTags(324)%Label   / 'biomet_47_id'            / &
         BiometCTags(325)%Label   / 'biomet_47_instrument'    / &
         BiometCTags(326)%Label   / 'biomet_47_unit_in'       / &
         BiometCTags(327)%Label   / 'biomet_47_unit_out'      / &
         BiometCTags(328)%Label   / 'biomet_47_aux1'          / &
         BiometCTags(329)%Label   / 'biomet_47_aux2'          / &
         BiometCTags(330)%Label   / 'biomet_48_variable'      / &
         BiometCTags(331)%Label   / 'biomet_48_id'            / &
         BiometCTags(332)%Label   / 'biomet_48_instrument'    / &
         BiometCTags(333)%Label   / 'biomet_48_unit_in'       / &
         BiometCTags(334)%Label   / 'biomet_48_unit_out'      / &
         BiometCTags(335)%Label   / 'biomet_48_aux1'          / &
         BiometCTags(336)%Label   / 'biomet_48_aux2'          / &
         BiometCTags(337)%Label   / 'biomet_49_variable'      / &
         BiometCTags(338)%Label   / 'biomet_49_id'            / &
         BiometCTags(339)%Label   / 'biomet_49_instrument'    / &
         BiometCTags(340)%Label   / 'biomet_49_unit_in'       / &
         BiometCTags(341)%Label   / 'biomet_49_unit_out'      / &
         BiometCTags(342)%Label   / 'biomet_49_aux1'          / &
         BiometCTags(343)%Label   / 'biomet_49_aux2'          / &
         BiometCTags(344)%Label   / 'biomet_50_variable'      / &
         BiometCTags(345)%Label   / 'biomet_50_id'            / &
         BiometCTags(346)%Label   / 'biomet_50_instrument'    / &
         BiometCTags(347)%Label   / 'biomet_50_unit_in'       / &
         BiometCTags(348)%Label   / 'biomet_50_unit_out'      / &
         BiometCTags(349)%Label   / 'biomet_50_aux1'          / &
         BiometCTags(350)%Label   / 'biomet_50_aux2'          / &
         BiometCTags(351)%Label   / 'biomet_51_variable'      / &
         BiometCTags(352)%Label   / 'biomet_51_id'            / &
         BiometCTags(353)%Label   / 'biomet_51_instrument'    / &
         BiometCTags(354)%Label   / 'biomet_51_unit_in'       / &
         BiometCTags(355)%Label   / 'biomet_51_unit_out'      / &
         BiometCTags(356)%Label   / 'biomet_51_aux1'          / &
         BiometCTags(357)%Label   / 'biomet_51_aux2'          / &
         BiometCTags(358)%Label   / 'biomet_52_variable'      / &
         BiometCTags(359)%Label   / 'biomet_52_id'            / &
         BiometCTags(360)%Label   / 'biomet_52_instrument'    / &
         BiometCTags(361)%Label   / 'biomet_52_unit_in'       / &
         BiometCTags(362)%Label   / 'biomet_52_unit_out'      / &
         BiometCTags(363)%Label   / 'biomet_52_aux1'          / &
         BiometCTags(364)%Label   / 'biomet_52_aux2'          / &
         BiometCTags(365)%Label   / 'biomet_53_variable'      / &
         BiometCTags(366)%Label   / 'biomet_53_id'            / &
         BiometCTags(367)%Label   / 'biomet_53_instrument'    / &
         BiometCTags(368)%Label   / 'biomet_53_unit_in'       / &
         BiometCTags(369)%Label   / 'biomet_53_unit_out'      / &
         BiometCTags(370)%Label   / 'biomet_53_aux1'          / &
         BiometCTags(371)%Label   / 'biomet_53_aux2'          / &
         BiometCTags(372)%Label   / 'biomet_54_variable'      / &
         BiometCTags(373)%Label   / 'biomet_54_id'            / &
         BiometCTags(374)%Label   / 'biomet_54_instrument'    / &
         BiometCTags(375)%Label   / 'biomet_54_unit_in'       / &
         BiometCTags(376)%Label   / 'biomet_54_unit_out'      / &
         BiometCTags(377)%Label   / 'biomet_54_aux1'          / &
         BiometCTags(378)%Label   / 'biomet_54_aux2'          / &
         BiometCTags(379)%Label   / 'biomet_55_variable'      / &
         BiometCTags(380)%Label   / 'biomet_55_id'            / &
         BiometCTags(381)%Label   / 'biomet_55_instrument'    / &
         BiometCTags(382)%Label   / 'biomet_55_unit_in'       / &
         BiometCTags(383)%Label   / 'biomet_55_unit_out'      / &
         BiometCTags(384)%Label   / 'biomet_55_aux1'          / &
         BiometCTags(385)%Label   / 'biomet_55_aux2'          / &
         BiometCTags(386)%Label   / 'biomet_56_variable'      / &
         BiometCTags(387)%Label   / 'biomet_56_id'            / &
         BiometCTags(388)%Label   / 'biomet_56_instrument'    / &
         BiometCTags(389)%Label   / 'biomet_56_unit_in'       / &
         BiometCTags(390)%Label   / 'biomet_56_unit_out'      / &
         BiometCTags(391)%Label   / 'biomet_56_aux1'          / &
         BiometCTags(392)%Label   / 'biomet_56_aux2'          / &
         BiometCTags(393)%Label   / 'biomet_57_variable'      / &
         BiometCTags(394)%Label   / 'biomet_57_id'            / &
         BiometCTags(395)%Label   / 'biomet_57_instrument'    / &
         BiometCTags(396)%Label   / 'biomet_57_unit_in'       / &
         BiometCTags(397)%Label   / 'biomet_57_unit_out'      / &
         BiometCTags(398)%Label   / 'biomet_57_aux1'          / &
         BiometCTags(399)%Label   / 'biomet_57_aux2'          / &
         BiometCTags(400)%Label   / 'biomet_58_variable'      / &
         BiometCTags(401)%Label   / 'biomet_58_id'            / &
         BiometCTags(402)%Label   / 'biomet_58_instrument'    / &
         BiometCTags(403)%Label   / 'biomet_58_unit_in'       / &
         BiometCTags(404)%Label   / 'biomet_58_unit_out'      / &
         BiometCTags(405)%Label   / 'biomet_58_aux1'          / &
         BiometCTags(406)%Label   / 'biomet_58_aux2'          / &
         BiometCTags(407)%Label   / 'biomet_59_variable'      / &
         BiometCTags(408)%Label   / 'biomet_59_id'            / &
         BiometCTags(409)%Label   / 'biomet_59_instrument'    / &
         BiometCTags(410)%Label   / 'biomet_59_unit_in'       / &
         BiometCTags(411)%Label   / 'biomet_59_unit_out'      / &
         BiometCTags(412)%Label   / 'biomet_59_aux1'          / &
         BiometCTags(413)%Label   / 'biomet_59_aux2'          / &
         BiometCTags(414)%Label   / 'biomet_60_variable'      / &
         BiometCTags(415)%Label   / 'biomet_60_id'            / &
         BiometCTags(416)%Label   / 'biomet_60_instrument'    / &
         BiometCTags(417)%Label   / 'biomet_60_unit_in'       / &
         BiometCTags(418)%Label   / 'biomet_60_unit_out'      / &
         BiometCTags(419)%Label   / 'biomet_60_aux1'          / &
         BiometCTags(420)%Label   / 'biomet_60_aux2'          /

    data BiometCTags(421)%Label   / 'biomet_61_variable'      / &
         BiometCTags(422)%Label   / 'biomet_61_id'            / &
         BiometCTags(423)%Label   / 'biomet_61_instrument'    / &
         BiometCTags(424)%Label   / 'biomet_61_unit_in'       / &
         BiometCTags(425)%Label   / 'biomet_61_unit_out'      / &
         BiometCTags(426)%Label   / 'biomet_61_aux1'          / &
         BiometCTags(427)%Label   / 'biomet_61_aux2'          / &
         BiometCTags(428)%Label   / 'biomet_62_variable'      / &
         BiometCTags(429)%Label   / 'biomet_62_id'            / &
         BiometCTags(430)%Label   / 'biomet_62_instrument'    / &
         BiometCTags(431)%Label   / 'biomet_62_unit_in'       / &
         BiometCTags(432)%Label   / 'biomet_62_unit_out'      / &
         BiometCTags(433)%Label   / 'biomet_62_aux1'          / &
         BiometCTags(434)%Label   / 'biomet_62_aux2'          / &
         BiometCTags(435)%Label   / 'biomet_63_variable'      / &
         BiometCTags(436)%Label   / 'biomet_63_id'            / &
         BiometCTags(437)%Label   / 'biomet_63_instrument'    / &
         BiometCTags(438)%Label   / 'biomet_63_unit_in'       / &
         BiometCTags(439)%Label   / 'biomet_63_unit_out'      / &
         BiometCTags(440)%Label   / 'biomet_63_aux1'          / &
         BiometCTags(441)%Label   / 'biomet_63_aux2'          / &
         BiometCTags(442)%Label   / 'biomet_64_variable'      / &
         BiometCTags(443)%Label   / 'biomet_64_id'            / &
         BiometCTags(444)%Label   / 'biomet_64_instrument'    / &
         BiometCTags(445)%Label   / 'biomet_64_unit_in'       / &
         BiometCTags(446)%Label   / 'biomet_64_unit_out'      / &
         BiometCTags(447)%Label   / 'biomet_64_aux1'          / &
         BiometCTags(448)%Label   / 'biomet_64_aux2'          / &
         BiometCTags(449)%Label   / 'biomet_65_variable'      / &
         BiometCTags(450)%Label   / 'biomet_65_id'            / &
         BiometCTags(451)%Label   / 'biomet_65_instrument'    / &
         BiometCTags(452)%Label   / 'biomet_65_unit_in'       / &
         BiometCTags(453)%Label   / 'biomet_65_unit_out'      / &
         BiometCTags(454)%Label   / 'biomet_65_aux1'          / &
         BiometCTags(455)%Label   / 'biomet_65_aux2'          / &
         BiometCTags(456)%Label   / 'biomet_66_variable'      / &
         BiometCTags(457)%Label   / 'biomet_66_id'            / &
         BiometCTags(458)%Label   / 'biomet_66_instrument'    / &
         BiometCTags(459)%Label   / 'biomet_66_unit_in'       / &
         BiometCTags(460)%Label   / 'biomet_66_unit_out'      / &
         BiometCTags(461)%Label   / 'biomet_66_aux1'          / &
         BiometCTags(462)%Label   / 'biomet_66_aux2'          / &
         BiometCTags(463)%Label   / 'biomet_67_variable'      / &
         BiometCTags(464)%Label   / 'biomet_67_id'            / &
         BiometCTags(465)%Label   / 'biomet_67_instrument'    / &
         BiometCTags(466)%Label   / 'biomet_67_unit_in'       / &
         BiometCTags(467)%Label   / 'biomet_67_unit_out'      / &
         BiometCTags(468)%Label   / 'biomet_67_aux1'          / &
         BiometCTags(469)%Label   / 'biomet_67_aux2'          / &
         BiometCTags(470)%Label   / 'biomet_68_variable'      / &
         BiometCTags(471)%Label   / 'biomet_68_id'            / &
         BiometCTags(472)%Label   / 'biomet_68_instrument'    / &
         BiometCTags(473)%Label   / 'biomet_68_unit_in'       / &
         BiometCTags(474)%Label   / 'biomet_68_unit_out'      / &
         BiometCTags(475)%Label   / 'biomet_68_aux1'          / &
         BiometCTags(476)%Label   / 'biomet_68_aux2'          / &
         BiometCTags(477)%Label   / 'biomet_69_variable'      / &
         BiometCTags(478)%Label   / 'biomet_69_id'            / &
         BiometCTags(479)%Label   / 'biomet_69_instrument'    / &
         BiometCTags(480)%Label   / 'biomet_69_unit_in'       / &
         BiometCTags(481)%Label   / 'biomet_69_unit_out'      / &
         BiometCTags(482)%Label   / 'biomet_69_aux1'          / &
         BiometCTags(483)%Label   / 'biomet_69_aux2'          / &
         BiometCTags(484)%Label   / 'biomet_70_variable'      / &
         BiometCTags(485)%Label   / 'biomet_70_id'            / &
         BiometCTags(486)%Label   / 'biomet_70_instrument'    / &
         BiometCTags(487)%Label   / 'biomet_70_unit_in'       / &
         BiometCTags(488)%Label   / 'biomet_70_unit_out'      / &
         BiometCTags(489)%Label   / 'biomet_70_aux1'          / &
         BiometCTags(490)%Label   / 'biomet_70_aux2'          / &
         BiometCTags(491)%Label   / 'biomet_71_variable'      / &
         BiometCTags(492)%Label   / 'biomet_71_id'            / &
         BiometCTags(493)%Label   / 'biomet_71_instrument'    / &
         BiometCTags(494)%Label   / 'biomet_71_unit_in'       / &
         BiometCTags(495)%Label   / 'biomet_71_unit_out'      / &
         BiometCTags(496)%Label   / 'biomet_71_aux1'          / &
         BiometCTags(497)%Label   / 'biomet_71_aux2'          / &
         BiometCTags(498)%Label   / 'biomet_72_variable'      / &
         BiometCTags(499)%Label   / 'biomet_72_id'            / &
         BiometCTags(500)%Label   / 'biomet_72_instrument'    / &
         BiometCTags(501)%Label   / 'biomet_72_unit_in'       / &
         BiometCTags(502)%Label   / 'biomet_72_unit_out'      / &
         BiometCTags(503)%Label   / 'biomet_72_aux1'          / &
         BiometCTags(504)%Label   / 'biomet_72_aux2'          / &
         BiometCTags(505)%Label   / 'biomet_73_variable'      / &
         BiometCTags(506)%Label   / 'biomet_73_id'            / &
         BiometCTags(507)%Label   / 'biomet_73_instrument'    / &
         BiometCTags(508)%Label   / 'biomet_73_unit_in'       / &
         BiometCTags(509)%Label   / 'biomet_73_unit_out'      / &
         BiometCTags(510)%Label   / 'biomet_73_aux1'          / &
         BiometCTags(511)%Label   / 'biomet_73_aux2'          / &
         BiometCTags(512)%Label   / 'biomet_74_variable'      / &
         BiometCTags(513)%Label   / 'biomet_74_id'            / &
         BiometCTags(514)%Label   / 'biomet_74_instrument'    / &
         BiometCTags(515)%Label   / 'biomet_74_unit_in'       / &
         BiometCTags(516)%Label   / 'biomet_74_unit_out'      / &
         BiometCTags(517)%Label   / 'biomet_74_aux1'          / &
         BiometCTags(518)%Label   / 'biomet_74_aux2'          / &
         BiometCTags(519)%Label   / 'biomet_75_variable'      / &
         BiometCTags(520)%Label   / 'biomet_75_id'            / &
         BiometCTags(521)%Label   / 'biomet_75_instrument'    / &
         BiometCTags(522)%Label   / 'biomet_75_unit_in'       / &
         BiometCTags(523)%Label   / 'biomet_75_unit_out'      / &
         BiometCTags(524)%Label   / 'biomet_75_aux1'          / &
         BiometCTags(525)%Label   / 'biomet_75_aux2'          / &
         BiometCTags(526)%Label   / 'biomet_76_variable'      / &
         BiometCTags(527)%Label   / 'biomet_76_id'            / &
         BiometCTags(528)%Label   / 'biomet_76_instrument'    / &
         BiometCTags(529)%Label   / 'biomet_76_unit_in'       / &
         BiometCTags(530)%Label   / 'biomet_76_unit_out'      / &
         BiometCTags(531)%Label   / 'biomet_76_aux1'          / &
         BiometCTags(532)%Label   / 'biomet_76_aux2'          / &
         BiometCTags(533)%Label   / 'biomet_77_variable'      / &
         BiometCTags(534)%Label   / 'biomet_77_id'            / &
         BiometCTags(535)%Label   / 'biomet_77_instrument'    / &
         BiometCTags(536)%Label   / 'biomet_77_unit_in'       / &
         BiometCTags(537)%Label   / 'biomet_77_unit_out'      / &
         BiometCTags(538)%Label   / 'biomet_77_aux1'          / &
         BiometCTags(539)%Label   / 'biomet_77_aux2'          / &
         BiometCTags(540)%Label   / 'biomet_78_variable'      / &
         BiometCTags(541)%Label   / 'biomet_78_id'            / &
         BiometCTags(542)%Label   / 'biomet_78_instrument'    / &
         BiometCTags(543)%Label   / 'biomet_78_unit_in'       / &
         BiometCTags(544)%Label   / 'biomet_78_unit_out'      / &
         BiometCTags(545)%Label   / 'biomet_78_aux1'          / &
         BiometCTags(546)%Label   / 'biomet_78_aux2'          / &
         BiometCTags(547)%Label   / 'biomet_79_variable'      / &
         BiometCTags(548)%Label   / 'biomet_79_id'            / &
         BiometCTags(549)%Label   / 'biomet_79_instrument'    / &
         BiometCTags(550)%Label   / 'biomet_79_unit_in'       / &
         BiometCTags(551)%Label   / 'biomet_79_unit_out'      / &
         BiometCTags(552)%Label   / 'biomet_79_aux1'          / &
         BiometCTags(553)%Label   / 'biomet_79_aux2'          / &
         BiometCTags(554)%Label   / 'biomet_80_variable'      / &
         BiometCTags(555)%Label   / 'biomet_80_id'            / &
         BiometCTags(556)%Label   / 'biomet_80_instrument'    / &
         BiometCTags(557)%Label   / 'biomet_80_unit_in'       / &
         BiometCTags(558)%Label   / 'biomet_80_unit_out'      / &
         BiometCTags(559)%Label   / 'biomet_80_aux1'          / &
         BiometCTags(560)%Label   / 'biomet_80_aux2'          / &
         BiometCTags(561)%Label   / 'biomet_81_variable'      / &
         BiometCTags(562)%Label   / 'biomet_81_id'            / &
         BiometCTags(563)%Label   / 'biomet_81_instrument'    / &
         BiometCTags(564)%Label   / 'biomet_81_unit_in'       / &
         BiometCTags(565)%Label   / 'biomet_81_unit_out'      / &
         BiometCTags(566)%Label   / 'biomet_81_aux1'          / &
         BiometCTags(567)%Label   / 'biomet_81_aux2'          / &
         BiometCTags(568)%Label   / 'biomet_82_variable'      / &
         BiometCTags(569)%Label   / 'biomet_82_id'            / &
         BiometCTags(570)%Label   / 'biomet_82_instrument'    / &
         BiometCTags(571)%Label   / 'biomet_82_unit_in'       / &
         BiometCTags(572)%Label   / 'biomet_82_unit_out'      / &
         BiometCTags(573)%Label   / 'biomet_82_aux1'          / &
         BiometCTags(574)%Label   / 'biomet_82_aux2'          / &
         BiometCTags(575)%Label   / 'biomet_83_variable'      / &
         BiometCTags(576)%Label   / 'biomet_83_id'            / &
         BiometCTags(577)%Label   / 'biomet_83_instrument'    / &
         BiometCTags(578)%Label   / 'biomet_83_unit_in'       / &
         BiometCTags(579)%Label   / 'biomet_83_unit_out'      / &
         BiometCTags(580)%Label   / 'biomet_83_aux1'          / &
         BiometCTags(581)%Label   / 'biomet_83_aux2'          / &
         BiometCTags(582)%Label   / 'biomet_84_variable'      / &
         BiometCTags(583)%Label   / 'biomet_84_id'            / &
         BiometCTags(584)%Label   / 'biomet_84_instrument'    / &
         BiometCTags(585)%Label   / 'biomet_84_unit_in'       / &
         BiometCTags(586)%Label   / 'biomet_84_unit_out'      / &
         BiometCTags(587)%Label   / 'biomet_84_aux1'          / &
         BiometCTags(588)%Label   / 'biomet_84_aux2'          / &
         BiometCTags(589)%Label   / 'biomet_85_variable'      / &
         BiometCTags(590)%Label   / 'biomet_85_id'            / &
         BiometCTags(591)%Label   / 'biomet_85_instrument'    / &
         BiometCTags(592)%Label   / 'biomet_85_unit_in'       / &
         BiometCTags(593)%Label   / 'biomet_85_unit_out'      / &
         BiometCTags(594)%Label   / 'biomet_85_aux1'          / &
         BiometCTags(595)%Label   / 'biomet_85_aux2'          / &
         BiometCTags(596)%Label   / 'biomet_86_variable'      / &
         BiometCTags(597)%Label   / 'biomet_86_id'            / &
         BiometCTags(598)%Label   / 'biomet_86_instrument'    / &
         BiometCTags(599)%Label   / 'biomet_86_unit_in'       / &
         BiometCTags(600)%Label   / 'biomet_86_unit_out'      / &
         BiometCTags(601)%Label   / 'biomet_86_aux1'          / &
         BiometCTags(602)%Label   / 'biomet_86_aux2'          /

    data BiometCTags(603)%Label   / 'biomet_87_variable'      / &
         BiometCTags(604)%Label   / 'biomet_87_id'            / &
         BiometCTags(605)%Label   / 'biomet_87_instrument'    / &
         BiometCTags(606)%Label   / 'biomet_87_unit_in'       / &
         BiometCTags(607)%Label   / 'biomet_87_unit_out'      / &
         BiometCTags(608)%Label   / 'biomet_87_aux1'          / &
         BiometCTags(609)%Label   / 'biomet_87_aux2'          / &
         BiometCTags(610)%Label   / 'biomet_88_variable'      / &
         BiometCTags(611)%Label   / 'biomet_88_id'            / &
         BiometCTags(612)%Label   / 'biomet_88_instrument'    / &
         BiometCTags(613)%Label   / 'biomet_88_unit_in'       / &
         BiometCTags(614)%Label   / 'biomet_88_unit_out'      / &
         BiometCTags(615)%Label   / 'biomet_88_aux1'          / &
         BiometCTags(616)%Label   / 'biomet_88_aux2'          / &
         BiometCTags(617)%Label   / 'biomet_89_variable'      / &
         BiometCTags(618)%Label   / 'biomet_89_id'            / &
         BiometCTags(619)%Label   / 'biomet_89_instrument'    / &
         BiometCTags(620)%Label   / 'biomet_89_unit_in'       / &
         BiometCTags(621)%Label   / 'biomet_89_unit_out'      / &
         BiometCTags(622)%Label   / 'biomet_89_aux1'          / &
         BiometCTags(623)%Label   / 'biomet_89_aux2'          / &
         BiometCTags(624)%Label   / 'biomet_90_variable'      / &
         BiometCTags(625)%Label   / 'biomet_90_id'            / &
         BiometCTags(626)%Label   / 'biomet_90_instrument'    / &
         BiometCTags(627)%Label   / 'biomet_90_unit_in'       / &
         BiometCTags(628)%Label   / 'biomet_90_unit_out'      / &
         BiometCTags(629)%Label   / 'biomet_90_aux1'          / &
         BiometCTags(630)%Label   / 'biomet_90_aux2'          / &
         BiometCTags(631)%Label   / 'biomet_91_variable'      / &
         BiometCTags(632)%Label   / 'biomet_91_id'            / &
         BiometCTags(633)%Label   / 'biomet_91_instrument'    / &
         BiometCTags(634)%Label   / 'biomet_91_unit_in'       / &
         BiometCTags(635)%Label   / 'biomet_91_unit_out'      / &
         BiometCTags(636)%Label   / 'biomet_91_aux1'          / &
         BiometCTags(637)%Label   / 'biomet_91_aux2'          / &
         BiometCTags(638)%Label   / 'biomet_92_variable'      / &
         BiometCTags(639)%Label   / 'biomet_92_id'            / &
         BiometCTags(640)%Label   / 'biomet_92_instrument'    / &
         BiometCTags(641)%Label   / 'biomet_92_unit_in'       / &
         BiometCTags(642)%Label   / 'biomet_92_unit_out'      / &
         BiometCTags(643)%Label   / 'biomet_92_aux1'          / &
         BiometCTags(644)%Label   / 'biomet_92_aux2'          / &
         BiometCTags(645)%Label   / 'biomet_93_variable'      / &
         BiometCTags(646)%Label   / 'biomet_93_id'            / &
         BiometCTags(647)%Label   / 'biomet_93_instrument'    / &
         BiometCTags(648)%Label   / 'biomet_93_unit_in'       / &
         BiometCTags(649)%Label   / 'biomet_93_unit_out'      / &
         BiometCTags(650)%Label   / 'biomet_93_aux1'          / &
         BiometCTags(651)%Label   / 'biomet_93_aux2'          / &
         BiometCTags(652)%Label   / 'biomet_94_variable'      / &
         BiometCTags(653)%Label   / 'biomet_94_id'            / &
         BiometCTags(654)%Label   / 'biomet_94_instrument'    / &
         BiometCTags(655)%Label   / 'biomet_94_unit_in'       / &
         BiometCTags(656)%Label   / 'biomet_94_unit_out'      / &
         BiometCTags(657)%Label   / 'biomet_94_aux1'          / &
         BiometCTags(658)%Label   / 'biomet_94_aux2'          / &
         BiometCTags(659)%Label   / 'biomet_95_variable'      / &
         BiometCTags(660)%Label   / 'biomet_95_id'            / &
         BiometCTags(661)%Label   / 'biomet_95_instrument'    / &
         BiometCTags(662)%Label   / 'biomet_95_unit_in'       / &
         BiometCTags(663)%Label   / 'biomet_95_unit_out'      / &
         BiometCTags(664)%Label   / 'biomet_95_aux1'          / &
         BiometCTags(665)%Label   / 'biomet_95_aux2'          / &
         BiometCTags(666)%Label   / 'biomet_96_variable'      / &
         BiometCTags(667)%Label   / 'biomet_96_id'            / &
         BiometCTags(668)%Label   / 'biomet_96_instrument'    / &
         BiometCTags(669)%Label   / 'biomet_96_unit_in'       / &
         BiometCTags(670)%Label   / 'biomet_96_unit_out'      / &
         BiometCTags(671)%Label   / 'biomet_96_aux1'          / &
         BiometCTags(672)%Label   / 'biomet_96_aux2'          / &
         BiometCTags(673)%Label   / 'biomet_97_variable'      / &
         BiometCTags(674)%Label   / 'biomet_97_id'            / &
         BiometCTags(675)%Label   / 'biomet_97_instrument'    / &
         BiometCTags(676)%Label   / 'biomet_97_unit_in'       / &
         BiometCTags(677)%Label   / 'biomet_97_unit_out'      / &
         BiometCTags(678)%Label   / 'biomet_97_aux1'          / &
         BiometCTags(679)%Label   / 'biomet_97_aux2'          / &
         BiometCTags(680)%Label   / 'biomet_98_variable'      / &
         BiometCTags(681)%Label   / 'biomet_98_id'            / &
         BiometCTags(682)%Label   / 'biomet_98_instrument'    / &
         BiometCTags(683)%Label   / 'biomet_98_unit_in'       / &
         BiometCTags(684)%Label   / 'biomet_98_unit_out'      / &
         BiometCTags(685)%Label   / 'biomet_98_aux1'          / &
         BiometCTags(686)%Label   / 'biomet_98_aux2'          / &
         BiometCTags(687)%Label   / 'biomet_99_variable'      / &
         BiometCTags(688)%Label   / 'biomet_99_id'            / &
         BiometCTags(689)%Label   / 'biomet_99_instrument'    / &
         BiometCTags(690)%Label   / 'biomet_99_unit_in'       / &
         BiometCTags(691)%Label   / 'biomet_99_unit_out'      / &
         BiometCTags(692)%Label   / 'biomet_99_aux1'          / &
         BiometCTags(693)%Label   / 'biomet_99_aux2'          / &
         BiometCTags(694)%Label   / 'biomet_100_variable'     / &
         BiometCTags(695)%Label   / 'biomet_100_id'           / &
         BiometCTags(696)%Label   / 'biomet_100_instrument'   / &
         BiometCTags(697)%Label   / 'biomet_100_unit_in'      / &
         BiometCTags(698)%Label   / 'biomet_100_unit_out'     / &
         BiometCTags(699)%Label   / 'biomet_100_aux1'         / &
         BiometCTags(700)%Label   / 'biomet_100_aux2'         /

    data BiometCTags(1001)%Label   / 'biomet_separator'       / &
         BiometCTags(1002)%Label   / 'biomet_data_label'      /

    data BiometNTags(1)%Label   / 'biomet_1_gain'          / &
         BiometNTags(2)%Label   / 'biomet_1_offset'        / &
         BiometNTags(3)%Label   / 'biomet_1_aux3'          / &
         BiometNTags(4)%Label   / 'biomet_1_aux4'          / &
         BiometNTags(5)%Label   / 'biomet_1_aux5'          / &
         BiometNTags(6)%Label   / 'biomet_1_aux6'          / &
         BiometNTags(7)%Label   / 'biomet_2_gain'          / &
         BiometNTags(8)%Label   / 'biomet_2_offset'        / &
         BiometNTags(9)%Label   / 'biomet_2_aux3'          / &
         BiometNTags(10)%Label  / 'biomet_2_aux4'          / &
         BiometNTags(11)%Label  / 'biomet_2_aux5'          / &
         BiometNTags(12)%Label  / 'biomet_2_aux6'          / &
         BiometNTags(13)%Label  / 'biomet_3_gain'          / &
         BiometNTags(14)%Label  / 'biomet_3_offset'        / &
         BiometNTags(15)%Label  / 'biomet_3_aux3'          / &
         BiometNTags(16)%Label  / 'biomet_3_aux4'          / &
         BiometNTags(17)%Label  / 'biomet_3_aux5'          / &
         BiometNTags(18)%Label  / 'biomet_3_aux6'          / &
         BiometNTags(19)%Label  / 'biomet_4_gain'          / &
         BiometNTags(20)%Label  / 'biomet_4_offset'        / &
         BiometNTags(21)%Label  / 'biomet_4_aux3'          / &
         BiometNTags(22)%Label  / 'biomet_4_aux4'          / &
         BiometNTags(23)%Label  / 'biomet_4_aux5'          / &
         BiometNTags(24)%Label  / 'biomet_4_aux6'          / &
         BiometNTags(25)%Label  / 'biomet_5_gain'          / &
         BiometNTags(26)%Label  / 'biomet_5_offset'        / &
         BiometNTags(27)%Label  / 'biomet_5_aux3'          / &
         BiometNTags(28)%Label  / 'biomet_5_aux4'          / &
         BiometNTags(29)%Label  / 'biomet_5_aux5'          / &
         BiometNTags(30)%Label  / 'biomet_5_aux6'          / &
         BiometNTags(31)%Label  / 'biomet_6_gain'          / &
         BiometNTags(32)%Label  / 'biomet_6_offset'        / &
         BiometNTags(33)%Label  / 'biomet_6_aux3'          / &
         BiometNTags(34)%Label  / 'biomet_6_aux4'          / &
         BiometNTags(35)%Label  / 'biomet_6_aux5'          / &
         BiometNTags(36)%Label  / 'biomet_6_aux6'          / &
         BiometNTags(37)%Label  / 'biomet_7_gain'          / &
         BiometNTags(38)%Label  / 'biomet_7_offset'        / &
         BiometNTags(39)%Label  / 'biomet_7_aux3'          / &
         BiometNTags(40)%Label  / 'biomet_7_aux4'          / &
         BiometNTags(41)%Label  / 'biomet_7_aux5'          / &
         BiometNTags(42)%Label  / 'biomet_7_aux6'          / &
         BiometNTags(43)%Label  / 'biomet_8_gain'          / &
         BiometNTags(44)%Label  / 'biomet_8_offset'        / &
         BiometNTags(45)%Label  / 'biomet_8_aux3'          / &
         BiometNTags(46)%Label  / 'biomet_8_aux4'          / &
         BiometNTags(47)%Label  / 'biomet_8_aux5'          / &
         BiometNTags(48)%Label  / 'biomet_8_aux6'          / &
         BiometNTags(49)%Label  / 'biomet_9_gain'          / &
         BiometNTags(50)%Label  / 'biomet_9_offset'        / &
         BiometNTags(51)%Label  / 'biomet_9_aux3'          / &
         BiometNTags(52)%Label  / 'biomet_9_aux4'          / &
         BiometNTags(53)%Label  / 'biomet_9_aux5'          / &
         BiometNTags(54)%Label  / 'biomet_9_aux6'          / &
         BiometNTags(55)%Label  / 'biomet_10_gain'          / &
         BiometNTags(56)%Label  / 'biomet_10_offset'        / &
         BiometNTags(57)%Label  / 'biomet_10_aux3'          / &
         BiometNTags(58)%Label  / 'biomet_10_aux4'          / &
         BiometNTags(59)%Label  / 'biomet_10_aux5'          / &
         BiometNTags(60)%Label  / 'biomet_10_aux6'          / &
         BiometNTags(61)%Label  / 'biomet_11_gain'          / &
         BiometNTags(62)%Label  / 'biomet_11_offset'        / &
         BiometNTags(63)%Label  / 'biomet_11_aux3'          / &
         BiometNTags(64)%Label  / 'biomet_11_aux4'          / &
         BiometNTags(65)%Label  / 'biomet_11_aux5'          / &
         BiometNTags(66)%Label  / 'biomet_11_aux6'          / &
         BiometNTags(67)%Label  / 'biomet_12_gain'          / &
         BiometNTags(68)%Label  / 'biomet_12_offset'        / &
         BiometNTags(69)%Label  / 'biomet_12_aux3'          / &
         BiometNTags(70)%Label  / 'biomet_12_aux4'          / &
         BiometNTags(71)%Label  / 'biomet_12_aux5'          / &
         BiometNTags(72)%Label  / 'biomet_12_aux6'          / &
         BiometNTags(73)%Label  / 'biomet_13_gain'          / &
         BiometNTags(74)%Label  / 'biomet_13_offset'        / &
         BiometNTags(75)%Label  / 'biomet_13_aux3'          / &
         BiometNTags(76)%Label  / 'biomet_13_aux4'          / &
         BiometNTags(77)%Label  / 'biomet_13_aux5'          / &
         BiometNTags(78)%Label  / 'biomet_13_aux6'          / &
         BiometNTags(79)%Label  / 'biomet_14_gain'          / &
         BiometNTags(80)%Label  / 'biomet_14_offset'        / &
         BiometNTags(81)%Label  / 'biomet_14_aux3'          / &
         BiometNTags(82)%Label  / 'biomet_14_aux4'          / &
         BiometNTags(83)%Label  / 'biomet_14_aux5'          / &
         BiometNTags(84)%Label  / 'biomet_14_aux6'          / &
         BiometNTags(85)%Label  / 'biomet_15_gain'          / &
         BiometNTags(86)%Label  / 'biomet_15_offset'        / &
         BiometNTags(87)%Label  / 'biomet_15_aux3'          / &
         BiometNTags(88)%Label  / 'biomet_15_aux4'          / &
         BiometNTags(89)%Label  / 'biomet_15_aux5'          / &
         BiometNTags(90)%Label  / 'biomet_15_aux6'          / &
         BiometNTags(91)%Label  / 'biomet_16_gain'          / &
         BiometNTags(92)%Label  / 'biomet_16_offset'        / &
         BiometNTags(93)%Label  / 'biomet_16_aux3'          / &
         BiometNTags(94)%Label  / 'biomet_16_aux4'          / &
         BiometNTags(95)%Label  / 'biomet_16_aux5'          / &
         BiometNTags(96)%Label  / 'biomet_16_aux6'          / &
         BiometNTags(97)%Label  / 'biomet_17_gain'          / &
         BiometNTags(98)%Label  / 'biomet_17_offset'        / &
         BiometNTags(99)%Label  / 'biomet_17_aux3'          / &
         BiometNTags(100)%Label  / 'biomet_17_aux4'          / &
         BiometNTags(101)%Label  / 'biomet_17_aux5'          / &
         BiometNTags(102)%Label  / 'biomet_17_aux6'          / &
         BiometNTags(103)%Label  / 'biomet_18_gain'          / &
         BiometNTags(104)%Label  / 'biomet_18_offset'        / &
         BiometNTags(105)%Label  / 'biomet_18_aux3'          / &
         BiometNTags(106)%Label  / 'biomet_18_aux4'          / &
         BiometNTags(107)%Label  / 'biomet_18_aux5'          / &
         BiometNTags(108)%Label  / 'biomet_18_aux6'          / &
         BiometNTags(109)%Label  / 'biomet_19_gain'          / &
         BiometNTags(110)%Label  / 'biomet_19_offset'        / &
         BiometNTags(111)%Label  / 'biomet_19_aux3'          / &
         BiometNTags(112)%Label  / 'biomet_19_aux4'          / &
         BiometNTags(113)%Label  / 'biomet_19_aux5'          / &
         BiometNTags(114)%Label  / 'biomet_19_aux6'          / &
         BiometNTags(115)%Label  / 'biomet_20_gain'          / &
         BiometNTags(116)%Label  / 'biomet_20_offset'        / &
         BiometNTags(117)%Label  / 'biomet_20_aux3'          / &
         BiometNTags(118)%Label  / 'biomet_20_aux4'          / &
         BiometNTags(119)%Label  / 'biomet_20_aux5'          / &
         BiometNTags(120)%Label  / 'biomet_20_aux6'          / &
         BiometNTags(121)%Label  / 'biomet_21_gain'          / &
         BiometNTags(122)%Label  / 'biomet_21_offset'        / &
         BiometNTags(123)%Label  / 'biomet_21_aux3'          / &
         BiometNTags(124)%Label  / 'biomet_21_aux4'          / &
         BiometNTags(125)%Label  / 'biomet_21_aux5'          / &
         BiometNTags(126)%Label  / 'biomet_21_aux6'          / &
         BiometNTags(127)%Label  / 'biomet_22_gain'          / &
         BiometNTags(128)%Label  / 'biomet_22_offset'        / &
         BiometNTags(129)%Label  / 'biomet_22_aux3'          / &
         BiometNTags(130)%Label  / 'biomet_22_aux4'          / &
         BiometNTags(131)%Label  / 'biomet_22_aux5'          / &
         BiometNTags(132)%Label  / 'biomet_22_aux6'          / &
         BiometNTags(133)%Label  / 'biomet_23_gain'          / &
         BiometNTags(134)%Label  / 'biomet_23_offset'        / &
         BiometNTags(135)%Label  / 'biomet_23_aux3'          / &
         BiometNTags(136)%Label  / 'biomet_23_aux4'          / &
         BiometNTags(137)%Label  / 'biomet_23_aux5'          / &
         BiometNTags(138)%Label  / 'biomet_23_aux6'          / &
         BiometNTags(139)%Label  / 'biomet_24_gain'          / &
         BiometNTags(140)%Label  / 'biomet_24_offset'        / &
         BiometNTags(141)%Label  / 'biomet_24_aux3'          / &
         BiometNTags(142)%Label  / 'biomet_24_aux4'          / &
         BiometNTags(143)%Label  / 'biomet_24_aux5'          / &
         BiometNTags(144)%Label  / 'biomet_24_aux6'          / &
         BiometNTags(145)%Label  / 'biomet_25_gain'          / &
         BiometNTags(146)%Label  / 'biomet_25_offset'        / &
         BiometNTags(147)%Label  / 'biomet_25_aux3'          / &
         BiometNTags(148)%Label  / 'biomet_25_aux4'          / &
         BiometNTags(149)%Label  / 'biomet_25_aux5'          / &
         BiometNTags(150)%Label  / 'biomet_25_aux6'          / &
         BiometNTags(151)%Label  / 'biomet_26_gain'          / &
         BiometNTags(152)%Label  / 'biomet_26_offset'        / &
         BiometNTags(153)%Label  / 'biomet_26_aux3'          / &
         BiometNTags(154)%Label  / 'biomet_26_aux4'          / &
         BiometNTags(155)%Label  / 'biomet_26_aux5'          / &
         BiometNTags(156)%Label  / 'biomet_26_aux6'          / &
         BiometNTags(157)%Label  / 'biomet_27_gain'          / &
         BiometNTags(158)%Label  / 'biomet_27_offset'        / &
         BiometNTags(159)%Label  / 'biomet_27_aux3'          / &
         BiometNTags(160)%Label  / 'biomet_27_aux4'          / &
         BiometNTags(161)%Label  / 'biomet_27_aux5'          / &
         BiometNTags(162)%Label  / 'biomet_27_aux6'          / &
         BiometNTags(163)%Label  / 'biomet_28_gain'          / &
         BiometNTags(164)%Label  / 'biomet_28_offset'        / &
         BiometNTags(165)%Label  / 'biomet_28_aux3'          / &
         BiometNTags(166)%Label  / 'biomet_28_aux4'          / &
         BiometNTags(167)%Label  / 'biomet_28_aux5'          / &
         BiometNTags(168)%Label  / 'biomet_28_aux6'          / &
         BiometNTags(169)%Label  / 'biomet_29_gain'          / &
         BiometNTags(170)%Label  / 'biomet_29_offset'        / &
         BiometNTags(171)%Label  / 'biomet_29_aux3'          / &
         BiometNTags(172)%Label  / 'biomet_29_aux4'          / &
         BiometNTags(173)%Label  / 'biomet_29_aux5'          / &
         BiometNTags(174)%Label  / 'biomet_29_aux6'          / &
         BiometNTags(175)%Label  / 'biomet_30_gain'          / &
         BiometNTags(176)%Label  / 'biomet_30_offset'        / &
         BiometNTags(177)%Label  / 'biomet_30_aux3'          / &
         BiometNTags(178)%Label  / 'biomet_30_aux4'          / &
         BiometNTags(179)%Label  / 'biomet_30_aux5'          / &
         BiometNTags(180)%Label  / 'biomet_30_aux6'          / &
         BiometNTags(181)%Label  / 'biomet_31_gain'          / &
         BiometNTags(182)%Label  / 'biomet_31_offset'        / &
         BiometNTags(183)%Label  / 'biomet_31_aux3'          / &
         BiometNTags(184)%Label  / 'biomet_31_aux4'          / &
         BiometNTags(185)%Label  / 'biomet_31_aux5'          / &
         BiometNTags(186)%Label  / 'biomet_31_aux6'          / &
         BiometNTags(187)%Label  / 'biomet_32_gain'          / &
         BiometNTags(188)%Label  / 'biomet_32_offset'        / &
         BiometNTags(189)%Label  / 'biomet_32_aux3'          / &
         BiometNTags(190)%Label  / 'biomet_32_aux4'          / &
         BiometNTags(191)%Label  / 'biomet_32_aux5'          / &
         BiometNTags(192)%Label  / 'biomet_32_aux6'          / &
         BiometNTags(193)%Label  / 'biomet_33_gain'          / &
         BiometNTags(194)%Label  / 'biomet_33_offset'        / &
         BiometNTags(195)%Label  / 'biomet_33_aux3'          / &
         BiometNTags(196)%Label  / 'biomet_33_aux4'          / &
         BiometNTags(197)%Label  / 'biomet_33_aux5'          / &
         BiometNTags(198)%Label  / 'biomet_33_aux6'          /

    data BiometNTags(199)%Label  / 'biomet_34_gain'          / &
         BiometNTags(200)%Label  / 'biomet_34_offset'        / &
         BiometNTags(201)%Label  / 'biomet_34_aux3'          / &
         BiometNTags(202)%Label  / 'biomet_34_aux4'          / &
         BiometNTags(203)%Label  / 'biomet_34_aux5'          / &
         BiometNTags(204)%Label  / 'biomet_34_aux6'          / &
         BiometNTags(205)%Label  / 'biomet_35_gain'          / &
         BiometNTags(206)%Label  / 'biomet_35_offset'        / &
         BiometNTags(207)%Label  / 'biomet_35_aux3'          / &
         BiometNTags(208)%Label  / 'biomet_35_aux4'          / &
         BiometNTags(209)%Label  / 'biomet_35_aux5'          / &
         BiometNTags(210)%Label  / 'biomet_35_aux6'          / &
         BiometNTags(211)%Label  / 'biomet_36_gain'          / &
         BiometNTags(212)%Label  / 'biomet_36_offset'        / &
         BiometNTags(213)%Label  / 'biomet_36_aux3'          / &
         BiometNTags(214)%Label  / 'biomet_36_aux4'          / &
         BiometNTags(215)%Label  / 'biomet_36_aux5'          / &
         BiometNTags(216)%Label  / 'biomet_36_aux6'          / &
         BiometNTags(217)%Label  / 'biomet_37_gain'          / &
         BiometNTags(218)%Label  / 'biomet_37_offset'        / &
         BiometNTags(219)%Label  / 'biomet_37_aux3'          / &
         BiometNTags(220)%Label  / 'biomet_37_aux4'          / &
         BiometNTags(221)%Label  / 'biomet_37_aux5'          / &
         BiometNTags(222)%Label  / 'biomet_37_aux6'          / &
         BiometNTags(223)%Label  / 'biomet_38_gain'          / &
         BiometNTags(224)%Label  / 'biomet_38_offset'        / &
         BiometNTags(225)%Label  / 'biomet_38_aux3'          / &
         BiometNTags(226)%Label  / 'biomet_38_aux4'          / &
         BiometNTags(227)%Label  / 'biomet_38_aux5'          / &
         BiometNTags(228)%Label  / 'biomet_38_aux6'          / &
         BiometNTags(229)%Label  / 'biomet_39_gain'          / &
         BiometNTags(230)%Label  / 'biomet_39_offset'        / &
         BiometNTags(231)%Label  / 'biomet_39_aux3'          / &
         BiometNTags(232)%Label  / 'biomet_39_aux4'          / &
         BiometNTags(233)%Label  / 'biomet_39_aux5'          / &
         BiometNTags(234)%Label  / 'biomet_39_aux6'          / &
         BiometNTags(235)%Label  / 'biomet_40_gain'          / &
         BiometNTags(236)%Label  / 'biomet_40_offset'        / &
         BiometNTags(237)%Label  / 'biomet_40_aux3'          / &
         BiometNTags(238)%Label  / 'biomet_40_aux4'          / &
         BiometNTags(239)%Label  / 'biomet_40_aux5'          / &
         BiometNTags(240)%Label  / 'biomet_40_aux6'          / &
         BiometNTags(241)%Label  / 'biomet_41_gain'          / &
         BiometNTags(242)%Label  / 'biomet_41_offset'        / &
         BiometNTags(243)%Label  / 'biomet_41_aux3'          / &
         BiometNTags(244)%Label  / 'biomet_41_aux4'          / &
         BiometNTags(245)%Label  / 'biomet_41_aux5'          / &
         BiometNTags(246)%Label  / 'biomet_41_aux6'          / &
         BiometNTags(247)%Label  / 'biomet_42_gain'          / &
         BiometNTags(248)%Label  / 'biomet_42_offset'        / &
         BiometNTags(249)%Label  / 'biomet_42_aux3'          / &
         BiometNTags(250)%Label  / 'biomet_42_aux4'          / &
         BiometNTags(251)%Label  / 'biomet_42_aux5'          / &
         BiometNTags(252)%Label  / 'biomet_42_aux6'          / &
         BiometNTags(253)%Label  / 'biomet_43_gain'          / &
         BiometNTags(254)%Label  / 'biomet_43_offset'        / &
         BiometNTags(255)%Label  / 'biomet_43_aux3'          / &
         BiometNTags(256)%Label  / 'biomet_43_aux4'          / &
         BiometNTags(257)%Label  / 'biomet_43_aux5'          / &
         BiometNTags(258)%Label  / 'biomet_43_aux6'          / &
         BiometNTags(259)%Label  / 'biomet_44_gain'          / &
         BiometNTags(260)%Label  / 'biomet_44_offset'        / &
         BiometNTags(261)%Label  / 'biomet_44_aux3'          / &
         BiometNTags(262)%Label  / 'biomet_44_aux4'          / &
         BiometNTags(263)%Label  / 'biomet_44_aux5'          / &
         BiometNTags(264)%Label  / 'biomet_44_aux6'          / &
         BiometNTags(265)%Label  / 'biomet_45_gain'          / &
         BiometNTags(266)%Label  / 'biomet_45_offset'        / &
         BiometNTags(267)%Label  / 'biomet_45_aux3'          / &
         BiometNTags(268)%Label  / 'biomet_45_aux4'          / &
         BiometNTags(269)%Label  / 'biomet_45_aux5'          / &
         BiometNTags(270)%Label  / 'biomet_45_aux6'          / &
         BiometNTags(271)%Label  / 'biomet_46_gain'          / &
         BiometNTags(272)%Label  / 'biomet_46_offset'        / &
         BiometNTags(273)%Label  / 'biomet_46_aux3'          / &
         BiometNTags(274)%Label  / 'biomet_46_aux4'          / &
         BiometNTags(275)%Label  / 'biomet_46_aux5'          / &
         BiometNTags(276)%Label  / 'biomet_46_aux6'          / &
         BiometNTags(277)%Label  / 'biomet_47_gain'          / &
         BiometNTags(278)%Label  / 'biomet_47_offset'        / &
         BiometNTags(279)%Label  / 'biomet_47_aux3'          / &
         BiometNTags(280)%Label  / 'biomet_47_aux4'          / &
         BiometNTags(281)%Label  / 'biomet_47_aux5'          / &
         BiometNTags(282)%Label  / 'biomet_47_aux6'          / &
         BiometNTags(283)%Label  / 'biomet_48_gain'          / &
         BiometNTags(284)%Label  / 'biomet_48_offset'        / &
         BiometNTags(285)%Label  / 'biomet_48_aux3'          / &
         BiometNTags(286)%Label  / 'biomet_48_aux4'          / &
         BiometNTags(287)%Label  / 'biomet_48_aux5'          / &
         BiometNTags(288)%Label  / 'biomet_48_aux6'          / &
         BiometNTags(289)%Label  / 'biomet_49_gain'          / &
         BiometNTags(290)%Label  / 'biomet_49_offset'        / &
         BiometNTags(291)%Label  / 'biomet_49_aux3'          / &
         BiometNTags(292)%Label  / 'biomet_49_aux4'          / &
         BiometNTags(293)%Label  / 'biomet_49_aux5'          / &
         BiometNTags(294)%Label  / 'biomet_49_aux6'          / &
         BiometNTags(295)%Label  / 'biomet_50_gain'          / &
         BiometNTags(296)%Label  / 'biomet_50_offset'        / &
         BiometNTags(297)%Label  / 'biomet_50_aux3'          / &
         BiometNTags(298)%Label  / 'biomet_50_aux4'          / &
         BiometNTags(299)%Label  / 'biomet_50_aux5'          / &
         BiometNTags(300)%Label  / 'biomet_50_aux6'          / &
         BiometNTags(301)%Label  / 'biomet_51_gain'          / &
         BiometNTags(302)%Label  / 'biomet_51_offset'        / &
         BiometNTags(303)%Label  / 'biomet_51_aux3'          / &
         BiometNTags(304)%Label  / 'biomet_51_aux4'          / &
         BiometNTags(305)%Label  / 'biomet_51_aux5'          / &
         BiometNTags(306)%Label  / 'biomet_51_aux6'          / &
         BiometNTags(307)%Label  / 'biomet_52_gain'          / &
         BiometNTags(308)%Label  / 'biomet_52_offset'        / &
         BiometNTags(309)%Label  / 'biomet_52_aux3'          / &
         BiometNTags(310)%Label  / 'biomet_52_aux4'          / &
         BiometNTags(311)%Label  / 'biomet_52_aux5'          / &
         BiometNTags(312)%Label  / 'biomet_52_aux6'          / &
         BiometNTags(313)%Label  / 'biomet_53_gain'          / &
         BiometNTags(314)%Label  / 'biomet_53_offset'        / &
         BiometNTags(315)%Label  / 'biomet_53_aux3'          / &
         BiometNTags(316)%Label  / 'biomet_53_aux4'          / &
         BiometNTags(317)%Label  / 'biomet_53_aux5'          / &
         BiometNTags(318)%Label  / 'biomet_53_aux6'          / &
         BiometNTags(319)%Label  / 'biomet_54_gain'          / &
         BiometNTags(320)%Label  / 'biomet_54_offset'        / &
         BiometNTags(321)%Label  / 'biomet_54_aux3'          / &
         BiometNTags(322)%Label  / 'biomet_54_aux4'          / &
         BiometNTags(323)%Label  / 'biomet_54_aux5'          / &
         BiometNTags(324)%Label  / 'biomet_54_aux6'          / &
         BiometNTags(325)%Label  / 'biomet_55_gain'          / &
         BiometNTags(326)%Label  / 'biomet_55_offset'        / &
         BiometNTags(327)%Label  / 'biomet_55_aux3'          / &
         BiometNTags(328)%Label  / 'biomet_55_aux4'          / &
         BiometNTags(329)%Label  / 'biomet_55_aux5'          / &
         BiometNTags(330)%Label  / 'biomet_55_aux6'          / &
         BiometNTags(331)%Label  / 'biomet_56_gain'          / &
         BiometNTags(332)%Label  / 'biomet_56_offset'        / &
         BiometNTags(333)%Label  / 'biomet_56_aux3'          / &
         BiometNTags(334)%Label  / 'biomet_56_aux4'          / &
         BiometNTags(335)%Label  / 'biomet_56_aux5'          / &
         BiometNTags(336)%Label  / 'biomet_56_aux6'          / &
         BiometNTags(337)%Label  / 'biomet_57_gain'          / &
         BiometNTags(338)%Label  / 'biomet_57_offset'        / &
         BiometNTags(339)%Label  / 'biomet_57_aux3'          / &
         BiometNTags(340)%Label  / 'biomet_57_aux4'          / &
         BiometNTags(341)%Label  / 'biomet_57_aux5'          / &
         BiometNTags(342)%Label  / 'biomet_57_aux6'          / &
         BiometNTags(343)%Label  / 'biomet_58_gain'          / &
         BiometNTags(344)%Label  / 'biomet_58_offset'        / &
         BiometNTags(345)%Label  / 'biomet_58_aux3'          / &
         BiometNTags(346)%Label  / 'biomet_58_aux4'          / &
         BiometNTags(347)%Label  / 'biomet_58_aux5'          / &
         BiometNTags(348)%Label  / 'biomet_58_aux6'          / &
         BiometNTags(349)%Label  / 'biomet_59_gain'          / &
         BiometNTags(350)%Label  / 'biomet_59_offset'        / &
         BiometNTags(351)%Label  / 'biomet_59_aux3'          / &
         BiometNTags(352)%Label  / 'biomet_59_aux4'          / &
         BiometNTags(353)%Label  / 'biomet_59_aux5'          / &
         BiometNTags(354)%Label  / 'biomet_59_aux6'          / &
         BiometNTags(355)%Label  / 'biomet_60_gain'          / &
         BiometNTags(356)%Label  / 'biomet_60_offset'        / &
         BiometNTags(357)%Label  / 'biomet_60_aux3'          / &
         BiometNTags(358)%Label  / 'biomet_60_aux4'          / &
         BiometNTags(359)%Label  / 'biomet_60_aux5'          / &
         BiometNTags(360)%Label  / 'biomet_60_aux6'          / &
         BiometNTags(361)%Label  / 'biomet_61_gain'          / &
         BiometNTags(362)%Label  / 'biomet_61_offset'        / &
         BiometNTags(363)%Label  / 'biomet_61_aux3'          / &
         BiometNTags(364)%Label  / 'biomet_61_aux4'          / &
         BiometNTags(365)%Label  / 'biomet_61_aux5'          / &
         BiometNTags(366)%Label  / 'biomet_61_aux6'          / &
         BiometNTags(367)%Label  / 'biomet_62_gain'          / &
         BiometNTags(368)%Label  / 'biomet_62_offset'        / &
         BiometNTags(369)%Label  / 'biomet_62_aux3'          / &
         BiometNTags(370)%Label  / 'biomet_62_aux4'          / &
         BiometNTags(371)%Label  / 'biomet_62_aux5'          / &
         BiometNTags(372)%Label  / 'biomet_62_aux6'          / &
         BiometNTags(373)%Label  / 'biomet_63_gain'          / &
         BiometNTags(374)%Label  / 'biomet_63_offset'        / &
         BiometNTags(375)%Label  / 'biomet_63_aux3'          / &
         BiometNTags(376)%Label  / 'biomet_63_aux4'          / &
         BiometNTags(377)%Label  / 'biomet_63_aux5'          / &
         BiometNTags(378)%Label  / 'biomet_63_aux6'          / &
         BiometNTags(379)%Label  / 'biomet_64_gain'          / &
         BiometNTags(380)%Label  / 'biomet_64_offset'        / &
         BiometNTags(381)%Label  / 'biomet_64_aux3'          / &
         BiometNTags(382)%Label  / 'biomet_64_aux4'          / &
         BiometNTags(383)%Label  / 'biomet_64_aux5'          / &
         BiometNTags(384)%Label  / 'biomet_64_aux6'          / &
         BiometNTags(385)%Label  / 'biomet_65_gain'          / &
         BiometNTags(386)%Label  / 'biomet_65_offset'        / &
         BiometNTags(387)%Label  / 'biomet_65_aux3'          / &
         BiometNTags(388)%Label  / 'biomet_65_aux4'          / &
         BiometNTags(389)%Label  / 'biomet_65_aux5'          / &
         BiometNTags(390)%Label  / 'biomet_65_aux6'          / &
         BiometNTags(391)%Label  / 'biomet_66_gain'          / &
         BiometNTags(392)%Label  / 'biomet_66_offset'        / &
         BiometNTags(393)%Label  / 'biomet_66_aux3'          / &
         BiometNTags(394)%Label  / 'biomet_66_aux4'          / &
         BiometNTags(395)%Label  / 'biomet_66_aux5'          / &
         BiometNTags(396)%Label  / 'biomet_66_aux6'          / &
         BiometNTags(397)%Label  / 'biomet_67_gain'          / &
         BiometNTags(398)%Label  / 'biomet_67_offset'        / &
         BiometNTags(399)%Label  / 'biomet_67_aux3'          / &
         BiometNTags(400)%Label  / 'biomet_67_aux4'          / &
         BiometNTags(401)%Label  / 'biomet_67_aux5'          / &
         BiometNTags(402)%Label  / 'biomet_67_aux6'          /

    data BiometNTags(403)%Label  / 'biomet_68_gain'          / &
         BiometNTags(404)%Label  / 'biomet_68_offset'        / &
         BiometNTags(405)%Label  / 'biomet_68_aux3'          / &
         BiometNTags(406)%Label  / 'biomet_68_aux4'          / &
         BiometNTags(407)%Label  / 'biomet_68_aux5'          / &
         BiometNTags(408)%Label  / 'biomet_68_aux6'          / &
         BiometNTags(409)%Label  / 'biomet_69_gain'          / &
         BiometNTags(410)%Label  / 'biomet_69_offset'        / &
         BiometNTags(411)%Label  / 'biomet_69_aux3'          / &
         BiometNTags(412)%Label  / 'biomet_69_aux4'          / &
         BiometNTags(413)%Label  / 'biomet_69_aux5'          / &
         BiometNTags(414)%Label  / 'biomet_69_aux6'          / &
         BiometNTags(415)%Label  / 'biomet_70_gain'          / &
         BiometNTags(416)%Label  / 'biomet_70_offset'        / &
         BiometNTags(417)%Label  / 'biomet_70_aux3'          / &
         BiometNTags(418)%Label  / 'biomet_70_aux4'          / &
         BiometNTags(419)%Label  / 'biomet_70_aux5'          / &
         BiometNTags(420)%Label  / 'biomet_70_aux6'          / &
         BiometNTags(421)%Label  / 'biomet_71_gain'          / &
         BiometNTags(422)%Label  / 'biomet_71_offset'        / &
         BiometNTags(423)%Label  / 'biomet_71_aux3'          / &
         BiometNTags(424)%Label  / 'biomet_71_aux4'          / &
         BiometNTags(425)%Label  / 'biomet_71_aux5'          / &
         BiometNTags(426)%Label  / 'biomet_71_aux6'          / &
         BiometNTags(427)%Label  / 'biomet_72_gain'          / &
         BiometNTags(428)%Label  / 'biomet_72_offset'        / &
         BiometNTags(429)%Label  / 'biomet_72_aux3'          / &
         BiometNTags(430)%Label  / 'biomet_72_aux4'          / &
         BiometNTags(431)%Label  / 'biomet_72_aux5'          / &
         BiometNTags(432)%Label  / 'biomet_72_aux6'          / &
         BiometNTags(433)%Label  / 'biomet_73_gain'          / &
         BiometNTags(434)%Label  / 'biomet_73_offset'        / &
         BiometNTags(435)%Label  / 'biomet_73_aux3'          / &
         BiometNTags(436)%Label  / 'biomet_73_aux4'          / &
         BiometNTags(437)%Label  / 'biomet_73_aux5'          / &
         BiometNTags(438)%Label  / 'biomet_73_aux6'          / &
         BiometNTags(439)%Label  / 'biomet_74_gain'          / &
         BiometNTags(440)%Label  / 'biomet_74_offset'        / &
         BiometNTags(441)%Label  / 'biomet_74_aux3'          / &
         BiometNTags(442)%Label  / 'biomet_74_aux4'          / &
         BiometNTags(443)%Label  / 'biomet_74_aux5'          / &
         BiometNTags(444)%Label  / 'biomet_74_aux6'          / &
         BiometNTags(445)%Label  / 'biomet_75_gain'          / &
         BiometNTags(446)%Label  / 'biomet_75_offset'        / &
         BiometNTags(447)%Label  / 'biomet_75_aux3'          / &
         BiometNTags(448)%Label  / 'biomet_75_aux4'          / &
         BiometNTags(449)%Label  / 'biomet_75_aux5'          / &
         BiometNTags(450)%Label  / 'biomet_75_aux6'          / &
         BiometNTags(451)%Label  / 'biomet_76_gain'          / &
         BiometNTags(452)%Label  / 'biomet_76_offset'        / &
         BiometNTags(453)%Label  / 'biomet_76_aux3'          / &
         BiometNTags(454)%Label  / 'biomet_76_aux4'          / &
         BiometNTags(455)%Label  / 'biomet_76_aux5'          / &
         BiometNTags(456)%Label  / 'biomet_76_aux6'          / &
         BiometNTags(457)%Label  / 'biomet_77_gain'          / &
         BiometNTags(458)%Label  / 'biomet_77_offset'        / &
         BiometNTags(459)%Label  / 'biomet_77_aux3'          / &
         BiometNTags(460)%Label  / 'biomet_77_aux4'          / &
         BiometNTags(461)%Label  / 'biomet_77_aux5'          / &
         BiometNTags(462)%Label  / 'biomet_77_aux6'          / &
         BiometNTags(463)%Label  / 'biomet_78_gain'          / &
         BiometNTags(464)%Label  / 'biomet_78_offset'        / &
         BiometNTags(465)%Label  / 'biomet_78_aux3'          / &
         BiometNTags(466)%Label  / 'biomet_78_aux4'          / &
         BiometNTags(467)%Label  / 'biomet_78_aux5'          / &
         BiometNTags(468)%Label  / 'biomet_78_aux6'          / &
         BiometNTags(469)%Label  / 'biomet_79_gain'          / &
         BiometNTags(470)%Label  / 'biomet_79_offset'        / &
         BiometNTags(471)%Label  / 'biomet_79_aux3'          / &
         BiometNTags(472)%Label  / 'biomet_79_aux4'          / &
         BiometNTags(473)%Label  / 'biomet_79_aux5'          / &
         BiometNTags(474)%Label  / 'biomet_79_aux6'          / &
         BiometNTags(475)%Label  / 'biomet_80_gain'          / &
         BiometNTags(476)%Label  / 'biomet_80_offset'        / &
         BiometNTags(477)%Label  / 'biomet_80_aux3'          / &
         BiometNTags(478)%Label  / 'biomet_80_aux4'          / &
         BiometNTags(479)%Label  / 'biomet_80_aux5'          / &
         BiometNTags(480)%Label  / 'biomet_80_aux6'          / &
         BiometNTags(481)%Label  / 'biomet_81_gain'          / &
         BiometNTags(482)%Label  / 'biomet_81_offset'        / &
         BiometNTags(483)%Label  / 'biomet_81_aux3'          / &
         BiometNTags(484)%Label  / 'biomet_81_aux4'          / &
         BiometNTags(485)%Label  / 'biomet_81_aux5'          / &
         BiometNTags(486)%Label  / 'biomet_81_aux6'          / &
         BiometNTags(487)%Label  / 'biomet_82_gain'          / &
         BiometNTags(488)%Label  / 'biomet_82_offset'        / &
         BiometNTags(489)%Label  / 'biomet_82_aux3'          / &
         BiometNTags(490)%Label  / 'biomet_82_aux4'          / &
         BiometNTags(491)%Label  / 'biomet_82_aux5'          / &
         BiometNTags(492)%Label  / 'biomet_82_aux6'          / &
         BiometNTags(493)%Label  / 'biomet_83_gain'          / &
         BiometNTags(494)%Label  / 'biomet_83_offset'        / &
         BiometNTags(495)%Label  / 'biomet_83_aux3'          / &
         BiometNTags(496)%Label  / 'biomet_83_aux4'          / &
         BiometNTags(497)%Label  / 'biomet_83_aux5'          / &
         BiometNTags(498)%Label  / 'biomet_83_aux6'          / &
         BiometNTags(499)%Label  / 'biomet_84_gain'          / &
         BiometNTags(500)%Label  / 'biomet_84_offset'        / &
         BiometNTags(501)%Label  / 'biomet_84_aux3'          / &
         BiometNTags(502)%Label  / 'biomet_84_aux4'          / &
         BiometNTags(503)%Label  / 'biomet_84_aux5'          / &
         BiometNTags(504)%Label  / 'biomet_84_aux6'          / &
         BiometNTags(505)%Label  / 'biomet_85_gain'          / &
         BiometNTags(506)%Label  / 'biomet_85_offset'        / &
         BiometNTags(507)%Label  / 'biomet_85_aux3'          / &
         BiometNTags(508)%Label  / 'biomet_85_aux4'          / &
         BiometNTags(509)%Label  / 'biomet_85_aux5'          / &
         BiometNTags(510)%Label  / 'biomet_85_aux6'          / &
         BiometNTags(511)%Label  / 'biomet_86_gain'          / &
         BiometNTags(512)%Label  / 'biomet_86_offset'        / &
         BiometNTags(513)%Label  / 'biomet_86_aux3'          / &
         BiometNTags(514)%Label  / 'biomet_86_aux4'          / &
         BiometNTags(515)%Label  / 'biomet_86_aux5'          / &
         BiometNTags(516)%Label  / 'biomet_86_aux6'          / &
         BiometNTags(517)%Label  / 'biomet_87_gain'          / &
         BiometNTags(518)%Label  / 'biomet_87_offset'        / &
         BiometNTags(519)%Label  / 'biomet_87_aux3'          / &
         BiometNTags(520)%Label  / 'biomet_87_aux4'          / &
         BiometNTags(521)%Label  / 'biomet_87_aux5'          / &
         BiometNTags(522)%Label  / 'biomet_87_aux6'          / &
         BiometNTags(523)%Label  / 'biomet_88_gain'          / &
         BiometNTags(524)%Label  / 'biomet_88_offset'        / &
         BiometNTags(525)%Label  / 'biomet_88_aux3'          / &
         BiometNTags(526)%Label  / 'biomet_88_aux4'          / &
         BiometNTags(527)%Label  / 'biomet_88_aux5'          / &
         BiometNTags(528)%Label  / 'biomet_88_aux6'          / &
         BiometNTags(529)%Label  / 'biomet_89_gain'          / &
         BiometNTags(530)%Label  / 'biomet_89_offset'        / &
         BiometNTags(531)%Label  / 'biomet_89_aux3'          / &
         BiometNTags(532)%Label  / 'biomet_89_aux4'          / &
         BiometNTags(533)%Label  / 'biomet_89_aux5'          / &
         BiometNTags(534)%Label  / 'biomet_89_aux6'          / &
         BiometNTags(535)%Label  / 'biomet_90_gain'          / &
         BiometNTags(536)%Label  / 'biomet_90_offset'        / &
         BiometNTags(537)%Label  / 'biomet_90_aux3'          / &
         BiometNTags(538)%Label  / 'biomet_90_aux4'          / &
         BiometNTags(539)%Label  / 'biomet_90_aux5'          / &
         BiometNTags(540)%Label  / 'biomet_90_aux6'          / &
         BiometNTags(541)%Label  / 'biomet_91_gain'          / &
         BiometNTags(542)%Label  / 'biomet_91_offset'        / &
         BiometNTags(543)%Label  / 'biomet_91_aux3'          / &
         BiometNTags(544)%Label  / 'biomet_91_aux4'          / &
         BiometNTags(545)%Label  / 'biomet_91_aux5'          / &
         BiometNTags(546)%Label  / 'biomet_91_aux6'          / &
         BiometNTags(547)%Label  / 'biomet_92_gain'          / &
         BiometNTags(548)%Label  / 'biomet_92_offset'        / &
         BiometNTags(549)%Label  / 'biomet_92_aux3'          / &
         BiometNTags(550)%Label  / 'biomet_92_aux4'          / &
         BiometNTags(551)%Label  / 'biomet_92_aux5'          / &
         BiometNTags(552)%Label  / 'biomet_92_aux6'          / &
         BiometNTags(553)%Label  / 'biomet_93_gain'          / &
         BiometNTags(554)%Label  / 'biomet_93_offset'        / &
         BiometNTags(555)%Label  / 'biomet_93_aux3'          / &
         BiometNTags(556)%Label  / 'biomet_93_aux4'          / &
         BiometNTags(557)%Label  / 'biomet_93_aux5'          / &
         BiometNTags(558)%Label  / 'biomet_93_aux6'          / &
         BiometNTags(559)%Label  / 'biomet_94_gain'          / &
         BiometNTags(560)%Label  / 'biomet_94_offset'        / &
         BiometNTags(561)%Label  / 'biomet_94_aux3'          / &
         BiometNTags(562)%Label  / 'biomet_94_aux4'          / &
         BiometNTags(563)%Label  / 'biomet_94_aux5'          / &
         BiometNTags(564)%Label  / 'biomet_94_aux6'          / &
         BiometNTags(565)%Label  / 'biomet_95_gain'          / &
         BiometNTags(566)%Label  / 'biomet_95_offset'        / &
         BiometNTags(567)%Label  / 'biomet_95_aux3'          / &
         BiometNTags(568)%Label  / 'biomet_95_aux4'          / &
         BiometNTags(569)%Label  / 'biomet_95_aux5'          / &
         BiometNTags(570)%Label  / 'biomet_95_aux6'          / &
         BiometNTags(571)%Label  / 'biomet_96_gain'          / &
         BiometNTags(572)%Label  / 'biomet_96_offset'        / &
         BiometNTags(573)%Label  / 'biomet_96_aux3'          / &
         BiometNTags(574)%Label  / 'biomet_96_aux4'          / &
         BiometNTags(575)%Label  / 'biomet_96_aux5'          / &
         BiometNTags(576)%Label  / 'biomet_96_aux6'          / &
         BiometNTags(577)%Label  / 'biomet_97_gain'          / &
         BiometNTags(578)%Label  / 'biomet_97_offset'        / &
         BiometNTags(579)%Label  / 'biomet_97_aux3'          / &
         BiometNTags(580)%Label  / 'biomet_97_aux4'          / &
         BiometNTags(581)%Label  / 'biomet_97_aux5'          / &
         BiometNTags(582)%Label  / 'biomet_97_aux6'          / &
         BiometNTags(583)%Label  / 'biomet_98_gain'          / &
         BiometNTags(584)%Label  / 'biomet_98_offset'        / &
         BiometNTags(585)%Label  / 'biomet_98_aux3'          / &
         BiometNTags(586)%Label  / 'biomet_98_aux4'          / &
         BiometNTags(587)%Label  / 'biomet_98_aux5'          / &
         BiometNTags(588)%Label  / 'biomet_98_aux6'          / &
         BiometNTags(589)%Label  / 'biomet_99_gain'          / &
         BiometNTags(590)%Label  / 'biomet_99_offset'        / &
         BiometNTags(591)%Label  / 'biomet_99_aux3'          / &
         BiometNTags(592)%Label  / 'biomet_99_aux4'          / &
         BiometNTags(593)%Label  / 'biomet_99_aux5'          / &
         BiometNTags(594)%Label  / 'biomet_99_aux6'          / &
         BiometNTags(595)%Label  / 'biomet_100_gain'         / &
         BiometNTags(596)%Label  / 'biomet_100_offset'       / &
         BiometNTags(597)%Label  / 'biomet_100_aux3'         / &
         BiometNTags(598)%Label  / 'biomet_100_aux4'         / &
         BiometNTags(599)%Label  / 'biomet_100_aux5'         / &
         BiometNTags(600)%Label  / 'biomet_100_aux6'         /

    data BiometNTags(1001)%Label  / 'biomet_header_rows'     / &
         BiometNTags(1002)%Label  / 'biomet_file_duration'   / &
         BiometNTags(1003)%Label  / 'biomet_data_rate'       /

    !> tags of the [Project] group of processing.eddypro file
    integer, parameter :: Npn = 18
    integer, parameter :: Npc = 42
    logical :: EPPrjNTagFound(Npn)
    logical :: EPPrjCTagFound(Npc)
    type (Numerical) :: EPPrjNTags(Npn)
    type (Text) :: EPPrjCTags(Npc)
    data EPPrjNTags(1)%Label / 'binary_nbytes'    / &
         EPPrjNTags(2)%Label / 'binary_hnlines'   / &
         EPPrjNTags(3)%Label / 'col_ts'           / &
         EPPrjNTags(4)%Label / 'col_co2'          / &
         EPPrjNTags(5)%Label / 'col_h2o'          / &
         EPPrjNTags(6)%Label / 'col_ch4'          / &
         EPPrjNTags(7)%Label / 'col_n2o'          / &
         EPPrjNTags(8)%Label / 'col_cell_t'       / &
         EPPrjNTags(9)%Label / 'col_int_t_1'      / &
         EPPrjNTags(10)%Label / 'col_int_t_2'     / &
         EPPrjNTags(11)%Label / 'col_int_p'       / &
         EPPrjNTags(12)%Label / 'col_air_t'       / &
         EPPrjNTags(13)%Label / 'col_air_p'       / &
         EPPrjNTags(14)%Label / 'col_diag_72'     / &
         EPPrjNTags(15)%Label / 'col_diag_75'     / &
         EPPrjNTags(16)%Label / 'col_diag_77'     / &
         EPPrjNTags(17)%Label / 'gas_diff'        / &
         EPPrjNTags(18)%Label / 'gas_mw'          /

    data EPPrjCTags(1)%Label / 'sw_version'       / &
         EPPrjCTags(2)%Label / 'ini_version'      / &
         EPPrjCTags(3)%Label / 'file_name'        / &
         EPPrjCTags(4)%Label / 'project_title'    / &
         EPPrjCTags(5)%Label / 'project_id'       / &
         EPPrjCTags(6)%Label / 'file_type'        / &
         EPPrjCTags(7)%Label / 'file_prototype'   / &
         EPPrjCTags(8)%Label / 'cfg_file'         / &
         EPPrjCTags(9)%Label / 'use_pfile'        / &
         EPPrjCTags(10)%Label / 'proj_file'       / &
         EPPrjCTags(11)%Label / 'use_dyn_md_file' / &
         EPPrjCTags(12)%Label / 'dyn_metadata_file' / &
         EPPrjCTags(13)%Label / 'binary_eol'        / &
         EPPrjCTags(14)%Label / 'binary_little_end' / &
         EPPrjCTags(15)%Label / 'master_sonic'      / &
         EPPrjCTags(16)%Label / 'run_mode'          / &
         EPPrjCTags(17)%Label / 'use_biom'          / &
         EPPrjCTags(18)%Label / 'biom_file'         / &
         EPPrjCTags(19)%Label / 'out_ghg_eu'       / &
         EPPrjCTags(20)%Label / 'out_amflux'       / &
         EPPrjCTags(21)%Label / 'out_rich'         / &
         EPPrjCTags(22)%Label / 'lf_meth'          / &
         EPPrjCTags(23)%Label / 'hf_meth'          / &
         EPPrjCTags(24)%Label / 'make_dataset'     / &
         EPPrjCTags(25)%Label / 'pr_start_date'    / &
         EPPrjCTags(26)%Label / 'pr_start_time'    / &
         EPPrjCTags(27)%Label / 'pr_end_date'      / &
         EPPrjCTags(28)%Label / 'pr_end_time'      / &
         EPPrjCTags(29)%Label / 'biom_dir'         / &
         EPPrjCTags(30)%Label / 'biom_ext'         / &
         EPPrjCTags(31)%Label / 'biom_rec'         / &
         EPPrjCTags(32)%Label / 'tob1_format'      / &
         EPPrjCTags(33)%Label / 'wpl_meth'         / &
         EPPrjCTags(34)%Label / 'foot_meth'        / &
         EPPrjCTags(35)%Label / 'out_path'         / &
         EPPrjCTags(36)%Label / 'err_label'        / &
         EPPrjCTags(37)%Label / 'fix_out_format'   / &
         EPPrjCTags(38)%Label / 'qc_meth'          / &
         EPPrjCTags(39)%Label / 'out_metadata'     / &
         EPPrjCTags(40)%Label / 'pr_subset'        / &
         EPPrjCTags(41)%Label / 'out_mean_cosp'    / &
         EPPrjCTags(42)%Label / 'out_biomet'       /

    !> tags of the metadata file created by GHG software
    integer, parameter :: Nan = 884
    integer, parameter :: Nac = 765
    logical :: ANTagFound(Nan)
    logical :: ACTagFound(Nac)
    type (Numerical) :: ANTags(Nan)
    type (Text) :: ACTags(Nac)

    data ANTags(1)%Label   / 'altitude' / &
         ANTags(2)%Label   / 'latitude' / &
         ANTags(3)%Label   / 'longitude' / &
         ANTags(4)%Label   / 'canopy_height' / &
         ANTags(5)%Label   / 'displacement_height' / &
         ANTags(6)%Label   / 'roughness_length' / &
         ANTags(7)%Label   / 'acquisition_frequency' / &
         ANTags(8)%Label   / 'file_duration' / &
         ANTags(9)%Label   / 'header_rows' / &
         ANTags(10)%Label  / 'instr_1_height' / &
         ANTags(11)%Label  / 'instr_1_north_offset' / &
         ANTags(12)%Label  / 'instr_1_northward_separation' / &
         ANTags(13)%Label  / 'instr_1_eastward_separation' / &
         ANTags(14)%Label  / 'instr_1_vertical_separation' / &
         ANTags(15)%Label  / 'instr_1_tube_diameter' / &
         ANTags(16)%Label  / 'instr_1_tube_length' / &
         ANTags(17)%Label  / 'instr_1_tube_flowrate' / &
         ANTags(18)%Label  / 'instr_1_hpath_length' / &
         ANTags(19)%Label  / 'instr_1_vpath_length' / &
         ANTags(20)%Label  / 'instr_1_tau' / &
         ANTags(21)%Label  / 'instr_1_kw' / &
         ANTags(22)%Label  / 'instr_1_ko' / &
         ANTags(23)%Label  / 'instr_1_void1' / &
         ANTags(24)%Label  / 'instr_1_void2' / &
         ANTags(25)%Label  / 'instr_2_height' / &
         ANTags(26)%Label  / 'instr_2_north_offset' / &
         ANTags(27)%Label  / 'instr_2_northward_separation' / &
         ANTags(28)%Label  / 'instr_2_eastward_separation' / &
         ANTags(29)%Label  / 'instr_2_vertical_separation' / &
         ANTags(30)%Label  / 'instr_2_tube_diameter' / &
         ANTags(31)%Label  / 'instr_2_tube_length' / &
         ANTags(32)%Label  / 'instr_2_tube_flowrate' / &
         ANTags(33)%Label  / 'instr_2_hpath_length' / &
         ANTags(34)%Label  / 'instr_2_vpath_length' / &
         ANTags(35)%Label  / 'instr_2_tau' / &
         ANTags(36)%Label  / 'instr_2_kw' / &
         ANTags(37)%Label  / 'instr_2_ko' / &
         ANTags(38)%Label  / 'instr_2_void1' / &
         ANTags(39)%Label  / 'instr_2_void2' / &
         ANTags(40)%Label  / 'instr_3_height' / &
         ANTags(41)%Label  / 'instr_3_north_offset' / &
         ANTags(42)%Label  / 'instr_3_northward_separation' / &
         ANTags(43)%Label  / 'instr_3_eastward_separation' / &
         ANTags(44)%Label  / 'instr_3_vertical_separation' / &
         ANTags(45)%Label  / 'instr_3_tube_diameter' / &
         ANTags(46)%Label  / 'instr_3_tube_length' / &
         ANTags(47)%Label  / 'instr_3_tube_flowrate' / &
         ANTags(48)%Label  / 'instr_3_hpath_length' / &
         ANTags(49)%Label  / 'instr_3_vpath_length' / &
         ANTags(50)%Label  / 'instr_3_tau' / &
         ANTags(51)%Label  / 'instr_3_kw' / &
         ANTags(52)%Label  / 'instr_3_ko' / &
         ANTags(53)%Label  / 'instr_3_void1' / &
         ANTags(54)%Label  / 'instr_3_void2' / &
         ANTags(55)%Label  / 'instr_4_height' / &
         ANTags(56)%Label  / 'instr_4_north_offset' / &
         ANTags(57)%Label  / 'instr_4_northward_separation' / &
         ANTags(58)%Label  / 'instr_4_eastward_separation' / &
         ANTags(59)%Label  / 'instr_4_vertical_separation' / &
         ANTags(60)%Label  / 'instr_4_tube_diameter' / &
         ANTags(61)%Label  / 'instr_4_tube_length' / &
         ANTags(62)%Label  / 'instr_4_tube_flowrate' / &
         ANTags(63)%Label  / 'instr_4_hpath_length' / &
         ANTags(64)%Label  / 'instr_4_vpath_length' / &
         ANTags(65)%Label  / 'instr_4_tau' / &
         ANTags(66)%Label  / 'instr_4_kw' / &
         ANTags(67)%Label  / 'instr_4_ko' / &
         ANTags(68)%Label  / 'instr_4_void1' / &
         ANTags(69)%Label  / 'instr_4_void2' / &
         ANTags(70)%Label  / 'instr_5_height' / &
         ANTags(71)%Label  / 'instr_5_north_offset' / &
         ANTags(72)%Label  / 'instr_5_northward_separation' / &
         ANTags(73)%Label  / 'instr_5_eastward_separation' / &
         ANTags(74)%Label  / 'instr_5_vertical_separation' / &
         ANTags(75)%Label  / 'instr_5_tube_diameter' / &
         ANTags(76)%Label  / 'instr_5_tube_length' / &
         ANTags(77)%Label  / 'instr_5_tube_flowrate' / &
         ANTags(78)%Label  / 'instr_5_hpath_length' / &
         ANTags(79)%Label  / 'instr_5_vpath_length' / &
         ANTags(80)%Label  / 'instr_5_tau' / &
         ANTags(81)%Label  / 'instr_5_kw' / &
         ANTags(82)%Label  / 'instr_5_ko' / &
         ANTags(83)%Label  / 'instr_5_void1' / &
         ANTags(84)%Label  / 'instr_5_void2' / &
         ANTags(85)%Label  / 'col_1_min_value' / &
         ANTags(86)%Label  / 'col_1_max_value' / &
         ANTags(87)%Label  / 'col_1_a_value' / &
         ANTags(88)%Label  / 'col_1_b_value' / &
         ANTags(89)%Label  / 'col_1_nom_timelag' / &
         ANTags(90)%Label  / 'col_1_min_timelag' / &
         ANTags(91)%Label  / 'col_1_max_timelag' / &
         ANTags(92)%Label  / 'col_1_flag_threshold' / &
         ANTags(93)%Label  / 'col_2_min_value' / &
         ANTags(94)%Label  / 'col_2_max_value' / &
         ANTags(95)%Label  / 'col_2_a_value' / &
         ANTags(96)%Label  / 'col_2_b_value' / &
         ANTags(97)%Label  / 'col_2_nom_timelag' / &
         ANTags(98)%Label  / 'col_2_min_timelag' / &
         ANTags(99)%Label  / 'col_2_max_timelag' / &
         ANTags(100)%Label  / 'col_2_flag_threshold' / &
         ANTags(101)%Label  / 'col_3_min_value' / &
         ANTags(102)%Label  / 'col_3_max_value' / &
         ANTags(103)%Label  / 'col_3_a_value' / &
         ANTags(104)%Label  / 'col_3_b_value' / &
         ANTags(105)%Label  / 'col_3_nom_timelag' / &
         ANTags(106)%Label  / 'col_3_min_timelag' / &
         ANTags(107)%Label  / 'col_3_max_timelag' / &
         ANTags(108)%Label  / 'col_3_flag_threshold' / &
         ANTags(109)%Label  / 'col_4_min_value' / &
         ANTags(110)%Label  / 'col_4_max_value' / &
         ANTags(111)%Label  / 'col_4_a_value' / &
         ANTags(112)%Label  / 'col_4_b_value' / &
         ANTags(113)%Label  / 'col_4_nom_timelag' / &
         ANTags(114)%Label  / 'col_4_min_timelag' / &
         ANTags(115)%Label  / 'col_4_max_timelag' / &
         ANTags(116)%Label  / 'col_4_flag_threshold' / &
         ANTags(117)%Label  / 'col_5_min_value' / &
         ANTags(118)%Label  / 'col_5_max_value' / &
         ANTags(119)%Label  / 'col_5_a_value' / &
         ANTags(120)%Label  / 'col_5_b_value' / &
         ANTags(121)%Label  / 'col_5_nom_timelag' / &
         ANTags(122)%Label  / 'col_5_min_timelag' / &
         ANTags(123)%Label  / 'col_5_max_timelag' / &
         ANTags(124)%Label  / 'col_5_flag_threshold' / &
         ANTags(125)%Label  / 'col_6_min_value' / &
         ANTags(126)%Label  / 'col_6_max_value' / &
         ANTags(127)%Label  / 'col_6_a_value' / &
         ANTags(128)%Label  / 'col_6_b_value' / &
         ANTags(129)%Label  / 'col_6_nom_timelag' / &
         ANTags(130)%Label  / 'col_6_min_timelag' / &
         ANTags(131)%Label  / 'col_6_max_timelag' / &
         ANTags(132)%Label  / 'col_6_flag_threshold' / &
         ANTags(133)%Label  / 'col_7_min_value' / &
         ANTags(134)%Label  / 'col_7_max_value' / &
         ANTags(135)%Label / 'col_7_a_value' / &
         ANTags(136)%Label / 'col_7_b_value' / &
         ANTags(137)%Label / 'col_7_nom_timelag' / &
         ANTags(138)%Label / 'col_7_min_timelag' / &
         ANTags(139)%Label / 'col_7_max_timelag' / &
         ANTags(140)%Label / 'col_7_flag_threshold' / &
         ANTags(141)%Label / 'col_8_min_value' / &
         ANTags(142)%Label / 'col_8_max_value' / &
         ANTags(143)%Label / 'col_8_a_value' / &
         ANTags(144)%Label / 'col_8_b_value' / &
         ANTags(145)%Label / 'col_8_nom_timelag' / &
         ANTags(146)%Label / 'col_8_min_timelag' / &
         ANTags(147)%Label / 'col_8_max_timelag' / &
         ANTags(148)%Label / 'col_8_flag_threshold' / &
         ANTags(149)%Label / 'col_9_min_value' / &
         ANTags(150)%Label / 'col_9_max_value' / &
         ANTags(151)%Label / 'col_9_a_value' / &
         ANTags(152)%Label / 'col_9_b_value' / &
         ANTags(153)%Label / 'col_9_nom_timelag' / &
         ANTags(154)%Label / 'col_9_min_timelag' / &
         ANTags(155)%Label / 'col_9_max_timelag' / &
         ANTags(156)%Label / 'col_9_flag_threshold' / &
         ANTags(157)%Label / 'col_10_min_value' / &
         ANTags(158)%Label / 'col_10_max_value' / &
         ANTags(159)%Label / 'col_10_a_value' / &
         ANTags(160)%Label / 'col_10_b_value' / &
         ANTags(161)%Label / 'col_10_nom_timelag' / &
         ANTags(162)%Label / 'col_10_min_timelag' / &
         ANTags(163)%Label / 'col_10_max_timelag' / &
         ANTags(164)%Label / 'col_10_flag_threshold' / &
         ANTags(165)%Label / 'col_11_min_value' / &
         ANTags(166)%Label / 'col_11_max_value' / &
         ANTags(167)%Label / 'col_11_a_value' / &
         ANTags(168)%Label / 'col_11_b_value' / &
         ANTags(169)%Label / 'col_11_nom_timelag' / &
         ANTags(170)%Label / 'col_11_min_timelag' / &
         ANTags(171)%Label / 'col_11_max_timelag' / &
         ANTags(172)%Label / 'col_11_flag_threshold' / &
         ANTags(173)%Label / 'col_12_min_value' / &
         ANTags(174)%Label / 'col_12_max_value' / &
         ANTags(175)%Label / 'col_12_a_value' / &
         ANTags(176)%Label / 'col_12_b_value' / &
         ANTags(177)%Label / 'col_12_nom_timelag' / &
         ANTags(178)%Label / 'col_12_min_timelag' / &
         ANTags(179)%Label / 'col_12_max_timelag' / &
         ANTags(180)%Label / 'col_12_flag_threshold' / &
         ANTags(181)%Label / 'col_13_min_value' / &
         ANTags(182)%Label / 'col_13_max_value' / &
         ANTags(183)%Label / 'col_13_a_value' / &
         ANTags(184)%Label / 'col_13_b_value' / &
         ANTags(185)%Label / 'col_13_nom_timelag' / &
         ANTags(186)%Label / 'col_13_min_timelag' / &
         ANTags(187)%Label / 'col_13_max_timelag' / &
         ANTags(188)%Label / 'col_13_flag_threshold' / &
         ANTags(189)%Label / 'col_14_min_value' / &
         ANTags(190)%Label / 'col_14_max_value' / &
         ANTags(191)%Label / 'col_14_a_value' / &
         ANTags(192)%Label / 'col_14_b_value' / &
         ANTags(193)%Label / 'col_14_nom_timelag' / &
         ANTags(194)%Label / 'col_14_min_timelag' / &
         ANTags(195)%Label / 'col_14_max_timelag' / &
         ANTags(196)%Label / 'col_14_flag_threshold' / &
         ANTags(197)%Label / 'col_15_min_value' / &
         ANTags(198)%Label / 'col_15_max_value' / &
         ANTags(199)%Label / 'col_15_a_value' / &
         ANTags(200)%Label / 'col_15_b_value' / &
         ANTags(201)%Label / 'col_15_nom_timelag' / &
         ANTags(202)%Label / 'col_15_min_timelag' / &
         ANTags(203)%Label / 'col_15_max_timelag' / &
         ANTags(204)%Label / 'col_15_flag_threshold' / &
         ANTags(205)%Label / 'col_16_min_value' / &
         ANTags(206)%Label / 'col_16_max_value' / &
         ANTags(207)%Label / 'col_16_a_value' / &
         ANTags(208)%Label / 'col_16_b_value' / &
         ANTags(209)%Label / 'col_16_nom_timelag' / &
         ANTags(210)%Label / 'col_16_min_timelag' / &
         ANTags(211)%Label / 'col_16_max_timelag' / &
         ANTags(212)%Label / 'col_16_flag_threshold' / &
         ANTags(213)%Label / 'col_17_min_value' / &
         ANTags(214)%Label / 'col_17_max_value' / &
         ANTags(215)%Label / 'col_17_a_value' / &
         ANTags(216)%Label / 'col_17_b_value' / &
         ANTags(217)%Label / 'col_17_nom_timelag' / &
         ANTags(218)%Label / 'col_17_min_timelag' / &
         ANTags(219)%Label / 'col_17_max_timelag' / &
         ANTags(220)%Label / 'col_17_flag_threshold' / &
         ANTags(221)%Label / 'col_18_min_value' / &
         ANTags(222)%Label / 'col_18_max_value' / &
         ANTags(223)%Label / 'col_18_a_value' / &
         ANTags(224)%Label / 'col_18_b_value' / &
         ANTags(225)%Label / 'col_18_nom_timelag' / &
         ANTags(226)%Label / 'col_18_min_timelag' / &
         ANTags(227)%Label / 'col_18_max_timelag' / &
         ANTags(228)%Label / 'col_18_flag_threshold' / &
         ANTags(229)%Label / 'col_19_min_value' / &
         ANTags(230)%Label / 'col_19_max_value' / &
         ANTags(231)%Label / 'col_19_a_value' / &
         ANTags(232)%Label / 'col_19_b_value' / &
         ANTags(233)%Label / 'col_19_nom_timelag' / &
         ANTags(234)%Label / 'col_19_min_timelag' / &
         ANTags(235)%Label / 'col_19_max_timelag' / &
         ANTags(236)%Label / 'col_19_flag_threshold' / &
         ANTags(237)%Label / 'col_20_min_value' / &
         ANTags(238)%Label / 'col_20_max_value' / &
         ANTags(239)%Label / 'col_20_a_value' / &
         ANTags(240)%Label / 'col_20_b_value' /

    data ANTags(241)%Label / 'col_20_nom_timelag' / &
         ANTags(242)%Label / 'col_20_min_timelag' / &
         ANTags(243)%Label / 'col_20_max_timelag' / &
         ANTags(244)%Label / 'col_20_flag_threshold' / &
         ANTags(245)%Label / 'col_21_min_value' / &
         ANTags(246)%Label / 'col_21_max_value' / &
         ANTags(247)%Label / 'col_21_a_value' / &
         ANTags(248)%Label / 'col_21_b_value' / &
         ANTags(249)%Label / 'col_21_nom_timelag' / &
         ANTags(250)%Label / 'col_21_min_timelag' / &
         ANTags(251)%Label / 'col_21_max_timelag' / &
         ANTags(252)%Label / 'col_21_flag_threshold' / &
         ANTags(253)%Label / 'col_22_min_value' / &
         ANTags(254)%Label / 'col_22_max_value' / &
         ANTags(255)%Label / 'col_22_a_value' / &
         ANTags(256)%Label / 'col_22_b_value' / &
         ANTags(257)%Label / 'col_22_nom_timelag' / &
         ANTags(258)%Label / 'col_22_min_timelag' / &
         ANTags(259)%Label / 'col_22_max_timelag' / &
         ANTags(260)%Label / 'col_22_flag_threshold' / &
         ANTags(261)%Label / 'col_23_min_value' / &
         ANTags(262)%Label / 'col_23_max_value' / &
         ANTags(263)%Label / 'col_23_a_value' / &
         ANTags(264)%Label / 'col_23_b_value' / &
         ANTags(265)%Label / 'col_23_nom_timelag' / &
         ANTags(266)%Label / 'col_23_min_timelag' / &
         ANTags(267)%Label / 'col_23_max_timelag' / &
         ANTags(268)%Label / 'col_23_flag_threshold' / &
         ANTags(269)%Label / 'col_24_min_value' / &
         ANTags(270)%Label / 'col_24_max_value' / &
         ANTags(271)%Label / 'col_24_a_value' / &
         ANTags(272)%Label / 'col_24_b_value' / &
         ANTags(273)%Label / 'col_24_nom_timelag' / &
         ANTags(274)%Label / 'col_24_min_timelag' / &
         ANTags(275)%Label / 'col_24_max_timelag' / &
         ANTags(276)%Label / 'col_24_flag_threshold' / &
         ANTags(277)%Label / 'col_25_min_value' / &
         ANTags(278)%Label / 'col_25_max_value' / &
         ANTags(279)%Label / 'col_25_a_value' / &
         ANTags(280)%Label / 'col_25_b_value' / &
         ANTags(281)%Label / 'col_25_nom_timelag' / &
         ANTags(282)%Label / 'col_25_min_timelag' / &
         ANTags(283)%Label / 'col_25_max_timelag' / &
         ANTags(284)%Label / 'col_25_flag_threshold' /&
         ANTags(285)%Label / 'col_26_min_value' / &
         ANTags(286)%Label / 'col_26_max_value' / &
         ANTags(287)%Label / 'col_26_a_value' / &
         ANTags(288)%Label / 'col_26_b_value' / &
         ANTags(289)%Label / 'col_26_nom_timelag' / &
         ANTags(290)%Label / 'col_26_min_timelag' / &
         ANTags(291)%Label / 'col_26_max_timelag' / &
         ANTags(292)%Label / 'col_26_flag_threshold' /&
         ANTags(293)%Label / 'col_27_min_value' / &
         ANTags(294)%Label / 'col_27_max_value' / &
         ANTags(295)%Label / 'col_27_a_value' / &
         ANTags(296)%Label / 'col_27_b_value' / &
         ANTags(297)%Label / 'col_27_nom_timelag' / &
         ANTags(298)%Label / 'col_27_min_timelag' / &
         ANTags(299)%Label / 'col_27_max_timelag' / &
         ANTags(300)%Label / 'col_27_flag_threshold' /&
         ANTags(301)%Label / 'col_28_min_value' / &
         ANTags(302)%Label / 'col_28_max_value' / &
         ANTags(303)%Label / 'col_28_a_value' / &
         ANTags(304)%Label / 'col_28_b_value' / &
         ANTags(305)%Label / 'col_28_nom_timelag' / &
         ANTags(306)%Label / 'col_28_min_timelag' / &
         ANTags(307)%Label / 'col_28_max_timelag' / &
         ANTags(308)%Label / 'col_28_flag_threshold' /&
         ANTags(309)%Label / 'col_29_min_value' / &
         ANTags(310)%Label / 'col_29_max_value' / &
         ANTags(311)%Label / 'col_29_a_value' / &
         ANTags(312)%Label / 'col_29_b_value' / &
         ANTags(313)%Label / 'col_29_nom_timelag' / &
         ANTags(314)%Label / 'col_29_min_timelag' / &
         ANTags(315)%Label / 'col_29_max_timelag' / &
         ANTags(316)%Label / 'col_29_flag_threshold' /&
         ANTags(317)%Label / 'col_30_min_value' / &
         ANTags(318)%Label / 'col_30_max_value' / &
         ANTags(319)%Label / 'col_30_a_value' / &
         ANTags(320)%Label / 'col_30_b_value' / &
         ANTags(321)%Label / 'col_30_nom_timelag' / &
         ANTags(322)%Label / 'col_30_min_timelag' / &
         ANTags(323)%Label / 'col_30_max_timelag' / &
         ANTags(324)%Label / 'col_30_flag_threshold' /&
         ANTags(325)%Label / 'col_31_min_value' / &
         ANTags(326)%Label / 'col_31_max_value' / &
         ANTags(327)%Label / 'col_31_a_value' / &
         ANTags(328)%Label / 'col_31_b_value' / &
         ANTags(329)%Label / 'col_31_nom_timelag' / &
         ANTags(330)%Label / 'col_31_min_timelag' / &
         ANTags(331)%Label / 'col_31_max_timelag' / &
         ANTags(332)%Label / 'col_31_flag_threshold' /&
         ANTags(333)%Label / 'col_32_min_value' / &
         ANTags(334)%Label / 'col_32_max_value' / &
         ANTags(335)%Label / 'col_32_a_value' / &
         ANTags(336)%Label / 'col_32_b_value' / &
         ANTags(337)%Label / 'col_32_nom_timelag' / &
         ANTags(338)%Label / 'col_32_min_timelag' / &
         ANTags(339)%Label / 'col_32_max_timelag' / &
         ANTags(340)%Label / 'col_32_flag_threshold' /&
         ANTags(341)%Label / 'col_33_min_value' / &
         ANTags(342)%Label / 'col_33_max_value' / &
         ANTags(343)%Label / 'col_33_a_value' / &
         ANTags(344)%Label / 'col_33_b_value' / &
         ANTags(345)%Label / 'col_33_nom_timelag' / &
         ANTags(346)%Label / 'col_33_min_timelag' / &
         ANTags(347)%Label / 'col_33_max_timelag' / &
         ANTags(348)%Label / 'col_33_flag_threshold' /&
         ANTags(349)%Label / 'col_34_min_value' / &
         ANTags(350)%Label / 'col_34_max_value' / &
         ANTags(351)%Label / 'col_34_a_value' / &
         ANTags(352)%Label / 'col_34_b_value' / &
         ANTags(353)%Label / 'col_34_nom_timelag' / &
         ANTags(354)%Label / 'col_34_min_timelag' / &
         ANTags(355)%Label / 'col_34_max_timelag' / &
         ANTags(356)%Label / 'col_34_flag_threshold' /&
         ANTags(357)%Label / 'col_35_min_value' / &
         ANTags(358)%Label / 'col_35_max_value' / &
         ANTags(359)%Label / 'col_35_a_value' / &
         ANTags(360)%Label / 'col_35_b_value' / &
         ANTags(361)%Label / 'col_35_nom_timelag' / &
         ANTags(362)%Label / 'col_35_min_timelag' / &
         ANTags(363)%Label / 'col_35_max_timelag' / &
         ANTags(364)%Label / 'col_35_flag_threshold' /&
         ANTags(365)%Label / 'col_36_min_value' / &
         ANTags(366)%Label / 'col_36_max_value' / &
         ANTags(367)%Label / 'col_36_a_value' / &
         ANTags(368)%Label / 'col_36_b_value' / &
         ANTags(369)%Label / 'col_36_nom_timelag' / &
         ANTags(370)%Label / 'col_36_min_timelag' / &
         ANTags(371)%Label / 'col_36_max_timelag' / &
         ANTags(372)%Label / 'col_36_flag_threshold' /&
         ANTags(373)%Label / 'col_37_min_value' / &
         ANTags(374)%Label / 'col_37_max_value' / &
         ANTags(375)%Label / 'col_37_a_value' / &
         ANTags(376)%Label / 'col_37_b_value' / &
         ANTags(377)%Label / 'col_37_nom_timelag' / &
         ANTags(378)%Label / 'col_37_min_timelag' / &
         ANTags(379)%Label / 'col_37_max_timelag' / &
         ANTags(380)%Label / 'col_37_flag_threshold' /&
         ANTags(381)%Label / 'col_38_min_value' / &
         ANTags(382)%Label / 'col_38_max_value' / &
         ANTags(383)%Label / 'col_38_a_value' / &
         ANTags(384)%Label / 'col_38_b_value' / &
         ANTags(385)%Label / 'col_38_nom_timelag' / &
         ANTags(386)%Label / 'col_38_min_timelag' / &
         ANTags(387)%Label / 'col_38_max_timelag' / &
         ANTags(388)%Label / 'col_38_flag_threshold' /&
         ANTags(389)%Label / 'col_39_min_value' / &
         ANTags(390)%Label / 'col_39_max_value' / &
         ANTags(391)%Label / 'col_39_a_value' / &
         ANTags(392)%Label / 'col_39_b_value' / &
         ANTags(393)%Label / 'col_39_nom_timelag' / &
         ANTags(394)%Label / 'col_39_min_timelag' / &
         ANTags(395)%Label / 'col_39_max_timelag' / &
         ANTags(396)%Label / 'col_39_flag_threshold' /&
         ANTags(397)%Label / 'col_40_min_value' / &
         ANTags(398)%Label / 'col_40_max_value' / &
         ANTags(399)%Label / 'col_40_a_value' / &
         ANTags(400)%Label / 'col_40_b_value' / &
         ANTags(401)%Label / 'col_40_nom_timelag' / &
         ANTags(402)%Label / 'col_40_min_timelag' / &
         ANTags(403)%Label / 'col_40_max_timelag' / &
         ANTags(404)%Label / 'col_40_flag_threshold' /&
         ANTags(405)%Label / 'col_41_min_value' / &
         ANTags(406)%Label / 'col_41_max_value' / &
         ANTags(407)%Label / 'col_41_a_value' / &
         ANTags(408)%Label / 'col_41_b_value' / &
         ANTags(409)%Label / 'col_41_nom_timelag' / &
         ANTags(410)%Label / 'col_41_min_timelag' / &
         ANTags(411)%Label / 'col_41_max_timelag' / &
         ANTags(412)%Label / 'col_41_flag_threshold' /&
         ANTags(413)%Label / 'col_42_min_value' / &
         ANTags(414)%Label / 'col_42_max_value' / &
         ANTags(415)%Label / 'col_42_a_value' / &
         ANTags(416)%Label / 'col_42_b_value' / &
         ANTags(417)%Label / 'col_42_nom_timelag' / &
         ANTags(418)%Label / 'col_42_min_timelag' / &
         ANTags(419)%Label / 'col_42_max_timelag' / &
         ANTags(420)%Label / 'col_42_flag_threshold' /&
         ANTags(421)%Label / 'col_43_min_value' / &
         ANTags(422)%Label / 'col_43_max_value' / &
         ANTags(423)%Label / 'col_43_a_value' / &
         ANTags(424)%Label / 'col_43_b_value' / &
         ANTags(425)%Label / 'col_43_nom_timelag' / &
         ANTags(426)%Label / 'col_43_min_timelag' / &
         ANTags(427)%Label / 'col_43_max_timelag' / &
         ANTags(428)%Label / 'col_43_flag_threshold' /&
         ANTags(429)%Label / 'col_44_min_value' / &
         ANTags(430)%Label / 'col_44_max_value' / &
         ANTags(431)%Label / 'col_44_a_value' / &
         ANTags(432)%Label / 'col_44_b_value' / &
         ANTags(433)%Label / 'col_44_nom_timelag' / &
         ANTags(434)%Label / 'col_44_min_timelag' / &
         ANTags(435)%Label / 'col_44_max_timelag' / &
         ANTags(436)%Label / 'col_44_flag_threshold' /&
         ANTags(437)%Label / 'col_45_min_value' / &
         ANTags(438)%Label / 'col_45_max_value' / &
         ANTags(439)%Label / 'col_45_a_value' / &
         ANTags(440)%Label / 'col_45_b_value' /

    data ANTags(441)%Label / 'col_45_nom_timelag' / &
         ANTags(442)%Label / 'col_45_min_timelag' / &
         ANTags(443)%Label / 'col_45_max_timelag' / &
         ANTags(444)%Label / 'col_45_flag_threshold' /&
         ANTags(445)%Label / 'col_46_min_value' / &
         ANTags(446)%Label / 'col_46_max_value' / &
         ANTags(447)%Label / 'col_46_a_value' / &
         ANTags(448)%Label / 'col_46_b_value' / &
         ANTags(449)%Label / 'col_46_nom_timelag' / &
         ANTags(450)%Label / 'col_46_min_timelag' / &
         ANTags(451)%Label / 'col_46_max_timelag' / &
         ANTags(452)%Label / 'col_46_flag_threshold' /&
         ANTags(453)%Label / 'col_47_min_value' / &
         ANTags(454)%Label / 'col_47_max_value' / &
         ANTags(455)%Label / 'col_47_a_value' / &
         ANTags(456)%Label / 'col_47_b_value' / &
         ANTags(457)%Label / 'col_47_nom_timelag' / &
         ANTags(458)%Label / 'col_47_min_timelag' / &
         ANTags(459)%Label / 'col_47_max_timelag' / &
         ANTags(460)%Label / 'col_47_flag_threshold' /&
         ANTags(461)%Label / 'col_48_min_value' / &
         ANTags(462)%Label / 'col_48_max_value' / &
         ANTags(463)%Label / 'col_48_a_value' / &
         ANTags(464)%Label / 'col_48_b_value' / &
         ANTags(465)%Label / 'col_48_nom_timelag' / &
         ANTags(466)%Label / 'col_48_min_timelag' / &
         ANTags(467)%Label / 'col_48_max_timelag' / &
         ANTags(468)%Label / 'col_48_flag_threshold' /&
         ANTags(469)%Label / 'col_49_min_value' / &
         ANTags(470)%Label / 'col_49_max_value' / &
         ANTags(471)%Label / 'col_49_a_value' / &
         ANTags(472)%Label / 'col_49_b_value' / &
         ANTags(473)%Label / 'col_49_nom_timelag' / &
         ANTags(474)%Label / 'col_49_min_timelag' / &
         ANTags(475)%Label / 'col_49_max_timelag' / &
         ANTags(476)%Label / 'col_49_flag_threshold' /&
         ANTags(477)%Label / 'col_50_min_value' / &
         ANTags(478)%Label / 'col_50_max_value' / &
         ANTags(479)%Label / 'col_50_a_value' / &
         ANTags(480)%Label / 'col_50_b_value' / &
         ANTags(481)%Label / 'col_50_nom_timelag' / &
         ANTags(482)%Label / 'col_50_min_timelag' / &
         ANTags(483)%Label / 'col_50_max_timelag' / &
         ANTags(484)%Label / 'col_50_flag_threshold' /&
         ANTags(485)%Label / 'col_51_min_value' / &
         ANTags(486)%Label / 'col_51_max_value' / &
         ANTags(487)%Label / 'col_51_a_value' / &
         ANTags(488)%Label / 'col_51_b_value' / &
         ANTags(489)%Label / 'col_51_nom_timelag' / &
         ANTags(490)%Label / 'col_51_min_timelag' / &
         ANTags(491)%Label / 'col_51_max_timelag' / &
         ANTags(492)%Label / 'col_51_flag_threshold' /&
         ANTags(493)%Label / 'col_52_min_value' / &
         ANTags(494)%Label / 'col_52_max_value' / &
         ANTags(495)%Label / 'col_52_a_value' / &
         ANTags(496)%Label / 'col_52_b_value' / &
         ANTags(497)%Label / 'col_52_nom_timelag' / &
         ANTags(498)%Label / 'col_52_min_timelag' / &
         ANTags(499)%Label / 'col_52_max_timelag' / &
         ANTags(500)%Label / 'col_52_flag_threshold' /&
         ANTags(501)%Label / 'col_53_min_value' / &
         ANTags(502)%Label / 'col_53_max_value' / &
         ANTags(503)%Label / 'col_53_a_value' / &
         ANTags(504)%Label / 'col_53_b_value' / &
         ANTags(505)%Label / 'col_53_nom_timelag' / &
         ANTags(506)%Label / 'col_53_min_timelag' / &
         ANTags(507)%Label / 'col_53_max_timelag' / &
         ANTags(508)%Label / 'col_53_flag_threshold' /&
         ANTags(509)%Label / 'col_54_min_value' / &
         ANTags(510)%Label / 'col_54_max_value' / &
         ANTags(511)%Label / 'col_54_a_value' / &
         ANTags(512)%Label / 'col_54_b_value' / &
         ANTags(513)%Label / 'col_54_nom_timelag' / &
         ANTags(514)%Label / 'col_54_min_timelag' / &
         ANTags(515)%Label / 'col_54_max_timelag' / &
         ANTags(516)%Label / 'col_54_flag_threshold' /&
         ANTags(517)%Label / 'col_55_min_value' / &
         ANTags(518)%Label / 'col_55_max_value' / &
         ANTags(519)%Label / 'col_55_a_value' / &
         ANTags(520)%Label / 'col_55_b_value' / &
         ANTags(521)%Label / 'col_55_nom_timelag' / &
         ANTags(522)%Label / 'col_55_min_timelag' / &
         ANTags(523)%Label / 'col_55_max_timelag' / &
         ANTags(524)%Label / 'col_55_flag_threshold' /&
         ANTags(525)%Label / 'col_56_min_value' / &
         ANTags(526)%Label / 'col_56_max_value' / &
         ANTags(527)%Label / 'col_56_a_value' / &
         ANTags(528)%Label / 'col_56_b_value' / &
         ANTags(529)%Label / 'col_56_nom_timelag' / &
         ANTags(530)%Label / 'col_56_min_timelag' / &
         ANTags(531)%Label / 'col_56_max_timelag' / &
         ANTags(532)%Label / 'col_56_flag_threshold' /&
         ANTags(533)%Label / 'col_57_min_value' / &
         ANTags(534)%Label / 'col_57_max_value' / &
         ANTags(535)%Label / 'col_57_a_value' / &
         ANTags(536)%Label / 'col_57_b_value' / &
         ANTags(537)%Label / 'col_57_nom_timelag' / &
         ANTags(538)%Label / 'col_57_min_timelag' / &
         ANTags(539)%Label / 'col_57_max_timelag' / &
         ANTags(540)%Label / 'col_57_flag_threshold' /&
         ANTags(541)%Label / 'col_58_min_value' / &
         ANTags(542)%Label / 'col_58_max_value' / &
         ANTags(543)%Label / 'col_58_a_value' / &
         ANTags(544)%Label / 'col_58_b_value' / &
         ANTags(545)%Label / 'col_58_nom_timelag' / &
         ANTags(546)%Label / 'col_58_min_timelag' / &
         ANTags(547)%Label / 'col_58_max_timelag' / &
         ANTags(548)%Label / 'col_58_flag_threshold' /&
         ANTags(549)%Label / 'col_59_min_value' / &
         ANTags(550)%Label / 'col_59_max_value' / &
         ANTags(551)%Label / 'col_59_a_value' / &
         ANTags(552)%Label / 'col_59_b_value' / &
         ANTags(553)%Label / 'col_59_nom_timelag' / &
         ANTags(554)%Label / 'col_59_min_timelag' / &
         ANTags(555)%Label / 'col_59_max_timelag' / &
         ANTags(556)%Label / 'col_59_flag_threshold' /&
         ANTags(557)%Label / 'col_60_min_value' / &
         ANTags(558)%Label / 'col_60_max_value' / &
         ANTags(559)%Label / 'col_60_a_value' / &
         ANTags(560)%Label / 'col_60_b_value' / &
         ANTags(561)%Label / 'col_60_nom_timelag' / &
         ANTags(562)%Label / 'col_60_min_timelag' / &
         ANTags(563)%Label / 'col_60_max_timelag' / &
         ANTags(564)%Label / 'col_60_flag_threshold' /&
         ANTags(565)%Label / 'col_61_min_value' / &
         ANTags(566)%Label / 'col_61_max_value' / &
         ANTags(567)%Label / 'col_61_a_value' / &
         ANTags(568)%Label / 'col_61_b_value' / &
         ANTags(569)%Label / 'col_61_nom_timelag' / &
         ANTags(570)%Label / 'col_61_min_timelag' / &
         ANTags(571)%Label / 'col_61_max_timelag' / &
         ANTags(572)%Label / 'col_61_flag_threshold' /&
         ANTags(573)%Label / 'col_62_min_value' / &
         ANTags(574)%Label / 'col_62_max_value' / &
         ANTags(575)%Label / 'col_62_a_value' / &
         ANTags(576)%Label / 'col_62_b_value' / &
         ANTags(577)%Label / 'col_62_nom_timelag' / &
         ANTags(578)%Label / 'col_62_min_timelag' / &
         ANTags(579)%Label / 'col_62_max_timelag' / &
         ANTags(580)%Label / 'col_62_flag_threshold' /&
         ANTags(581)%Label / 'col_63_min_value' / &
         ANTags(582)%Label / 'col_63_max_value' / &
         ANTags(583)%Label / 'col_63_a_value' / &
         ANTags(584)%Label / 'col_63_b_value' / &
         ANTags(585)%Label / 'col_63_nom_timelag' / &
         ANTags(586)%Label / 'col_63_min_timelag' / &
         ANTags(587)%Label / 'col_63_max_timelag' / &
         ANTags(588)%Label / 'col_63_flag_threshold' /&
         ANTags(589)%Label / 'col_64_min_value' / &
         ANTags(590)%Label / 'col_64_max_value' / &
         ANTags(591)%Label / 'col_64_a_value' / &
         ANTags(592)%Label / 'col_64_b_value' / &
         ANTags(593)%Label / 'col_64_nom_timelag' / &
         ANTags(594)%Label / 'col_64_min_timelag' / &
         ANTags(595)%Label / 'col_64_max_timelag' / &
         ANTags(596)%Label / 'col_64_flag_threshold' /&
         ANTags(597)%Label / 'col_65_min_value' / &
         ANTags(598)%Label / 'col_65_max_value' / &
         ANTags(599)%Label / 'col_65_a_value' / &
         ANTags(600)%Label / 'col_65_b_value' / &
         ANTags(601)%Label / 'col_65_nom_timelag' / &
         ANTags(602)%Label / 'col_65_min_timelag' / &
         ANTags(603)%Label / 'col_65_max_timelag' / &
         ANTags(604)%Label / 'col_65_flag_threshold' /&
         ANTags(605)%Label / 'col_66_min_value' / &
         ANTags(606)%Label / 'col_66_max_value' / &
         ANTags(607)%Label / 'col_66_a_value' / &
         ANTags(608)%Label / 'col_66_b_value' / &
         ANTags(609)%Label / 'col_66_nom_timelag' / &
         ANTags(610)%Label / 'col_66_min_timelag' / &
         ANTags(611)%Label / 'col_66_max_timelag' / &
         ANTags(612)%Label / 'col_66_flag_threshold' /&
         ANTags(613)%Label / 'col_67_min_value' / &
         ANTags(614)%Label / 'col_67_max_value' / &
         ANTags(615)%Label / 'col_67_a_value' / &
         ANTags(616)%Label / 'col_67_b_value' / &
         ANTags(617)%Label / 'col_67_nom_timelag' / &
         ANTags(618)%Label / 'col_67_min_timelag' / &
         ANTags(619)%Label / 'col_67_max_timelag' / &
         ANTags(620)%Label / 'col_67_flag_threshold' /&
         ANTags(621)%Label / 'col_68_min_value' / &
         ANTags(622)%Label / 'col_68_max_value' / &
         ANTags(623)%Label / 'col_68_a_value' / &
         ANTags(624)%Label / 'col_68_b_value' / &
         ANTags(625)%Label / 'col_68_nom_timelag' / &
         ANTags(626)%Label / 'col_68_min_timelag' / &
         ANTags(627)%Label / 'col_68_max_timelag' / &
         ANTags(628)%Label / 'col_68_flag_threshold' /&
         ANTags(629)%Label / 'col_69_min_value' / &
         ANTags(630)%Label / 'col_69_max_value' / &
         ANTags(631)%Label / 'col_69_a_value' / &
         ANTags(632)%Label / 'col_69_b_value' / &
         ANTags(633)%Label / 'col_69_nom_timelag' / &
         ANTags(634)%Label / 'col_69_min_timelag' / &
         ANTags(635)%Label / 'col_69_max_timelag' / &
         ANTags(636)%Label / 'col_69_flag_threshold' /&
         ANTags(637)%Label / 'col_70_min_value' / &
         ANTags(638)%Label / 'col_70_max_value' / &
         ANTags(639)%Label / 'col_70_a_value' / &
         ANTags(640)%Label / 'col_70_b_value' /

    data ANTags(641)%Label / 'col_70_nom_timelag' / &
         ANTags(642)%Label / 'col_70_min_timelag' / &
         ANTags(643)%Label / 'col_70_max_timelag' / &
         ANTags(644)%Label / 'col_70_flag_threshold' /&
         ANTags(645)%Label / 'col_71_min_value' / &
         ANTags(646)%Label / 'col_71_max_value' / &
         ANTags(647)%Label / 'col_71_a_value' / &
         ANTags(648)%Label / 'col_71_b_value' / &
         ANTags(649)%Label / 'col_71_nom_timelag' / &
         ANTags(650)%Label / 'col_71_min_timelag' / &
         ANTags(651)%Label / 'col_71_max_timelag' / &
         ANTags(652)%Label / 'col_71_flag_threshold' /&
         ANTags(653)%Label / 'col_72_min_value' / &
         ANTags(654)%Label / 'col_72_max_value' / &
         ANTags(655)%Label / 'col_72_a_value' / &
         ANTags(656)%Label / 'col_72_b_value' / &
         ANTags(657)%Label / 'col_72_nom_timelag' / &
         ANTags(658)%Label / 'col_72_min_timelag' / &
         ANTags(659)%Label / 'col_72_max_timelag' / &
         ANTags(660)%Label / 'col_72_flag_threshold' /&
         ANTags(661)%Label / 'col_73_min_value' / &
         ANTags(662)%Label / 'col_73_max_value' / &
         ANTags(663)%Label / 'col_73_a_value' / &
         ANTags(664)%Label / 'col_73_b_value' / &
         ANTags(665)%Label / 'col_73_nom_timelag' / &
         ANTags(666)%Label / 'col_73_min_timelag' / &
         ANTags(667)%Label / 'col_73_max_timelag' / &
         ANTags(668)%Label / 'col_73_flag_threshold' /&
         ANTags(669)%Label / 'col_74_min_value' / &
         ANTags(670)%Label / 'col_74_max_value' / &
         ANTags(671)%Label / 'col_74_a_value' / &
         ANTags(672)%Label / 'col_74_b_value' / &
         ANTags(673)%Label / 'col_74_nom_timelag' / &
         ANTags(674)%Label / 'col_74_min_timelag' / &
         ANTags(675)%Label / 'col_74_max_timelag' / &
         ANTags(676)%Label / 'col_74_flag_threshold' /&
         ANTags(677)%Label / 'col_75_min_value' / &
         ANTags(678)%Label / 'col_75_max_value' / &
         ANTags(679)%Label / 'col_75_a_value' / &
         ANTags(680)%Label / 'col_75_b_value' / &
         ANTags(681)%Label / 'col_75_nom_timelag' / &
         ANTags(682)%Label / 'col_75_min_timelag' / &
         ANTags(683)%Label / 'col_75_max_timelag' / &
         ANTags(684)%Label / 'col_75_flag_threshold' /&
         ANTags(685)%Label / 'col_76_min_value' / &
         ANTags(686)%Label / 'col_76_max_value' / &
         ANTags(687)%Label / 'col_76_a_value' / &
         ANTags(688)%Label / 'col_76_b_value' / &
         ANTags(689)%Label / 'col_76_nom_timelag' / &
         ANTags(690)%Label / 'col_76_min_timelag' / &
         ANTags(691)%Label / 'col_76_max_timelag' / &
         ANTags(692)%Label / 'col_76_flag_threshold' /&
         ANTags(693)%Label / 'col_77_min_value' / &
         ANTags(694)%Label / 'col_77_max_value' / &
         ANTags(695)%Label / 'col_77_a_value' / &
         ANTags(696)%Label / 'col_77_b_value' / &
         ANTags(697)%Label / 'col_77_nom_timelag' / &
         ANTags(698)%Label / 'col_77_min_timelag' / &
         ANTags(699)%Label / 'col_77_max_timelag' / &
         ANTags(700)%Label / 'col_77_flag_threshold' /&
         ANTags(701)%Label / 'col_78_min_value' / &
         ANTags(702)%Label / 'col_78_max_value' / &
         ANTags(703)%Label / 'col_78_a_value' / &
         ANTags(704)%Label / 'col_78_b_value' / &
         ANTags(705)%Label / 'col_78_nom_timelag' / &
         ANTags(706)%Label / 'col_78_min_timelag' / &
         ANTags(707)%Label / 'col_78_max_timelag' / &
         ANTags(708)%Label / 'col_78_flag_threshold' /&
         ANTags(709)%Label / 'col_79_min_value' / &
         ANTags(710)%Label / 'col_79_max_value' / &
         ANTags(711)%Label / 'col_79_a_value' / &
         ANTags(712)%Label / 'col_79_b_value' / &
         ANTags(713)%Label / 'col_79_nom_timelag' / &
         ANTags(714)%Label / 'col_79_min_timelag' / &
         ANTags(715)%Label / 'col_79_max_timelag' / &
         ANTags(716)%Label / 'col_79_flag_threshold' /&
         ANTags(717)%Label / 'col_80_min_value' / &
         ANTags(718)%Label / 'col_80_max_value' / &
         ANTags(719)%Label / 'col_80_a_value' / &
         ANTags(720)%Label / 'col_80_b_value' / &
         ANTags(721)%Label / 'col_80_nom_timelag' / &
         ANTags(722)%Label / 'col_80_min_timelag' / &
         ANTags(723)%Label / 'col_80_max_timelag' / &
         ANTags(724)%Label / 'col_80_flag_threshold' /&
         ANTags(725)%Label / 'col_81_min_value' / &
         ANTags(726)%Label / 'col_81_max_value' / &
         ANTags(727)%Label / 'col_81_a_value' / &
         ANTags(728)%Label / 'col_81_b_value' / &
         ANTags(729)%Label / 'col_81_nom_timelag' / &
         ANTags(730)%Label / 'col_81_min_timelag' / &
         ANTags(731)%Label / 'col_81_max_timelag' / &
         ANTags(732)%Label / 'col_81_flag_threshold' /&
         ANTags(733)%Label / 'col_82_min_value' / &
         ANTags(734)%Label / 'col_82_max_value' / &
         ANTags(735)%Label / 'col_82_a_value' / &
         ANTags(736)%Label / 'col_82_b_value' / &
         ANTags(737)%Label / 'col_82_nom_timelag' / &
         ANTags(738)%Label / 'col_82_min_timelag' / &
         ANTags(739)%Label / 'col_82_max_timelag' / &
         ANTags(740)%Label / 'col_82_flag_threshold' /&
         ANTags(741)%Label / 'col_83_min_value' / &
         ANTags(742)%Label / 'col_83_max_value' / &
         ANTags(743)%Label / 'col_83_a_value' / &
         ANTags(744)%Label / 'col_83_b_value' / &
         ANTags(745)%Label / 'col_83_nom_timelag' / &
         ANTags(746)%Label / 'col_83_min_timelag' / &
         ANTags(747)%Label / 'col_83_max_timelag' / &
         ANTags(748)%Label / 'col_83_flag_threshold' /&
         ANTags(749)%Label / 'col_84_min_value' / &
         ANTags(750)%Label / 'col_84_max_value' / &
         ANTags(751)%Label / 'col_84_a_value' / &
         ANTags(752)%Label / 'col_84_b_value' / &
         ANTags(753)%Label / 'col_84_nom_timelag' / &
         ANTags(754)%Label / 'col_84_min_timelag' / &
         ANTags(755)%Label / 'col_84_max_timelag' / &
         ANTags(756)%Label / 'col_84_flag_threshold' /&
         ANTags(757)%Label / 'col_85_min_value' / &
         ANTags(758)%Label / 'col_85_max_value' / &
         ANTags(759)%Label / 'col_85_a_value' / &
         ANTags(760)%Label / 'col_85_b_value' / &
         ANTags(761)%Label / 'col_85_nom_timelag' / &
         ANTags(762)%Label / 'col_85_min_timelag' / &
         ANTags(763)%Label / 'col_85_max_timelag' / &
         ANTags(764)%Label / 'col_85_flag_threshold' /&
         ANTags(765)%Label / 'col_86_min_value' / &
         ANTags(766)%Label / 'col_86_max_value' / &
         ANTags(767)%Label / 'col_86_a_value' / &
         ANTags(768)%Label / 'col_86_b_value' / &
         ANTags(769)%Label / 'col_86_nom_timelag' / &
         ANTags(770)%Label / 'col_86_min_timelag' / &
         ANTags(771)%Label / 'col_86_max_timelag' / &
         ANTags(772)%Label / 'col_86_flag_threshold' /&
         ANTags(773)%Label / 'col_87_min_value' / &
         ANTags(774)%Label / 'col_87_max_value' / &
         ANTags(775)%Label / 'col_87_a_value' / &
         ANTags(776)%Label / 'col_87_b_value' / &
         ANTags(777)%Label / 'col_87_nom_timelag' / &
         ANTags(778)%Label / 'col_87_min_timelag' / &
         ANTags(779)%Label / 'col_87_max_timelag' / &
         ANTags(780)%Label / 'col_87_flag_threshold' /&
         ANTags(781)%Label / 'col_88_min_value' / &
         ANTags(782)%Label / 'col_88_max_value' / &
         ANTags(783)%Label / 'col_88_a_value' / &
         ANTags(784)%Label / 'col_88_b_value' / &
         ANTags(785)%Label / 'col_88_nom_timelag' / &
         ANTags(786)%Label / 'col_88_min_timelag' / &
         ANTags(787)%Label / 'col_88_max_timelag' / &
         ANTags(788)%Label / 'col_88_flag_threshold' /&
         ANTags(789)%Label / 'col_89_min_value' / &
         ANTags(790)%Label / 'col_89_max_value' / &
         ANTags(791)%Label / 'col_89_a_value' / &
         ANTags(792)%Label / 'col_89_b_value' / &
         ANTags(793)%Label / 'col_89_nom_timelag' / &
         ANTags(794)%Label / 'col_89_min_timelag' / &
         ANTags(795)%Label / 'col_89_max_timelag' / &
         ANTags(796)%Label / 'col_89_flag_threshold' /&
         ANTags(797)%Label / 'col_90_min_value' / &
         ANTags(798)%Label / 'col_90_max_value' / &
         ANTags(799)%Label / 'col_90_a_value' / &
         ANTags(800)%Label / 'col_90_b_value' / &
         ANTags(801)%Label / 'col_90_nom_timelag' / &
         ANTags(802)%Label / 'col_90_min_timelag' / &
         ANTags(803)%Label / 'col_90_max_timelag' / &
         ANTags(804)%Label / 'col_90_flag_threshold' /&
         ANTags(805)%Label / 'col_91_min_value' / &
         ANTags(806)%Label / 'col_91_max_value' / &
         ANTags(807)%Label / 'col_91_a_value' / &
         ANTags(808)%Label / 'col_91_b_value' / &
         ANTags(809)%Label / 'col_91_nom_timelag' / &
         ANTags(810)%Label / 'col_91_min_timelag' / &
         ANTags(811)%Label / 'col_91_max_timelag' / &
         ANTags(812)%Label / 'col_91_flag_threshold' /&
         ANTags(813)%Label / 'col_92_min_value' / &
         ANTags(814)%Label / 'col_92_max_value' / &
         ANTags(815)%Label / 'col_92_a_value' / &
         ANTags(816)%Label / 'col_92_b_value' / &
         ANTags(817)%Label / 'col_92_nom_timelag' / &
         ANTags(818)%Label / 'col_92_min_timelag' / &
         ANTags(819)%Label / 'col_92_max_timelag' / &
         ANTags(820)%Label / 'col_92_flag_threshold' /&
         ANTags(821)%Label / 'col_93_min_value' / &
         ANTags(822)%Label / 'col_93_max_value' / &
         ANTags(823)%Label / 'col_93_a_value' / &
         ANTags(824)%Label / 'col_93_b_value' / &
         ANTags(825)%Label / 'col_93_nom_timelag' / &
         ANTags(826)%Label / 'col_93_min_timelag' / &
         ANTags(827)%Label / 'col_93_max_timelag' / &
         ANTags(828)%Label / 'col_93_flag_threshold' /&
         ANTags(829)%Label / 'col_94_min_value' / &
         ANTags(830)%Label / 'col_94_max_value' / &
         ANTags(831)%Label / 'col_94_a_value' / &
         ANTags(832)%Label / 'col_94_b_value' / &
         ANTags(833)%Label / 'col_94_nom_timelag' / &
         ANTags(834)%Label / 'col_94_min_timelag' / &
         ANTags(835)%Label / 'col_94_max_timelag' / &
         ANTags(836)%Label / 'col_94_flag_threshold' /&
         ANTags(837)%Label / 'col_95_min_value' / &
         ANTags(838)%Label / 'col_95_max_value' / &
         ANTags(839)%Label / 'col_95_a_value' / &
         ANTags(840)%Label / 'col_95_b_value' / &
         ANTags(841)%Label / 'col_95_nom_timelag' / &
         ANTags(842)%Label / 'col_95_min_timelag' / &
         ANTags(843)%Label / 'col_95_max_timelag' / &
         ANTags(844)%Label / 'col_95_flag_threshold' /&
         ANTags(845)%Label / 'col_96_min_value' / &
         ANTags(846)%Label / 'col_96_max_value' / &
         ANTags(847)%Label / 'col_96_a_value' / &
         ANTags(848)%Label / 'col_96_b_value' / &
         ANTags(849)%Label / 'col_96_nom_timelag' / &
         ANTags(850)%Label / 'col_96_min_timelag' / &
         ANTags(851)%Label / 'col_96_max_timelag' / &
         ANTags(852)%Label / 'col_96_flag_threshold' /&
         ANTags(853)%Label / 'col_97_min_value' / &
         ANTags(854)%Label / 'col_97_max_value' / &
         ANTags(855)%Label / 'col_97_a_value' / &
         ANTags(856)%Label / 'col_97_b_value' / &
         ANTags(857)%Label / 'col_97_nom_timelag' / &
         ANTags(858)%Label / 'col_97_min_timelag' / &
         ANTags(859)%Label / 'col_97_max_timelag' / &
         ANTags(860)%Label / 'col_97_flag_threshold' /&
         ANTags(861)%Label / 'col_98_min_value' / &
         ANTags(862)%Label / 'col_98_max_value' / &
         ANTags(863)%Label / 'col_98_a_value' / &
         ANTags(864)%Label / 'col_98_b_value' / &
         ANTags(865)%Label / 'col_98_nom_timelag' / &
         ANTags(866)%Label / 'col_98_min_timelag' / &
         ANTags(867)%Label / 'col_98_max_timelag' / &
         ANTags(868)%Label / 'col_98_flag_threshold' /&
         ANTags(869)%Label / 'col_99_min_value' / &
         ANTags(870)%Label / 'col_99_max_value' / &
         ANTags(871)%Label / 'col_99_a_value' / &
         ANTags(872)%Label / 'col_99_b_value' / &
         ANTags(873)%Label / 'col_99_nom_timelag' / &
         ANTags(874)%Label / 'col_99_min_timelag' / &
         ANTags(875)%Label / 'col_99_max_timelag' / &
         ANTags(876)%Label / 'col_99_flag_threshold' /&
         ANTags(877)%Label / 'col_100_min_value' / &
         ANTags(878)%Label / 'col_100_max_value' / &
         ANTags(879)%Label / 'col_100_a_value' / &
         ANTags(880)%Label / 'col_100_b_value' / &
         ANTags(881)%Label / 'col_100_nom_timelag' / &
         ANTags(882)%Label / 'col_100_min_timelag' / &
         ANTags(883)%Label / 'col_100_max_timelag' / &
         ANTags(884)%Label / 'col_100_flag_threshold' /

    data ACTags(1)%Label   / 'software_version' / ACTags(2)%Label   / 'title' / &
         ACTags(3)%Label   / 'creation_date' / ACTags(4)%Label   / 'start_date' / &
         ACTags(5)%Label   / 'end_date' / ACTags(6)%Label   / 'file_name' / &
         ACTags(7)%Label   / 'data_path' / ACTags(8)%Label   / 'project_notes' / &
         ACTags(9)%Label   / 'site_name' / ACTags(10)%Label  / 'site_id' / &
         ACTags(11)%Label  / 'site_notes' / ACTags(12)%Label  / 'station_name' / &
         ACTags(13)%Label  / 'station_id' / ACTags(14)%Label  / 'pc_time_settings' / &
         ACTags(15)%Label  / 'timing_notes' / ACTags(16)%Label  / 'saved_native' / &
         ACTags(17)%Label  / 'timestamp' / ACTags(18)%Label  / 'enable_processing' /    &
         ACTags(19)%Label  / 'iso_format' / ACTags(20)%Label  / 'tstamp_end' / &
         ACTags(21)%Label  / 'native_format' / ACTags(22)%Label  / 'head_corr' / &
         ACTags(23)%Label  / 'separator' / ACTags(24)%Label  / 'flag_discards_if_above' / &
         ACTags(25)%Label  / 'instr_1_manufacturer' / ACTags(26)%Label  / 'instr_1_sw_version' / &
         ACTags(27)%Label  / 'instr_1_model' / ACTags(28)%Label  / 'instr_1_sn' / &
         ACTags(29)%Label  / 'instr_1_id' / ACTags(30)%Label  / 'instr_1_wformat' / &
         ACTags(31)%Label  / 'instr_1_wref' / ACTags(32)%Label  / 'instr_1_head_corr' / &
         ACTags(33)%Label  / 'instr_2_manufacturer' / ACTags(34)%Label  / 'instr_2_sw_version' / &
         ACTags(35)%Label  / 'instr_2_model' / ACTags(36)%Label  / 'instr_2_sn' / &
         ACTags(37)%Label  / 'instr_2_id' / ACTags(38)%Label  / 'instr_2_wformat' / &
         ACTags(39)%Label  / 'instr_2_wref' / ACTags(40)%Label  / 'instr_2_head_corr' / &
         ACTags(41)%Label  / 'instr_3_manufacturer' / ACTags(42)%Label  / 'instr_3_sw_version' / &
         ACTags(43)%Label  / 'instr_3_model' / ACTags(44)%Label  / 'instr_3_sn' / &
         ACTags(45)%Label  / 'instr_3_id' / ACTags(46)%Label  / 'instr_3_wformat' / &
         ACTags(47)%Label  / 'instr_3_wref' / ACTags(48)%Label  / 'instr_3_head_corr' / &
         ACTags(49)%Label  / 'instr_4_manufacturer' / ACTags(50)%Label  / 'instr_4_sw_version' / &
         ACTags(51)%Label  / 'instr_4_model' / ACTags(52)%Label  / 'instr_4_sn' / &
         ACTags(53)%Label  / 'instr_4_id' / ACTags(54)%Label  / 'instr_4_wformat' / &
         ACTags(55)%Label  / 'instr_4_wref' / ACTags(56)%Label  / 'instr_4_head_corr' / &
         ACTags(57)%Label  / 'instr_5_manufacturer' / ACTags(58)%Label  / 'instr_5_sw_version' / &
         ACTags(59)%Label  / 'instr_5_model' / ACTags(60)%Label  / 'instr_5_sn' / &
         ACTags(61)%Label  / 'instr_5_id' / ACTags(62)%Label  / 'instr_5_wformat' / &
         ACTags(63)%Label  / 'instr_5_wref' / ACTags(64)%Label  / 'instr_5_head_corr' / &
         ACTags(65)%Label  / 'data_label' / &
         ACTags(66)%Label  / 'col_1_variable' / &
         ACTags(67)%Label  / 'col_1_useit' / &
         ACTags(68)%Label  / 'col_1_measure_type' / &
         ACTags(69)%Label  / 'col_1_instrument' / &
         ACTags(70)%Label  / 'col_1_unit_in' / &
         ACTags(71)%Label  / 'col_1_conversion' / &
         ACTags(72)%Label  / 'col_1_unit_out' / &
         ACTags(73)%Label  / 'col_2_variable' / &
         ACTags(74)%Label  / 'col_2_useit' / &
         ACTags(75)%Label  / 'col_2_measure_type' / &
         ACTags(76)%Label  / 'col_2_instrument' / &
         ACTags(77)%Label  / 'col_2_unit_in' / &
         ACTags(78)%Label  / 'col_2_conversion' / &
         ACTags(79)%Label  / 'col_2_unit_out' / &
         ACTags(80)%Label  / 'col_3_variable' / &
         ACTags(81)%Label  / 'col_3_useit' / &
         ACTags(82)%Label  / 'col_3_measure_type' / &
         ACTags(83)%Label  / 'col_3_instrument' / &
         ACTags(84)%Label  / 'col_3_unit_in' / &
         ACTags(85)%Label  / 'col_3_conversion' / &
         ACTags(86)%Label  / 'col_3_unit_out' / &
         ACTags(87)%Label  / 'col_4_variable' / &
         ACTags(88)%Label  / 'col_4_useit' / &
         ACTags(89)%Label  / 'col_4_measure_type' / &
         ACTags(90)%Label  / 'col_4_instrument' / &
         ACTags(91)%Label  / 'col_4_unit_in' / &
         ACTags(92)%Label  / 'col_4_conversion' / &
         ACTags(93)%Label  / 'col_4_unit_out' / &
         ACTags(94)%Label  / 'col_5_variable' / &
         ACTags(95)%Label  / 'col_5_useit' / &
         ACTags(96)%Label  / 'col_5_measure_type' / &
         ACTags(97)%Label  / 'col_5_instrument' / &
         ACTags(98)%Label  / 'col_5_unit_in' / &
         ACTags(99)%Label  / 'col_5_conversion' / &
         ACTags(100)%Label / 'col_5_unit_out' / &
         ACTags(101)%Label / 'col_6_variable' / &
         ACTags(102)%Label / 'col_6_useit' / &
         ACTags(103)%Label / 'col_6_measure_type' / &
         ACTags(104)%Label / 'col_6_instrument' / &
         ACTags(105)%Label / 'col_6_unit_in' / &
         ACTags(106)%Label / 'col_6_conversion' / &
         ACTags(107)%Label / 'col_6_unit_out' / &
         ACTags(108)%Label / 'col_7_variable' / &
         ACTags(109)%Label / 'col_7_useit' / &
         ACTags(110)%Label / 'col_7_measure_type' / &
         ACTags(111)%Label / 'col_7_instrument' / &
         ACTags(112)%Label / 'col_7_unit_in' / &
         ACTags(113)%Label / 'col_7_conversion' / &
         ACTags(114)%Label / 'col_7_unit_out' / &
         ACTags(115)%Label / 'col_8_variable' / &
         ACTags(116)%Label / 'col_8_useit' / &
         ACTags(117)%Label / 'col_8_measure_type' / &
         ACTags(118)%Label / 'col_8_instrument' / &
         ACTags(119)%Label / 'col_8_unit_in' / &
         ACTags(120)%Label / 'col_8_conversion' / &
         ACTags(121)%Label / 'col_8_unit_out' / &
         ACTags(122)%Label / 'col_9_variable' / &
         ACTags(123)%Label / 'col_9_useit' / &
         ACTags(124)%Label / 'col_9_measure_type' / &
         ACTags(125)%Label / 'col_9_instrument' / &
         ACTags(126)%Label / 'col_9_unit_in' / &
         ACTags(127)%Label / 'col_9_conversion' / &
         ACTags(128)%Label / 'col_9_unit_out' / &
         ACTags(129)%Label / 'col_10_variable' / &
         ACTags(130)%Label / 'col_10_useit' / &
         ACTags(131)%Label / 'col_10_measure_type' / &
         ACTags(132)%Label / 'col_10_instrument' / &
         ACTags(133)%Label / 'col_10_unit_in' / &
         ACTags(134)%Label / 'col_10_conversion' / &
         ACTags(135)%Label / 'col_10_unit_out' / &
         ACTags(136)%Label / 'col_11_variable' / &
         ACTags(137)%Label / 'col_11_useit' / &
         ACTags(138)%Label / 'col_11_measure_type' / &
         ACTags(139)%Label / 'col_11_instrument' / &
         ACTags(140)%Label / 'col_11_unit_in' / &
         ACTags(141)%Label / 'col_11_conversion' / &
         ACTags(142)%Label / 'col_11_unit_out' / &
         ACTags(143)%Label / 'col_12_variable' / &
         ACTags(144)%Label / 'col_12_useit' / &
         ACTags(145)%Label / 'col_12_measure_type' / &
         ACTags(146)%Label / 'col_12_instrument' / &
         ACTags(147)%Label / 'col_12_unit_in' / &
         ACTags(148)%Label / 'col_12_conversion' / &
         ACTags(149)%Label / 'col_12_unit_out' / &
         ACTags(150)%Label / 'col_13_variable' / &
         ACTags(151)%Label / 'col_13_useit' / &
         ACTags(152)%Label / 'col_13_measure_type' / &
         ACTags(153)%Label / 'col_13_instrument' / &
         ACTags(154)%Label / 'col_13_unit_in' / &
         ACTags(155)%Label / 'col_13_conversion' / &
         ACTags(156)%Label / 'col_13_unit_out' / &
         ACTags(157)%Label / 'col_14_variable' / &
         ACTags(158)%Label / 'col_14_useit' / &
         ACTags(159)%Label / 'col_14_measure_type' / &
         ACTags(160)%Label / 'col_14_instrument' / &
         ACTags(161)%Label / 'col_14_unit_in' / &
         ACTags(162)%Label / 'col_14_conversion' / &
         ACTags(163)%Label / 'col_14_unit_out' / &
         ACTags(164)%Label / 'col_15_variable' / &
         ACTags(165)%Label / 'col_15_useit' / &
         ACTags(166)%Label / 'col_15_measure_type' / &
         ACTags(167)%Label / 'col_15_instrument' / &
         ACTags(168)%Label / 'col_15_unit_in' / &
         ACTags(169)%Label / 'col_15_conversion' / &
         ACTags(170)%Label / 'col_15_unit_out' / &
         ACTags(171)%Label / 'col_16_variable' / &
         ACTags(172)%Label / 'col_16_useit' / &
         ACTags(173)%Label / 'col_16_measure_type' / &
         ACTags(174)%Label / 'col_16_instrument' / &
         ACTags(175)%Label / 'col_16_unit_in' / &
         ACTags(176)%Label / 'col_16_conversion' / &
         ACTags(177)%Label / 'col_16_unit_out' / &
         ACTags(178)%Label / 'col_17_variable' / &
         ACTags(179)%Label / 'col_17_useit' / &
         ACTags(180)%Label / 'col_17_measure_type' / &
         ACTags(181)%Label / 'col_17_instrument' / &
         ACTags(182)%Label / 'col_17_unit_in' / &
         ACTags(183)%Label / 'col_17_conversion' / &
         ACTags(184)%Label / 'col_17_unit_out' / &
         ACTags(185)%Label / 'col_18_variable' / &
         ACTags(186)%Label / 'col_18_useit' / &
         ACTags(187)%Label / 'col_18_measure_type' / &
         ACTags(188)%Label / 'col_18_instrument' / &
         ACTags(189)%Label / 'col_18_unit_in' / &
         ACTags(190)%Label / 'col_18_conversion' / &
         ACTags(191)%Label / 'col_18_unit_out' / &
         ACTags(192)%Label / 'col_19_variable' / &
         ACTags(193)%Label / 'col_19_useit' / &
         ACTags(194)%Label / 'col_19_measure_type' / &
         ACTags(195)%Label / 'col_19_instrument' / &
         ACTags(196)%Label / 'col_19_unit_in' / &
         ACTags(197)%Label / 'col_19_conversion' / &
         ACTags(198)%Label / 'col_19_unit_out' / &
         ACTags(199)%Label  / 'col_20_variable' / &
         ACTags(200)%Label  / 'col_20_useit' /

    data ACTags(201)%Label  / 'col_20_measure_type' / &
         ACTags(202)%Label  / 'col_20_instrument' / &
         ACTags(203)%Label  / 'col_20_unit_in' / &
         ACTags(204)%Label  / 'col_20_conversion' / &
         ACTags(205)%Label  / 'col_20_unit_out' / &
         ACTags(206)%Label  / 'col_21_variable' / &
         ACTags(207)%Label  / 'col_21_useit' / &
         ACTags(208)%Label  / 'col_21_measure_type' / &
         ACTags(209)%Label  / 'col_21_instrument' / &
         ACTags(210)%Label  / 'col_21_unit_in' / &
         ACTags(211)%Label  / 'col_21_conversion' / &
         ACTags(212)%Label  / 'col_21_unit_out' / &
         ACTags(213)%Label  / 'col_22_variable' / &
         ACTags(214)%Label  / 'col_22_useit' / &
         ACTags(215)%Label  / 'col_22_measure_type' / &
         ACTags(216)%Label  / 'col_22_instrument' / &
         ACTags(217)%Label  / 'col_22_unit_in' / &
         ACTags(218)%Label  / 'col_22_conversion' / &
         ACTags(219)%Label  / 'col_22_unit_out' / &
         ACTags(220)%Label  / 'col_23_variable' / &
         ACTags(221)%Label  / 'col_23_useit' / &
         ACTags(222)%Label  / 'col_23_measure_type' / &
         ACTags(223)%Label  / 'col_23_instrument' / &
         ACTags(224)%Label  / 'col_23_unit_in' / &
         ACTags(225)%Label  / 'col_23_conversion' / &
         ACTags(226)%Label  / 'col_23_unit_out' / &
         ACTags(227)%Label  / 'col_24_variable' / &
         ACTags(228)%Label  / 'col_24_useit' / &
         ACTags(229)%Label  / 'col_24_measure_type' / &
         ACTags(230)%Label  / 'col_24_instrument' / &
         ACTags(231)%Label  / 'col_24_unit_in' / &
         ACTags(232)%Label  / 'col_24_conversion' / &
         ACTags(233)%Label  / 'col_24_unit_out' / &
         ACTags(234)%Label  / 'col_25_variable' / &
         ACTags(235)%Label  / 'col_25_useit' / &
         ACTags(236)%Label  / 'col_25_measure_type' / &
         ACTags(237)%Label  / 'col_25_instrument' / &
         ACTags(238)%Label  / 'col_25_unit_in' / &
         ACTags(239)%Label  / 'col_25_conversion' / &
         ACTags(240)%Label  / 'col_25_unit_out' / &
         ACTags(241)%Label  / 'col_26_variable' / &
         ACTags(242)%Label  / 'col_26_useit' / &
         ACTags(243)%Label  / 'col_26_measure_type' / &
         ACTags(244)%Label  / 'col_26_instrument' / &
         ACTags(245)%Label  / 'col_26_unit_in' / &
         ACTags(246)%Label  / 'col_26_conversion' / &
         ACTags(247)%Label  / 'col_26_unit_out' / &
         ACTags(248)%Label  / 'col_27_variable' / &
         ACTags(249)%Label  / 'col_27_useit' / &
         ACTags(250)%Label  / 'col_27_measure_type' / &
         ACTags(251)%Label  / 'col_27_instrument' / &
         ACTags(252)%Label  / 'col_27_unit_in' / &
         ACTags(253)%Label  / 'col_27_conversion' / &
         ACTags(254)%Label  / 'col_27_unit_out' / &
         ACTags(255)%Label  / 'col_28_variable' / &
         ACTags(256)%Label  / 'col_28_useit' / &
         ACTags(257)%Label  / 'col_28_measure_type' / &
         ACTags(258)%Label  / 'col_28_instrument' / &
         ACTags(259)%Label  / 'col_28_unit_in' / &
         ACTags(260)%Label  / 'col_28_conversion' / &
         ACTags(261)%Label  / 'col_28_unit_out' / &
         ACTags(262)%Label  / 'col_29_variable' / &
         ACTags(263)%Label  / 'col_29_useit' / &
         ACTags(264)%Label  / 'col_29_measure_type' / &
         ACTags(265)%Label  / 'col_29_instrument' / &
         ACTags(266)%Label  / 'col_29_unit_in' / &
         ACTags(267)%Label  / 'col_29_conversion' / &
         ACTags(268)%Label  / 'col_29_unit_out' / &
         ACTags(269)%Label  / 'col_30_variable' / &
         ACTags(270)%Label  / 'col_30_useit' / &
         ACTags(271)%Label  / 'col_30_measure_type' / &
         ACTags(272)%Label  / 'col_30_instrument' / &
         ACTags(273)%Label  / 'col_30_unit_in' / &
         ACTags(274)%Label  / 'col_30_conversion' / &
         ACTags(275)%Label  / 'col_30_unit_out' / &
         ACTags(276)%Label  / 'col_31_variable' / &
         ACTags(277)%Label  / 'col_31_useit' / &
         ACTags(278)%Label  / 'col_31_measure_type' / &
         ACTags(279)%Label  / 'col_31_instrument' / &
         ACTags(280)%Label  / 'col_31_unit_in' / &
         ACTags(281)%Label  / 'col_31_conversion' / &
         ACTags(282)%Label  / 'col_31_unit_out' / &
         ACTags(283)%Label  / 'col_32_variable' / &
         ACTags(284)%Label  / 'col_32_useit' / &
         ACTags(285)%Label  / 'col_32_measure_type' / &
         ACTags(286)%Label  / 'col_32_instrument' / &
         ACTags(287)%Label  / 'col_32_unit_in' / &
         ACTags(288)%Label  / 'col_32_conversion' / &
         ACTags(289)%Label  / 'col_32_unit_out' / &
         ACTags(290)%Label  / 'col_33_variable' / &
         ACTags(291)%Label  / 'col_33_useit' / &
         ACTags(292)%Label  / 'col_33_measure_type' / &
         ACTags(293)%Label  / 'col_33_instrument' / &
         ACTags(294)%Label  / 'col_33_unit_in' / &
         ACTags(295)%Label  / 'col_33_conversion' / &
         ACTags(296)%Label  / 'col_33_unit_out' / &
         ACTags(297)%Label  / 'col_34_variable' / &
         ACTags(298)%Label  / 'col_34_useit' / &
         ACTags(299)%Label  / 'col_34_measure_type' / &
         ACTags(300)%Label  / 'col_34_instrument' / &
         ACTags(301)%Label  / 'col_34_unit_in' / &
         ACTags(302)%Label  / 'col_34_conversion' / &
         ACTags(303)%Label  / 'col_34_unit_out' / &
         ACTags(304)%Label  / 'col_35_variable' / &
         ACTags(305)%Label  / 'col_35_useit' / &
         ACTags(306)%Label  / 'col_35_measure_type' / &
         ACTags(307)%Label  / 'col_35_instrument' / &
         ACTags(308)%Label  / 'col_35_unit_in' / &
         ACTags(309)%Label  / 'col_35_conversion' / &
         ACTags(310)%Label  / 'col_35_unit_out' / &
         ACTags(311)%Label  / 'col_36_variable' / &
         ACTags(312)%Label  / 'col_36_useit' / &
         ACTags(313)%Label  / 'col_36_measure_type' / &
         ACTags(314)%Label  / 'col_36_instrument' / &
         ACTags(315)%Label  / 'col_36_unit_in' / &
         ACTags(316)%Label  / 'col_36_conversion' / &
         ACTags(317)%Label  / 'col_36_unit_out' / &
         ACTags(318)%Label  / 'col_37_variable' / &
         ACTags(319)%Label  / 'col_37_useit' / &
         ACTags(320)%Label  / 'col_37_measure_type' / &
         ACTags(321)%Label  / 'col_37_instrument' / &
         ACTags(322)%Label  / 'col_37_unit_in' / &
         ACTags(323)%Label  / 'col_37_conversion' / &
         ACTags(324)%Label  / 'col_37_unit_out' / &
         ACTags(325)%Label  / 'col_38_variable' / &
         ACTags(326)%Label  / 'col_38_useit' / &
         ACTags(327)%Label  / 'col_38_measure_type' / &
         ACTags(328)%Label  / 'col_38_instrument' / &
         ACTags(329)%Label  / 'col_38_unit_in' / &
         ACTags(330)%Label  / 'col_38_conversion' / &
         ACTags(331)%Label  / 'col_38_unit_out' / &
         ACTags(332)%Label  / 'col_39_variable' / &
         ACTags(333)%Label  / 'col_39_useit' / &
         ACTags(334)%Label  / 'col_39_measure_type' / &
         ACTags(335)%Label  / 'col_39_instrument' / &
         ACTags(336)%Label  / 'col_39_unit_in' / &
         ACTags(337)%Label  / 'col_39_conversion' / &
         ACTags(338)%Label  / 'col_39_unit_out' / &
         ACTags(339)%Label  / 'col_40_variable' / &
         ACTags(340)%Label  / 'col_40_useit' / &
         ACTags(341)%Label  / 'col_40_measure_type' / &
         ACTags(342)%Label  / 'col_40_instrument' / &
         ACTags(343)%Label  / 'col_40_unit_in' / &
         ACTags(344)%Label  / 'col_40_conversion' / &
         ACTags(345)%Label  / 'col_40_unit_out' / &
         ACTags(346)%Label  / 'col_41_variable' / &
         ACTags(347)%Label  / 'col_41_useit' / &
         ACTags(348)%Label  / 'col_41_measure_type' / &
         ACTags(349)%Label  / 'col_41_instrument' / &
         ACTags(350)%Label  / 'col_41_unit_in' / &
         ACTags(351)%Label  / 'col_41_conversion' / &
         ACTags(352)%Label  / 'col_41_unit_out' / &
         ACTags(353)%Label  / 'col_42_variable' / &
         ACTags(354)%Label  / 'col_42_useit' / &
         ACTags(355)%Label  / 'col_42_measure_type' / &
         ACTags(356)%Label  / 'col_42_instrument' / &
         ACTags(357)%Label  / 'col_42_unit_in' / &
         ACTags(358)%Label  / 'col_42_conversion' / &
         ACTags(359)%Label  / 'col_42_unit_out' / &
         ACTags(360)%Label  / 'col_43_variable' / &
         ACTags(361)%Label  / 'col_43_useit' / &
         ACTags(362)%Label  / 'col_43_measure_type' / &
         ACTags(363)%Label  / 'col_43_instrument' / &
         ACTags(364)%Label  / 'col_43_unit_in' / &
         ACTags(365)%Label  / 'col_43_conversion' / &
         ACTags(366)%Label  / 'col_43_unit_out' / &
         ACTags(367)%Label  / 'col_44_variable' / &
         ACTags(368)%Label  / 'col_44_useit' / &
         ACTags(369)%Label  / 'col_44_measure_type' / &
         ACTags(370)%Label  / 'col_44_instrument' / &
         ACTags(371)%Label  / 'col_44_unit_in' / &
         ACTags(372)%Label  / 'col_44_conversion' / &
         ACTags(373)%Label  / 'col_44_unit_out' / &
         ACTags(374)%Label  / 'col_45_variable' / &
         ACTags(375)%Label  / 'col_45_useit' / &
         ACTags(376)%Label  / 'col_45_measure_type' / &
         ACTags(377)%Label  / 'col_45_instrument' / &
         ACTags(378)%Label  / 'col_45_unit_in' / &
         ACTags(379)%Label  / 'col_45_conversion' / &
         ACTags(380)%Label  / 'col_45_unit_out' / &
         ACTags(381)%Label  / 'col_46_variable' / &
         ACTags(382)%Label  / 'col_46_useit' / &
         ACTags(383)%Label  / 'col_46_measure_type' / &
         ACTags(384)%Label  / 'col_46_instrument' / &
         ACTags(385)%Label  / 'col_46_unit_in' / &
         ACTags(386)%Label  / 'col_46_conversion' / &
         ACTags(387)%Label  / 'col_46_unit_out' / &
         ACTags(388)%Label  / 'col_47_variable' / &
         ACTags(389)%Label  / 'col_47_useit' / &
         ACTags(390)%Label  / 'col_47_measure_type' / &
         ACTags(391)%Label  / 'col_47_instrument' / &
         ACTags(392)%Label  / 'col_47_unit_in' / &
         ACTags(393)%Label  / 'col_47_conversion' / &
         ACTags(394)%Label  / 'col_47_unit_out' / &
         ACTags(395)%Label  / 'col_48_variable' / &
         ACTags(396)%Label  / 'col_48_useit' / &
         ACTags(397)%Label  / 'col_48_measure_type' / &
         ACTags(398)%Label  / 'col_48_instrument' / &
         ACTags(399)%Label  / 'col_48_unit_in' / &
         ACTags(400)%Label  / 'col_48_conversion' /

    data ACTags(401)%Label  / 'col_48_unit_out' / &
         ACTags(402)%Label  / 'col_49_variable' / &
         ACTags(403)%Label  / 'col_49_useit' / &
         ACTags(404)%Label  / 'col_49_measure_type' / &
         ACTags(405)%Label  / 'col_49_instrument' / &
         ACTags(406)%Label  / 'col_49_unit_in' / &
         ACTags(407)%Label  / 'col_49_conversion' / &
         ACTags(408)%Label  / 'col_49_unit_out' / &
         ACTags(409)%Label  / 'col_50_variable' / &
         ACTags(410)%Label  / 'col_50_useit' / &
         ACTags(411)%Label  / 'col_50_measure_type' / &
         ACTags(412)%Label  / 'col_50_instrument' / &
         ACTags(413)%Label  / 'col_50_unit_in' / &
         ACTags(414)%Label  / 'col_50_conversion' / &
         ACTags(415)%Label  / 'col_50_unit_out' / &
         ACTags(416)%Label  / 'col_51_variable' / &
         ACTags(417)%Label  / 'col_51_useit' / &
         ACTags(418)%Label  / 'col_51_measure_type' / &
         ACTags(419)%Label  / 'col_51_instrument' / &
         ACTags(420)%Label  / 'col_51_unit_in' / &
         ACTags(421)%Label  / 'col_51_conversion' / &
         ACTags(422)%Label  / 'col_51_unit_out' / &
         ACTags(423)%Label  / 'col_52_variable' / &
         ACTags(424)%Label  / 'col_52_useit' / &
         ACTags(425)%Label  / 'col_52_measure_type' / &
         ACTags(426)%Label  / 'col_52_instrument' / &
         ACTags(427)%Label  / 'col_52_unit_in' / &
         ACTags(428)%Label  / 'col_52_conversion' / &
         ACTags(429)%Label  / 'col_52_unit_out' / &
         ACTags(430)%Label  / 'col_53_variable' / &
         ACTags(431)%Label  / 'col_53_useit' / &
         ACTags(432)%Label  / 'col_53_measure_type' / &
         ACTags(433)%Label  / 'col_53_instrument' / &
         ACTags(434)%Label  / 'col_53_unit_in' / &
         ACTags(435)%Label  / 'col_53_conversion' / &
         ACTags(436)%Label  / 'col_53_unit_out' / &
         ACTags(437)%Label  / 'col_54_variable' / &
         ACTags(438)%Label  / 'col_54_useit' / &
         ACTags(439)%Label  / 'col_54_measure_type' / &
         ACTags(440)%Label  / 'col_54_instrument' / &
         ACTags(441)%Label  / 'col_54_unit_in' / &
         ACTags(442)%Label  / 'col_54_conversion' / &
         ACTags(443)%Label  / 'col_54_unit_out' / &
         ACTags(444)%Label  / 'col_55_variable' / &
         ACTags(445)%Label  / 'col_55_useit' / &
         ACTags(446)%Label  / 'col_55_measure_type' / &
         ACTags(447)%Label  / 'col_55_instrument' / &
         ACTags(448)%Label  / 'col_55_unit_in' / &
         ACTags(449)%Label  / 'col_55_conversion' / &
         ACTags(450)%Label  / 'col_55_unit_out' / &
         ACTags(451)%Label  / 'col_56_variable' / &
         ACTags(452)%Label  / 'col_56_useit' / &
         ACTags(453)%Label  / 'col_56_measure_type' / &
         ACTags(454)%Label  / 'col_56_instrument' / &
         ACTags(455)%Label  / 'col_56_unit_in' / &
         ACTags(456)%Label  / 'col_56_conversion' / &
         ACTags(457)%Label  / 'col_56_unit_out' / &
         ACTags(458)%Label  / 'col_57_variable' / &
         ACTags(459)%Label  / 'col_57_useit' / &
         ACTags(460)%Label  / 'col_57_measure_type' / &
         ACTags(461)%Label  / 'col_57_instrument' / &
         ACTags(462)%Label  / 'col_57_unit_in' / &
         ACTags(463)%Label  / 'col_57_conversion' / &
         ACTags(464)%Label  / 'col_57_unit_out' / &
         ACTags(465)%Label  / 'col_58_variable' / &
         ACTags(466)%Label  / 'col_58_useit' / &
         ACTags(467)%Label  / 'col_58_measure_type' / &
         ACTags(468)%Label  / 'col_58_instrument' / &
         ACTags(469)%Label  / 'col_58_unit_in' / &
         ACTags(470)%Label  / 'col_58_conversion' / &
         ACTags(471)%Label  / 'col_58_unit_out' / &
         ACTags(472)%Label  / 'col_59_variable' / &
         ACTags(473)%Label  / 'col_59_useit' / &
         ACTags(474)%Label  / 'col_59_measure_type' / &
         ACTags(475)%Label  / 'col_59_instrument' / &
         ACTags(476)%Label  / 'col_59_unit_in' / &
         ACTags(477)%Label  / 'col_59_conversion' / &
         ACTags(478)%Label  / 'col_59_unit_out' / &
         ACTags(479)%Label  / 'col_60_variable' / &
         ACTags(480)%Label  / 'col_60_useit' / &
         ACTags(481)%Label  / 'col_60_measure_type' / &
         ACTags(482)%Label  / 'col_60_instrument' / &
         ACTags(483)%Label  / 'col_60_unit_in' / &
         ACTags(484)%Label  / 'col_60_conversion' / &
         ACTags(485)%Label  / 'col_60_unit_out' / &
         ACTags(486)%Label  / 'col_61_variable' / &
         ACTags(487)%Label  / 'col_61_useit' / &
         ACTags(488)%Label  / 'col_61_measure_type' / &
         ACTags(489)%Label  / 'col_61_instrument' / &
         ACTags(490)%Label  / 'col_61_unit_in' / &
         ACTags(491)%Label  / 'col_61_conversion' / &
         ACTags(492)%Label  / 'col_61_unit_out' / &
         ACTags(493)%Label  / 'col_62_variable' / &
         ACTags(494)%Label  / 'col_62_useit' / &
         ACTags(495)%Label  / 'col_62_measure_type' / &
         ACTags(496)%Label  / 'col_62_instrument' / &
         ACTags(497)%Label  / 'col_62_unit_in' / &
         ACTags(498)%Label  / 'col_62_conversion' / &
         ACTags(499)%Label  / 'col_62_unit_out' / &
         ACTags(500)%Label  / 'col_63_variable' / &
         ACTags(501)%Label  / 'col_63_useit' / &
         ACTags(502)%Label  / 'col_63_measure_type' / &
         ACTags(503)%Label  / 'col_63_instrument' / &
         ACTags(504)%Label  / 'col_63_unit_in' / &
         ACTags(505)%Label  / 'col_63_conversion' / &
         ACTags(506)%Label  / 'col_63_unit_out' / &
         ACTags(507)%Label  / 'col_64_variable' / &
         ACTags(508)%Label  / 'col_64_useit' / &
         ACTags(509)%Label  / 'col_64_measure_type' / &
         ACTags(510)%Label  / 'col_64_instrument' / &
         ACTags(511)%Label  / 'col_64_unit_in' / &
         ACTags(512)%Label  / 'col_64_conversion' / &
         ACTags(513)%Label  / 'col_64_unit_out' / &
         ACTags(514)%Label  / 'col_65_variable' / &
         ACTags(515)%Label  / 'col_65_useit' / &
         ACTags(516)%Label  / 'col_65_measure_type' / &
         ACTags(517)%Label  / 'col_65_instrument' / &
         ACTags(518)%Label  / 'col_65_unit_in' / &
         ACTags(519)%Label  / 'col_65_conversion' / &
         ACTags(520)%Label  / 'col_65_unit_out' / &
         ACTags(521)%Label  / 'col_66_variable' / &
         ACTags(522)%Label  / 'col_66_useit' / &
         ACTags(523)%Label  / 'col_66_measure_type' / &
         ACTags(524)%Label  / 'col_66_instrument' / &
         ACTags(525)%Label  / 'col_66_unit_in' / &
         ACTags(526)%Label  / 'col_66_conversion' / &
         ACTags(527)%Label  / 'col_66_unit_out' / &
         ACTags(528)%Label  / 'col_67_variable' / &
         ACTags(529)%Label  / 'col_67_useit' / &
         ACTags(530)%Label  / 'col_67_measure_type' / &
         ACTags(531)%Label  / 'col_67_instrument' / &
         ACTags(532)%Label  / 'col_67_unit_in' / &
         ACTags(533)%Label  / 'col_67_conversion' / &
         ACTags(534)%Label  / 'col_67_unit_out' / &
         ACTags(535)%Label  / 'col_68_variable' / &
         ACTags(536)%Label  / 'col_68_useit' / &
         ACTags(537)%Label  / 'col_68_measure_type' / &
         ACTags(538)%Label  / 'col_68_instrument' / &
         ACTags(539)%Label  / 'col_68_unit_in' / &
         ACTags(540)%Label  / 'col_68_conversion' / &
         ACTags(541)%Label  / 'col_68_unit_out' / &
         ACTags(542)%Label  / 'col_69_variable' / &
         ACTags(543)%Label  / 'col_69_useit' / &
         ACTags(544)%Label  / 'col_69_measure_type' / &
         ACTags(545)%Label  / 'col_69_instrument' / &
         ACTags(546)%Label  / 'col_69_unit_in' / &
         ACTags(547)%Label  / 'col_69_conversion' / &
         ACTags(548)%Label  / 'col_69_unit_out' / &
         ACTags(549)%Label  / 'col_70_variable' / &
         ACTags(550)%Label  / 'col_70_useit' / &
         ACTags(551)%Label  / 'col_70_measure_type' / &
         ACTags(552)%Label  / 'col_70_instrument' / &
         ACTags(553)%Label  / 'col_70_unit_in' / &
         ACTags(554)%Label  / 'col_70_conversion' / &
         ACTags(555)%Label  / 'col_70_unit_out' / &
         ACTags(556)%Label  / 'col_71_variable' / &
         ACTags(557)%Label  / 'col_71_useit' / &
         ACTags(558)%Label  / 'col_71_measure_type' / &
         ACTags(559)%Label  / 'col_71_instrument' / &
         ACTags(560)%Label  / 'col_71_unit_in' / &
         ACTags(561)%Label  / 'col_71_conversion' / &
         ACTags(562)%Label  / 'col_71_unit_out' / &
         ACTags(563)%Label  / 'col_72_variable' / &
         ACTags(564)%Label  / 'col_72_useit' / &
         ACTags(565)%Label  / 'col_72_measure_type' / &
         ACTags(566)%Label  / 'col_72_instrument' / &
         ACTags(567)%Label  / 'col_72_unit_in' / &
         ACTags(568)%Label  / 'col_72_conversion' / &
         ACTags(569)%Label  / 'col_72_unit_out' / &
         ACTags(570)%Label  / 'col_73_variable' / &
         ACTags(571)%Label  / 'col_73_useit' / &
         ACTags(572)%Label  / 'col_73_measure_type' / &
         ACTags(573)%Label  / 'col_73_instrument' / &
         ACTags(574)%Label  / 'col_73_unit_in' / &
         ACTags(575)%Label  / 'col_73_conversion' / &
         ACTags(576)%Label  / 'col_73_unit_out' / &
         ACTags(577)%Label  / 'col_74_variable' / &
         ACTags(578)%Label  / 'col_74_useit' / &
         ACTags(579)%Label  / 'col_74_measure_type' / &
         ACTags(580)%Label  / 'col_74_instrument' / &
         ACTags(581)%Label  / 'col_74_unit_in' / &
         ACTags(582)%Label  / 'col_74_conversion' / &
         ACTags(583)%Label  / 'col_74_unit_out' / &
         ACTags(584)%Label  / 'col_75_variable' / &
         ACTags(585)%Label  / 'col_75_useit' / &
         ACTags(586)%Label  / 'col_75_measure_type' / &
         ACTags(587)%Label  / 'col_75_instrument' / &
         ACTags(588)%Label  / 'col_75_unit_in' / &
         ACTags(589)%Label  / 'col_75_conversion' / &
         ACTags(590)%Label  / 'col_75_unit_out' / &
         ACTags(591)%Label  / 'col_76_variable' / &
         ACTags(592)%Label  / 'col_76_useit' / &
         ACTags(593)%Label  / 'col_76_measure_type' / &
         ACTags(594)%Label  / 'col_76_instrument' / &
         ACTags(595)%Label  / 'col_76_unit_in' / &
         ACTags(596)%Label  / 'col_76_conversion' / &
         ACTags(597)%Label  / 'col_76_unit_out' / &
         ACTags(598)%Label  / 'col_77_variable' / &
         ACTags(599)%Label  / 'col_77_useit' / &
         ACTags(600)%Label  / 'col_77_measure_type' /

    data ACTags(601)%Label  / 'col_77_instrument' / &
         ACTags(602)%Label  / 'col_77_unit_in' / &
         ACTags(603)%Label  / 'col_77_conversion' / &
         ACTags(604)%Label  / 'col_77_unit_out' / &
         ACTags(605)%Label  / 'col_78_variable' / &
         ACTags(606)%Label  / 'col_78_useit' / &
         ACTags(607)%Label  / 'col_78_measure_type' / &
         ACTags(608)%Label  / 'col_78_instrument' / &
         ACTags(609)%Label  / 'col_78_unit_in' / &
         ACTags(610)%Label  / 'col_78_conversion' / &
         ACTags(611)%Label  / 'col_78_unit_out' / &
         ACTags(612)%Label  / 'col_79_variable' / &
         ACTags(613)%Label  / 'col_79_useit' / &
         ACTags(614)%Label  / 'col_79_measure_type' / &
         ACTags(615)%Label  / 'col_79_instrument' / &
         ACTags(616)%Label  / 'col_79_unit_in' / &
         ACTags(617)%Label  / 'col_79_conversion' / &
         ACTags(618)%Label  / 'col_79_unit_out' / &
         ACTags(619)%Label  / 'col_80_variable' / &
         ACTags(620)%Label  / 'col_80_useit' / &
         ACTags(621)%Label  / 'col_80_measure_type' / &
         ACTags(622)%Label  / 'col_80_instrument' / &
         ACTags(623)%Label  / 'col_80_unit_in' / &
         ACTags(624)%Label  / 'col_80_conversion' / &
         ACTags(625)%Label  / 'col_80_unit_out' / &
         ACTags(626)%Label  / 'col_81_variable' / &
         ACTags(627)%Label  / 'col_81_useit' / &
         ACTags(628)%Label  / 'col_81_measure_type' / &
         ACTags(629)%Label  / 'col_81_instrument' / &
         ACTags(630)%Label  / 'col_81_unit_in' / &
         ACTags(631)%Label  / 'col_81_conversion' / &
         ACTags(632)%Label  / 'col_81_unit_out' / &
         ACTags(633)%Label  / 'col_82_variable' / &
         ACTags(634)%Label  / 'col_82_useit' / &
         ACTags(635)%Label  / 'col_82_measure_type' / &
         ACTags(636)%Label  / 'col_82_instrument' / &
         ACTags(637)%Label  / 'col_82_unit_in' / &
         ACTags(638)%Label  / 'col_82_conversion' / &
         ACTags(639)%Label  / 'col_82_unit_out' / &
         ACTags(640)%Label  / 'col_83_variable' / &
         ACTags(641)%Label  / 'col_83_useit' / &
         ACTags(642)%Label  / 'col_83_measure_type' / &
         ACTags(643)%Label  / 'col_83_instrument' / &
         ACTags(644)%Label  / 'col_83_unit_in' / &
         ACTags(645)%Label  / 'col_83_conversion' / &
         ACTags(646)%Label  / 'col_83_unit_out' / &
         ACTags(647)%Label  / 'col_84_variable' / &
         ACTags(648)%Label  / 'col_84_useit' / &
         ACTags(649)%Label  / 'col_84_measure_type' / &
         ACTags(650)%Label  / 'col_84_instrument' / &
         ACTags(651)%Label  / 'col_84_unit_in' / &
         ACTags(652)%Label  / 'col_84_conversion' / &
         ACTags(653)%Label  / 'col_84_unit_out' / &
         ACTags(654)%Label  / 'col_85_variable' / &
         ACTags(655)%Label  / 'col_85_useit' / &
         ACTags(656)%Label  / 'col_85_measure_type' / &
         ACTags(657)%Label  / 'col_85_instrument' / &
         ACTags(658)%Label  / 'col_85_unit_in' / &
         ACTags(659)%Label  / 'col_85_conversion' / &
         ACTags(660)%Label  / 'col_85_unit_out' / &
         ACTags(661)%Label  / 'col_86_variable' / &
         ACTags(662)%Label  / 'col_86_useit' / &
         ACTags(663)%Label  / 'col_86_measure_type' / &
         ACTags(664)%Label  / 'col_86_instrument' / &
         ACTags(665)%Label  / 'col_86_unit_in' / &
         ACTags(666)%Label  / 'col_86_conversion' / &
         ACTags(667)%Label  / 'col_86_unit_out' / &
         ACTags(668)%Label  / 'col_87_variable' / &
         ACTags(669)%Label  / 'col_87_useit' / &
         ACTags(670)%Label  / 'col_87_measure_type' / &
         ACTags(671)%Label  / 'col_87_instrument' / &
         ACTags(672)%Label  / 'col_87_unit_in' / &
         ACTags(673)%Label  / 'col_87_conversion' / &
         ACTags(674)%Label  / 'col_87_unit_out' / &
         ACTags(675)%Label  / 'col_88_variable' / &
         ACTags(676)%Label  / 'col_88_useit' / &
         ACTags(677)%Label  / 'col_88_measure_type' / &
         ACTags(678)%Label  / 'col_88_instrument' / &
         ACTags(679)%Label  / 'col_88_unit_in' / &
         ACTags(680)%Label  / 'col_88_conversion' / &
         ACTags(681)%Label  / 'col_88_unit_out' / &
         ACTags(682)%Label  / 'col_89_variable' / &
         ACTags(683)%Label  / 'col_89_useit' / &
         ACTags(684)%Label  / 'col_89_measure_type' / &
         ACTags(685)%Label  / 'col_89_instrument' / &
         ACTags(686)%Label  / 'col_89_unit_in' / &
         ACTags(687)%Label  / 'col_89_conversion' / &
         ACTags(688)%Label  / 'col_89_unit_out' / &
         ACTags(689)%Label  / 'col_90_variable' / &
         ACTags(690)%Label  / 'col_90_useit' / &
         ACTags(691)%Label  / 'col_90_measure_type' / &
         ACTags(692)%Label  / 'col_90_instrument' / &
         ACTags(693)%Label  / 'col_90_unit_in' / &
         ACTags(694)%Label  / 'col_90_conversion' / &
         ACTags(695)%Label  / 'col_90_unit_out' / &
         ACTags(696)%Label  / 'col_91_variable' / &
         ACTags(697)%Label  / 'col_91_useit' / &
         ACTags(698)%Label  / 'col_91_measure_type' / &
         ACTags(699)%Label  / 'col_91_instrument' / &
         ACTags(700)%Label  / 'col_91_unit_in' / &
         ACTags(701)%Label  / 'col_91_conversion' / &
         ACTags(702)%Label  / 'col_91_unit_out' / &
         ACTags(703)%Label  / 'col_92_variable' / &
         ACTags(704)%Label  / 'col_92_useit' / &
         ACTags(705)%Label  / 'col_92_measure_type' / &
         ACTags(706)%Label  / 'col_92_instrument' / &
         ACTags(707)%Label  / 'col_92_unit_in' / &
         ACTags(708)%Label  / 'col_92_conversion' / &
         ACTags(709)%Label  / 'col_92_unit_out' / &
         ACTags(710)%Label  / 'col_93_variable' / &
         ACTags(711)%Label  / 'col_93_useit' / &
         ACTags(712)%Label  / 'col_93_measure_type' / &
         ACTags(713)%Label  / 'col_93_instrument' / &
         ACTags(714)%Label  / 'col_93_unit_in' / &
         ACTags(715)%Label  / 'col_93_conversion' / &
         ACTags(716)%Label  / 'col_93_unit_out' / &
         ACTags(717)%Label  / 'col_94_variable' / &
         ACTags(718)%Label  / 'col_94_useit' / &
         ACTags(719)%Label  / 'col_94_measure_type' / &
         ACTags(720)%Label  / 'col_94_instrument' / &
         ACTags(721)%Label  / 'col_94_unit_in' / &
         ACTags(722)%Label  / 'col_94_conversion' / &
         ACTags(723)%Label  / 'col_94_unit_out' / &
         ACTags(724)%Label  / 'col_95_variable' / &
         ACTags(725)%Label  / 'col_95_useit' / &
         ACTags(726)%Label  / 'col_95_measure_type' / &
         ACTags(727)%Label  / 'col_95_instrument' / &
         ACTags(728)%Label  / 'col_95_unit_in' / &
         ACTags(729)%Label  / 'col_95_conversion' / &
         ACTags(730)%Label  / 'col_95_unit_out' / &
         ACTags(731)%Label  / 'col_96_variable' / &
         ACTags(732)%Label  / 'col_96_useit' / &
         ACTags(733)%Label  / 'col_96_measure_type' / &
         ACTags(734)%Label  / 'col_96_instrument' / &
         ACTags(735)%Label  / 'col_96_unit_in' / &
         ACTags(736)%Label  / 'col_96_conversion' / &
         ACTags(737)%Label  / 'col_96_unit_out' / &
         ACTags(738)%Label  / 'col_97_variable' / &
         ACTags(739)%Label  / 'col_97_useit' / &
         ACTags(740)%Label  / 'col_97_measure_type' / &
         ACTags(741)%Label  / 'col_97_instrument' / &
         ACTags(742)%Label  / 'col_97_unit_in' / &
         ACTags(743)%Label  / 'col_97_conversion' / &
         ACTags(744)%Label  / 'col_97_unit_out' / &
         ACTags(745)%Label  / 'col_98_variable' / &
         ACTags(746)%Label  / 'col_98_useit' / &
         ACTags(747)%Label  / 'col_98_measure_type' / &
         ACTags(748)%Label  / 'col_98_instrument' / &
         ACTags(749)%Label  / 'col_98_unit_in' / &
         ACTags(750)%Label  / 'col_98_conversion' / &
         ACTags(751)%Label  / 'col_98_unit_out' / &
         ACTags(752)%Label  / 'col_99_variable' / &
         ACTags(753)%Label  / 'col_99_useit' / &
         ACTags(754)%Label  / 'col_99_measure_type' / &
         ACTags(755)%Label  / 'col_99_instrument' / &
         ACTags(756)%Label  / 'col_99_unit_in' / &
         ACTags(757)%Label  / 'col_99_conversion' / &
         ACTags(758)%Label  / 'col_99_unit_out' / &
         ACTags(759)%Label  / 'col_100_variable' / &
         ACTags(760)%Label  / 'col_100_useit' / &
         ACTags(761)%Label  / 'col_100_measure_type' / &
         ACTags(762)%Label  / 'col_100_instrument' / &
         ACTags(763)%Label  / 'col_100_unit_in' / &
         ACTags(764)%Label  / 'col_100_conversion' / &
         ACTags(765)%Label  / 'col_100_unit_out' /
end module m_common_global_var
