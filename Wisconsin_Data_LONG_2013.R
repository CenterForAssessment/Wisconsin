############################################################################
###
### Script to create Wisconsin LONG data for 2013
###
############################################################################

### Load SGP package

require(SGP)
require(data.table)


### Load 2013 data sets

MATH_Data <- read.csv("Data/Base_Files/DAMIAN.WSAS/DAMIAN.WSAS.MATH.2013.csv")
READING_Data <- read.csv("Data/Base_Files/DAMIAN.WSAS/DAMIAN.WSAS.RDG.2013.csv")


### Create CSEM files

attach(MATH_Data)
MATH_Data_LONG <- data.table(
			VALID_CASE="VALID_CASE",
			ID=rep(as.character(ID), 6),
			CONTENT_AREA="MATHEMATICS", 
			YEAR=rep(as.character(2008:2013), each=dim(MATH_Data)[1]),
			GRADE=as.character(c(GRADE_2008, GRADE_2009, GRADE_2010, GRADE_2011, GRADE_2012, GRADE_2013)),
			SCALE_SCORE=c(SS_2008, SS_2009, SS_2010, SS_2011, SS_2012, SS_2013))
detach(MATH_Data)

attach(READING_Data)
READING_Data_LONG <- data.table(
			VALID_CASE="VALID_CASE",
			ID=rep(as.character(ID), 6),
			CONTENT_AREA="READING", 
			YEAR=rep(as.character(2008:2013), each=dim(READING_Data)[1]),
			GRADE=as.character(c(GRADE_2008, GRADE_2009, GRADE_2010, GRADE_2011, GRADE_2012, GRADE_2013)),
			SCALE_SCORE=c(SS_2008, SS_2009, SS_2010, SS_2011, SS_2012, SS_2013))
detach(READING_Data)

Wisconsin_Data_LONG <- rbind(MATH_Data_LONG, READING_Data_LONG)
Wisconsin_Data_LONG_2013 <- subset(Wisconsin_Data_LONG, YEAR=="2013" & !is.na(GRADE))


save(Wisconsin_Data_LONG_2013, file="Data/Wisconsin_Data_LONG_2013.Rdata")
