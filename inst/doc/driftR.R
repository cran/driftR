## ---- eval = FALSE-------------------------------------------------------
#  install.packages("driftR")
#  library(driftR)

## ----gh-installation, eval = FALSE---------------------------------------
#  install.packages("devtools")
#  devtools::install_github("shaughnessyar/driftR")

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_readSonde(file = "sondeData.csv", defineVar = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_readSonde(file = system.file("extdata", "rawData.csv", package = "driftR"),
#                              defineVar = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_factor(waterTibble, corrFactor = corfac, dateVar= Date,
#                           timeVar = Time, format = "MDY", keepDateTime = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_correctOne(waterTibble, sourceVar = SpCond, cleanVar = SpCond_corr,
#                             calVal = 1.07, calStd = 1, factorVar = corfac)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_correctTwo(waterTibble, sourceVar = pH, cleanVar = pH_corr, calValLow = 7.01,
#                             calStdLow = 7, calValHigh = 11.8, calStdHigh = 10, factorVar = corfac)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_drop(waterTibble, head = 6, tail = 6)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- rename(Turbidity = `Turbidity.`)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- select(waterTibble, Date, Time, dateTime, SpCond, SpCond_Corr, pH, pH_Corr, pHmV,
#               Chloride, Chloride_Corr, AmmoniumN, AmmoniumN_Corr, NitrateN, NitrateN_Corr,
#               Turbidity, Turbidity_Corr, DO, DO_Corr, corfac)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- select(waterTibble, -NitrateN)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- select(waterTibble, -c(NitrateN, pHmV))

## ---- eval=FALSE---------------------------------------------------------
#  write_csv(df, path = "waterData.csv", na = "NA")

## ---- eval=FALSE---------------------------------------------------------
#  # load needed packages
#  library(driftR)
#  library(dplyr)
#  library(readr)
#  
#  # import data exported from a Sonde
#  # example file located in the package
#  waterTibble <- dr_readSonde(file = system.file("extdata", "rawData.csv", package="driftR"),
#                              define = TRUE)
#  
#  # calculate correction factors
#  # results stored in new vector corrFac
#  waterTibble <- dr_factor(waterTibble, corrFactor = corrFac, dateVar = Date,
#                           timeVar = Time, format = "MDY", keepDateTime = TRUE)
#  
#  # apply one-point calibration to SpCond;
#  # results stored in new vector SpConde_Corr
#  waterTibble <- dr_correctOne(waterTibble, sourceVar = SpCond, cleanVar = SpCond_Corr,
#                               calVal = 1.07, calStd = 1, factorVar = corrFac)
#  
#  # apply one-point calibration to Turbidity.;
#  # results stored in new vector Turbidity_Corr
#  waterTibble <- rename(waterTibble, Turbidity = `Turbidity.`)
#  waterTibble <- dr_correctOne(waterTibble, sourceVar = Turbidity, cleanVar = Turbidity_Corr,
#                      calVal = 1.3, calStd = 0, factorVar = corrFac)
#  
#  # apply one-point calibration to DO;
#  # results stored in new vector DO_Corr
#  waterTibble <- dr_correctOne(waterTibble, sourceVar = DO, cleanVar = DO_Corr,
#                               calVal = 97.6, calStd = 99, factorVar = corrFac)
#  
#  # apply two-point calibration to pH;
#  # results stored in new vector ph_Corr
#  waterTibble <- dr_correctTwo(waterTibble, sourceVar = pH, cleanVar = pH_Corr,
#                               calValLow = 7.01, calStdLow = 7, calValHigh = 11.8,
#                               calStdHigh =  10, factorVar = corrFac)
#  
#  # apply two-point calibration to Chloride;
#  # results stored in new vector Chloride_Corr
#  waterTibble <- dr_correctTwo(waterTibble, sourceVar = Chloride, cleanVar = Chloride_Corr,
#                               calValLow = 11.6, calStdLow = 10, calValHigh = 1411,
#                               calStdHigh =  1000, factorVar = corrFac)
#  
#  # drop observations to account for instrument equilibration
#  waterTibble <- dr_drop(waterTibble, head=6, tail=6)
#  
#  # reorder variables
#  waterTibble <- select(waterTibble, Date, Time, dateTime, SpCond, SpCond_Corr, pH, pH_Corr, pHmV,
#                        Chloride, Chloride_Corr, AmmoniumN, NitrateN, Turbidity, Turbidity_Corr,
#                        DO, DO_Corr, corrFac)
#  
#  # export cleaned data
#  write_csv(waterTibble, path = "waterData.csv", na = "NA")

