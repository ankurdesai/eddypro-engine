!***************************************************************************
! m_typedef.f90
! -------------
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
! \brief       Module for definition of derived types
! \author      Gerardo Fratini
! \note
! \sa
! \bug
! \deprecated
! \test
! \todo
!***************************************************************************
module m_typedef
    use m_numeric_kinds
    use libdate
    implicit none
    save

    !> labels for array sizes
    integer, parameter :: MaxAvrgPeriodInHours = 5
    integer, parameter :: MaxNumRow = 144000
    integer, parameter :: MaxNumInstruments = 5
    integer, parameter :: MaxNumRawFlags = 10
    integer, parameter :: NumDegH = 9
    integer, parameter :: MaxNumCol = 100
    integer, parameter :: E2NumVar = 14
    integer, parameter :: MaxNumDiag = 4
    integer, parameter :: GHGNumVar = 8
    integer, parameter :: MaxUserVar = 30
    integer, parameter :: MaxNumBins = 300
    integer, parameter :: MaxOutstringLen = 5000
    integer, parameter :: MaxNumBiometRow = 60 * MaxAvrgPeriodInHours !< 1 record/min * 60 min * 5h
    integer, parameter :: MaxNumBiometCol = 100
    integer, parameter :: MaxNumCstmBiometCol = 50
    integer, parameter :: ExNumInstruments = 5

    integer, parameter :: MaxGasClasses = 12
    integer, parameter :: toMaxH2OClass = 20
    integer, parameter :: MaxNumWSect = 36

    integer, parameter :: MaxBiometRep = 10
    integer, parameter :: MaxProfRep = 5
    integer, parameter :: MaxProfNodes = 7
    integer, parameter :: NumStdCustom = 50

    !> labels for EddyPro standard set
    integer, parameter :: u   = 1
    integer, parameter :: v   = 2
    integer, parameter :: w   = 3
    integer, parameter :: ts  = 4
    integer, parameter :: co2 = 5
    integer, parameter :: h2o = 6
    integer, parameter :: ch4 = 7
    integer, parameter :: n2o = 8
    integer, parameter :: gas4 = 8
    integer, parameter :: tc  = 9
    integer, parameter :: ti1 = 10
    integer, parameter :: ti2 = 11
    integer, parameter :: pi  = 12
    integer, parameter :: pc  = 12
    integer, parameter :: te  = 13
    integer, parameter :: pe  = 14

    integer, parameter :: sonic  = 1
    integer, parameter :: ico2   = 2
    integer, parameter :: ih2o   = 3
    integer, parameter :: ich4   = 4
    integer, parameter :: igas4  = 5

    !> character labels
    character(8) :: e2lab(E2NumVar)
    data e2lab(1:E2NumVar) / 'u', 'v', 'w', 'ts', 'co2', 'h2o', 'ch4', 'n2o', 'cell_t', &
        'int_t_1', 'int_t_2', 'int_p', 'air_t', 'air_p'/

    !> labels for cospectra
    integer, parameter :: w_u   = 1
    integer, parameter :: w_v   = 2
    integer, parameter :: w_w   = 3
    integer, parameter :: w_ts  = 4
    integer, parameter :: w_co2 = 5
    integer, parameter :: w_h2o = 6
    integer, parameter :: w_ch4 = 7
    integer, parameter :: w_n2o = 8
    integer, parameter :: w_gas4 = 8

    !> Other labels
    integer, parameter :: fink_sims = 1
    integer, parameter :: mann_lens = 2
    integer, parameter :: lens      = 3

    type :: Numerical
        character(60) :: Label
        real(kind = dbl) :: Value
    end type Numerical

    type :: Text
        character(64) :: Label
        character(256) :: Value
    end type Text

    type GenericE2Var
        real(kind = dbl) :: dbl(E2NumVar)
        integer :: int(E2NumVar)
        character(64) :: char(E2NumVar)
    end type GenericE2Var

    type :: AAType
        real(kind = dbl) :: min
        real(kind = dbl) :: max
        real(kind = dbl) :: lim
    end type AAType

    type :: ADCType
        character(32) :: Var
        character(32) :: VoltRange
        character(32) :: Constants
        character(32) :: Units
        character(32) :: PhysUnits
        real(kind = dbl) :: a
        real(kind = dbl) :: b
        real(kind = dbl) :: Vmin
        real(kind = dbl) :: Vmax
        real(kind = dbl) :: TLdef
        real(kind = dbl) :: TLmin
        real(kind = dbl) :: TLmax
    end type ADCType

    type :: ALType
        real(kind = dbl) :: u_max
        real(kind = dbl) :: w_max
        real(kind = dbl) :: t_min
        real(kind = dbl) :: t_max
        real(kind = dbl) :: co2_min
        real(kind = dbl) :: co2_max
        real(kind = dbl) :: h2o_min
        real(kind = dbl) :: h2o_max
        real(kind = dbl) :: ch4_min
        real(kind = dbl) :: ch4_max
        real(kind = dbl) :: gas4_min
        real(kind = dbl) :: gas4_max
    end type ALType

   type :: AnemType
        character(20) :: Var
        character(20) :: Units
    end type AnemType

    type :: ARType
        integer :: lim
        integer :: bins
        real(kind = dbl) :: hf_lim
    end type ARType

    type :: LPTFType
        real(kind = dbl) :: dirga
        real(kind = dbl) :: dsonic
        real(kind = dbl) :: m
        real(kind = dbl) :: wirga
        real(kind = dbl) :: wsonic
        real(kind = dbl) :: sver
        real(kind = dbl) :: shor
        real(kind = dbl) :: t
    end Type LPTFType

    type :: BPTFType
        real(kind = dbl) :: EXP(GHGNumVar)
        type(LPTFType)   :: LP(GHGNumVar)
        real(kind = dbl) :: HP(GHGNumVar)
        real(kind = dbl) :: BP(GHGNumVar)
    end type BPTFType

    type :: BinaryType
        integer :: head_nlines
        integer :: nbytes
        character(8) :: ascii_head_eol
        logical :: little_endian
    end type BinaryType

    type :: BiometColType
        character(32) :: var
        character(32) :: id
        character(32) :: instr
        character(32) :: unit_in
        character(32) :: unit_out
        real(kind = dbl) :: gain
        real(kind = dbl) :: offset
    end type BiometColType

    type :: BiometMetaType
        character(1)     :: separator
        character(32)    :: data_label
        integer          :: nhead
        real(kind = dbl) :: duration
        real(kind = dbl) :: rate
        real(kind = dbl) :: step
        type(BiometColType) :: BiometCol(MaxNumBiometCol)
    end type BiometMetaType

    type :: BurbaParType
        real(kind = dbl) :: m(2, 3, 4)
        real(kind = dbl) :: l(2, 3, 2)
    end type BurbaParType

    type :: BurbaType
        real(kind = dbl) :: h_bot
        real(kind = dbl) :: h_top
        real(kind = dbl) :: h_spar
    end type BurbaType

    type :: CDSetupType
        integer :: ndir
        character(4) :: year
        character(10) :: start_date
        character(10) :: end_date
        logical :: filetype(20)
        logical :: recurse
        character(32) :: cstm(3)
    end type CDSetupType

    type :: CalibType
        character(10) :: date
        character(5)  :: time
        type(DateType) :: ts
        logical :: cleaning
        real(kind = dbl) :: offset(GHGNumVar)
        real(kind = dbl) :: ref(GHGNumVar)
        real(kind = dbl) :: ri(GHGNumVar)
        real(kind = dbl) :: rf(GHGNumVar)
        real(kind = dbl) :: Tcell
        real(kind = dbl) :: vmol
    end type CalibType

    type :: DriftCorrectionType
        character(32) :: method
        real(kind = dbl) :: dir_cal(0:6, GHGNumVar)
        real(kind = dbl) :: inv_cal(0:6, GHGNumVar)
        real(kind = dbl) :: b
        real(kind = dbl) :: c
    end type DriftCorrectionType

    type :: tsDriftsType
        type (DateType) :: Timestamp
        real (kind = dbl) :: offset(GHGNumVar)
    end type tsDriftsType

    type :: InstrumentType
        character(32) :: firm
        character(32) :: model
        character(32) :: sw_ver
        character(32) :: category
        real(kind = dbl) :: height
        real(kind = dbl) :: vpath_length
        real(kind = dbl) :: hpath_length
        real(kind = dbl) :: tau
        real(kind = dbl) :: north_offset
        real(kind = dbl) :: tube_l
        real(kind = dbl) :: tube_d
        real(kind = dbl) :: tube_f
        real(kind = dbl) :: hsep
        real(kind = dbl) :: nsep
        real(kind = dbl) :: esep
        real(kind = dbl) :: vsep
        real(kind = dbl) :: kw
        real(kind = dbl) :: ko
        character(32) :: wref
        character(32) :: wformat
        character(32) :: path_type
        character(32) :: measure_type
        logical :: head_corr
        logical :: master_sonic
    end type InstrumentType

    type :: RawFlagType
        integer :: col
        real(kind = dbl) :: threshold
        logical :: upper
    end type RawFlagType

    type :: ColType
        character(32) :: var
        character(32) :: label
        character(32) :: measure_type
        character(32) :: instr_name
        character(32) :: unit_in
        character(32) :: conversion_type
        character(32) :: unit_out
        real(kind = dbl) :: min
        real(kind = dbl) :: max
        real(kind = dbl) :: a
        real(kind = dbl) :: b
        real(kind = dbl) :: def_tl
        real(kind = dbl) :: min_tl
        real(kind = dbl) :: max_tl
        real(kind = dbl) :: flag_thrshld
        type (InstrumentType) :: instr
        type (RawFlagType) :: flag
        logical :: useit
        logical :: present
        real(kind = dbl) :: Va
    end type ColType

    type :: DegTType
        character(10) :: date
        character(5) :: time
        real(kind = dbl) :: zL
        real(kind = dbl) :: u
        real(kind = dbl) :: cov
        real(kind = dbl) :: dcov(9)
        logical :: def(9)
    end type DegTType

    type :: Diag7200Type
        logical :: present
        integer :: head_detect
        integer :: t_out
        integer :: t_in
        integer :: aux_in
        integer :: delta_p
        integer :: chopper
        integer :: detector
        integer :: pll
        integer :: sync
        real(kind = dbl) :: AGC
    end type Diag7200Type

    type :: Diag7500Type
        logical :: present
        integer :: chopper
        integer :: detector
        integer :: pll
        integer :: sync
        real(kind = dbl) :: AGC
    end type Diag7500Type

    type :: Diag7700Type
        logical :: present
        integer :: not_ready
        integer :: no_signal
        integer :: re_unlocked
        integer :: bad_temp
        integer :: laser_temp_unregulated
        integer :: block_temp_unregulated
        integer :: motor_spinning
        integer :: pump_on
        integer :: top_heater_on
        integer :: bottom_heater_on
        integer :: calibrating
        integer :: motor_failure
        integer :: bad_aux_tc1
        integer :: bad_aux_tc2
        integer :: bad_aux_tc3
        integer :: box_connected
    end type Diag7700Type

    type :: DirType
        character(256) :: main_in
        character(256) :: main_out
        character(256) :: binned
        character(256) :: full
        character(256) :: biomet
    end type DirType

    type :: DOType
        real(kind = dbl) :: hf1_lim
        real(kind = dbl) :: hf2_lim
        real(kind = dbl) :: extlim_dw
        real(kind = dbl) :: extlim_up
    end type DOType

    type :: DSType
        real(kind = dbl) :: hf_uv
        real(kind = dbl) :: hf_w
        real(kind = dbl) :: hf_t
        real(kind = dbl) :: hf_co2
        real(kind = dbl) :: hf_h2o
        real(kind = dbl) :: hf_ch4
        real(kind = dbl) :: hf_gas4
        real(kind = dbl) :: hf_var
        real(kind = dbl) :: sf_uv
        real(kind = dbl) :: sf_w
        real(kind = dbl) :: sf_t
        real(kind = dbl) :: sf_co2
        real(kind = dbl) :: sf_h2o
        real(kind = dbl) :: sf_ch4
        real(kind = dbl) :: sf_gas4
        real(kind = dbl) :: sf_var
    end type DSType

    type :: MetadataType
        integer :: ord(32)
        character(10) :: date
        character(5) :: time
        real(kind = dbl) :: alt
        real(kind = dbl) :: lat
        real(kind = dbl) :: lon
        real(kind = dbl) :: bar_press
        real(kind = dbl) :: canopy_height
        real(kind = dbl) :: d
        real(kind = dbl) :: z0
        real(kind = dbl) :: ac_freq
        real(kind = dbl) :: file_length
        character(256) :: sitename
        type(ColType) :: E2Col(E2NumVar)
    end type MetadataType

    type :: DynMDType
        character(32) :: measure_type(GHGNumVar)
        real(kind = dbl) :: alt
        real(kind = dbl) :: lat
        real(kind = dbl) :: lon
        real(kind = dbl) :: ac_freq
        real(kind = dbl) :: file_length
        real(kind = dbl) :: canopy_height
        real(kind = dbl) :: d
        real(kind = dbl) :: z0
        type(InstrumentType) :: Instr(E2NumVar)
    end type DynMDType

    type :: EddyProProjType
        integer :: col(E2NumVar + MaxNumDiag)
        real(kind=dbl) :: new_gas_diff
        character(10) :: start_date
        character(5)  :: start_time
        character(10) :: end_date
        character(5)  :: end_time
        character(32) :: title
        character(32) :: id
        character(64) :: fproto
        character(32) :: ftype
        character(32) :: fext
        character(32) :: master_sonic
        character(32) :: lf_meth
        character(32) :: hf_meth
        character(32) :: err_label
        character(32) :: run_mode
        character(32) :: run_env
        character(32) :: caller
        character(32) :: biomet_data
        character(64) :: biomet_tail
        logical :: biomet_dir
        logical :: biomet_recurse
        logical :: make_dataset
        logical :: wpl
        logical :: out_essentials
        logical :: use_extmd_file
        logical :: use_dynmd_file
        logical :: out_full
        logical :: out_ghg_eu
        logical :: out_amflux
        logical :: out_md
        logical :: out_avrg_cosp
        logical :: out_biomet
        logical :: fcc_follows
        logical :: fix_out_format
    end type EddyProProjType

    type :: EddyProLogType
        logical :: save_native
        logical :: timestamp
        logical :: enable_proc
        logical :: iso_format
        logical :: tstamp_end
        character(30) :: native_format
    end type EddyProLogType

    type :: SASetupType
        integer :: min_smpl
        real(kind = dbl) :: fmin(E2NumVar)
        real(kind = dbl) :: fmax(E2NumVar)
        real(kind = dbl) :: trshld_H
        real(kind = dbl) :: trshld_LE
        real(kind = dbl) :: trshld_co2
        real(kind = dbl) :: trshld_ch4
        real(kind = dbl) :: trshld_gas4
        real(kind = dbl) :: hfn_fmin(GHGNumVar)
        real(kind = dbl) :: f12_trshld(GHGNumVar)
        integer :: nclass(E2NumVar)
        integer :: class(E2NumVar, 12)
        character(32) :: lptf
        character(32) :: cosp
        character(32) :: cosp_type
        character(32) :: horst_lens09
        character(10) :: start_date
        character(10) :: end_date
        logical :: add_sonic_lptf
        logical :: ibrom_model
        logical :: in_situ
    end type SASetupType

    type :: FCCsetupType
        character(10)  :: start_date
        character(5)   :: start_time
        character(10)  :: end_date
        character(5)   :: end_time
        character(32)  :: H_corr
        logical :: sa_onthefly
        logical :: import_full_cospectra
        type(SASetupType) :: SA
    end type FCCsetupType

    type :: FCCMetadataType
        character(32)    :: H2oPathType
        real(kind = dbl) :: ac_freq
        logical          :: ru
    end type FCCMetadataType

    type :: FileListType
        character(64) :: name
        character(256) :: path
        type(DateType)  :: timestamp
    end type FileListType

    type :: FileType
        character(256) :: tlag_opt
        character(256) :: metadata
        character(256) :: DynMD
        character(256) :: biomet
        character(256) :: ex
        character(256) :: pf
        character(256) :: to
        character(256) :: sa
    end type FileType

    type :: FluxType
        character(10) :: date
        character(5) :: time
        real(kind = dbl) :: co2
        real(kind = dbl) :: h2o
        real(kind = dbl) :: ch4
        real(kind = dbl) :: gas4
        real(kind = dbl) :: E
        real(kind = dbl) :: E_co2
        real(kind = dbl) :: E_ch4
        real(kind = dbl) :: E_gas4
        real(kind = dbl) :: LE
        real(kind = dbl) :: H
        real(kind = dbl) :: Hi_co2
        real(kind = dbl) :: Hi_h2o
        real(kind = dbl) :: Hi_ch4
        real(kind = dbl) :: Hi_gas4
        real(kind = dbl) :: tau
        real(kind = dbl) :: ustar
        real(kind = dbl) :: zL
    end type FluxType

    type :: FileCheckType
        logical :: first
        logical :: second
    end type FileCheckType

    type :: FileInterpreterType
        integer :: header_rows
        integer :: ulongs
        character(1) :: separator
        character(64) :: data_label
        character(8)  :: tob1_format
        logical :: discard_if_above
        logical :: file_with_text
    end type FileInterpreterType

    type :: FootType
        real(kind = dbl) :: peak
        real(kind = dbl) :: offset
        real(kind = dbl) :: x10
        real(kind = dbl) :: x30
        real(kind = dbl) :: x50
        real(kind = dbl) :: x70
        real(kind = dbl) :: x90
    end type FootType

    type FPCheckType
        integer :: outliers
    end type FPCheckType

    type FPFlagType
        logical :: outliers
    end type FPFlagType

    type H2OCovType
        character(10) :: date
        character(5) :: time
        real(kind = dbl) :: tl_co2
        real(kind = dbl) :: tl_ch4
        real(kind = dbl) :: tl_gas4
    end type H2OCovType

    type HeaderType
        character(64) :: var
        character(64) :: units
    end type HeaderType

    type :: EssentialsType
        integer :: e2spikes(E2NumVar)
        real(kind = dbl) :: yaw
        real(kind = dbl) :: pitch
        real(kind = dbl) :: roll
        real(kind = dbl) :: zL
        real(kind = dbl) :: L
        real(kind = dbl) :: degH(NumDegH + 1)
        real(kind = dbl) :: timelag(E2NumVar)
        real(kind = dbl) :: AGC72
        real(kind = dbl) :: AGC75
        real(kind = dbl) :: RSSI77
        real(kind = dbl) :: rand_uncer(E2NumVar)
        real(kind = dbl) :: rand_uncer_LE
        logical :: def_tlag(E2NumVar)
    end type EssentialsType

    type :: LongSpectraType
        real(kind = dbl) :: fn(GHGNumVar)
        real(kind = dbl) :: of(GHGNumVar)
        real(kind = dbl) :: ts(GHGNumVar)
    end type LongSpectraType

    type :: BiometSetupType
        character(1) :: separator
        character(64) :: tstamp_prototype
        integer :: head_lines
        integer :: tstep
        logical :: use_header
        character(16) :: tstamp_ref
        integer :: Ta
        integer :: Pa
        integer :: RH
        integer :: PPFD
        integer :: LWin
        integer :: Rg
        integer :: CO2
        integer :: H2O
        integer :: CH4
        integer :: GAS4
        integer :: prof_swc
        integer :: prof_shf
        integer :: prof_ts
        integer :: prof_t
        integer :: prof_co2
        integer :: prof_h2o
        integer :: prof_ch4
        integer :: prof_gas4
        real(kind = dbl) :: zT(MaxProfNodes)
        real(kind = dbl) :: zCO2(MaxProfNodes)
        real(kind = dbl) :: zH2O(MaxProfNodes)
        real(kind = dbl) :: zCH4(MaxProfNodes)
        real(kind = dbl) :: zGAS4(MaxProfNodes)
        real(kind = dbl) :: dz(5, MaxProfNodes-1)
    end type BiometSetupType

    type :: SpecMethType
        integer :: nbins
        character(32) :: lp_meth
        character(32) :: lptf
        character(32) :: cosp
        character(32) :: cosp_type
        logical :: hptf
        logical :: add_sonic_lptf
    end type SpecMethType

    type :: BiometType
        character(10) :: date
        character(5) :: time
        real(kind = dbl) :: Ta(MaxBiometRep)
        real(kind = dbl) :: Ts(MaxBiometRep)
        real(kind = dbl) :: Tbc(MaxBiometRep)
        real(kind = dbl) :: Tc(MaxBiometRep)
        real(kind = dbl) :: Tbole(MaxBiometRep)
        real(kind = dbl) :: Pa(MaxBiometRep)
        real(kind = dbl) :: RH(MaxBiometRep)
        real(kind = dbl) :: Rg(MaxBiometRep)
        real(kind = dbl) :: Ruva(MaxBiometRep)
        real(kind = dbl) :: Ruvb(MaxBiometRep)
        real(kind = dbl) :: LWin(MaxBiometRep)
        real(kind = dbl) :: LWout(MaxBiometRep)
        real(kind = dbl) :: SWin(MaxBiometRep)
        real(kind = dbl) :: SWout(MaxBiometRep)
        real(kind = dbl) :: SWdif(MaxBiometRep)
        real(kind = dbl) :: SWbc(MaxBiometRep)
        real(kind = dbl) :: P(MaxBiometRep)
        real(kind = dbl) :: Prain(MaxBiometRep)
        real(kind = dbl) :: Psnow(MaxBiometRep)
        real(kind = dbl) :: SNOWD(MaxBiometRep)
        real(kind = dbl) :: Rn(MaxBiometRep)
        real(kind = dbl) :: Rd(MaxBiometRep)
        real(kind = dbl) :: Rr(MaxBiometRep)
        real(kind = dbl) :: PPFD(MaxBiometRep)
        real(kind = dbl) :: PPFDd(MaxBiometRep)
        real(kind = dbl) :: PPFDr(MaxBiometRep)
        real(kind = dbl) :: PPFDbc(MaxBiometRep)
        real(kind = dbl) :: APAR(MaxBiometRep)
        real(kind = dbl) :: Alb(MaxBiometRep)
        real(kind = dbl) :: PRI(MaxBiometRep)
        real(kind = dbl) :: LAI(MaxBiometRep)
        real(kind = dbl) :: WS(MaxBiometRep)
        real(kind = dbl) :: MWS(MaxBiometRep)
        real(kind = dbl) :: WD(MaxBiometRep)
        real(kind = dbl) :: StemFlow(MaxBiometRep)
        real(kind = dbl) :: SapFlow(MaxBiometRep)
        real(kind = dbl) :: TR(MaxBiometRep)
        real(kind = dbl) :: SWC(MaxBiometRep)
        real(kind = dbl) :: SHF(MaxBiometRep)
        logical :: Pused
        logical :: RHused
        logical :: Tused
    end type BiometType

    type :: BiometCountType
        integer :: Ta(MaxBiometRep)
        integer :: Ts(MaxBiometRep)
        integer :: Tbc(MaxBiometRep)
        integer :: Tc(MaxBiometRep)
        integer :: Tbole(MaxBiometRep)
        integer :: Pa(MaxBiometRep)
        integer :: RH(MaxBiometRep)
        integer :: Rg(MaxBiometRep)
        integer :: Ruva(MaxBiometRep)
        integer :: Ruvb(MaxBiometRep)
        integer :: LWin(MaxBiometRep)
        integer :: LWout(MaxBiometRep)
        integer :: SWin(MaxBiometRep)
        integer :: SWout(MaxBiometRep)
        integer :: SWdif(MaxBiometRep)
        integer :: SWbc(MaxBiometRep)
        integer :: P(MaxBiometRep)
        integer :: Prain(MaxBiometRep)
        integer :: Psnow(MaxBiometRep)
        integer :: SNOWD(MaxBiometRep)
        integer :: Rn(MaxBiometRep)
        integer :: Rd(MaxBiometRep)
        integer :: Rr(MaxBiometRep)
        integer :: PPFD(MaxBiometRep)
        integer :: PPFDd(MaxBiometRep)
        integer :: PPFDr(MaxBiometRep)
        integer :: PPFDbc(MaxBiometRep)
        integer :: APAR(MaxBiometRep)
        integer :: Alb(MaxBiometRep)
        integer :: PRI(MaxBiometRep)
        integer :: LAI(MaxBiometRep)
        integer :: WS(MaxBiometRep)
        integer :: MWS(MaxBiometRep)
        integer :: WD(MaxBiometRep)
        integer :: StemFlow(MaxBiometRep)
        integer :: SapFlow(MaxBiometRep)
        integer :: TR(MaxBiometRep)
        integer :: SWC(MaxBiometRep)
        integer :: SHF(MaxBiometRep)
    end type BiometCountType

    type :: BiometUnitsType
        character(32) :: Ta(MaxBiometRep)
        character(32) :: Ts(MaxBiometRep)
        character(32) :: Tbc(MaxBiometRep)
        character(32) :: Tc(MaxBiometRep)
        character(32) :: Tbole(MaxBiometRep)
        character(32) :: Pa(MaxBiometRep)
        character(32) :: RH(MaxBiometRep)
        character(32) :: Rg(MaxBiometRep)
        character(32) :: Ruva(MaxBiometRep)
        character(32) :: Ruvb(MaxBiometRep)
        character(32) :: LWin(MaxBiometRep)
        character(32) :: LWout(MaxBiometRep)
        character(32) :: SWin(MaxBiometRep)
        character(32) :: SWout(MaxBiometRep)
        character(32) :: SWdif(MaxBiometRep)
        character(32) :: SWbc(MaxBiometRep)
        character(32) :: P(MaxBiometRep)
        character(32) :: Prain(MaxBiometRep)
        character(32) :: Psnow(MaxBiometRep)
        character(32) :: SNOWD(MaxBiometRep)
        character(32) :: Rn(MaxBiometRep)
        character(32) :: Rd(MaxBiometRep)
        character(32) :: Rr(MaxBiometRep)
        character(32) :: PPFD(MaxBiometRep)
        character(32) :: PPFDd(MaxBiometRep)
        character(32) :: PPFDr(MaxBiometRep)
        character(32) :: PPFDbc(MaxBiometRep)
        character(32) :: APAR(MaxBiometRep)
        character(32) :: Alb(MaxBiometRep)
        character(32) :: PRI(MaxBiometRep)
        character(32) :: LAI(MaxBiometRep)
        character(32) :: WS(MaxBiometRep)
        character(32) :: MWS(MaxBiometRep)
        character(32) :: WD(MaxBiometRep)
        character(32) :: StemFlow(MaxBiometRep)
        character(32) :: SapFlow(MaxBiometRep)
        character(32) :: TR(MaxBiometRep)
        character(32) :: SWC(MaxBiometRep)
        character(32) :: SHF(MaxBiometRep)
    end type BiometUnitsType

    type :: ProfileType
        real(kind = dbl) :: SWC(MaxProfRep, MaxProfNodes)
        real(kind = dbl) :: SHF(MaxProfRep, MaxProfNodes)
        real(kind = dbl) :: ST(MaxBiometRep, MaxProfNodes)
        real(kind = dbl) :: CO2(MaxBiometRep, MaxProfNodes)
        real(kind = dbl) :: H2O(MaxBiometRep, MaxProfNodes)
        real(kind = dbl) :: CH4(MaxBiometRep, MaxProfNodes)
        real(kind = dbl) :: GAS4(MaxBiometRep, MaxProfNodes)
        real(kind = dbl) :: T(MaxBiometRep, MaxProfNodes)
    end type ProfileType

    type :: ProfileCountType
        integer :: SWC(MaxProfRep, MaxProfNodes)
        integer :: SHF(MaxProfRep, MaxProfNodes)
        integer :: ST(MaxProfRep, MaxProfNodes)
        integer :: CO2(MaxProfRep, MaxProfNodes)
        integer :: H2O(MaxProfRep, MaxProfNodes)
        integer :: CH4(MaxProfRep, MaxProfNodes)
        integer :: GAS4(MaxProfRep, MaxProfNodes)
        integer :: T(MaxProfRep, MaxProfNodes)
    end type ProfileCountType

    type :: ProfileUnitsType
        character(32) :: SWC(MaxProfRep)
        character(32) :: SHF(MaxProfRep)
        character(32) :: ST(MaxBiometRep)
        character(32) :: CO2(MaxBiometRep)
        character(32) :: H2O(MaxBiometRep)
        character(32) :: CH4(MaxBiometRep)
        character(32) :: GAS4(MaxBiometRep)
        character(32) :: T(MaxBiometRep)
    end type ProfileUnitsType

    type BiometVarType
        real(kind = dbl) :: Ta
        real(kind = dbl) :: Pa
        real(kind = dbl) :: RH
        real(kind = dbl) :: Rg
        real(kind = dbl) :: LWin
        real(kind = dbl) :: PPFD
        real(kind = dbl) :: CO2
        real(kind = dbl) :: H2O
        real(kind = dbl) :: CH4
        real(kind = dbl) :: GAS4
        real(kind = dbl) :: prof_swc(MaxProfNodes)
        real(kind = dbl) :: prof_shf(MaxProfNodes)
        real(kind = dbl) :: prof_ts(MaxProfNodes)
        real(kind = dbl) :: prof_t(MaxProfNodes)
        real(kind = dbl) :: prof_co2(MaxProfNodes)
        real(kind = dbl) :: prof_h2o(MaxProfNodes)
        real(kind = dbl) :: prof_ch4(MaxProfNodes)
        real(kind = dbl) :: prof_gas4(MaxProfNodes)
    end type BiometVarType

    type :: OrdType
        character(32) :: var
        character(32) :: units
    end type OrdType

    type :: MetVarType
        character(32) :: id
        integer :: ord
    end type MetVarType

    type :: Mul7700Type
        real(kind = dbl) :: A
        real(kind = dbl) :: B
        real(kind = dbl) :: C
    end type Mul7700Type

    type :: MethType
        character(8)  :: det
        character(32) :: rot
        character(32) :: tlag
        character(32) :: wpl
        character(32) :: qcflag
        character(32) :: foot
        character(32) :: Hcorr
        type(SpecMethType) :: spec
    end type MethType

    type :: MFSetupType
        character(30) :: met_ext
        character(30) :: separator
        character(30) :: policy
        character(30) :: logger
        character(30) :: out_fname
        character(30) :: mtype
        character(30) :: dproto
        character(30) :: tproto
        logical :: tstamp_end
    end type MFSetupType

    type :: ModelParType
        real(kind = dbl) :: Wd
        real(kind = dbl) :: U
        real(kind = dbl) :: Us
        real(kind = dbl) :: L
    end type ModelParType

    type :: NSType
        real(kind = dbl) :: hf_lim
    end type NSType

    type :: AmbientStateType
        real(kind = dbl) :: VPD
        real(kind = dbl) :: Va
        real(kind = dbl) :: Vd
        real(kind = dbl) :: Ta
        real(kind = dbl) :: Td
        real(kind = dbl) :: Tmap
        real(kind = dbl) :: Tcell
        real(kind = dbl) :: Pcell
        real(kind = dbl) :: Ts
        real(kind = dbl) :: Q
        real(kind = dbl) :: lambda
        real(kind = dbl) :: bowen
        real(kind = dbl) :: sigma
        real(kind = dbl) :: e
        real(kind = dbl) :: es
        real(kind = dbl) :: p_d
        real(kind = dbl) :: RhoCp
        real(kind = dbl) :: WS
        real(kind = dbl) :: MWS
        real(kind = dbl) :: us
        real(kind = dbl) :: L
        real(kind = dbl) :: zL
        real(kind = dbl) :: alpha
    end type AmbientStateType

   type :: PFSetupType
        integer :: num_sec
        integer :: min_per_sec
        integer :: avrg_len
        integer :: wsect_end(MaxNumWSect)
        real(kind = dbl) :: width(MaxNumWSect)
        real(kind = dbl) :: w_max
        real(kind = dbl) :: u_min
        real(kind = dbl) :: north_offset
        real(kind = dbl) :: max_lack
        character(4) :: year
        character(10) :: start_date
        character(10) :: end_date
        character(32) :: fix
        logical :: wsect_exclude(MaxNumWSect)
    end type PFSetupType

   type :: RUsetupType
        integer :: its_sec_fact
        integer :: tlag_max
        character(32) :: meth
        character(32) :: its_meth
    end type RUsetupType

    type :: RPsetupType
        integer :: Tconst
        integer :: nfiles
        integer :: nspec
        integer :: avrg_len
        real(kind = dbl) :: max_lack
        real(kind = dbl) :: offset(3)
        character(32) :: tap_win
        character(32) :: bu_corr
        character(32) :: calib_aoa
        logical :: do_spectral_analysis
        logical :: use_geo_north
        logical :: power_of_two
        logical :: bu_multi
        logical :: filter_al
        logical :: filter_sr
        logical :: filter_spectra_by_qc
        logical :: filter_by_raw_flags
        logical :: calib_cw
        logical :: despike
        logical :: to_mixing_ratio
        logical :: pf_onthefly
        logical :: to_onthefly
        logical :: pf_subtract_b0
        logical :: recurse
        logical :: despike_vm
        logical :: out_biomet
        logical :: out_qc_details
        logical :: out_bin_sp
        logical :: out_bin_og
        logical :: out_full_sp(GHGNumVar)
        logical :: out_full_cosp(GHGNumVar)
        logical :: out_raw_var(E2NumVar)
        logical :: out_st(7)
        logical :: out_raw(7)
    end type RPsetupType

    type :: PrType
        real(kind = dbl) :: d
        real(kind = dbl) :: a
        real(kind = dbl) :: w
        real(kind = dbl) :: ws
        real(kind = dbl) :: VPD
    end type PrType

    type :: QCType
        integer :: w_u
        integer :: w_ts
        integer :: w_co2
        integer :: w_h2o
        integer :: w_ch4
        integer :: w_gas4
        integer :: u
        integer :: w
        integer :: ts
        integer :: tau
        integer :: co2
        integer :: h2o
        integer :: ch4
        integer :: gas4
        integer :: H
        character(32) :: Filename
        character(10) :: date
        character(5) :: time
    end type QCType

    type :: RegParType
        real(kind = dbl) :: Fn
        real(kind = dbl) :: fc
        real(kind = dbl) :: f2
        real(kind = dbl) :: e1
        real(kind = dbl) :: e2
        real(kind = dbl) :: e3
    end type RegParType

    type :: MassParType
        real(kind = dbl) :: a0
        real(kind = dbl) :: fpeak
        real(kind = dbl) :: mu
    end type MassParType

    type :: RotType
        real(kind = dbl) :: yaw
        real(kind = dbl) :: pitch
        real(kind = dbl) :: roll
        logical :: D3
    end type RotType

    type :: RHOType
        real(kind = dbl) :: d
        real(kind = dbl) :: a
        real(kind = dbl) :: w
    end type RHOType

    type :: RSCharFlagType
        character(9) :: sr
        character(9) :: ar
        character(9) :: do
        character(9) :: al
        character(9) :: sk
        character(9) :: ds
        character(9) :: tl
        character(9) :: aa
        character(9) :: ns
    end type RSCharFlagType

    type :: RSIntFlagType
        integer :: sr
        integer :: ar
        integer :: do
        integer :: al
        integer :: sk
        integer :: ds
        integer :: tl
        integer :: aa
        integer :: ns
    end type RSIntFlagType

    type :: ScalarType
        logical :: IsMixRatio
        logical :: IsMolFraction
        logical :: IsMolDensity
    end type ScalarType

    type :: SiteType
        real(kind = dbl) :: Alt
        real(kind = dbl) :: Lat
        real(kind = dbl) :: BarPr
        real(kind = dbl) :: canopy_height
        real(kind = dbl) :: d
        real(kind = dbl) :: z0
    end type SiteType

    type :: SKType
        real(kind = dbl) :: hf_skmin
        real(kind = dbl) :: hf_skmax
        real(kind = dbl) :: hf_kumin
        real(kind = dbl) :: hf_kumax
        real(kind = dbl) :: sf_skmin
        real(kind = dbl) :: sf_skmax
        real(kind = dbl) :: sf_kumin
        real(kind = dbl) :: sf_kumax
    end type SKType

    type :: SpectralType
        real(kind = dbl) :: of(GHGNumVar)
    end type SpectralType

    type :: SpectraSetType
        integer :: fnum
        real(kind = dbl) :: fn
        real(kind = dbl) :: fnorm
        real(kind = dbl) :: of(GHGNumVar)
    end type SpectraSetType

    type :: FitSpectraType
        real(kind = dbl) :: fnorm(GHGNumVar)
        real(kind = dbl) :: of(GHGNumVar)
    end type FitSpectraType

    type :: MeanSpectraType
        integer :: cnt(GHGNumVar)
        integer :: fnum(GHGNumVar)
        real(kind = dbl) :: fn(GHGNumVar)
        real(kind = dbl) :: of(GHGNumVar)
        real(kind = dbl) :: ts(GHGNumVar)
    end type MeanSpectraType

    type :: SRType
        integer :: num_spk
        real(kind = dbl) :: lim_u
        real(kind = dbl) :: lim_w
        real(kind = dbl) :: lim_co2
        real(kind = dbl) :: lim_h2o
        real(kind = dbl) :: lim_ch4
        real(kind = dbl) :: lim_gas4
        real(kind = dbl) :: hf_lim
    end type SRType

    type :: StationType
        real(kind = dbl) :: AcFreq
        real(kind = dbl) :: FileLength
        real(kind = dbl) :: hm
        real(kind = dbl) :: HorSep
        real(kind = dbl) :: VerSep
    end type StationType

    type :: StatsType
        real(kind = dbl) :: TKE
        real(kind = dbl) :: wind_dir
        real(kind = dbl) :: Mean(E2NumVar)
        real(kind = dbl) :: Cov(E2NumVar, E2NumVar)
        real(kind = dbl) :: StDev(E2NumVar)
        real(kind = dbl) :: Skw(E2NumVar)
        real(kind = dbl) :: Kur(E2NumVar)
        real(kind = dbl) :: d(E2NumVar)
        real(kind = dbl) :: chi(E2NumVar)
        real(kind = dbl) :: r(E2NumVar)
        real(kind = dbl) :: h2ocov_tl_co2
        real(kind = dbl) :: h2ocov_tl_ch4
        real(kind = dbl) :: h2ocov_tl_gas4
        real(kind = dbl) :: tc_cov_tl_co2
        real(kind = dbl) :: tc_cov_tl_h2o
        real(kind = dbl) :: tc_cov_tl_ch4
        real(kind = dbl) :: tc_cov_tl_gas4
        real(kind = dbl) :: T
        real(kind = dbl) :: Pr
        real(kind = dbl) :: RH
        real(kind = dbl) :: mT
        real(kind = dbl) :: mPr
        real(kind = dbl) :: mRH
        real(kind = dbl) :: mRg
        real(kind = dbl) :: mLWin
        real(kind = dbl) :: mPPFD
        logical :: daytime
        integer :: nlines
        character(32) :: Filename
        character(10) :: date
        character(10) :: mdate
        character(5) :: time
        character(5) :: mtime
    end type StatsType

    type :: UserStatsType
        real(kind = dbl) :: Mean(MaxUserVar)
        real(kind = dbl) :: Cov(MaxUserVar, MaxUserVar)
        real(kind = dbl) :: StDev(MaxUserVar)
        real(kind = dbl) :: Skw(MaxUserVar)
        real(kind = dbl) :: Kur(MaxUserVar)
        character(10) :: date
        character(5) :: time
    end type UserStatsType

    type :: StorType
        real(kind = dbl) :: H
        real(kind = dbl) :: LE
        real(kind = dbl) :: of(GHGNumVar)
    end type StorType

    type :: TestType
        logical :: sr
        logical :: ar
        logical :: do
        logical :: al
        logical :: sk
        logical :: ds
        logical :: tl
        logical :: aa
        logical :: ns
    end type TestType

    type :: TimeLagType
        real(kind = dbl) :: def
        real(kind = dbl) :: min
        real(kind = dbl) :: max
    end type TimeLagType

    type :: TimeLagDatasetType
        real(kind = dbl) :: tlag(E2NumVar)
        real(kind = dbl) :: RH
    end type TimeLagDatasetType

    type :: TimeLagOptType
        real(kind = dbl) :: Tlag(E2NumVar)
        real(kind = dbl) :: T
        real(kind = dbl) :: RH
    end type TimeLagOptType

    type :: TOSetupType
        integer :: h2o_nclass
        real(kind = dbl) :: h2o_class_size
        real(kind = dbl) :: co2_min_flux
        real(kind = dbl) :: ch4_min_flux
        real(kind = dbl) :: gas4_min_flux
        real(kind = dbl) :: le_min_flux
        real(kind = dbl) :: pg_range
        real(kind = dbl) :: min_lag(GHGNumVar)
        real(kind = dbl) :: max_lag(GHGNumVar)
        character(10) :: start_date
        character(10) :: end_date
    end type TOSetupType

    type :: TLType
        real(kind = dbl) :: def_co2
        real(kind = dbl) :: def_h2o
        real(kind = dbl) :: def_ch4
        real(kind = dbl) :: def_n2o
        real(kind = dbl) :: hf_lim
        real(kind = dbl) :: sf_lim
    end type TLType

    type :: TubeType
        real(kind = dbl) :: l
        real(kind = dbl) :: d
        real(kind = dbl) :: f
    end type TubeType

    type :: WPLType
        real(kind = dbl) :: dilut
        real(kind = dbl) :: exp
        real(kind = dbl) :: burba
    end type WPLType

    type :: ExType
        character(64) :: fname
        character(10) :: date
        character(5) :: time
        character(32) :: measure_type(GHGNumVar)
        character(8) :: det_meth
        character(10) :: vm_flags(12)
        integer :: file_records
        integer :: used_records
        integer :: spikes(GHGNumVar)
        real(kind = dbl) :: file_length
        real(kind = dbl) :: lat
        real(kind = dbl) :: lon
        real(kind = dbl) :: alt
        real(kind = dbl) :: licor_flags(29)
        real(kind = dbl) :: det_timec
        real(kind = dbl) :: unrot_u
        real(kind = dbl) :: unrot_v
        real(kind = dbl) :: unrot_w
        real(kind = dbl) :: rot_u
        real(kind = dbl) :: rot_v
        real(kind = dbl) :: rot_w
        real(kind = dbl) :: MWS
        real(kind = dbl) :: WS
        real(kind = dbl) :: WD
        real(kind = dbl) :: ustar
        real(kind = dbl) :: TKE
        real(kind = dbl) :: L
        real(kind = dbl) :: zL
        real(kind = dbl) :: Bowen
        real(kind = dbl) :: Tstar
        real(kind = dbl) :: d(GHGNumVar)
        real(kind = dbl) :: r(GHGNumVar)
        real(kind = dbl) :: chi(GHGNumVar)
        real(kind = dbl) :: Ts
        real(kind = dbl) :: Ta
        real(kind = dbl) :: Pa
        real(kind = dbl) :: RH
        real(kind = dbl) :: Va
        real(kind = dbl) :: RhoCp
        real(kind = dbl) :: e
        real(kind = dbl) :: es
        real(kind = dbl) :: Q
        real(kind = dbl) :: VPD
        real(kind = dbl) :: Tdew
        real(kind = dbl) :: Pd
        real(kind = dbl) :: Vd
        real(kind = dbl) :: lambda
        real(kind = dbl) :: sigma
        real(kind = dbl) :: Tcell
        real(kind = dbl) :: Pcell
        real(kind = dbl) :: Vcell(GHGNumVar)
        real(kind = dbl) :: Var(E2NumVar)
        real(kind = dbl) :: Cov_w(E2NumVar)
        real(kind = dbl) :: tlag(GHGNumVar)
        real(kind = dbl) :: yaw
        real(kind = dbl) :: pitch
        real(kind = dbl) :: roll
        real(kind = dbl) :: st_w_u
        real(kind = dbl) :: st_w_ts
        real(kind = dbl) :: st_w_co2
        real(kind = dbl) :: st_w_h2o
        real(kind = dbl) :: st_w_ch4
        real(kind = dbl) :: st_w_gas4
        real(kind = dbl) :: dt_u
        real(kind = dbl) :: dt_w
        real(kind = dbl) :: dt_ts
        real(kind = dbl) :: avrg_length
        real(kind = dbl) :: ac_freq
        real(kind = dbl) :: canopy_height
        real(kind = dbl) :: disp_height
        real(kind = dbl) :: rough_length
        real(kind = dbl) :: bWS
        real(kind = dbl) :: bzL
        real(kind = dbl) :: agc72
        real(kind = dbl) :: agc75
        real(kind = dbl) :: rssi77
        real(kind = dbl) :: user_var(MaxUserVar)
        real(kind = dbl) :: rand_uncer(E2NumVar)
        real(kind = dbl) :: rand_uncer_LE
        logical :: daytime
        logical :: var_present(GHGNumVar)
        logical :: def_tlag(GHGNumVar)
        type(StorType) :: Stor
        type(RhoType) :: RHO
        type(Mul7700Type) :: Mul7700
        type(BurbaType) :: Burba
        type(DegTType) :: degT
        type(InstrumentType) :: instr(ExNumInstruments)
        type(FluxType) :: Flux0
    end type ExType
end module m_typedef

