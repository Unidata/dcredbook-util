# Redbook Graphics Display with GEMPAK and LDM

Redbook Graphics are operational forecast products transmitted on the NWSTG channel of NOAAport. Redbook binary files contain georeferenced drawing commands and can be mapped and reprojected into any desired display area, and easily overlaid on any GEMPAK data set.

* [Sample Display of Redbook Products](http://www.unidata.ucar.edu/software/gempak/redbook/gifs.html)
* [Redbook Graphics Product Description [noaa.gov]](http://fxa.noaa.gov/doc/Redbook-graphics.html)

The script used below to generate the GIF output files can be found at [http://github.com/Unidata/dcredbook-util](http://github.com/Unidata/dcredbook-util). 

In addition to displaying in both gpmap and nmap2, Redbook products can be decoded with the dcredbook program:

* **dcredbook_gif** to output GIF images without an X window server
* **dcredbook_gf** to output GIF images with an X window server
* **dcredbook_ps** to output PostScript files
* **dcredbook_vg** to output vector graphic files

## LDM Pattern Action

These three pattern actions are included in the GEMPAK LDM template.
    
    # Redbook graphics processing
    # gif
    HRS     ^(P.....) (K[^WK]..|KW[^A].|KWA[^L]|KK[^C]|KKC[^I]) ([0-3][0-9][0-2][0-9][0-6][0-9])
            PIPE    -close  util/dcredbook.csh \1 \2 \3
    # postscript
    HRS     ^P..... (K[^WK]|KW[^A]|KWA[^L]|KK[^C]|KKC[^I])
            PIPE    -close  util/dcredbook_ps.csh
    # vg
    HRS     ^P..... (K[^WK]|KW[^A]|KWA[^L]|KK[^C]|KKC[^I])
            PIPE    -close  util/dcredbook_vg.csh -d data/logs/dcredbook_vg.log

## $GEMDATA/redbook File List

    /local/ldm/data/gempak/redbook% ls gifs
    90F-SFC_FRONTS_3H.gif    95E-5DAY_TOTAL_PRECIP.gif     HRY-SVR_TSTM_RPTS.gif      MPD-PRECIP_MED.gif
    90I-MSL_ISOBARS_3H.gif   97E.gif                       L2F-12H_FRZ_LVL_ANLYS.gif  P0W-OBS_WX_DPCN.gif
    90W-OBS_WX_DPCN_ANL.gif  9AM-SURFACE_GEO_WIND.gif      L2W-12H_WX_DPCN_LO.gif     RA1-MAR_ANLYS_ATL.gif
    92E-6H_QPF+6HR.gif       9AV-SURFACE_GEO_REL_VORT.gif  L4F-24H_FRZ_LVL_ANLYS.gif  RP1-MAR_ANLYS_PAC.gif
    93E-6H_QPF+12HR.gif      9EE-6H_QPF+18HR.gif           L4W-24H_WX_DPCN_LO.gif
    94Q-24H_DAY1_QPF.gif     9FE-6H_QPF+24HR.gif           MCD-MESO_CONV_DISC.gif
    /local/ldm/data/gempak/redbook% ls ps
    012.ps                          92E-6H_QPF+6HR.ps               HI4-HEAT_INDEX_3+85_DY6-10.ps
    100.ps                          92F-12H_FNT-MSL_PRS.ps          HI5-HEAT_INDEX_2+90_DY6-10.ps
    104.ps                          93E-6H_QPF+12HR.ps              HI6-HEAT_INDEX_1+95_DY6-10.ps
    120.ps                          93P-DAY3_MXMN_POP_ANM.ps        HI7-HEAT_INDEX_3+85_DY8-14.ps
    200.ps                          94E-EXCSV_RAIN_OTLK.ps          HI8-HEAT_INDEX_2+90_DY8-14.ps
    204.ps                          94F-24H_FNT-MSL_PRS.ps          HI9-HEAT_INDEX_1+95_DY8-14.ps
    220.ps                          94O-CNVTV_OTLK_DAY1.ps          HRY-SVR_TSTM_RPTS.ps
    300-DAY_3_HEAT_INDX_100F_MX.ps  94P-DAY4_MXMN_POP_ANM.ps        HX6-MAX_HEAT_INDEX_6_10_DAY.ps
    301.ps                          94Q-24H_DAY1_QPF.ps             HX8-MAX_HEAT_INDEX_8_14_DAY.ps
    304.ps                          95A-5DAY_MAX_TEMP_ANM.ps        I0P-PECIPITABLE_WATER.ps
    305-DAY_3_HEAT_INDX_105F_MX.ps  95B-5DAY_MIN_TEMP_ANM.ps        K72-72H_LOW_TRACKS.ps
    320.ps                          95E-5DAY_TOTAL_PRECIP.ps        L0A-RGL_FRZ_LVL.ps
    375-DAY_3_HEAT_INDX_75F_MN.ps   95P-DAY5_MXMN_POP_ANM.ps        L0F-RGL_FRZ_LVL_ANLYS.ps
    380-DAY_3_HEAT_INDX_80F_MN.ps   96C-6_10DY_500MB_ANM.ps         L2F-12H_FRZ_LVL_ANLYS.ps
    384-DAY_3_HEAT_INDX_85F_MN.ps   96E-6_10DY_TOTL_PRECP.ps        L2P-12H_INSTAN_PCPN.ps
    385-DAY_3_HEAT_INDX_85F.ps      96F-36H_FNT-MSL_PRS.ps          L2W-12H_WX_DPCN_LO.ps
    390-DAY_3_HEAT_INDX_90F.ps      96H-6_10DY_500MB_MN_HT.ps       L4F-24H_FRZ_LVL_ANLYS.ps
    395-DAY_3_HEAT_INDX_95F.ps      96P-DAY6_MXMN_POP_ANM.ps        L4P-24H_INSTAN_PCPN.ps
    396-DAY_3_HEAT_INDX_95F_MX.ps   96T-6_10DY_TEMP_ANM.ps          L4W-24H_WX_DPCN_LO.ps
    400-DAY_4_HEAT_INDX_100F_MX.ps  97E.ps                          L6P-36H_INSTAN_PCPN.ps
    405-DAY_4_HEAT_INDX_105F_MX.ps  97P-DAY1_MXMN_POP_ANM.ps        L8P-48H_INSTAN_PCPN.ps
    475-DAY_4_HEAT_INDX_75F_MN.ps   98C-8-14_DAY_500MB_HGT_ANOM.ps  MCD-MESO_CONV_DISC.ps
    480-DAY_4_HEAT_INDX_80F_MN.ps   98E-8-14_DAY_TOTAL_PRECIP.ps    MPD-PRECIP_MED.ps
    484-DAY_4_HEAT_INDX_85F_MN.ps   98F-48H_FNT-MSL_PRS.ps          OA2-DAY_2_SEVERE_PROB_OUTLK.ps
    485-DAY_4_HEAT_INDX_85F.ps      98H-8-14_DAY_MEAN_500MB_HGT.ps  OA3-DAY_3_SEVERE_PROB_OUTLK.ps
    48O.ps                          98O-SVR_OTLK_DAY2.ps            OH1-DAY_1_SEVERE_HAIL.ps
    490-DAY_4_HEAT_INDX_90F.ps      98Q-24H_DAY2_QPF.ps             OT1-DAY_1_TORNADO.ps
    495-DAY_4_HEAT_INDX_95F.ps      98T-8-14_DAY_TEMP_ANOM.ps       OW1-DAY_1_SEVERE_WINDS.ps
    496-DAY_4_HEAT_INDX_95F_MX.ps   99O-DAY_3_SEVERE_CAT_OUTLK.ps   P01-LIFTED_K_INDEX.ps
    500-DAY_5_HEAT_INDX_100F_MX.ps  99Q-24H_DAY3_QPF.ps             P03-RGL_PCP_WTR_PLT.ps
    505-DAY_5_HEAT_INDX_105F_MX.ps  9AM-SURFACE_GEO_WIND.ps         P0D-RGL_SFC-500_RH.ps
    575-DAY_5_HEAT_INDX_75F_MN.ps   9AV-SURFACE_GEO_REL_VORT.ps     P0N-OBS_MIN_TEMP-12H.ps
    580-DAY_5_HEAT_INDX_80F_MN.ps   9EE-6H_QPF+18HR.ps              P0P-OBS_PCPN-24H.ps
    584-DAY_5_HEAT_INDX_85F_MN.ps   9FE-6H_QPF+24HR.ps              P0S-OBS_SNOW_COVER.ps
    585-DAY_5_HEAT_INDX_85F.ps      9GE-6HR_QPF_VALID_30-36HRS.ps   P0W-OBS_WX_DPCN.ps
    590-DAY_5_HEAT_INDX_90F.ps      9HE-6HR_QPF_VALID_36-42HRS.ps   P0X-OBS_MAX_TEMP-12H.ps
    595-DAY_5_HEAT_INDX_95F.ps      9IE-6HR_QPF_VALID_42-48HRS.ps   RA0-SURFACE_ANLYS_ATL.ps
    596-DAY_5_HEAT_INDX_95F_MX.ps   9JE-6HR_QPF_VALID_48-54HRS.ps   RA1-MAR_ANLYS_ATL.ps
    600-DAY_6_HEAT_INDX_100F_MX.ps  9JH-DAY3_FNT_ISOBAR.ps          RA2-24H_WNDWAV_FCST_ATL.ps
    605-DAY_6_HEAT_INDX_105F_MX.ps  9KE-6H_QPF+54HR.ps              RA3-36H_WNDWAV_FCST_ATL.ps
    675-DAY_6_HEAT_INDX_75F_MN.ps   9KH-DAY4_FNT_ISOBAR.ps          RA4-48H_SURFACE_FCST_ATL.ps
    680-DAY_6_HEAT_INDX_80F_MN.ps   9LE-6H_QPF+60HR.ps              RA5-48H_WNDWAV_FCST_ATL.ps
    684-DAY_6_HEAT_INDX_85F_MN.ps   9LH-DAY5_FNT_ISOBAR.ps          RA6-96H_SURFACE_FCST_ATL.ps
    685-DAY_6_HEAT_INDX_85F.ps      9MH-144HR_SURFACE_FCST.ps       RA7-00H_WAVE_DRCT_ATL.ps
    690-DAY_6_HEAT_INDX_90F.ps      9NE-6H_QPF+72HR.ps              RP0-SURFACE_ANLYS_PAC.ps
    695-DAY_6_HEAT_INDX_95F.ps      9NH-168HR_SURFACE_FCST.ps       RP1-MAR_ANLYS_PAC.ps
    696-DAY_6_HEAT_INDX_95F_MX.ps   9OE-6H_QPF+66HR.ps              RP2-24H_WNDWAV_FCST_PAC.ps
    700-DAY_7_HEAT_INDX_100F_MX.ps  B2S-DAY1_PROB_GT12_SNOW.ps      RP3-24H_SURFACE_FCST_PAC.ps
    705-DAY_7_HEAT_INDX_105F_MX.ps  B4S-DAY1_PROB_GT04_SNOW.ps      RP4-48H_SURFACE_FCST_PAC.ps
    775-DAY_7_HEAT_INDX_75F_MN.ps   B5Z-DAY1_PROB_GT.25_ICE.ps      RP5-48H_WNDWAV_FCST_PAC.ps
    780-DAY_7_HEAT_INDX_80F_MN.ps   B8S-DAY1_PROB_GT08_SNOW.ps      RP6-96H_SURFACE_FCST_PAC.ps
    784-DAY_7_HEAT_INDX_85F_MN.ps   C2S-DAY2_PROB_GT12_SNOW.ps      RP7-00H_WAVE_DRCT_PAC.ps
    785-DAY_7_HEAT_INDX_85F.ps      C4S-DAY2_PROB_GT04_SNOW.ps      SVR-SEVERE_WEATHER_REPORTS.ps
    790-DAY_7_HEAT_INDX_90F.ps      C5Z-DAY2_PROB_GT.25_ICE.ps      TSA-SFC_PRES_ANL.ps
    795-DAY_7_HEAT_INDX_95F.ps      C8S-DAY2_PROB_GT08_SNOW.ps      U05-96HR_500MB_HGHT_UKM.ps
    796-DAY_7_HEAT_INDX_95F_MX.ps   D2S-DAY3_PROB_GT12_SNOW.ps      U06-120HR_500MB_HGHT_UKM.ps
    90F-SFC_FRONTS_3H.ps            D4S-DAY3_PROB_GT04_SNOW.ps      U07-144HR_500MB_HGHT_UKM.ps
    90I-MSL_ISOBARS_3H.ps           D5Z-DAY3_PROB_GT.25_ICE.ps      U16-96HR_PMSL_UKM.ps
    90N-NORM_MIN_TEMP_ANL.ps        D8S-DAY3_PROB_GT08_SNOW.ps      U17-120HR_PMSL_UKM.ps
    90W-OBS_WX_DPCN_ANL.ps          FW1-FW_OUTLOOK_DAY1.ps          U18-144HR_PMSL_UKM.ps
    90X-NORM_MAX_TEMP_ANL.ps        FW2-FW_OUTLOOK_DAY2.ps          UNKNOWN.ps
    91E-6H_QPF_UPD.ps               FW3.ps                          WNH-SIG_FLOOD_POTENTIAL.ps
    /local/ldm/data/gempak/redbook% ls vg
    012                          700-DAY_7_HEAT_INDX_100F_MX  9EE-6H_QPF+18HR              L4P-24H_INSTAN_PCPN
    100                          705-DAY_7_HEAT_INDX_105F_MX  9FE-6H_QPF+24HR              L4W-24H_WX_DPCN_LO
    104                          775-DAY_7_HEAT_INDX_75F_MN   9GE-6HR_QPF_VALID_30-36HRS   L6P-36H_INSTAN_PCPN
    120                          780-DAY_7_HEAT_INDX_80F_MN   9HE-6HR_QPF_VALID_36-42HRS   L8P-48H_INSTAN_PCPN
    200                          784-DAY_7_HEAT_INDX_85F_MN   9IE-6HR_QPF_VALID_42-48HRS   MCD-MESO_CONV_DISC
    204                          785-DAY_7_HEAT_INDX_85F      9JE-6HR_QPF_VALID_48-54HRS   MPD-PRECIP_MED
    220                          790-DAY_7_HEAT_INDX_90F      9JH-DAY3_FNT_ISOBAR          OA2-DAY_2_SEVERE_PROB_OUTLK
    300-DAY_3_HEAT_INDX_100F_MX  795-DAY_7_HEAT_INDX_95F      9KE-6H_QPF+54HR              OA3-DAY_3_SEVERE_PROB_OUTLK
    301                          796-DAY_7_HEAT_INDX_95F_MX   9KH-DAY4_FNT_ISOBAR          OH1-DAY_1_SEVERE_HAIL
    304                          90F-SFC_FRONTS_3H            9LE-6H_QPF+60HR              OT1-DAY_1_TORNADO
    305-DAY_3_HEAT_INDX_105F_MX  90I-MSL_ISOBARS_3H           9LH-DAY5_FNT_ISOBAR          OW1-DAY_1_SEVERE_WINDS
    320                          90N-NORM_MIN_TEMP_ANL        9MH-144HR_SURFACE_FCST       P01-LIFTED_K_INDEX
    375-DAY_3_HEAT_INDX_75F_MN   90W-OBS_WX_DPCN_ANL          9NE-6H_QPF+72HR              P03-RGL_PCP_WTR_PLT
    380-DAY_3_HEAT_INDX_80F_MN   90X-NORM_MAX_TEMP_ANL        9NH-168HR_SURFACE_FCST       P0D-RGL_SFC-500_RH
    384-DAY_3_HEAT_INDX_85F_MN   91E-6H_QPF_UPD               9OE-6H_QPF+66HR              P0N-OBS_MIN_TEMP-12H
    385-DAY_3_HEAT_INDX_85F      92E-6H_QPF+6HR               B2S-DAY1_PROB_GT12_SNOW      P0P-OBS_PCPN-24H
    390-DAY_3_HEAT_INDX_90F      92F-12H_FNT-MSL_PRS          B4S-DAY1_PROB_GT04_SNOW      P0S-OBS_SNOW_COVER
    395-DAY_3_HEAT_INDX_95F      93E-6H_QPF+12HR              B5Z-DAY1_PROB_GT.25_ICE      P0W-OBS_WX_DPCN
    396-DAY_3_HEAT_INDX_95F_MX   93P-DAY3_MXMN_POP_ANM        B8S-DAY1_PROB_GT08_SNOW      P0X-OBS_MAX_TEMP-12H
    400-DAY_4_HEAT_INDX_100F_MX  94E-EXCSV_RAIN_OTLK          C2S-DAY2_PROB_GT12_SNOW      RA0-SURFACE_ANLYS_ATL
    405-DAY_4_HEAT_INDX_105F_MX  94F-24H_FNT-MSL_PRS          C4S-DAY2_PROB_GT04_SNOW      RA1-MAR_ANLYS_ATL
    475-DAY_4_HEAT_INDX_75F_MN   94O-CNVTV_OTLK_DAY1          C5Z-DAY2_PROB_GT.25_ICE      RA2-24H_WNDWAV_FCST_ATL
    480-DAY_4_HEAT_INDX_80F_MN   94P-DAY4_MXMN_POP_ANM        C8S-DAY2_PROB_GT08_SNOW      RA3-36H_WNDWAV_FCST_ATL
    484-DAY_4_HEAT_INDX_85F_MN   94Q-24H_DAY1_QPF             D2S-DAY3_PROB_GT12_SNOW      RA4-48H_SURFACE_FCST_ATL
    485-DAY_4_HEAT_INDX_85F      95A-5DAY_MAX_TEMP_ANM        D4S-DAY3_PROB_GT04_SNOW      RA5-48H_WNDWAV_FCST_ATL
    48O                          95B-5DAY_MIN_TEMP_ANM        D5Z-DAY3_PROB_GT.25_ICE      RA6-96H_SURFACE_FCST_ATL
    490-DAY_4_HEAT_INDX_90F      95E-5DAY_TOTAL_PRECIP        D8S-DAY3_PROB_GT08_SNOW      RA7-00H_WAVE_DRCT_ATL
    495-DAY_4_HEAT_INDX_95F      95P-DAY5_MXMN_POP_ANM        FW1-FW_OUTLOOK_DAY1          RP0-SURFACE_ANLYS_PAC
    496-DAY_4_HEAT_INDX_95F_MX   96C-6_10DY_500MB_ANM         FW2-FW_OUTLOOK_DAY2          RP1-MAR_ANLYS_PAC
    500-DAY_5_HEAT_INDX_100F_MX  96E-6_10DY_TOTL_PRECP        FW3                          RP2-24H_WNDWAV_FCST_PAC
    505-DAY_5_HEAT_INDX_105F_MX  96F-36H_FNT-MSL_PRS          HI4-HEAT_INDEX_3+85_DY6-10   RP3-24H_SURFACE_FCST_PAC
    575-DAY_5_HEAT_INDX_75F_MN   96H-6_10DY_500MB_MN_HT       HI5-HEAT_INDEX_2+90_DY6-10   RP4-48H_SURFACE_FCST_PAC
    580-DAY_5_HEAT_INDX_80F_MN   96P-DAY6_MXMN_POP_ANM        HI6-HEAT_INDEX_1+95_DY6-10   RP5-48H_WNDWAV_FCST_PAC
    584-DAY_5_HEAT_INDX_85F_MN   96T-6_10DY_TEMP_ANM          HI7-HEAT_INDEX_3+85_DY8-14   RP6-96H_SURFACE_FCST_PAC
    585-DAY_5_HEAT_INDX_85F      97E                          HI8-HEAT_INDEX_2+90_DY8-14   RP7-00H_WAVE_DRCT_PAC
    590-DAY_5_HEAT_INDX_90F      97P-DAY1_MXMN_POP_ANM        HI9-HEAT_INDEX_1+95_DY8-14   SVR-SEVERE_WEATHER_REPORTS
    595-DAY_5_HEAT_INDX_95F      98C-8-14_DAY_500MB_HGT_ANOM  HRY-SVR_TSTM_RPTS            TSA-SFC_PRES_ANL
    596-DAY_5_HEAT_INDX_95F_MX   98E-8-14_DAY_TOTAL_PRECIP    HX6-MAX_HEAT_INDEX_6_10_DAY  U05-96HR_500MB_HGHT_UKM
    600-DAY_6_HEAT_INDX_100F_MX  98F-48H_FNT-MSL_PRS          HX8-MAX_HEAT_INDEX_8_14_DAY  U06-120HR_500MB_HGHT_UKM
    605-DAY_6_HEAT_INDX_105F_MX  98H-8-14_DAY_MEAN_500MB_HGT  I0P-PECIPITABLE_WATER        U07-144HR_500MB_HGHT_UKM
    675-DAY_6_HEAT_INDX_75F_MN   98O-SVR_OTLK_DAY2            K72-72H_LOW_TRACKS           U16-96HR_PMSL_UKM
    680-DAY_6_HEAT_INDX_80F_MN   98Q-24H_DAY2_QPF             L0A-RGL_FRZ_LVL              U17-120HR_PMSL_UKM
    684-DAY_6_HEAT_INDX_85F_MN   98T-8-14_DAY_TEMP_ANOM       L0F-RGL_FRZ_LVL_ANLYS        U18-144HR_PMSL_UKM
    685-DAY_6_HEAT_INDX_85F      99O-DAY_3_SEVERE_CAT_OUTLK   L2F-12H_FRZ_LVL_ANLYS        UNKNOWN
    690-DAY_6_HEAT_INDX_90F      99Q-24H_DAY3_QPF             L2P-12H_INSTAN_PCPN          WNH-SIG_FLOOD_POTENTIAL
    695-DAY_6_HEAT_INDX_95F      9AM-SURFACE_GEO_WIND         L2W-12H_WX_DPCN_LO
    696-DAY_6_HEAT_INDX_95F_MX   9AV-SURFACE_GEO_REL_VORT     L4F-24H_FRZ_LVL_ANLYS

