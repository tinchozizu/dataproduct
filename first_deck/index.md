---
title       : The presentation of Financial Calculator
subtitle    : Slidify presentation with extra documentation
author      : Martin Salvo
job         : Coursera Final Assignment
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## What is the purpose of Nominal and Effective Rate

The nominal interest rate is conceptually the simplest type of interest rate. It is quite simply the stated interest rate of a given bond or loan. This type of interest rate is referred to as the coupon rate for fixed income investments, as it is the interest rate guaranteed by the issuer that was traditionally stamped on the coupons that were redeemed by the bondholders.

The other type of interest rate that investors and borrowers should know is called the effective rate, which takes the power of compounding into account.

`Read more: Interest Rates Explained: Nominal, Real And Effective | Investopedia http://www.investopedia.com/articles/investing/082113/understanding-interest-rates-nominal-real-and-effective.asp#ixzz41F9wNUOz`  

--- 

## How they are related

This calculator compares both types of interest rates taking into account dates of the investment period and direct rate of return, also known as holding period return.

Where the relationship between nominal and effective rate is:
 $$ER = (1 + \frac{NominalRate}{nperyear})^{nperyear} - 1$$

--- 

## This is how is calculated in R the Effective Rate


```r
strDates <- c("01/01/2016", "01/31/2016")
dates <- as.Date(strDates, "%m/%d/%Y")

effectiveRate <- function(fvalue, ivalue, fdate, idate) { d <- as.numeric(fdate)-as.numeric(idate)
                                                          result <- (fvalue/ivalue)^(365/d)-1
                                                          return(result) }

effectiveRate(102.5, 100, dates[2], dates[1]) 
```

```
## [1] 0.350435
```

--- 

## This is how is calculated in R the Nominal Rate


```r
strDates <- c("01/01/2016", "01/31/2016")
dates <- as.Date(strDates, "%m/%d/%Y")

NominalRate <- function(fvalue, ivalue, fdate, idate) { d <- as.numeric(fdate)-as.numeric(idate) 
                                                        r <- (fvalue/ivalue)^(365/d)
                                                        result <- (r^(1/12)-1)*12
                                                        return(result) }

NominalRate(102.5, 100, dates[2], dates[1]) 
```

```
## [1] 0.304219
```
