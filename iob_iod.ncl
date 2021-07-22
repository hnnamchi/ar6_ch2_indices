;*************************************************
;*************************************************
begin
;==================================================
;==================================================
;==================================================
; This code calculates the annual IOB and IOD SST indices
; created by Hyacinth Nnamchi
; last updated on 21.07.2021
;==================================================
; land-sea mask file
a    = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/landsea.nc","r")
  lsdata = a->LSMASK
 ;===============================================================================================================
;===============================================================================================================
yrStrt = 1982
yrLast = 2019

yyyymm = yyyymm_time(yrStrt, yrLast, "integer")
printVarSummary(yyyymm) 

year_base = 1994

 PLOT_RESULTS  = False
 WRITE_RESULTS = True 
 
;================================================================
;================================================================
;================================================================
; ===============================================================
; Open the file: Read only the user specified period
; ==============================================================
f      = addfile ("/home/hyacinth/work/datasets/sst/OISST_sst.mnmean.nc", "r")

  TIME   = f->time
  YYYY   = cd_calendar(TIME,-1)/100                 ; entire file
  iYYYY  = ind(YYYY.ge.yrStrt .and. YYYY.le.yrLast)

  OISST    = short2flt(f->sst(iYYYY,:,:))
  printVarSummary(OISST)       ; variable overview
  
  OISST!1  =  "lat"
  OISST!2  =  "lon"
  
  OISST = lonFlip(OISST)
  printVarSummary(OISST)       ; variable overview
  

  lsm = landsea_mask(lsdata,OISST&lat,OISST&lon)
  OISST = mask(OISST,conform(OISST,lsm,(/1,2/)).ge.1,False)
 
delete(lsm)
delete(lsdata)
delete([/YYYY,iYYYY,f,TIME/])
;===============================================================================================================
;===============================================================================================================
;===============================================================================================================
;===================================

;==============================================================
;==============================================================
oisst = month_to_annual_weighted(yyyymm,OISST,1)   ; tmp_annual_mean(20)
printVarSummary(oisst)       ; variable overview
delete(OISST)
;
print(oisst&year)
OISST = oisst	;pass metadata
OISST = oisst - conform(oisst,dim_avg_n_Wrap(oisst({year_base:},:,:),0), (/1,2/))
printMinMax(OISST,True)      
printVarSummary(OISST)       ; variable overview
;==============================================================


delete(yyyymm)
delete(oisst)
list_vars()

print("==============================================================")
print("==============================================================")


yrStrt = 1854

  
yyyymm = yyyymm_time(yrStrt, yrLast, "integer")
printVarSummary(yyyymm) 

xlabel = ispan(yrStrt,yrLast,1)

;================================================================
;================================================================
;================================================================
;================================================================
; ===============================================================
; Open the file: Read only the user specified period
; ==============================================================
f      = addfile ("/home/hyacinth/work/datasets/sst/NOAA_sst.mnmean.v5.nc", "r")
  TIME   = f->time
  YYYY   = cd_calendar(TIME,-1)/100                 ; entire file
  iYYYY  = ind(YYYY.ge.yrStrt .and. YYYY.le.yrLast)

  ERSST    = short2flt(f->sst(iYYYY,:,:))
  printVarSummary(ERSST)       ; variable overview
  
  ERSST!1  =  "lat"
  ERSST!2  =  "lon"
  
  ERSST = lonFlip(ERSST)
  printVarSummary(ERSST)       ; variable overview
  
 delete([/YYYY,iYYYY,f,TIME,f/])
;=========================================================================================
;=========================================================================================
ersst = month_to_annual_weighted(yyyymm,ERSST,1)   ; tmp_annual_mean(20)
printVarSummary(ersst)       ; variable overview
delete(ERSST)
;
print(ersst&year)
ERSST = ersst	;pass metadata
ERSST = ersst - conform(ersst,dim_avg_n_Wrap(ersst({year_base:},:,:),0), (/1,2/))
printMinMax(ERSST,True)      
printVarSummary(ERSST)       ; variable overview
;==============================================================


delete(yyyymm)
delete(ersst)
list_vars()

print("==============================================================")
print("==============================================================")





yrStrt = 1856

  
yyyymm = yyyymm_time(yrStrt, yrLast, "integer")
printVarSummary(yyyymm) 

;================================================================
; ===============================================================
; Open the file: Read only the user specified period
; ==============================================================
f      = addfile ("/home/hyacinth/work/datasets/sst/KAPLAN_sst.mon.anom.nc", "r")
  TIME   = f->time
  YYYY   = cd_calendar(TIME,-1)/100                 ; entire file
  iYYYY  = ind(YYYY.ge.yrStrt .and. YYYY.le.yrLast)

  KAPL    = short2flt(f->sst(iYYYY,:,:))
  printVarSummary(KAPL)       ; variable overview
  
  
  KAPL!1  =  "lat"
  KAPL!2  =  "lon"
  
  KAPL = lonFlip(KAPL)
  printVarSummary(KAPL)       ; variable overview

delete([/YYYY,iYYYY,f,TIME,f/])
;=========================================================================================
;=========================================================================================
kapl = month_to_annual_weighted(yyyymm,KAPL,1)   ; tmp_annual_mean(20)
printVarSummary(kapl)       ; variable overview
delete(KAPL)
;
print(kapl&year)
KAPL = kapl	;pass metadata
KAPL = kapl - conform(kapl,dim_avg_n_Wrap(kapl({year_base:},:,:),0), (/1,2/))
printMinMax(KAPL,True)      
printVarSummary(KAPL)       ; variable overview
;==============================================================


delete(yyyymm)
delete(kapl)
list_vars()

print("==============================================================")

yrStrt = 1870


  
yyyymm = yyyymm_time(yrStrt, yrLast, "integer")
printVarSummary(yyyymm) 
;================================================================
;================================================================
;================================================================
;================================================================
; ===============================================================
; Open the file: Read only the user specified period
; ==============================================================
f      = addfile ("/home/hyacinth/work/datasets/sst/HadISST_sst.nc", "r")
  TIME   = f->time
  YYYY   = cd_calendar(TIME,-1)/100                 ; entire file
  iYYYY  = ind(YYYY.ge.yrStrt .and. YYYY.le.yrLast)

  HADI    = short2flt(f->sst(iYYYY,:,:))
  printVarSummary(HADI)       ; variable overview
  
  
  HADI!1  =  "lat"
  HADI!2  =  "lon"
  
  printVarSummary(HADI)       ; variable overview

delete([/YYYY,iYYYY,f,TIME,f/])
;=========================================================================================
;=========================================================================================
hadi = month_to_annual_weighted(yyyymm,HADI,1)   ; tmp_annual_mean(20)
printVarSummary(hadi)       ; variable overview
delete(HADI)
;
print(hadi&year)
HADI = hadi	;pass metadata
HADI = hadi - conform(hadi,dim_avg_n_Wrap(hadi({year_base:},:,:),0), (/1,2/))
printMinMax(HADI,True)      
printVarSummary(HADI)       ; variable overview
;==============================================================


delete(yyyymm)
delete(hadi)
list_vars()

print("==============================================================")
print("==============================================================")

yrStrt = 1854



  
yyyymm = yyyymm_time(yrStrt, yrLast, "integer")
printVarSummary(yyyymm) 

;================================================================
; ===============================================================
; Open the file: Read only the user specified period
; ==============================================================
f      = addfile ("/home/hyacinth/work/datasets/sst/COBE_sst.mon.mean.nc", "r")
  TIME   = f->time
  YYYY   = cd_calendar(TIME,-1)/100                 ; entire file
  iYYYY  = ind(YYYY.ge.yrStrt .and. YYYY.le.yrLast)

  COBE    = short2flt(f->sst(iYYYY,:,:))
  printVarSummary(COBE)       ; variable overview
  
  
  COBE!1  =  "lat"
  COBE!2  =  "lon"
  
  COBE = lonFlip(COBE)
  printVarSummary(COBE)       ; variable overview

delete([/YYYY,iYYYY,f,TIME,f/])
;=========================================================================================
;=========================================================================================
cobe = month_to_annual_weighted(yyyymm,COBE,1)   ; tmp_annual_mean(20)
printVarSummary(cobe)       ; variable overview
delete(COBE)
;
print(cobe&year)
COBE = cobe	;pass metadata
COBE = cobe - conform(cobe,dim_avg_n_Wrap(cobe({year_base:},:,:),0), (/1,2/))
printMinMax(COBE,True)      
printVarSummary(COBE)       ; variable overview
;==============================================================


delete(yyyymm)
delete(cobe)
print("==============================================================")
print("==============================================================")
iob = new((/5,dimsizes(ERSST(:,0,0))/),float,ERSST@_FillValue)
iob(0,:) = wgt_areaave_Wrap(COBE(year|:, {lon|40:100}, {lat | -20:20}),1.0, 1.0, 0)	
iob(1,:) = wgt_areaave_Wrap(ERSST(year|:, {lon|40:100}, {lat | -20:20}),1.0, 1.0, 0)	
iob(2,16:) = wgt_areaave_Wrap(HADI(year|:, {lon|40:100}, {lat | -20:20}),1.0, 1.0, 0)	
iob(3,2:) = wgt_areaave_Wrap(KAPL(year|:, {lon|40:100}, {lat | -20:20}),1.0, 1.0, 0)	
iob(4,128:) = wgt_areaave_Wrap(OISST(year|:, {lon|40:100}, {lat | -20:20}),1.0, 1.0, 0)	

iob!0 = "lev"
iob&year = ERSST&year
printVarSummary(iob)       ; variable overview
printMinMax(iob,True)
;
iod = new((/5,dimsizes(ERSST(:,0,0))/),float,ERSST@_FillValue)
iod(0,:) = wgt_areaave_Wrap(COBE(year|:, {lon|50:70}, {lat | -10:10}),1.0, 1.0, 0) - wgt_areaave_Wrap(COBE(year|:, {lon|90:110}, {lat | -10:0}),1.0, 1.0, 0)	
iod(1,:) = wgt_areaave_Wrap(ERSST(year|:, {lon|50:70}, {lat |-10:10}),1.0, 1.0, 0) -wgt_areaave_Wrap(ERSST(year|:, {lon|90:110}, {lat | -10:0}),1.0, 1.0, 0)	
iod(2,16:) = wgt_areaave_Wrap(HADI(year|:, {lon|50:70}, {lat |-10:10}),1.0, 1.0, 0) -wgt_areaave_Wrap(HADI(year|:, {lon|90:110}, {lat | -10:0}),1.0, 1.0, 0)	
iod(3,2:) = wgt_areaave_Wrap(KAPL(year|:, {lon|50:70}, {lat |-10:10}),1.0, 1.0, 0) -wgt_areaave_Wrap(KAPL(year|:, {lon|90:110}, {lat | -10:0}),1.0, 1.0, 0)	
iod(4,128:) = wgt_areaave_Wrap(OISST(year|:, {lon|50:70}, {lat|-10:10}),1.0, 1.0, 0)-wgt_areaave_Wrap(OISST(year|:, {lon|90:110}, {lat |-10:0}),1.0, 1.0, 0)	

iod!0 = "lev"
iod!1 = "year"
iod&year = iob&year
printVarSummary(iod)       ; variable overview
printMinMax(iod,True)
;============================================================
;=====================================================================
;----------------------------------------------------------------------
; Write the variable to a file 
;----------------------------------------------------------------------

     iob@long_name = "Indian Ocean Basin (IOB) mode: Annual SST indices"

    if(WRITE_RESULTS) then
      rgrdFileName = "IOB.nc"
      system("rm -f " + rgrdFileName)
      rgrd_nc = addfile(rgrdFileName,"c")

;---Create variable to hold global file attributes
      global = True
      global@creator       = "Hyacinth C. Nnamchi (hyacinth.nnamchi@unn.edu.ng)"
      global@software         = "NCAR Command Language (NCL version '" + \
                             get_ncl_version() + "')"
      global@datasets  =	"COBE, ERSST, HadISST, KAPLAN, OISST"
      global@comments  =	"Indices are used for Figure 2.35 in the Working Group Contribution to IPCC AR6. See Technical Annex VI for definitions"
      global@creation_date = systemfunc("date")
    
      fileattdef(rgrd_nc,global)        ; copy global file attributes
;
      rgrd_nc->iob       = iob
      
    
     print("Variable saved to file !")
     
    end if

delete(rgrd_nc)

;
;============================================================
;----------------------------------------------------------------------
;=====================================================================
;----------------------------------------------------------------------
; Write the variable to a file 
;----------------------------------------------------------------------
    copy_VarAtts(iob,iod)	;copies metadata

    iod@long_name = "Indian Ocean Dipole (IOD) mode: Annual SST indices"

    if(WRITE_RESULTS) then
      rgrdFileName = "IOD.nc"
      system("rm -f " + rgrdFileName)
      rgrd_nc = addfile(rgrdFileName,"c")

;---Create variable to hold global file attributes
      global = True
      global@creator       = "Hyacinth C. Nnamchi (hyacinth.nnamchi@unn.edu.ng)"
      global@software         = "NCAR Command Language (NCL version '" + \
                             get_ncl_version() + "')"
      global@datasets  =	"COBE, ERSST, HadISST, KAPLAN, OISST"
      global@comments  =	"Indices are used for Figure 2.35 in the Working Group Contribution to IPCC AR6. See Technical Annex VI for definitions"
      global@creation_date = systemfunc("date")
    
      fileattdef(rgrd_nc,global)        ; copy global file attributes

      rgrd_nc->iod       = iod
      
    
     print("Variable saved to file !")
     
    end if

delete(rgrd_nc)

;===============================================================================================================
;===============================================================================================================
;=============================================================================================================== 
;===============================================================================================================
;===============================================================================================================
end
