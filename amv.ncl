;*************************************************
;*************************************************
begin
;==================================================
; This code calculates the annual AMV SST indices
; created by Hyacinth Nnamchi
; last updated on 21.07.2021
;==================================================
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
  

delete([/YYYY,iYYYY,f,TIME/])
;===============================================================================================================
;===============================================================================================================
;===============================================================================================================
;===================================

;==============================================================
;==============================================================
oisst = month_to_annual_weighted(yyyymm,OISST,1)   
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
  
; print(xxxxxx)
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
  
  ;HADI = lonFlip(HADI)
  printVarSummary(HADI)       ; variable overview

delete([/YYYY,iYYYY,f,TIME,f/])

 HADI = where(HADI.gt.-20.,HADI,HADI@_FillValue)

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
;list_vars()

COBE = dtrend_msg_n(COBE&year,COBE,True,False,0)
ERSST = dtrend_msg_n(ERSST&year,ERSST,True,False,0)
HADI = dtrend_msg_n(HADI&year,HADI,True,False,0)
KAPL = dtrend_msg_n(KAPL&year,KAPL,True,False,0)
OISST = dtrend_msg_n(OISST&year,OISST,True,False,0)
print("==============================================================")
print("==============================================================")
amv = new((/4,dimsizes(ERSST(:,0,0))/),float,ERSST@_FillValue)
amv(0,:) =  runave_n_Wrap(wgt_areaave_Wrap(COBE(year|:, {lon|-75:50}, {lat | 0:70}),1.0, 1.0, 0),10,0,0)	
amv(1,:) = runave_n_Wrap(wgt_areaave_Wrap(ERSST(year|:, {lon|-75:50}, {lat |0:70}),1.0, 1.0, 0),10,0,0)	
amv(2,16:) = runave_n_Wrap(wgt_areaave_Wrap(HADI(year|:, {lon|-75:50}, {lat |0:70}),1.0, 1.0, 0),10,0,0)	
amv(3,2:) = runave_n_Wrap(wgt_areaave_Wrap(KAPL(year|:, {lon|-75:50}, {lat | 0:70}),1.0, 1.0, 0),10,0,0)	
;amv(4,132:) = runave_n_Wrap(wgt_areaave_Wrap(OISST(year|:,{lon|-75:50}, {lat|0:70}),1.0, 1.0, 0),10,0,0)	
amv!0 = "dataset"
printVarSummary(amv)       ; variable overview
printMinMax(amv,True)
;----------------------------------------------------------------------
;=====================================================================
;----------------------------------------------------------------------
; Write the variable to a file 
;----------------------------------------------------------------------

    amv@long_name = "Atlantic Multidecadal Variability (AMV): Annual SST indices"

    if(WRITE_RESULTS) then
      rgrdFileName = "AMV.nc"
      system("rm -f " + rgrdFileName)
      rgrd_nc = addfile(rgrdFileName,"c")

;---Create variable to hold global file attributes
      global = True
      global@creator       = "Hyacinth C. Nnamchi (hyacinth.nnamchi@unn.edu.ng)"
      global@software         = "NCAR Command Language (NCL version '" + \
                             get_ncl_version() + "')"
      global@datasets  =	"COBE, ERSST, HadISST, KAPLAN"
      global@comments  =	"Indices are used for upper pannel of Figure 2.36 in the Working Group Contribution to IPCC AR6. See Technical Annex VI for definitions"
      global@creation_date = systemfunc("date")
    
      fileattdef(rgrd_nc,global)        ; copy global file attributes
;
      rgrd_nc->amv       = amv
      
    
     print("Variable saved to file !")
     
    end if
;===============================================================================================================
;===============================================================================================================
;===============================================================================================================         
end
