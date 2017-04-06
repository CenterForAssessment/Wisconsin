#####################################################################################
###
### Wisconsin SGP analyses for 2016
###
#####################################################################################

### Load SGP Package

require(SGP)


### Load data

load("Data/WSAS_ADDITIONAL.Rdata")


### abcSGP

Wisconsin_SGP <- abcSGP(
			WSAS_ADDITIONAL,
			state="WI",
#			steps=c("prepareSGP", "analyzeSGP", "combineSGP", "summarizeSGP", "outputSGP"),
			steps=c("prepareSGP", "analyzeSGP", "combineSGP", "outputSGP"),
			years= "2016",
			sgp.percentiles=TRUE,
			sgp.projections=TRUE,
			sgp.projections.lagged=TRUE,
			sgp.percentiles.baseline=FALSE,
			sgp.projections.baseline=FALSE,
			sgp.projections.lagged.baseline=FALSE)


### Save results

save(Wisconsin_SGP, file="Data/Wisconsin_SGP.Rdata")
