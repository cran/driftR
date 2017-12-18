## ---- eval=FALSE---------------------------------------------------------
#  driftData <- data.frame(
#    Date = c("9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015"),
#    Time = c("12:10:49", "12:15:50", "12:20:51", "12:25:51", "12:30:51", "12:35:51"),
#    Temp = c(14.76, 14.64, 14.57, 14.51, 14.50, 14.63),
#    SpCond = c(0.754, 0.750, 0.750, 0.749, 0.749, 0.749),
#    stringsAsFactors = FALSE
#  )

## ---- eval=FALSE---------------------------------------------------------
#  > mean(driftData$Temp)
#  [1] 14.60167

## ---- eval=FALSE---------------------------------------------------------
#  tidyMean <- function(data, variable){
#    mean(data[[variable]])
#  }

## ---- eval=FALSE---------------------------------------------------------
#  > tidyMean(driftData, Temp)
#    Error in (function(x, i, exact) if (is.matrix(i)) as.matrix(x)[[i]] else .subset2(x,  :
#     object 'Temp' not found

## ---- eval=FALSE---------------------------------------------------------
#  > tidyMean(driftData, "Temp")
#  [1] 14.60167

## ---- eval=FALSE---------------------------------------------------------
#  library("driftR")
#  
#  > dr_factor(driftData, corrFactor = corrFac,
#              dateVar = Date, timeVar = Time, format = "MDY")
#  #        Date     Time  Temp SpCond   corrFac
#  # 1 9/18/2015 12:10:49 14.76  0.754 0.0000000
#  # 2 9/18/2015 12:15:50 14.64  0.750 0.2003995
#  # 3 9/18/2015 12:20:51 14.57  0.750 0.4007989
#  # 4 9/18/2015 12:25:51 14.51  0.749 0.6005326
#  # 5 9/18/2015 12:30:51 14.50  0.749 0.8002663
#  # 6 9/18/2015 12:35:51 14.63  0.749 1.0000000
#  
#  > dr_factor(driftData, corrFactor = "corrFac",
#              dateVar = "Date", timeVar = "Time", format = "MDY")
#  #        Date     Time  Temp SpCond   corrFac
#  # 1 9/18/2015 12:10:49 14.76  0.754 0.0000000
#  # 2 9/18/2015 12:15:50 14.64  0.750 0.2003995
#  # 3 9/18/2015 12:20:51 14.57  0.750 0.4007989
#  # 4 9/18/2015 12:25:51 14.51  0.749 0.6005326
#  # 5 9/18/2015 12:30:51 14.50  0.749 0.8002663
#  # 6 9/18/2015 12:35:51 14.63  0.749 1.0000000

## ---- eval=FALSE---------------------------------------------------------
#  library("driftR")
#  
#  driftData <- driftData %>%
#    dr_factor(corrFactor = corrFac,
#              dateVar = Date,
#              timeVar = Time,
#              format = "MDY"
#              keepDateTime = TRUE) %>%
#    dr_correctOne(sourceVar = SpCond,
#                  cleanVar = SpCond_Corr,
#                  calVal = 1.07,
#                  calStd = 1,
#                  factorVar = corrFac)

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
#  # calculate correction factors and correct variables
#  waterTibble <- waterTibble %>%
#    dr_factor(corrFactor = corrFac, dateVar = Date,
#              timeVar = Time, format = "MDY", keepDateTime = TRUE) %>%
#    dr_correctOne(sourceVar = SpCond, cleanVar = SpCond_Corr,
#                  calVal = 1.07, calStd = 1, factorVar = corrFac) %>%
#    rename(Turbidity = `Turbidity.`) %>%
#    dr_correctOne(sourceVar = Turbidity, cleanVar = Turbidity_Corr,
#                 calVal = 1.3, calStd = 0, factorVar = corrFac) %>%
#    dr_correctOne(sourceVar = DO, cleanVar = DO_Corr, calVal = 97.6,
#                  calStd = 99, factorVar = corrFac) %>%
#    dr_correctTwo(sourceVar = pH, cleanVar = pH_Corr,
#                  calValLow = 7.01, calStdLow = 7, calValHigh = 11.8,
#                  calStdHigh =  10, factorVar = corrFac) %>%
#    dr_correctTwo(sourceVar = Chloride, cleanVar = Chloride_Corr,
#                  calValLow = 11.6, calStdLow = 10, calValHigh = 1411,
#                  calStdHigh =  1000, factorVar = corrFac) %>%
#    dr_drop(head=6, tail=6) %>%
#    select(Date, Time, SpCond, SpCond_Corr, pH, pH_Corr, pHmV,
#           Chloride, Chloride_Corr, AmmoniumN, NitrateN,
#           Turbidity, Turbidity_Corr, DO, DO_Corr, corrFac)
#  
#  # export cleaned data
#  write_csv(waterTibble, path = "waterData.csv", na = "NA")

