!***************************************************************************
! m_rp_global_var.f90
! -------------------
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
! \brief       Module containing variables common to EddyPro
! \author      Gerardo Fratini
! \note
! \sa
! \bug
! \deprecated
! \test
! \todo
!***************************************************************************
module m_rp_global_var
    use m_common_global_var
    implicit none
    save

    integer :: NumAllRow = 0
    integer :: NumSlowVar = 0

    type :: DateTimeArrayType
        character(10) :: date
        character(5) :: time
        type(DateType) :: dt_time
    end type DateTimeArrayType

    real(kind = dbl) :: refCounts(GHGNumVar)

    character(10), parameter :: rp_app              = 'EddyPro-RP'
    character(13), parameter :: SubDirStats         = 'eddypro_stats'
    character(20), parameter :: SubDirRaw           = 'eddypro_raw_datasets'
    character(18), parameter :: SubDirUserStats     = 'eddypro_user_stats'
    character(21), parameter :: SubDirBinOgives     = 'eddypro_binned_ogives'
    character(512) :: raw_out_header
    character(256) :: StatsDir
    character(256) :: UserStatsDir
    character(256) :: RawDir
    character(256) :: RawSubDir(7)
    character(256) :: BinCospectraDir
    character(256) :: BinOgivesDir
    character(256) :: CospectraDir
    character(256) :: St1_Path
    character(256) :: St2_Path
    character(256) :: St3_Path
    character(256) :: St4_Path
    character(256) :: St5_Path
    character(256) :: St6_Path
    character(256) :: St7_Path
    character(256) :: UserSt1_Path
    character(256) :: UserSt2_Path
    character(256) :: UserSt3_Path
    character(256) :: UserSt4_Path
    character(256) :: UserSt5_Path
    character(256) :: UserSt6_Path
    character(256) :: UserSt7_Path
    character(256) :: Slow_Path
    character(256) :: Essentials_Path
    character(256) :: PlanarFit_Path
    character(256) :: TimelagOpt_Path
    character(256) :: QCdetails_Path
    logical :: OutVarPresent(E2NumVar)
    logical :: TimeLagOptSelected

    !> global variables
    type(RPsetupType) :: RPsetup
    type(PFSetupType) :: PFSetup
    type(TOSetupType) :: TOSetup
    type(RUsetupType) :: RUsetup
    type(TimeLagType) :: toPasGas(E2NumVar)
    type(TimeLagType) :: toH2O(toMaxH2OClass)
    type(StatsType) :: Stats1
    type(StatsType) :: Stats2
    type(StatsType) :: Stats3
    type(StatsType) :: Stats4
    type(StatsType) :: Stats5
    type(StatsType) :: Stats6
    type(StatsType) :: Stats7
    type(TestType)     :: Test
    type(RSIntFlagType)  :: IntSF
    type(RSIntFlagType)  :: IntHF
    type(RSCharFlagType) :: CharSF
    type(RSCharFlagType) :: CharHF
    type(SRType) :: sr
    type(ARType) :: ar
    type(DOType) :: do
    type(ALType) :: al
    type(SKType) :: sk
    type(DSType) :: ds
    type(TLType) :: tl
    type(AAType) :: aa
    type(NSType) :: ns
    type(DriftCorrectionType) :: DriftCorr
    type(CalibType), allocatable :: Calib(:)
    type(CalibType), allocatable :: tmpCalib(:)
    type(tsDriftsType), allocatable :: tsDrifts(:)

    !> Flux related variables
    type (RHOType)  :: RHO
    type (FluxType) :: Flux0
    type (FluxType) :: Flux1
    type (FluxType) :: Flux2
    type (FluxType) :: Flux3
    type (BurbaType):: Burba
    type (BurbaParType) :: BurbaPar
    type (StorType) :: Stor
    type (Mul7700Type)   :: Mul7700

    !> Dynamic metadata
    type(DynMDType) :: DynamicMetadata
    integer :: DynamicMetadataOrder(256)

    !> biomet data related variables
    type(BiometSetupType) :: BiometSetup

    type(BiometType) :: Biomet(MaxNumBiometRow)
    type(ProfileType) :: Profile(MaxNumBiometRow)
    real(kind = dbl) :: CstmBiometSet(MaxNumBiometRow, MaxNumCstmBiometCol)
    real(kind = dbl) :: CstmBiomet(MaxNumCstmBiometCol)

    type(BiometType) :: E2Biomet
    type(ProfileType) :: E2Profile
    type(BiometCountType) :: CountBiomet
    type(ProfileCountType) :: CountProfile

    type(BiometVarType) :: BiometVar
    type(BiometVarType) :: PrevSlowVar

    type(BiometUnitsType) :: BiometUnits
    type(ProfileUnitsType) :: ProfileUnits

    type(OrdType) :: BiometOrd(300)
    type(OrdType) :: ProfileOrd(300)
    type(OrdType) :: CstmOrd(300)

    type(OrdType), parameter :: &
        NullOrd = OrdType('none', 'none')

    type(DynMDType), parameter :: &
        ErrDynamicMetadata = DynMDType('none', error, error, &
            error, error, error, error, error, error, NullInstrument)

    type(BiometType), parameter :: &
        ErrBiomet = BiometType('none', 'none', error, error, &
            error, error, error, error, error, error, error, error, error, error, error, &
            error, error, error, error, error, error, error, error, error, error, error, &
            error, error, error, error, error, error, error, error, error, error, error, &
            error, error, error, error, .false., .false., .false.)

    type(BiometVarType), parameter :: &
        ErrBiometVar = BiometVarType(error, error, error, error, error, error, error, error, error, error, &
            error, error, error, error, error, error, error, error)

    type(ProfileType), parameter :: &
        ErrProfile = ProfileType(error, error, error, error, error, &
            error, error, error)

    type(BiometType), parameter :: &
        NullBiomet = BiometType('none', 'none', 0d0, 0d0, &
            0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, &
            0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, &
            0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, 0d0, &
            0d0, 0d0, 0d0, 0d0, .false., .false., .false.)

    type(ProfileType), parameter :: &
        NullProfile = ProfileType(0d0, 0d0, 0d0, 0d0, 0d0, &
            0d0, 0d0, 0d0)

    type(BiometCountType), parameter :: &
        NullCountBiomet = BiometCountType(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    type(ProfileCountType), parameter :: &
        NullCountProfile = ProfileCountType(0, 0, 0, 0, 0, 0, 0, 0)

    type(BiometUnitsType), parameter :: &
        NullBiometUnits = BiometUnitsType('none', 'none', 'none', &
            'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', &
            'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', &
            'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', &
            'none', 'none', 'none')
    type(ProfileUnitsType), parameter :: &
        NullProfileUnits = ProfileUnitsType('none', 'none', 'none', 'none', 'none', &
            'none', 'none', 'none')

    !> Tags of the setup ".ini" file for rawscreening
    integer, parameter :: Nsn = 400
    integer, parameter :: Nsc = 100
    logical :: SNTagFound(Nsn)
    logical :: SCTagFound(Nsc)
    type (Numerical) :: SNTags(Nsn)
    type (Text) :: SCTags(Nsc)
    data SNTags(1)%Label   / 'sr_num_spk'    / &
         SNTags(2)%Label   / 'sr_lim_u'      / &
         SNTags(3)%Label   / 'sr_lim_hf'     / &
         SNTags(4)%Label   / 'ar_lim'        / &
         SNTags(5)%Label   / 'ar_bins'       / &
         SNTags(6)%Label   / 'ar_hf_lim'     / &
         SNTags(7)%Label   / 'do_extlim_dw'  / &
         SNTags(8)%Label   / 'do_hf1_lim'    / &
         SNTags(9)%Label   / 'do_hf2_lim'    / &
         SNTags(10)%Label  / 'al_u_max'      / &
         SNTags(11)%Label  / 'al_w_max'      / &
         SNTags(12)%Label  / 'al_tson_min'   / &
         SNTags(13)%Label  / 'al_tson_max'   / &
         SNTags(14)%Label  / 'al_co2_min'    / &
         SNTags(15)%Label  / 'al_co2_max'    / &
         SNTags(16)%Label  / 'al_h2o_min'    / &
         SNTags(17)%Label  / 'al_h2o_max'    / &
         SNTags(18)%Label  / 'sk_hf_skmin'   / &
         SNTags(19)%Label  / 'sk_hf_skmax'   / &
         SNTags(20)%Label  / 'sk_sf_skmin'   / &
         SNTags(21)%Label  / 'sk_sf_skmax'   / &
         SNTags(22)%Label  / 'sk_hf_kumin'   / &
         SNTags(23)%Label  / 'sk_hf_kumax'   / &
         SNTags(24)%Label  / 'sk_sf_kumin'   / &
         SNTags(25)%Label  / 'sk_sf_kumax'   / &
         SNTags(26)%Label  / 'ds_hf_uv'      / &
         SNTags(27)%Label  / 'ds_hf_w'       / &
         SNTags(28)%Label  / 'ds_hf_t'       / &
         SNTags(29)%Label  / 'ds_hf_co2'     / &
         SNTags(30)%Label  / 'ds_hf_h2o'     / &
         SNTags(31)%Label  / 'ds_hf_var'     / &
         SNTags(32)%Label  / 'ds_sf_uv'      / &
         SNTags(33)%Label  / 'ds_sf_w'       / &
         SNTags(34)%Label  / 'ds_sf_t'       / &
         SNTags(35)%Label  / 'ds_sf_co2'     / &
         SNTags(36)%Label  / 'ds_sf_h2o'     / &
         SNTags(37)%Label  / 'ds_sf_var'     / &
         SNTags(38)%Label  / 'tl_hf_lim'     / &
         SNTags(39)%Label  / 'tl_sf_lim'     / &
         SNTags(40)%Label  / 'tl_def_co2'    / &
         SNTags(41)%Label  / 'tl_def_h2o'    / &
         SNTags(42)%Label  / 'aa_min'        / &
         SNTags(43)%Label  / 'aa_max'        / &
         SNTags(44)%Label  / 'aa_lim'        / &
         SNTags(45)%Label  / 'ns_hf_lim'     / &
         SNTags(46)%Label  / 'timeconst'     / &
         SNTags(47)%Label  / 'nfiles'        / &
         SNTags(48)%Label  / 'nbins'         / &
         SNTags(49)%Label  / 'max_lack'      / &
         SNTags(50)%Label  / 'avrg_len'      / &
         SNTags(51)%Label  / 'u_offset'      / &
         SNTags(52)%Label  / 'v_offset'      / &
         SNTags(53)%Label  / 'w_offset'      / &
         SNTags(54)%Label  / 'sr_lim_w'      / &
         SNTags(55)%Label  / 'sr_lim_co2'    / &
         SNTags(56)%Label  / 'sr_lim_h2o'    / &
         SNTags(57)%Label  / 'sr_lim_ch4'    / &
         SNTags(58)%Label  / 'sr_lim_n2o'    / &
         SNTags(59)%Label  / 'al_ch4_min'    / &
         SNTags(60)%Label  / 'al_ch4_max'    / &
         SNTags(61)%Label  / 'al_n2o_min'    / &
         SNTags(62)%Label  / 'al_n2o_max'    / &
         SNTags(63)%Label  / 'ds_hf_ch4'     / &
         SNTags(64)%Label  / 'ds_hf_n2o'     / &
         SNTags(65)%Label  / 'ds_sf_ch4'     / &
         SNTags(66)%Label  / 'ds_sf_n2o'     / &
         SNTags(67)%Label  / 'tl_def_ch4'    / &
         SNTags(68)%Label  / 'tl_def_n2o'    / &
         SNTags(69)%Label  / 'pf_num_sec'    / &  !< no longer used
         SNTags(70)%Label  / 'pf_min_num_per_sec' / &
         SNTags(71)%Label  / 'pf_w_max'    / &
         SNTags(72)%Label  / 'pf_u_min'    /&
         SNTags(73)%Label / 'flag1_column'    / &
         SNTags(74)%Label / 'flag1_threshold' / &
         SNTags(75)%Label / 'flag1_upper'     / &
         SNTags(76)%Label / 'flag2_column'    / &
         SNTags(77)%Label / 'flag2_threshold' / &
         SNTags(78)%Label / 'flag2_upper'     / &
         SNTags(79)%Label / 'flag3_column'    / &
         SNTags(80)%Label / 'flag3_threshold' / &
         SNTags(81)%Label / 'flag3_upper'     / &
         SNTags(82)%Label / 'flag4_column'    / &
         SNTags(83)%Label / 'flag4_threshold' / &
         SNTags(84)%Label / 'flag4_upper'     / &
         SNTags(85)%Label / 'flag5_column'    / &
         SNTags(86)%Label / 'flag5_threshold' / &
         SNTags(87)%Label / 'flag5_upper'     / &
         SNTags(88)%Label / 'flag6_column'    / &
         SNTags(89)%Label / 'flag6_threshold' / &
         SNTags(90)%Label / 'flag6_upper'     / &
         SNTags(91)%Label / 'flag7_column'    / &
         SNTags(92)%Label / 'flag7_threshold' / &
         SNTags(93)%Label / 'flag7_upper'     / &
         SNTags(94)%Label / 'flag8_column'    / &
         SNTags(95)%Label / 'flag8_threshold' / &
         SNTags(96)%Label / 'flag8_upper'     / &
         SNTags(97)%Label / 'flag9_column'    / &
         SNTags(98)%Label / 'flag9_threshold' / &
         SNTags(99)%Label / 'flag9_upper'     / &
         SNTags(100)%Label / 'flag10_column'   / &
         SNTags(101)%Label / 'flag10_threshold'/ &
         SNTags(102)%Label / 'flag10_upper'    / &
         SNTags(103)%Label  / 'prof_swc' / &
         SNTags(104)%Label  / 'prof_shf' / &
         SNTags(105)%Label  / 'prof_ts'  / &
         SNTags(106)%Label  / 'prof_ta'  / &
         SNTags(107)%Label  / 'prof_co2' / &
         SNTags(108)%Label  / 'prof_h2o' / &
         SNTags(109)%Label  / 'prof_ch4' / &
         SNTags(110)%Label  / 'prof_gas4' / &
         SNTags(111)%Label  / 'biom_ta'   / &
         SNTags(112)%Label  / 'biom_pa'   / &
         SNTags(113)%Label  / 'biom_rh'   / &
         SNTags(114)%Label  / 'biom_ppfd' / &
         SNTags(115)%Label  / 'biom_lwin' / &
         SNTags(116)%Label  / 'biom_rg'   / &
         SNTags(117)%Label  / 'biom_co2'  / &
         SNTags(118)%Label  / 'biom_h2o'  / &
         SNTags(119)%Label  / 'biom_ch4'  / &
         SNTags(120)%Label  / 'biom_gas4' / &
         SNTags(121)%Label  / 'prof_t_z1'    / &
         SNTags(122)%Label  / 'prof_t_z2'    / &
         SNTags(123)%Label  / 'prof_t_z3'    / &
         SNTags(124)%Label  / 'prof_t_z4'    / &
         SNTags(125)%Label  / 'prof_t_z5'    / &
         SNTags(126)%Label  / 'prof_t_z6'    / &
         SNTags(127)%Label  / 'prof_t_z7'    / &
         SNTags(128)%Label  / 'prof_co2_z1'  / &
         SNTags(129)%Label  / 'prof_co2_z2'  / &
         SNTags(130)%Label  / 'prof_co2_z3'  / &
         SNTags(131)%Label  / 'prof_co2_z4'  / &
         SNTags(132)%Label  / 'prof_co2_z5'  / &
         SNTags(133)%Label  / 'prof_co2_z6'  / &
         SNTags(134)%Label  / 'prof_co2_z7'  / &
         SNTags(135)%Label  / 'prof_h2o_z1'  / &
         SNTags(136)%Label  / 'prof_h2o_z2'  / &
         SNTags(137)%Label  / 'prof_h2o_z3'  / &
         SNTags(138)%Label  / 'prof_h2o_z4'  / &
         SNTags(139)%Label  / 'prof_h2o_z5'  / &
         SNTags(140)%Label  / 'prof_h2o_z6'  / &
         SNTags(141)%Label  / 'prof_h2o_z7'  / &
         SNTags(142)%Label  / 'prof_ch4_z1'  / &
         SNTags(143)%Label  / 'prof_ch4_z2'  / &
         SNTags(144)%Label  / 'prof_ch4_z3'  / &
         SNTags(145)%Label  / 'prof_ch4_z4'  / &
         SNTags(146)%Label  / 'prof_ch4_z5'  / &
         SNTags(147)%Label  / 'prof_ch4_z6'  / &
         SNTags(148)%Label  / 'prof_ch4_z7'  / &
         SNTags(149)%Label  / 'prof_gas4_z1' / &
         SNTags(150)%Label  / 'prof_gas4_z2' / &
         SNTags(151)%Label  / 'prof_gas4_z3' / &
         SNTags(152)%Label  / 'prof_gas4_z4' / &
         SNTags(153)%Label  / 'prof_gas4_z5' / &
         SNTags(154)%Label  / 'prof_gas4_z6' / &
         SNTags(155)%Label  / 'prof_gas4_z7' / &
         SNTags(156)%Label  / 'm_day_bot1'        / &
         SNTags(157)%Label  / 'm_day_bot2'        / &
         SNTags(158)%Label  / 'm_day_bot3'        / &
         SNTags(159)%Label  / 'm_day_bot4'        / &
         SNTags(160)%Label  / 'm_day_top1'        / &
         SNTags(161)%Label  / 'm_day_top2'        / &
         SNTags(162)%Label  / 'm_day_top3'        / &
         SNTags(163)%Label  / 'm_day_top4'        / &
         SNTags(164)%Label  / 'm_day_spar1'       / &
         SNTags(165)%Label  / 'm_day_spar2'       / &
         SNTags(166)%Label  / 'm_day_spar3'       / &
         SNTags(167)%Label  / 'm_day_spar4'       / &
         SNTags(168)%Label  / 'm_night_bot1'      / &
         SNTags(169)%Label  / 'm_night_bot2'      / &
         SNTags(170)%Label  / 'm_night_bot3'      / &
         SNTags(171)%Label  / 'm_night_bot4'      / &
         SNTags(172)%Label  / 'm_night_top1'      / &
         SNTags(173)%Label  / 'm_night_top2'      / &
         SNTags(174)%Label  / 'm_night_top3'      / &
         SNTags(175)%Label  / 'm_night_top4'      / &
         SNTags(176)%Label  / 'm_night_spar1'     / &
         SNTags(177)%Label  / 'm_night_spar2'     / &
         SNTags(178)%Label  / 'm_night_spar3'     / &
         SNTags(179)%Label  / 'm_night_spar4'     / &
         SNTags(180)%Label  / 'l_day_bot_gain'    / &
         SNTags(181)%Label  / 'l_day_bot_offset'  / &
         SNTags(182)%Label  / 'l_day_top_gain'    / &
         SNTags(183)%Label  / 'l_day_top_offset'  / &
         SNTags(184)%Label  / 'l_day_spar_gain'   / &
         SNTags(185)%Label  / 'l_day_spar_offset' / &
         SNTags(186)%Label  / 'l_night_bot_gain'    / &
         SNTags(187)%Label  / 'l_night_bot_offset'  / &
         SNTags(188)%Label  / 'l_night_top_gain'    / &
         SNTags(189)%Label  / 'l_night_top_offset'  / &
         SNTags(190)%Label  / 'l_night_spar_gain'   / &
         SNTags(191)%Label  / 'l_night_spar_offset' / &
         SNTags(192)%Label  / 'biom_hlines'         / &
         SNTags(193)%Label  / 'mag_dec'             / &
         SNTags(194)%Label  / 'to_co2_min_flux'     / &
         SNTags(195)%Label  / 'to_ch4_min_flux'     / &
         SNTags(196)%Label  / 'to_gas4_min_flux'    / &
         SNTags(197)%Label  / 'to_le_min_flux'      / &
         SNTags(198)%Label  / 'to_pg_range'         / &
         SNTags(199)%Label  / 'to_co2_min_lag'      / &
         SNTags(200)%Label  / 'to_co2_max_lag'      / &
         SNTags(201)%Label  / 'to_h2o_min_lag'      / &
         SNTags(202)%Label  / 'to_h2o_max_lag'      / &
         SNTags(203)%Label  / 'to_ch4_min_lag'      / &
         SNTags(204)%Label  / 'to_ch4_max_lag'      / &
         SNTags(205)%Label  / 'to_gas4_min_lag'     / &
         SNTags(206)%Label  / 'to_gas4_max_lag'     / &
         SNTags(207)%Label  / 'to_h2o_nclass'       / &
         SNTags(208)%Label  / 'pf_north_offset'     / &
         SNTags(209)%Label  / 'pf_sect_1_width'     / &
         SNTags(210)%Label  / 'pf_sect_1_exclude' / &
         SNTags(211)%Label  / 'pf_sect_2_width'     / &
         SNTags(212)%Label  / 'pf_sect_2_exclude' / &
         SNTags(213)%Label  / 'pf_sect_3_width'     / &
         SNTags(214)%Label  / 'pf_sect_3_exclude' / &
         SNTags(215)%Label  / 'pf_sect_4_width'     / &
         SNTags(216)%Label  / 'pf_sect_4_exclude' / &
         SNTags(217)%Label  / 'pf_sect_5_width'     / &
         SNTags(218)%Label  / 'pf_sect_5_exclude' / &
         SNTags(219)%Label  / 'pf_sect_6_width'     / &
         SNTags(220)%Label  / 'pf_sect_6_exclude' / &
         SNTags(221)%Label  / 'pf_sect_7_width'     / &
         SNTags(222)%Label  / 'pf_sect_7_exclude' / &
         SNTags(223)%Label  / 'pf_sect_8_width'     / &
         SNTags(224)%Label  / 'pf_sect_8_exclude' / &
         SNTags(225)%Label  / 'pf_sect_9_width'     / &
         SNTags(226)%Label  / 'pf_sect_9_exclude' / &
         SNTags(227)%Label  / 'pf_sect_10_width'     / &
         SNTags(228)%Label  / 'pf_sect_10_exclude' / &
         SNTags(229)%Label  / 'pf_sect_11_width'     / &
         SNTags(230)%Label  / 'pf_sect_11_exclude' / &
         SNTags(231)%Label  / 'pf_sect_12_width'     / &
         SNTags(232)%Label  / 'pf_sect_12_exclude' / &
         SNTags(233)%Label  / 'pf_sect_13_width'     / &
         SNTags(234)%Label  / 'pf_sect_13_exclude' / &
         SNTags(235)%Label  / 'pf_sect_14_width'     / &
         SNTags(236)%Label  / 'pf_sect_14_exclude' / &
         SNTags(237)%Label  / 'pf_sect_15_width'     / &
         SNTags(238)%Label  / 'pf_sect_15_exclude' / &
         SNTags(239)%Label  / 'pf_sect_16_width'     / &
         SNTags(240)%Label  / 'pf_sect_16_exclude' /

    data SNTags(241)%Label  / 'pf_sect_17_width'     / &
         SNTags(242)%Label  / 'pf_sect_17_exclude' / &
         SNTags(243)%Label  / 'pf_sect_18_width'     / &
         SNTags(244)%Label  / 'pf_sect_18_exclude' / &
         SNTags(245)%Label  / 'pf_sect_19_width'     / &
         SNTags(246)%Label  / 'pf_sect_19_exclude' / &
         SNTags(247)%Label  / 'pf_sect_20_width'     / &
         SNTags(248)%Label  / 'pf_sect_20_exclude' / &
         SNTags(249)%Label  / 'pf_sect_21_width'     / &
         SNTags(250)%Label  / 'pf_sect_21_exclude' / &
         SNTags(251)%Label  / 'pf_sect_22_width'     / &
         SNTags(252)%Label  / 'pf_sect_22_exclude' / &
         SNTags(253)%Label  / 'pf_sect_23_width'     / &
         SNTags(254)%Label  / 'pf_sect_23_exclude' / &
         SNTags(255)%Label  / 'pf_sect_24_width'     / &
         SNTags(256)%Label  / 'pf_sect_24_exclude' / &
         SNTags(257)%Label  / 'pf_sect_25_width'     / &
         SNTags(258)%Label  / 'pf_sect_25_exclude' / &
         SNTags(259)%Label  / 'pf_sect_26_width'     / &
         SNTags(260)%Label  / 'pf_sect_26_exclude' / &
         SNTags(261)%Label  / 'pf_sect_27_width'     / &
         SNTags(262)%Label  / 'pf_sect_27_exclude' / &
         SNTags(263)%Label  / 'pf_sect_28_width'     / &
         SNTags(264)%Label  / 'pf_sect_28_exclude' / &
         SNTags(265)%Label  / 'pf_sect_29_width'     / &
         SNTags(266)%Label  / 'pf_sect_29_exclude' / &
         SNTags(267)%Label  / 'pf_sect_30_width'     / &
         SNTags(268)%Label  / 'pf_sect_30_exclude' / &
         SNTags(269)%Label  / 'pf_sect_31_width'     / &
         SNTags(270)%Label  / 'pf_sect_31_exclude' / &
         SNTags(271)%Label  / 'pf_sect_32_width'     / &
         SNTags(272)%Label  / 'pf_sect_32_exclude' / &
         SNTags(273)%Label  / 'pf_sect_33_width'     / &
         SNTags(274)%Label  / 'pf_sect_33_exclude' / &
         SNTags(275)%Label  / 'pf_sect_34_width'     / &
         SNTags(276)%Label  / 'pf_sect_34_exclude' / &
         SNTags(277)%Label  / 'pf_sect_35_width'     / &
         SNTags(278)%Label  / 'pf_sect_35_exclude' / &
         SNTags(279)%Label  / 'pf_sect_36_width'     / &
         SNTags(280)%Label  / 'pf_sect_36_exclude' / &
         SNTags(281)%Label  / 'ru_meth'            / &
         SNTags(282)%Label  / 'ru_its_meth'        / &
         SNTags(283)%Label  / 'ru_its_sec_factor'  / &
         SNTags(284)%Label  / 'ru_tlag_max'        /

    data SNTags(300)%Label  / 'drift_method'           / &
         SNTags(301)%Label  / 'drift_dir_co2_0'        / &
         SNTags(302)%Label  / 'drift_dir_co2_1'        / &
         SNTags(303)%Label  / 'drift_dir_co2_2'        / &
         SNTags(304)%Label  / 'drift_dir_co2_3'        / &
         SNTags(305)%Label  / 'drift_dir_co2_4'        / &
         SNTags(306)%Label  / 'drift_dir_co2_5'        / &
         SNTags(307)%Label  / 'drift_dir_co2_6'        / &
         SNTags(308)%Label  / 'drift_dir_h2o_0'        / &
         SNTags(309)%Label  / 'drift_dir_h2o_1'        / &
         SNTags(310)%Label  / 'drift_dir_h2o_2'        / &
         SNTags(311)%Label  / 'drift_dir_h2o_3'        / &
         SNTags(312)%Label  / 'drift_dir_h2o_4'        / &
         SNTags(313)%Label  / 'drift_dir_h2o_5'        / &
         SNTags(314)%Label  / 'drift_dir_h2o_6'        / &
         SNTags(315)%Label  / 'drift_dir_ch4_0'        / &
         SNTags(316)%Label  / 'drift_dir_ch4_1'        / &
         SNTags(317)%Label  / 'drift_dir_ch4_2'        / &
         SNTags(318)%Label  / 'drift_dir_ch4_3'        / &
         SNTags(319)%Label  / 'drift_dir_ch4_4'        / &
         SNTags(320)%Label  / 'drift_dir_ch4_5'        / &
         SNTags(321)%Label  / 'drift_dir_ch4_6'        / &
         SNTags(322)%Label  / 'drift_dir_gas4_0'        / &
         SNTags(323)%Label  / 'drift_dir_gas4_1'        / &
         SNTags(324)%Label  / 'drift_dir_gas4_2'        / &
         SNTags(325)%Label  / 'drift_dir_gas4_3'        / &
         SNTags(326)%Label  / 'drift_dir_gas4_4'        / &
         SNTags(327)%Label  / 'drift_dir_gas4_5'        / &
         SNTags(328)%Label  / 'drift_dir_gas4_6'        / &
         SNTags(329)%Label  / 'drift_inv_co2_0'        / &
         SNTags(330)%Label  / 'drift_inv_co2_1'        / &
         SNTags(331)%Label  / 'drift_inv_co2_2'        / &
         SNTags(332)%Label  / 'drift_inv_co2_3'        / &
         SNTags(333)%Label  / 'drift_inv_co2_4'        / &
         SNTags(334)%Label  / 'drift_inv_co2_5'        / &
         SNTags(335)%Label  / 'drift_inv_co2_6'        / &
         SNTags(336)%Label  / 'drift_inv_h2o_0'        / &
         SNTags(337)%Label  / 'drift_inv_h2o_1'        / &
         SNTags(338)%Label  / 'drift_inv_h2o_2'        / &
         SNTags(339)%Label  / 'drift_inv_h2o_3'        / &
         SNTags(340)%Label  / 'drift_inv_h2o_4'        / &
         SNTags(341)%Label  / 'drift_inv_h2o_5'        / &
         SNTags(342)%Label  / 'drift_inv_h2o_6'        / &
         SNTags(343)%Label  / 'drift_inv_ch4_0'        / &
         SNTags(344)%Label  / 'drift_inv_ch4_1'        / &
         SNTags(345)%Label  / 'drift_inv_ch4_2'        / &
         SNTags(346)%Label  / 'drift_inv_ch4_3'        / &
         SNTags(347)%Label  / 'drift_inv_ch4_4'        / &
         SNTags(348)%Label  / 'drift_inv_ch4_5'        / &
         SNTags(349)%Label  / 'drift_inv_ch4_6'        / &
         SNTags(350)%Label  / 'drift_inv_gas4_0'        / &
         SNTags(351)%Label  / 'drift_inv_gas4_1'        / &
         SNTags(352)%Label  / 'drift_inv_gas4_2'        / &
         SNTags(353)%Label  / 'drift_inv_gas4_3'        / &
         SNTags(354)%Label  / 'drift_inv_gas4_4'        / &
         SNTags(355)%Label  / 'drift_inv_gas4_5'        / &
         SNTags(356)%Label  / 'drift_inv_gas4_6'        / &
         SNTags(370)%Label  / 'drift_tempsens_b'        / &
         SNTags(371)%Label  / 'drift_tempsens_c'        /

    data SCTags(1)%Label  / 'data_path'    / &
         SCTags(2)%Label  / 'out_path'     / &
         SCTags(3)%Label  / 'test_sr'      / &
         SCTags(4)%Label  / 'test_ar'      / &
         SCTags(5)%Label  / 'test_do'      / &
         SCTags(6)%Label  / 'test_al'      / &
         SCTags(7)%Label  / 'test_sk'      / &
         SCTags(8)%Label  / 'test_ds'      / &
         SCTags(9)%Label /  'test_tl'      / &
         SCTags(10)%Label / 'test_aa'      / &
         SCTags(11)%Label / 'test_ns'      / &
         SCTags(12)%Label / 'flow_distortion'  / &
         SCTags(13)%Label / 'cross_wind'       / &
         SCTags(14)%Label / 'detrend_meth'     / &
         SCTags(15)%Label / 'rot_meth'         / &
         SCTags(16)%Label / 'tlag_meth'        / &
         SCTags(17)%Label / 'tap_win'          / &
         SCTags(18)%Label / 'make_dataset'     / &
         SCTags(19)%Label / 'recurse'          / &
         SCTags(20)%Label / 'me_file'          / &
         SCTags(21)%Label / 'to_file'          / &
         SCTags(22)%Label / 'start_date'       / &  !> not used
         SCTags(23)%Label / 'start_time'       / &  !> not used
         SCTags(24)%Label / 'end_date'         / &  !> not used
         SCTags(25)%Label / 'end_time'         / &  !> not used
         SCTags(26)%Label / 'out_bin_sp'       / &
         SCTags(27)%Label / 'out_full_sp_u'    / &
         SCTags(28)%Label / 'out_full_sp_v'    / &
         SCTags(29)%Label / 'out_full_sp_w'    / &
         SCTags(30)%Label / 'out_full_sp_ts'   / &
         SCTags(31)%Label / 'out_full_sp_co2'  / &
         SCTags(32)%Label / 'out_full_sp_h2o'  / &
         SCTags(33)%Label / 'out_full_sp_ch4'  / &
         SCTags(34)%Label / 'out_full_sp_n2o'  / &
         SCTags(35)%Label / 'out_full_cosp_w_u'   / &
         SCTags(36)%Label / 'out_full_cosp_w_v'   / &
         SCTags(37)%Label / 'out_full_cosp_w_ts'  / &
         SCTags(38)%Label / 'out_full_cosp_w_co2' / &
         SCTags(39)%Label / 'out_full_cosp_w_h2o' / &
         SCTags(40)%Label / 'out_full_cosp_w_ch4' / &
         SCTags(41)%Label / 'out_full_cosp_w_n2o' / &
         SCTags(42)%Label / 'out_st_1' / &
         SCTags(43)%Label / 'out_st_2' / &
         SCTags(44)%Label / 'out_st_3' / &
         SCTags(45)%Label / 'out_st_4' / &
         SCTags(46)%Label / 'out_st_5' / &
         SCTags(47)%Label / 'out_st_6' / &
         SCTags(48)%Label / 'out_st_7' / &
         SCTags(49)%Label / 'pf_start_date' / &
         SCTags(50)%Label / 'pf_end_date' / &
         SCTags(51)%Label / 'out_bin_og'  / &
         SCTags(52)%Label / 'out_ghg_eu'  / &
         SCTags(53)%Label / 'out_amflux'  / &
         SCTags(54)%Label / 'out_rich'    / &      !< not used
         SCTags(55)%Label / 'to_mixratio' / &
         SCTags(56)%Label / 'pf_mode'     / &
         SCTags(57)%Label / 'pf_file'     / &
         SCTags(58)%Label / 'biom_use_native_header' / &
         SCTags(59)%Label / 'biom_var_string'  / &   !< not used
         SCTags(60)%Label / 'biom_unit_string' / &   !< not used
         SCTags(61)%Label / 'biom_separator'   / &
         SCTags(62)%Label / 'biom_tstamp_ref'  / &
         SCTags(63)%Label / 'filter_sr'        / &
         SCTags(64)%Label / 'filter_al'        / &
         SCTags(65)%Label / 'bu_corr'          / &
         SCTags(66)%Label / 'bu_multi'         / &
         SCTags(67)%Label / 'qc_meth'          / &   !< not used
         SCTags(68)%Label / 'out_raw_1'        / &
         SCTags(69)%Label / 'out_raw_2'        / &
         SCTags(70)%Label / 'out_raw_3'        / &
         SCTags(71)%Label / 'out_raw_4'        / &
         SCTags(72)%Label / 'out_raw_5'        / &
         SCTags(73)%Label / 'out_raw_6'        / &
         SCTags(74)%Label / 'out_raw_7'        / &
         SCTags(75)%Label / 'out_raw_u'        / &
         SCTags(76)%Label / 'out_raw_v'        / &
         SCTags(77)%Label / 'out_raw_w'        / &
         SCTags(78)%Label / 'out_raw_ts'       / &
         SCTags(79)%Label / 'out_raw_co2'      / &
         SCTags(80)%Label / 'out_raw_h2o'      / &
         SCTags(81)%Label / 'out_raw_ch4'      / &
         SCTags(82)%Label / 'out_raw_gas4'     / &
         SCTags(83)%Label / 'out_raw_t_air'    / &
         SCTags(84)%Label / 'out_raw_p_air'    / &
         SCTags(85)%Label / 'out_qc_details'   / &
         SCTags(86)%Label / 'out_biomet'       / &  !< unused (used in EddyProProj instead)
         SCTags(87)%Label / 'power_of_two'     / &
         SCTags(88)%Label / 'pf_fix'           / &
         SCTags(89)%Label / 'use_geo_north'    / &
         SCTags(90)%Label / 'despike_vm'       / &
         SCTags(91)%Label / 'to_mode'          / &
         SCTags(92)%Label / 'to_file'          / &
         SCTags(93)%Label / 'to_start_date'    / &
         SCTags(94)%Label / 'to_end_date'      / &
         SCTags(95)%Label / 'filter_spectra_qc'/ &
         SCTags(96)%Label / 'pf_subtract_b0'   / &
         SCTags(97)%Label / 'pf_subset'        / &
         SCTags(98)%Label / 'to_subset'        /
end module m_rp_global_var
