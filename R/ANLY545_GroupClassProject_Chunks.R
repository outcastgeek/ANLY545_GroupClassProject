## @knitr installLibraries

install.packages("ggplot2")
install.packages("sqldf")
install.packages("dplyr")
install.packages("vcd")
install.packages("vcdExtra")
install.packages("logmult")
install.packages("MASS")
install.packages("mosaic")
install.packages("ca")
install.packages("effects")

## @knitr loadLibraries

library(ggplot2)
library(sqldf)
library(dplyr)
library(vcd)
library(vcdExtra)
library(logmult)
library(MASS)
library(mosaic)
library(ca)
library(effects)

## @knitr helperFunctions

# Obtains the full File Path
fullFilePath <- function(fileName)
{
  fileFolder <- "./data/"
  fileNamePath <- paste(fileFolder, fileName, sep = "")
  fileNamePath
}

# Converts column of Timestamps to Date
ttColToDate <- function(dFrame, colName) {
  dFrame[colName] <- as.POSIXct(dFrame[colName], origin="1970-01-01")
  dFrame
}

# Converts column to utf-8
toUtf8 <- function(column) {
  columnUtf8 <- iconv(enc2utf8(column), sub = "byte")
  columnUtf8
}

# Formats Data
fmt <- function(dt, caption = "") {
  fmt_dt <- dt %>%
    kable("latex", longtable = T, booktabs = T)
  fmt_dt
}

# Style Data
style <- function(dt, full_width = F, angle = 0) {
  style_dt <- dt %>%
    kable_styling(latex_options = "striped", full_width = full_width) %>%
    row_spec(0, angle = angle)
  style_dt
}

## @knitr loadSheets

#Set Data File Name:
AviationData_file <- "AviationData.csv"

# Absenteeism
AviationData <- AviationData_file %>%
  fullFilePath %>%
  read.csv(encoding = "UTF-8", header=TRUE, stringsAsFactors=FALSE, sep = ",")

## @knitr dataExploration

AviationData %>% dim()

AviationData %>% colnames()

AviationData %>% summary()

## @knitr dataAnalysis

1 + 1
