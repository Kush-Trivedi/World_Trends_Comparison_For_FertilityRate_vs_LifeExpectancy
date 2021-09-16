# Load Data

getwd()
Data <- read.csv("LifeExpectancy.csv")
head(Data)
summary(Data)

#Plot initial visual
qplot(data=Data, x = Fertility.Rate, y = Year, size=I(4), colour = Region)

# Create Data Frame for Life Expectancy 1960 by using filters
Data1960Filter <- Data[Data$Year == "1960",]
head(Data1960Filter)
qplot(data=Data1960Filter, x = Fertility.Rate, y = Year, size=I(4), colour = Region)

# Create Data Frame for Life Expectancy 2013 by using filters
Data2013Filter <- Data[Data$Year == "2013",]
head(Data2013Filter)
qplot(data=Data2013Filter, x = Fertility.Rate, y = Year, size=I(4), colour = Region)

#Lets create data frame and add new values from vector and merge for 1960 only
myDataFrame1960 <- data.frame(Country_Code,Life_1960)
head(myDataFrame1960)
colnames(myDataFrame1960) <- c("Country.Code","Life.1960")


mergeData1960 <-  merge(Data1960Filter, myDataFrame1960, by.x = "Country.Code", by.y = "Country.Code")
head(mergeData1960)
mergeData1960$Year <- NULL

qplot(data = mergeData1960, x = Fertility.Rate, y = Life_1960, size=I(4), colour = Region,alpha = I(0.7), main = "Fertility Rate vs Life Expectancy - 1960")

#Lets create data frame and add new values from vector and merge for 2013
myDataFrame2013 <- data.frame(Country_Code,Life_2013)
head(myDataFrame2013)
colnames(myDataFrame2013) <- c("Country.Code","Life.2013")

mergedData2013 <- merge(Data2013Filter,myDataFrame2013, by.x = "Country.Code", by.y = "Country.Code")
head(mergedData2013)
mergedData2013$Year <- NULL

qplot(data = mergeData1960, x = Fertility.Rate, y = Life_2013, size=I(4), colour = Region,alpha = I(0.7),main = "Fertility Rate vs Life Expectancy - 2013")
