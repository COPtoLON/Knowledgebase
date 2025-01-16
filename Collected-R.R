#DB connections
library(RODBC)
library(data.table)
library(dplyr)
library(plyr)
library(purrr)
library(tidyverse)  ##

dbcon <- function(resultat)
{
  dbconnection <- odbcDriverConnect("Driver=SQL Server Native Client 11.0;Server=localhost; Database=FinanceTest;Uid=; Pwd=; trusted_connection=yes")
  df <- resultat
  values <- paste("(",df[1],",", df[2],",",df[3],",",df[4],",",df[5],",",df[6],",","'",df[7],"'",",","'",df[8],"'",",","'",df[9],"'",")", sep="", collapse=",")
  cmd <- paste("insert into dbo.Heston values ", values)
  sqlQuery(dbconnection, cmd, as.is=TRUE)
  odbcClose(dbconnection)
}

dbconnection <- odbcDriverConnect("Driver=SQL Server Native Client 11.0;Server=localhost; Database=FinanceTest;Uid=; Pwd=; trusted_connection=yes")
dataudvalg <- sqlQuery(dbconnection,paste("SELECT * FROM dbo.Heston"))





















# 1. programming basics

{
  #installing packages and interface
  
  #a. what does the GUI look like
  
  #b. Backend. Packages. help.
  
  install.packages("dplyr")
  install.packages("tidyverse")
  install.packages("ggplot2")
  
  library("readxl")
  library("xlsx")
  library(dplyr)
  
}

# 2. data, what does it look like and what is it?

#https://www.kaggle.com/datasets/asaniczka/university-employee-salaries-2011-present - university employee salaries
#https://www.kaggle.com/datasets/divu2001/coffee-shop-sales-analysis - coffee dataset

{
  
  # basic data entry

  {  
  x <- c(1,2,3,4,5,6,7)
  
  x <- c(1,2,3,4,5,6,7,NaN)
  
  x <- list(x)
  
  x <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)
  
  data_frame <- data.frame(x = c(1,2,3,4,5), y =c(10,20,30,40,50))
  }

  # reading and writing data
  
  { 
    data <- read.csv("E:\\Project.csv")
    
    write.csv("")
    
    my_data <- read_xlsx("E:\\Python\\exceltest.xlsx")
    
    my_data <- read_xlsx("E:\\Python\\exceltest.xlsx", sheet = "aktier")
    
    write.xlsx(my_data, "E:\\Python\\exceltest2.xlsx", sheetName = "Sheet1", 
               col.names = TRUE, row.names = TRUE, append = FALSE)
  }
  
  # subsetting and data manipulation
  
  {  
    weather[weather$MinTemp > 10,]
    
    # adding columns, removing columns and modifying columns
    
    # Adding columns
    df <- data.frame(a = c('A', 'B', 'C', 'D', 'E'),
                     b = c(45, 56, 54, 57, 59),
                     new1 = c(3, 3, 6, 7, 8),
                     new2 = c(13, 14, 16, 17, 20))
    
    
    new_test <- c(16, 17, 20, 23, 27)
    df_new <- cbind(df, new_test)
    
    
    # removing
    dplyr::select(weather, -c(MinTemp))
    
    
    # modifying columns
    df_new$new_test[df_new$a == "B"]  <- df_new$new_test[df_new$a == "B"] * 10
    
    df_new$new_test <-replace(df_new$new_test, df_new$a == "B", 0) 
    
    df_new[3,5] # row, column
    
    for (i in 1:5)
    {
      
      if (df_new[i,5] < 10)
      {df_new[i,5] <- "test"}
      
      print(df_new[i,5])
      
    }
    
    }
  
}


chisq.test(data$store_id, data$product_id)

data$store_id[data$store_id == NA] = 3

data <- rbind(data, a)
a <- c(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

nas <- data[!complete.cases(data),]

names(weather)

# 3. basic descriptive statistics

{
  
  sum(weather$MinTemp) #, na.rm=TRUE
  mean(weather$MinTemp)
  var(weather$MinTemp)
  summary(weather)
  
  # checking for na values
  is.na(weather$Sunshine)
  # checking for types
  is.numeric(weather$MinTemp)
  is.character(weather$RainToday)
  
}


# 4. advanced fundamentals

{

  for (x in 1:10) {
    print(x)
  }
  
  
  if (b > a) {
    print("b is greater than a")
  } else if (a == b) {
    print("a and b are equal")
  } else {
    print("a is greater than b")
  }
  
  
  sumofsquares <- function(x,y)
  {
    sumsq <- sum(c(x^2,y^2))
    return(sumsq)
  }
  
}


#sequences
1:10
seq(1,10)
seq(10,30,2)

#repetitions
rep(1:10,2)

#random numbers

rnorm(100, 0, 1)

rbinom(100, 2, 0.5)

rpois(100, 2)

#...

#statistiske tests

{


# basale statistiske tests, p-value skal altid være så tæt på 1 som muligt

t.test(weather$MaxTemp, mu = 7.25) 

# normal fordelingen eksempel

{
  x <- seq(-4, 4, length=100)
  
  population_mean = 0
  population_sd = 1
  
  y <- dnorm(x, population_mean, population_sd)
  
  plot(x,y, type = "l", lwd = 2, axes = FALSE, xlab = "", ylab = "")
  axis(1, at = -3:3, labels = c("-3s", "-2s", "-1s", "mean", "1s", "2s", "3s"))
  
  t.test(x, mu = 0)
  
}

# binomial fordelingen eksempel

{
  
  x <- seq(0, 10, length=11)
  
  n = 10
  p = 0.3
  
  y <- dbinom(x, n, p)
  
  plot(x,y, type = "l", lwd = 2, axes = FALSE, xlab = "", ylab = "")
  axis(1, at = 0:5)
  
  t.test(x, mu = 0)
  
}




# R program mht. confidens interval

middelværdi
mean_value <- mean(weather$MaxTemp)

# størrelse
n <- length(weather$MaxTemp)

# standardafvigelse
standard_deviation <- sd(weather$MaxTemp)

# standard fejlmargin
standard_error <- standard_deviation / sqrt(n)
alpha = 0.05
degrees_of_freedom = n - 1
t_score = qt(p=alpha/2, df=degrees_of_freedom,lower.tail=F)
margin_error <- t_score * standard_error

# øvre og nedre grænse
lower_bound <- mean_value - margin_error
upper_bound <- mean_value + margin_error

# confidens interval
print(c(lower_bound,upper_bound))





confidens_interval <- function(data, alpha = 0.05)
{
  mean_value <- mean(data)
  standard_deviation <- sd(weather$MaxTemp)
  standard_error <- standard_deviation / sqrt(length(data))
  degrees_of_freedom = length(data) - 1
  t_score = qt(p=alpha/2, df=degrees_of_freedom,lower.tail=F)
  margin_error <- t_score * standard_error
  
  # øvre og nedre grænse
  lower_bound <- mean_value - margin_error
  upper_bound <- mean_value + margin_error

  return(c(lower_bound, upper_bound))
}



z.test = function(x, mu, popvar)
{
  one.tail.p <- NULL
  z.score <- round((mean(x)-mu)/(popvar/sqrt(length(x))),3)
  one.tail.p <- round(pnorm(abs(z.score), lower.tail = FALSE),3)
  cat(" z =", z.score, "\n",
      "one-tailed probability =", one.tail.p,"\n",
      "two-tailed probability =", 2*one.tail.p)}


testset <- rnorm(100, 0, 1)    
mean(testset)
var(testset)

#test på enkelt dataset omkring middelværdien
z.test(testset, 1.51, 0.512)


# test på enkelt dataset omkring variansen
install.packages("EnvStats")
library(EnvStats)
varTest(testset, alternative = "greater", conf.level = 0.95, sigma.squared = 1.25)


z.test2 = function(x,y, popsd1, popsd2)
{
  one.tail.p <- NULL
  std.error <- sqrt((popsd1^2 / length(x) + popsd2^2 / length(y)))
  z.score <- round((mean(x)-mean(y))/std.error,3)
  one.tail.p <- round(pnorm(abs(z.score), lower.tail = FALSE),3)
  cat(" mean1 =", mean(x), " ", "mean2 =", mean(y), "\n",
      "standard error =", std.error, "\n",
      " z =", z.score, "\n",
      "one-tailed probability =", one.tail.p,"\n",
      "two-tailed probability =", 2*one.tail.p)
}

#test på om middelværdien mellem de to sæt matcher
z.test2(machine1, machine2, 1, 1)



machine1 = rnorm(100, 0, 1) 
machine2 = rnorm(100, 0, 1)  

# om middelværdien af de to dataset er parret
t.test(machine1, machine2, alternative = "greater", paired = TRUE)

# varians test mellem to dataset
var.test(machine1, machine2, ratio=1, alternative = "two.sided")

}




#scale of measurement
scale_of_measurement <- function(x)
{
  if (typeof(x) == "character")
  {
    print("nonparametric, either Ordinal or Nominal")
  } else if (typeof(x)  != "character")
  {
    print("parametric, either Interval Scale or Ratio Scale")
    if (typeof(x) == "integer")
    {
      print("the type is integer, which is usually used for to indicate discreet pieces.Examples are numbers of bananas purchased, wheels on cars, days until weekend or the alike. Integers are useful for indicating these whole pieces or amounts of something.")
    } else if (typeof(x) == "double")
    {
      print("the type is a double, also called a float. Which is used to indicate something with a continuous piece. Examples are prices, distances and most other things in the real world, which aren't cut into neat pieces.")
    }
  }
}
scale_of_measurement(weather$MinTemp)
scale_of_measurement(weather$RainToday)

# frequency table
frekvenstabel <- function(data, nedre = "", ovre = "")
{

  data <- data[complete.cases(data)]
  
  if (nedre != "")
  {
    data <- data[data >= nedre]
  }
  
  if (ovre != "")
  {
    data <- data[data <= ovre]
  }
  
  
  unikke <- unique(data)
  count <- c()
  
  for (i in 1:length(unikke))
  {
    n <- 0
    
    for (j in 1:length(data))
    {
      if (data[j] == unikke[i])
      {
        n <- n + 1
        
      }
    }
    count[i] = n
  }
  
  results <- data.frame(count,unikke)
  results <- results[order(results$unikke, decreasing = TRUE),]
  rownames(results) <- NULL
  return(results)
}
a <- frekvenstabel(weather$MinTemp, 8.0, 10)



# number of empty slots
n_missing <- function(data)
{
  length(data[is.na(data)])
}
n_missing(weather)


# data sorting
{
weather[order(weather$MinTemp, decreasing = TRUE) & weather$WindGustDir == "NNE", ]

nas <- weather[!complete.cases(weather),]
not_nas <- weather[complete.cases(weather),]
no_nas_no_outliers <- quantile(weather$Rainfall, probs=c(.05, .95), na.rm = FALSE)

weather[weather$WindGustDir == "NNE", ]
}

#plots
{
library(ggplot2)
library(dplyr)

a <- a %>% 
  arrange(desc(unikke)) %>%
  mutate(prop = count / sum(a$count) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )

# Barplot
ggplot(a, aes(x=unikke, y=count)) + 
  geom_bar(stat = "identity", width=0.5) 


ggplot(a, aes(x="", y=prop, fill=unikke)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  theme_void() + 
  theme(legend.position="none") +
  
  geom_text(aes(y = ypos, label = unikke), color = "white", size=10) 

hist(weather$MinTemp)


cum_freq_plot <- function(data)
{break_points <-seq(min(data), max(data), by=1)
data_transform = cut(data, break_points,
                     right=FALSE)
# creating the frequency table
freq_table = table(data_transform)


cumulative_freq = c(0, cumsum(freq_table))
#print("Cumulative Frequency")
#print(cumulative_freq)
# plotting the data
plot(break_points, cumulative_freq,
     xlab="Data Points",
     ylab="Cumulative Frequency")
# creating line graph
lines(break_points, cumulative_freq)}

cum_freq_plot(weather$MaxTemp)


library(hexbin)

bin<-hexbin(weather$MinTemp, weather$MaxTemp, xbins=100)

plot(bin, main="Hexagonal Binning")

plot(weather$MinTemp, weather$MaxTemp)

abline(lm(MaxTemp~MinTemp,data=weather),col='red') 





}


moment <- function(data, k = 1)
{
  if (typeof(data) == "character")
  {
    break
  }else if (typeof(data) != "character")
  {
    mk <- 0
    mean <- mean(data)
    s <- 0
    for (i in 1:length(data))
    {
      s <- s + (data[i] - mean)^k
      
    }
    
    
    mk <- 1/(length(data)-1) * s
    
  }
  return(mk)
  
}

moment(weather$MinTemp, 0)

mean(weather$MinTemp)

skewness <- function(data)
{
  skew <- moment(data,3)/moment(data,2)^(3/2)
  if (skew < 0)
  {print("The data is tilted left")
  }else if (skew > 0)
  {print("the data is tilted right")}
  
  return(skew)
  
  
  
}

skewness(weather$MinTemp)
hist(weather$MaxTemp)




# E2
{median(weather$MinTemp)
  mean(weather$MinTemp)
  
  test <- weather$MinTemp[weather$WindGustDir == "NNE" & complete.cases(weather)]
  mean(test)
  
  quantile(test, probs = c(0.25,0.50,0.75,0.80))
  IQR(test)
  skewness(test)
  min(test)
  max(test)
  var(test)
  std <- sqrt(var(test))
  
  IQR(weather$MinTemp)
  min(weather$MinTemp)
  max(weather$MinTemp)
  
  MAD <- function(data)
  {
    
    s <- 0
    
    for (i in 1:length(data))
    {
      s <- s + abs(data[i] - mean(data))
    }
    
    return(1/length(data) * s)
  }
  
  MAD(weather$MinTemp)
  std <- sqrt(var(weather$MinTemp))
  
  cov(weather$MinTemp, weather$MaxTemp)
  cor(weather$MinTemp, weather$MaxTemp)
  
  
  
  data.frame(table(weather$MinTemp))
  
  
  {
    m <- 80
    std <- 5
    
    #between 70 and 90
    
    Chebyshev.k <- function(rt_prob=0.05){return(k = sqrt(1 / rt_prob))}
    
    
    Chebyshev.max <- function(means, stds, rt_probs)
    {
      k <- Chebyshev.k(1-rt_probs)
      
      theoretical.max <- means + k*stds
      
      return(theoretical.max)
    }
    
    cheb <- Chebyshev.max(m, std, rt_probs=0.7)
    
    
    tp <- function(k)
    {
      1-1/k^2
    }
    tp(2)*m
    
    
  }
}
















# E3
# random variables
{
  #  random variables and discrete distributions
  m1 <- 0.2*20+0.5*10+0.3*-10

  var1 <- (20-m1)^2 * 0.2+(10-m1)^2 * 0.5+(-10-m1)^2 * 0.3
  std1 <- sqrt(var1)
  
  
  # binomial distribution
  dbinom(10, 20, 0.4) * 100
  
  pbinom(10, 20, 0.4) * 100
  
  (1 - pbinom(15, 20, 0.4)) * 100
  
  
  # continuous normal distribution
  m1 <- (12+20)/2
  
  punif(15.5, 12, 20)*100
  
  (1-punif(14, 12, 20))*100
  
  
  pnorm(80, 60, 20) - pnorm(50, 60, 20)
  pnorm(40, 60, 20) - pnorm(20, 60, 20)
  
  qnorm(0.15, 60,20, lower.tail = FALSE)
  qnorm(0.10, 60,20, lower.tail = TRUE)
  
  
  pnorm(200, 211.7, 20)
  1-pnorm(266.5, 211.7, 20)
  
  qnorm(0.10, 211.7,20, lower.tail = TRUE)
  qnorm(0.01, 211.7,20, lower.tail = FALSE)
}







#E4

{}

# sampling distribution of the sample mean
sample_mean <- 105
pop_mean <- 100
std <- 20
N <- 50
z <- (sample_mean - pop_mean) / (std/sqrt(N))
pnorm(z) - pnorm(z1)


pnorm(90, 100, 16)

sample_mean <- 90
pop_mean <- 100
std <- 16
N <- 4
z <- (sample_mean - pop_mean) / (std/sqrt(N))
pnorm(z)

pnorm(90,100,16)^4 * 100


# sampling distribution of the sample proportion
p <- 0.82
n <- 100
m1 <- p
std1 <- sqrt( (p*(1-p)) / n)

pnorm(0.8, m1, std1)

#c(m1-2*std1, m1+2*std1)

pnorm(0.84, m1, std1) - pnorm(0.80, m1, std1)




p_green <- 60/100
p_red <- 40/100

n <- 50
sd <- sqrt((p_green * p_red) / n)

z <- (0.7 - 0.6)/(sd/sqrt(n))
pnorm(z)


n <- 100
sd <- sqrt((p_green * p_red) / n)

z <- (0.7 - 0.6)/(sd/sqrt(n))
pnorm(z)











# 15. highway speeds

#40 cars
#std1 <- 5
#95% conf interval
#speed limit <- 55 mph


alpha <- 0.05
mean_value <- 55
standard_deviation <- 5
standard_error <- standard_deviation / sqrt(40)
degrees_of_freedom = 40 - 1
t_score = qt(p=alpha/2, df=degrees_of_freedom,lower.tail=F)
margin_error <- t_score * standard_error

# øvre og nedre grænse
lower_bound <- mean_value - margin_error
upper_bound <- mean_value + margin_error
c(lower_bound, upper_bound)


#economics 
confidens_interval(weather$MinTemp)

# Confidence interval for the population proportion
# 80 18-year olds, 20 have not graduated
# point estimate 20/80
# confidence interval on point estimate
#95% conf. p +- 1.96sqrt(p*(1-p)/n) for the Z value at 95% confidence.


# selecting the required sample size

95% conf
20.6% std
12.8 % std

z_score <- 1.96 # z-score value for 95% confidence interval
std_pct <- 0.128
margin_error <- 0.04
n = z_score^2 * (std_pct*(1-std_pct))/margin_error^2


#99% confidens_interval
#zscore for 99% =  2.58 
zscore <- 2.58
sample_proportion <- 0.05
(zscore^2 * sample_proportion * (1-sample_proportion)) / (0.05)^2







#dataset

# NaN og NA er not a number
x <- c(1,2,3,4,5,6,7,NaN)
desc = function(x)
{
  Nas = FALSE
  for (i in 1:length(x))
  {
    if (is.na(x[i]))
    {Nas = TRUE}
  }
  
  
  if(Nas == TRUE)
  {
    y <- na.omit(x)
  }
  else
  {
    y <- x
  }
  
  y <- sort(y)
  S <- sum(y, na.rm=TRUE)
  sm <- median(y)
  #range(invest)
  
  M <- mean(y, na.rm=TRUE) #mean without NaN
  MT <- mean(heights, trim = .5) #mean with a trim
  GM <- prod(y)^(1/length(y)) #geometric mean
  HM <- 1/mean(1/y) #harmonic mean
  
  V <- var(y, na.rm=TRUE)
  SD <- sd(y, na.rm=TRUE)
  V.P <- var(y)*(length(y)-1)/length(y)
  SD.P <- sd(y)*sqrt((length(y)-1)/length(y))
  
  skew <- mean((y-mean(y))^3)/(mean((y-mean(y))^2)^3)^(0.5) # skal rettes
  kurtosis <- mean((y-mean(y))^4)/(mean((y-mean(y))^2)^2) # skal rettes?

  
  
  
  cat("Are there any NaN?:",Nas,"\n",
      "Sum of dataset:", S,"\n",
      "median of dataset:",sm,"\n",
      "min of dataset",min(y),"\n",
      "max of dataset",max(y),"\n\n",
      
      "mean of dataset:", M, "\n",
      "Geometric mean of dataset:", GM, "\n",
      "Harmonic mean of dataset:", HM, "\n\n",
      
      "var of dataset:", V,"\n",
      "sample-var of dataset:", V.P,"\n\n",
      "St.dev of dataset:", SD, "\n",
      "sample St.dev of dataset:", SD.P,"\n\n",
      
      "Skew of the dataset:",skew,"\n", # skal rettes
      "kurtosis of the dataset:",kurtosis
      
      
      )
}

desc(x)
desc(series)
desc(invest)

rank(invest)

quantile(invest)

series <- seq(10,30) #10:30
repeated <- rep(series,2)
matrixe <- seq(5,100,5);  dim(matrixe) <- c(5,4)
#matrixe <- matrix(seq(5,100,5), nrow=5) ,byrow=T

t(matrixe)

heights <- c(36,42,43,37,40,45)

invest <- c(1.10,1.15,1.10,1.20,1.05)


N <- length(invest)
scale(invest)#/sqrt((N-1)/N)
attr(invest,"scaled:center")
attr(invest,"scaled:scale")


summary(invest)



#round(xxx,2)
prop.table(invest)

margin.table(invest)

cumsum(invest)

plot(ecdf(invest))
invests <- subset(invest, invest>1.1)

eye_color <- c(2,2,4,1,5,5,5,6,1,3,6,3,1,4)
feye_color <- factor(eye_color)
levels(feye_color) <- c("amber","blue","brown", "gray", "green", "hazel")
feye_color

empathy_score <- c(15,21,45,32,61,74,53,92,83,22,67,55,42,44)
eyes_and_empathy <- list(eyes_code=eye_color, eyes=feye_color, empathy=empathy_score)
eyes_and_empathy$eyes_code

t.result <- t.test(eyes_and_empathy$empathy, mu = 30)
t.result

e <- data.frame(eye_color, feye_color, empathy_score)
e.blue <- e$empathy_score[e$feye_color == "blue"]
e.averages <- c(mean(e.blue))
e.amounts <- c(length(e.blue))





hist(e$empathy_score, xlab="test", xlim = c(0,100), main = "test2", probability = TRUE ,lines(density(e$empathy_score)))

table(e$feye_color)
barplot(table(e$feye_color), ylim = c(0,10), xlab = "Type", ylab = "Frequency", axis.lty = "solid", space = .05)

pie(table(e$feye_color))

dotchart(table(e$feye_color))


dnorm(100,m=100,s=15) #density function
pnorm(100,m=100,s=15) #cumulative density function
qnorm(0.5, m=100, s=15) #quantile function
rnorm(5,m=100,s=15) #sampling dataset


values = c(1,2,3)
probabilities <- c(1/3,1/3,1/3)

smpl <- sample(x=values, prob = probabilities, size = 3, replace = TRUE)
smpl.means <- NULL

smpl.means <- append(smpl.means, mean(smpl))

for (i in 1:600){
  smpl <- sample(x=values, prob = probabilities, size = 3, replace = TRUE)
  smpl.means <- append(smpl.means, mean(smpl))
}


E.values = sum(values*probabilities)
var.values = sum((values-E.values)^2*probabilities)
sd.values = sqrt(var.values)
mean(smpl.means)
sd(smpl.means)

error <- qnorm(.025, lower.tail = FALSE)*sd.values/sqrt(length(invest))


mean.battery <- 60
sd.battery <- 20
N <- 25
error <- qt(.025, N-1,lower.tail = FALSE)*sd.battery/sqrt(N)
lower <- mean.battery - error
upper <- mean.battery + error

battery.data <- c(82,64,68,44,54,47,50,85,51,41,61,84,53,83,91,43,35,36,33,87,90,86,49,37,48)
t.test(battery.data, conf.level=.90)

IQ.data <- c(100,101,104,109,125,116,105,108,110)

z.test = function(x,mu,popvar){
 one.tail.p <- NULL
 z.score <- round((mean(x)-mu)/(popvar/sqrt(length(x))),3)
 one.tail.p <- round(pnorm(abs(z.score),lower.tail=FALSE),3)
 cat(" Z =",z.score,"\n","one-tailed probability =", one.tail.p,"\n",
     "two-tailed probability=",2*one.tail.p)}

z.test2 = function(x , y, popsd1, popsd2){
  one.tail.p <- NULL
  std.error <- sqrt((popsd1^2/length(x) + popsd2^2/length(y)))
  z.score <- round((mean(x)-mean(y))/std.error,3)
  one.tail.p <- round(pnorm(abs(z.score),lower.tail=FALSE),3)
  cat("mean1 =", mean(x), " ", "mean2 =", mean(y), "\n",
      "standard error =", std.error, "\n",
      "z =", z.score,"\n",
      "one-tailed probability =", one.tail.p,"\n",
      "two-tailed probability =", 2*one.tail.p)
}


z.test(IQ.data, 100,15)


data <- c(3,6,9,9,4,10,6,3,12)
t.test(data,mu=4,alternative="greater")


t.values <- seq(-4,4,1)
round(dt(t.values,12),2)
round(pt(t.values,12),2)
qt(c(0,0.25,0.5,0.75,1),12)
round(rt(8,12),2)


data <- c(12.43,11.71,14.41,11.05,9.53,11.66,9.33,11.71,14.35,13.81)
library(EnvStats)
varTest(data, alternative="greater",conf.level=0.95,sigma.squared=2.25)
qchisq(.05,df=9, lower.tail=FALSE)
chisq.values <- seq(0,16,2)
round(dchisq(chisq.values,9),3)
round(pchisq(chisq.values,9),3)
round(rchisq(n=6,df=9),3)


sample1 <- c(100,118,97,92,118,125,136,95,111)
sample2 <- c(91,109,83,88,115,108,127,102,86)
z.test2(sample1,sample2,15,15)

sample1 <- c(24.58,22.09,23.7,18.89,22.02,28.71,24.44,20.91,23.83,20.83)
sample2 <- c(21.61,19.06,20.72,15.77,19,25.88,21.48,17.85,20.86,17.77)
t.test(sample1, sample2, var.equal = TRUE, alternative = "two.sided", mu=0)


before <- c(198,201,210,185,204,156,167,197,220,186)
after <- c(194,203,200,183,200,153,166,197,215,184)
t.test(before,after,alternative="greater",paired=TRUE)

qf(0.25,9,14,lower.tail=FALSE)
F.scores <- seq(0,5,1)
round(df(F.scores,9,14),3)
round(pf(F.scores,9,14),3)
rf(5,9,14)






timeseries1 = function(timeframe,runs, x0, sigma, mu)
{
  dt = 1/timeframe
  sigmas <- data.frame(runs = rep(0,timeframe))
  walks <- data.frame(runs = rep(x0,timeframe))
  
  for (i in 1:(runs-1))
  {
    sigmas <- cbind(sigmas,runs = rep(0,timeframe))
    walks <- cbind(walks, runs = rep(x0,timeframe))
  }
  
  
  for (i in 1:ncol(sigmas))
  {
    for (j in 1:nrow(sigmas))
    {
      if (j == 1)
      {
        sigmas[j,i] = exp(mu - sigma^2 / 2 * dt + sigma * rnorm(1,m=0,s=sigma))
        walks[j,i] <- walks[j,i] * sigmas[j,i]
      }
      else
      {
        sigmas[j,i] = exp((mu - (sigma^2 / 2)) * dt + sigma * rnorm(1,m=0,s=sigma)) * sigmas[(j-1),i]
        walks[j,i] <- walks[j,i] * sigmas[j,i]
      }
      
    }
    
    
  }
  
  return(walks)
  
}


t <- data.frame(timeseries1(timeframe = 6, runs = 5,x0 = 3.8, sigma = 1, mu = 0))

{
plot(t[1:nrow(t),1], type = "b", col = "blue", xlim = c(1, 10), ylim = c(0, 100))
for (i in 1:(ncol(t)-1))
{
  lines(t[1:nrow(t),i+1], type = "l", col = "blue")
}
}


x <- c(5,4,3,2,1)
y <- c(1,2,3,4,5)

df <- data.frame(x,y)


linmol <- lm(y ~ x, data=df) 
linmol$coefficients[2]
lm.fit$coefficient[1] #intercept
lm.fit$coefficient[1] #hældning

plot(x,y)
abline(linmol)


devtools::install_github("EnvisionRisk/EnvisionRiskRaaS")
library(ggplot2)
library(EnvisionRiskRaaS)

#Request the delta vector (for Apple) from the risk server
use_date   <- Sys.Date()
use_symbol <- "AAPL.US"

# The term '_raw' within the function name is indicative of a key feature: 
# the simulated price changes are denominated in the same currency as 
# the stock. This implies that the analysis maintains the original currency 
# perspective of the stock, allowing for more accurate and relevant 
# insights. It enhances ease of comprehension and direct applicability, 
# bringing us closer to the context of the actual trading environment.
api_response <- EnvisionRiskRaaS::envrsk_instrument_delta_vector_raw(
  date   = use_date, 
  symbol = use_symbol)

# Use our advanced API to request an Expected-Shortfall calculation, set at a 
# 97.5% confidence level over a 1-day horizon, employing a point-in-time 
# volatility scenario.
api_response_es <- EnvisionRiskRaaS::envrsk_instrument_expected_shortfall_raw(
  date   = use_date, 
  symbol = use_symbol,
  signif_level = 0.975,
  volatility_id = "point_in_time")
expected_shortfall_estimate <- api_response_es[["Output"]]$expected_shortfall

# Leverage the EnvisionRiskRaaS::envrsk_instrument_delta_vector function with 
# base_cur set to "DKK" to incorporate the risk associated with  USD/DKK 
# currency exchange fluctuations. This allows you to evaluate and strategize 
# around the additional layer of market risk presented by currency movements, 
# thereby providing a more comprehensive understanding of the potential impacts 
# on your investments.
api_response3 <- EnvisionRiskRaaS::envrsk_instrument_delta_vector(date = use_date, symbol = use_symbol, base_cur = "DKK")

# Plot the P/L distribution (code hidden)

# Check out the comprehensive guide below for step-by-step instructions on how to 
# generate Profit/Loss (P/L) distribution for your bespoke portfolio. This 
# detailed resource is designed to assist you in understanding the financial 
# impact of potential market changes on your portfolio.
?EnvisionRiskRaaS::envrsk_portfolio_delta_vector


dt_positions <- as.data.frame(list("symbol"        = c("AAPL.US", "DANSKE.CO",
                                                       "CashUSD", "AGG.US"),
                                   "position_type" = c("single_stock",
                                                       "single_stock", "cash", "etf"),
                                   "quantity"      = c(129, 768, 69000, 89)))


delta_vector_2 <- envrsk_portfolio_delta_vector(access_token, date          = "2022-12-31",
                                                positions     = dt_positions,
                                                base_cur      = "USD",
                                                horizon       = 1,
                                                volatility_id = "point_in_time",
                                                report_depth  = 0,
                                                simplify      = TRUE)

 
 ggplot(api_response[["Output"]], aes(x=PnL)) +
   geom_histogram(aes(y=..density..), 
                  colour = "#27647B", 
                  fill = "#27647B", 
                  position="identity", 
                  alpha=0.75, 
                  bins = 50)+
   geom_density(alpha=1, 
                colour = "#CA3542")+
   geom_vline(xintercept = expected_shortfall_estimate, linetype = "dashed", colour = "#AEC0C9")+
   geom_text(aes(x=expected_shortfall_estimate, y=0.1, label = "Expected-Shortfall (97.5%, 1 day)"), colour="#57575F", angle=90)+
   labs(title="Price Uncertainty",
        subtitle = paste0("Profit/Loss distribution (one day) for ", use_symbol, " as seen from the ", use_date),
        x = "Profit/Loss (in $)", 
        y = "Density",
        caption = expression("In the world of financial markets, price uncertainty is a key element that contributes to market risk - the risk of losses in positions arising \nfrom movements in market prices. Risk management aims to quantify this risk and devise strategies to mitigate potential losses."))+
   xlim(c(-15, 15))+
   theme_bw()+
   theme(axis.text.y = element_blank(),
         plot.caption = element_text(size=7.5, hjust=0, margin=margin(t=15)))
 
 
 
 
# Logout from the risk server
#EnvisionRiskRaaS::envrsk_auth_log_out()


#******************************************************************************
#* 
#* EnvisionRisk Market Risk-as-a-Service API - R-Interface, May 2023 
#* 
#******************************************************************************
#* EnvisionRisk Market Risk-as-a-Service API is a cloud-based technology solution 
#* that provides risk management capabilities through Application Programming 
#* Interfaces (APIs). These APIs allow users to access advanced risk analytics, 
#* modeling tools, and financial data, facilitating efficient and comprehensive 
#* risk assessments.
#*
#* This technology enables financial institutions, asset managers, and other 
#* stakeholders to quantify and manage market risk, a key component of financial 
#* risk that involves potential losses due to changes in market prices. Market 
#* Risk-as-a-Service API can provide real-time, granular risk metrics such as 
#* Value at Risk (VaR), Expected Shortfall (ES), and other stress testing measures.
#* 
#* Value at Risk (VaR) and Expected Shortfall (ES) are two key metrics used in 
#* this practice. VaR estimates the potential loss that could occur in a portfolio 
#* over a specific time horizon at a certain confidence level. It's widely used 
#* due to its simplicity and intuitive interpretation, but it's criticized for 
#* not providing information about the potential losses beyond the VaR threshold, 
#* especially during extreme market events.
#* 
#* That's where Expected Shortfall comes in. ES, also known as Conditional VaR 
#* (CVaR), is a measure that quantifies the expected loss on those occasions 
#* when a specific VaR limit is exceeded. By considering the average of all 
#* losses worse than the VaR, it provides a more comprehensive picture of tail 
#* risk.
#* 
#* Together, VaR and ES provide valuable insights into a portfolio's market risk 
#* exposure. They guide risk managers in setting risk limits, making strategic 
#* asset allocation decisions, and developing hedging strategies to control 
#* potential losses. These metrics are essential in the quantitative risk management 
#* process, informing decision-making under uncertainty and helping to ensure the 
#* financial stability of the firm.
#* 
#* The benefits of this service for market risk management are substantial:
#*  - Scalability: As a cloud-based service, it can easily scale to handle large 
#*    data volumes and complex analytics, accommodating growing business needs.
#*  - Cost Efficiency: It eliminates the need for heavy upfront investment in 
#*    infrastructure and risk modeling software, making sophisticated risk 
#*    management capabilities accessible to a broader range of organizations.
#*  - Flexibility: With API-based integration, firms can embed risk analytics 
#*    into their existing systems and workflows, promoting seamless and flexible 
#*    operations.
#*  - Enhanced Decision-Making: The advanced analytics and comprehensive risk 
#*    measures can inform better investment and risk management decisions, 
#*    ultimately driving performance and profitability.
#*    
#******************************************************************************
#*
#*
#*
#*
options(scipen=999)

#******************************************************************************
#* Denependencies
#******************************************************************************
#' Use or Install a Package
#'
#' This function checks if a given R package is installed, and if not, 
#' installs the package. It then loads the package for use in the current R session.
#'
#' @param p A string specifying the name of the package.
#'
#' @return No return value. The function invisibly loads the required package into the R session.
#'         If the package is not already installed, it is first installed and then loaded.
#'
#' @examples
#' \dontrun{
#' usePackage("ggplot2")  # checks if ggplot2 is installed, installs it if not, then loads it
#' }
usePackage <- function(p){
  if (!is.element(p, utils::installed.packages()[,1]))
    utils::install.packages(p, dep = TRUE)
  require(p, character.only = TRUE)
}

# In case one or more of the packages are not installed they will be installed
pckg <- c("data.table", "jsonlite", "httr", "parallel", "getPass")
suppressWarnings(sapply(pckg, usePackage))

box::use(
  data.table[...],              
  jsonlite,                   
  httr,  
  parallel,
  getPass
) 

#' Read Excel Data via Clipboard
#'
#' This function reads data from the clipboard that has been copied from Excel. 
#' It is a convenience function that avoids having to save Excel data to a .csv 
#' file before importing into R.
#'
#' @param header Logical indicating whether the first row of the data should be 
#'               interpreted as the column names. Defaults to TRUE.
#' @param ...    Additional arguments to pass to the read.table function.
#'
#' @return A data frame containing the data that was copied from Excel and pasted into the clipboard.
#' @export
#'
#' @examples
#' \dontrun{
#' df <- read.excel()  # reads data from clipboard, assuming first row are column names
#' df <- read.excel(header = FALSE)  # reads data from clipboard, assuming no column names
#' }
read.excel <- function(header=TRUE,...) {
  read.table("clipboard",sep="\t",header=header,...)
}

#' Write Data to Clipboard in Excel-friendly Format
#'
#' This function writes data to the clipboard in a format that can be pasted directly into Excel. 
#' It is a convenience function that avoids having to save data to a .csv file before importing 
#' into Excel.
#'
#' @param x         A data frame or matrix to be written to the clipboard.
#' @param row.names Logical indicating whether the row names should be included in the output. 
#'                  Defaults to FALSE.
#' @param col.names Logical indicating whether the column names should be included in the output. 
#'                  Defaults to TRUE.
#' @param ...       Additional arguments to pass to the write.table function.
#'
#' @return NULL. The function is called for its side effect of writing data to the clipboard.
#' @export
#'
#' @examples
#' \dontrun{
#' write.excel(df)  # writes data frame 'df' to clipboard, can be pasted directly to Excel
#' write.excel(df, row.names = TRUE)  # includes row names in output
#' }
write.excel <- function(x,row.names=FALSE,col.names=TRUE,...) {
  write.table(x,"clipboard",sep="\t",row.names=row.names,col.names=col.names,...)
}

#' Function to generate random IDs
#'
#' This function generates random IDs based on the specified pattern and pattern length. 
#' It generates 'n' number of IDs, each containing a combination of uppercase letters, 
#' digits, and lowercase letters. The length and pattern of each part of the ID can be 
#' customized. If no pattern or pattern length is specified, it defaults to a pattern of 
#' two uppercase letters, four digits, and two lowercase letters.
#'
#' @param n An integer specifying the number of IDs to generate.
#' @param pattern_len A vector specifying the length of each part of the ID. Default is c(2, 4, 2).
#' @param pattern A vector specifying the pattern of each part of the ID. Default is c("[A-Z]", "[0-9]", "[a-z]").
#'
#' @return A character vector of length 'n' containing the generated IDs.
#'
#' @examples
#' \dontrun{
#' random_ids <- IdGenerator(n = 10)
#' }
IdGenerator <- function(n, pattern_len = c(2, 4, 2), pattern = c("[A-Z]", "[0-9]", "[a-z]")){
  stopifnot(length(pattern_len) == length(pattern))
  do.call(paste0, base::Map(stringi::stri_rand_strings, n = n, length = pattern_len, pattern = pattern))
}

#******************************************************************************
#*
#* Wrapping relevant EnvisionRisk Market Risk-as-a-Service API calls into R-functions
#*
#******************************************************************************
#*
#* The functionality wraps the EnvisionRisk market Risk-as-a-Service API into R
#* style functions. The functions takes familiar R data object as input, takes
#* care of communicating with the cloud server and transform the JSON output
#* from the API into R data structures.
#*
base_url  <- "https://api.envisionrisk.com/"
base_path <- "v1/themis/"

#' Function to make a POST request to an API
#'
#' This function sends a POST request to the specified API URL. 
#' It requires an access token, a URL, a body for the POST request,
#' and a list of query parameters. It adds the access token to the 
#' headers of the request and sends the POST request using the 'httr' package.
#'
#' @param access_token A string containing the access token.
#' @param url A string containing the URL of the API endpoint.
#' @param body A list containing the body of the POST request.
#' @param params A list containing the query parameters for the POST request.
#'
#' @return A list containing the status code and the content of the API response. 
#'
#' @examples
#' \dontrun{
#' result <- envrsk_post(access_token = "your_token", 
#'                       url          = "https://api.envisionrisk.com/path-to-endpoint", 
#'                       body         = list("body1" = "value1", 
#'                                           "body2" = "value2"),
#'                       params       = list("param1" = "value1", 
#'                                           "param2" = "value2"))
#' }
envrsk_post <- function(access_token,
                        url,
                        body,
                        params){

  # Query parameters
  .query <- c(params)

  #' headers
  .headers <- httr::add_headers('ACCESS-TOKEN' = access_token)

  # Body
  .body <- jsonlite::toJSON(body)

  #' post call to the endpoint
  res <- httr::POST(
    url    = url,
    query  = .query,
    config = .headers,
    body   = .body,
    httr::accept_json()
  )

  return(list("status_code" = httr::status_code(res),
              "content"     = httr::content(res)))
}

#' Function to make a GET request to an API
#'
#' This function sends a GET request to the specified API URL. 
#' It requires an access token, a URL, and a list of query parameters. 
#' It adds the access token to the headers of the request and sends 
#' the GET request using the 'httr' package.
#'
#' @param access_token A string containing the access token.
#' @param url A string containing the URL of the API endpoint.
#' @param params A list containing the query parameters for the GET request.
#'
#' @return A list containing the status code and the content of the API response. 
#'
#' @examples
#' \dontrun{
#' result <- envrsk_get(access_token = "your_token", 
#'                      url = "https://api.envisionrisk.com/path-to-endpoint", 
#'                      params = list("param1" = "value1", "param2" = "value2"))
#' }
envrsk_get <- function(access_token,
                       url,
                       params){
  
  # Query parameters
  .query <- c(params)
  
  #' headers
  .headers <- httr::add_headers('ACCESS-TOKEN' = access_token)
  
  
  #' post call to the endpoint
  res <- httr::GET(
    url    = url,
    query  = .query,
    config = .headers,
    httr::accept_json()
  )
  
  return(list("status_code" = httr::status_code(res),
              "content"     = httr::content(res)))
}

#******************************************************************************
#### Auth ####
#******************************************************************************
#' Function to get access token for API authentication
#'
#' This function obtains an access token needed for API authentication. 
#' It requires a user ID and password, and sends a GET request to the 
#' specified URL to retrieve the access token. If the request is successful,
#' it sets the expiry time for the access token to 24 hours from the current time.
#'
#' @param usr_id A string containing the user ID.
#' @param usr_pwd A string containing the user password.
#'
#' @return A list containing the status code, the access token and its expiry time. 
#'         In case of error, it returns the error message.
#' @export
#'
#' @examples
#' \dontrun{
#' token <- envrsk_auth_get_access_token(usr_id = "your_user_id", 
#'                                       usr_pwd = "your_password")
#' }
envrsk_auth_get_access_token <- function(usr_id, usr_pwd){
  # Query parameters
  .query <- list("usr_id"  = usr_id,
                 "usr_pwd" = usr_pwd)
  
  if(is.null(usr_id) | is.na(usr_id) | usr_id == ""){
    return(list(error="Missing required parameter: usr_id"))
  }
  
  if(is.null(usr_pwd) | is.na(usr_pwd) | usr_pwd == ""){
    return(list(error="Missing required parameter: usr_pwd"))
  }
  
  access_token_expiry <- Sys.time() + 24*60*60
  get_access_token <- httr::GET(
    url    = "https://api.envisionrisk.com/auth/get-access-token",
    query  = .query
  )

  if(httr::status_code(get_access_token) != 200){
    return(httr::content(get_access_token))
  }
  access_token <- httr::content(get_access_token)
  return(list("status-code"         = 200,
              "access-token"        = access_token,
              "access-token-expiry" = Sys.time() + (24*60*60 - 60)))

}

#' Function to renew access token for API authentication
#'
#' This function renews the access token needed for API authentication. 
#' It optionally forces a token renewal. If user ID and password are 
#' available in the system environment variables, it uses them to get 
#' a new access token. If the current access token exists and has not 
#' expired, it continues to use it unless force_renew is TRUE.
#'
#' @param force_renew A boolean value indicating whether to force the renewal 
#'                    of the access token. Default is FALSE.
#'
#' @return A message indicating the validity of the access token or any error message.
#' @export
#'
#' @examples
#' \dontrun{
#' envrsk_auth_renew_access_token(force_renew = TRUE)
#' }
envrsk_auth_renew_access_token <- function(force_renew = FALSE){
  renew_flow <- function(){
    if(Sys.getenv("USR_ID") != "" & Sys.getenv("USR_PWD") != ""){
      my_access_token <<- envrsk_auth_get_access_token(Sys.getenv("USR_ID"), 
                                                       Sys.getenv("USR_PWD"))
    } else {
      envrsk_auth_set_access_token()
    }
  }
  if(force_renew | !exists("my_access_token")){
    Sys.setenv("USR_ID" = "") 
    Sys.setenv("USR_PWD" = "")
    renew_flow()  
  } else {
    if(my_access_token[["access-token-expiry"]] < Sys.time()){
      renew_flow()
    }
  }
  if(!is.null(my_access_token[["status-code"]]) && my_access_token[["status-code"]] == 200){
    message(paste0("The access-token is valid until: ", as.POSIXct(my_access_token[["access-token-expiry"]])))
  } else {
    Sys.setenv("USR_ID" = "") 
    Sys.setenv("USR_PWD" = "")
    message(my_access_token)
  }
}

#' Function to set access token for API authentication
#'
#' This function sets the environment variables for user ID and password, 
#' and retrieves an access token for API authentication. It uses the user's 
#' input for the email and password as credentials for authentication. 
#' The access token retrieved is stored globally in the 'my_access_token' variable.
#'
#' @return No return value. This function prints a message if the access token is successfully retrieved.
#'
#' @examples
#' \dontrun{
#' envrsk_auth_set_access_token()
#' }
envrsk_auth_set_access_token <- function(){
  # Provide credentials - email and password. In case you have not yet received 
  # your personal credentials, contact EnvisionRisk at info@envisionrisk.com
  Sys.setenv("USR_ID"  = getPass::getPass(msg = "Please provide email: ", noblank = TRUE, forcemask = FALSE))
  Sys.setenv("USR_PWD" = getPass::getPass(msg = "Please provide password: ", noblank = TRUE, forcemask = FALSE))
  
  # AUTHENTICATIO WITH THE RISK SERVER
  # Retrieve the access-token from the Auth-server.
  my_access_token <<- envrsk_auth_get_access_token(Sys.getenv("USR_ID"), 
                                                   Sys.getenv("USR_PWD"))
  if(!is.null(my_access_token[["status-code"]]) && my_access_token[["status-code"]] == 200){
    message("access-token has been aquired and is saved into the variable 'my_access_token'")  
  }
}

#' Function to log out from the API
#'
#' This function logs out from the API by removing the access token and user credentials 
#' from the environment. It clears the 'access_token' and 'my_access_token' variables, 
#' and also clears the 'USR_ID' and 'USR_PWD' environment variables.
#'
#' @return No return value. This function clears certain variables and environment variables.
#' @export
#'
#' @examples
#' \dontrun{
#' envrsk_auth_log_out()
#' }
envrsk_auth_log_out <- function(){
  suppressWarnings(rm(list = c("access_token", "my_access_token")))
  Sys.setenv("USR_ID"  = "")
  Sys.setenv("USR_PWD" = "")
}

#******************************************************************************
#### Portfolio ####
#******************************************************************************
#' Function for estimating portfolio risk - Value-at-Risk (VaR) and Expected Shortfall (ES)
#'
#' This function uses the 'portfolio-risk-regular' API endpoint to estimate 
#' portfolio risk. It requires an access token and a date, along with a 
#' list of positions. It optionally takes in a base currency, a horizon, 
#' a significance level, a volatility ID, a report depth, and a flag 
#' to simplify the output.
#'
#' @param access_token A valid access token for API authentication.
#' @param date A date for which the portfolio risk should be estimated.
#' @param positions A list of positions in the portfolio.
#' @param base_cur An optional base currency for the portfolio. Default is NULL.
#' @param horizon An optional time horizon for the risk estimate. Default is NULL.
#' @param signif_level An optional significance level for the risk measure. Default is NULL.
#' @param volatility_id An optional volatility ID. Default is NULL.
#' @param report_depth An optional depth of the report. Default is NULL.
#' @param simplify A flag indicating whether to simplify the output. Default is FALSE.
#'
#' Value at Risk (VaR) is a statistical measure that estimates the maximum potential 
#' loss over a specified time horizon at a given confidence level. Expected 
#' Shortfall (ES), also known as Conditional Value at Risk (CVaR), estimates the 
#' average loss in the event that the VaR is exceeded. Both are forward-looking 
#' as they use statistical analysis based on historical data and volatility to 
#' predict potential future losses. They are essential for market risk management, 
#' helping organizations understand their risk exposure and potential financial 
#' impact under adverse market conditions.
#' 
#' @return A processed portfolio return value.
#' @export
#'
#' @examples
#' \dontrun{
#' dt_positions <- as.data.frame(list("symbol"        = c("AAPL.US", "DANSKE.CO", "CashUSD", "AGG.US"),
#'                                    "position_type" = c("single_stock", "single_stock", "cash", "etf"),
#'                                    "quantity"      = c(129, 768, 69000, 89)))
#' result_1 <- envrsk_portfolio_risk_regular(access_token = "your_token",
#'                                           date         = "2022-12-31",
#'                                           positions    = dt_positions)
#'                                           
#' result_2 <- envrsk_portfolio_risk_regular(access_token  = "your_token",
#'                                           date          = "2022-12-31",
#'                                           positions     = dt_positions,
#'                                           base_cur      = "USD",
#'                                           horizon       = 1,
#'                                           signif_level  = 0.975,
#'                                           volatility_id = "point_in_time",
#'                                           report_depth  = 0,
#'                                           simplify      = TRUE)
#' }
envrsk_portfolio_risk_regular <- function(access_token,
                                          date,
                                          positions,
                                          base_cur      = NULL,
                                          horizon       = NULL,
                                          signif_level  = NULL,
                                          volatility_id = NULL,
                                          report_depth  = NULL,
                                          simplify      = FALSE){
  end_point <- "portfolio-risk-regular"
  api_url <- paste0(base_url, base_path, end_point)

  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id,
                  "report_depth"  = report_depth)
  .params <- .params[lengths(.params) != 0]

  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)

  out <- process_portfolio_return_values(res_out, simplify)
  return(out)
}

#' Function for estimating risk components of a portfolio
#'
#' This function uses the 'portfolio-risk-regular' API endpoint to estimate 
#' portfolio risk. It requires an access token and a date, along with a 
#' list of positions. It optionally takes in a base currency, a horizon, 
#' a significance level, a volatility ID, a report depth, and a flag 
#' to simplify the output.
#'
#' @param access_token A valid access token for API authentication.
#' @param date A date for which the portfolio risk should be estimated.
#' @param positions A list of positions in the portfolio.
#' @param base_cur An optional base currency for the portfolio. Default is NULL.
#' @param horizon An optional time horizon for the risk estimate. Default is NULL.
#' @param signif_level An optional significance level for the risk measure. Default is NULL.
#' @param volatility_id An optional volatility ID. Default is NULL.
#' @param report_depth An optional depth of the report. Default is NULL.
#' @param simplify A flag indicating whether to simplify the output. Default is FALSE.
#'
#' Value at Risk (VaR) is a statistical measure that estimates the maximum potential 
#' loss over a specified time horizon at a given confidence level. Expected 
#' Shortfall (ES), also known as Conditional Value at Risk (CVaR), estimates the 
#' average loss in the event that the VaR is exceeded. Both are forward-looking 
#' as they use statistical analysis based on historical data and volatility to 
#' predict potential future losses. They are essential for market risk management, 
#' helping organizations understand their risk exposure and potential financial 
#' impact under adverse market conditions.
#'
#' Component Value at Risk (ComponentVaR) and Component Expected Shortfall 
#' (ComponentES) are measures that break down the total VaR and ES of a portfolio 
#' into individual components corresponding to each asset in the portfolio.
#' 
#' ComponentVaR for a particular asset represents the contribution of that asset 
#' to the portfolio's overall VaR. Similarly, CES quantifies an individual asset's 
#' contribution to the portfolio's total expected shortfall.
#' 
#' These measures are crucial for market risk management as they provide detailed 
#' insights into the risk contribution of each asset in the portfolio. By 
#' identifying the assets that contribute most to the portfolio's risk, a risk 
#' manager can better optimize the portfolio's risk-return tradeoff. For example, 
#' they may decide to reduce the portfolio's exposure to assets with high CVaR or 
#' CES, diversify the asset allocation, or use hedging strategies to mitigate risk.
#' 
#' @return A processed portfolio return value.
#' @export
#'
#' @examples
#' \dontrun{
#' dt_positions <- as.data.frame(list("symbol"        = c("AAPL.US", "DANSKE.CO", "CashUSD", "AGG.US"),
#'                                    "position_type" = c("single_stock", "single_stock", "cash", "etf"),
#'                                    "quantity"      = c(129, 768, 69000, 89)))
#' result_1 <- envrsk_portfolio_risk_component(access_token = "your_token",
#'                                           date         = "2022-12-31",
#'                                           positions    = dt_positions)
#'                                           
#' result_2 <- envrsk_portfolio_risk_component(access_token  = "your_token",
#'                                           date          = "2022-12-31",
#'                                           positions     = dt_positions,
#'                                           base_cur      = "USD",
#'                                           horizon       = 1,
#'                                           signif_level  = 0.975,
#'                                           volatility_id = "point_in_time",
#'                                           report_depth  = 0,
#'                                           simplify      = TRUE)
#' }
envrsk_portfolio_risk_component <- function(access_token,
                                            date,
                                            positions,
                                            base_cur      = NULL,
                                            horizon       = NULL,
                                            signif_level  = NULL,
                                            volatility_id = NULL,
                                            report_depth  = NULL,
                                            simplify      = FALSE){
  end_point <- "portfolio-risk-component"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id,
                  "report_depth"  = report_depth)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)
  
  out <- process_portfolio_return_values(res_out, simplify)
  return(out)
}

#' Function to calculate the delta vector of a portfolio
#'
#' This function sends a POST request to the 'portfolio-delta-vector' API endpoint 
#' to calculate the delta vector of a portfolio on a specified date. 
#' It requires an access token, a date, and the positions in the portfolio. 
#' It also allows for optional parameters like base currency, horizon, 
#' volatility ID, and report depth. It returns the response from the API.
#'
#' @param access_token A string containing the access token.
#' @param date A string containing the date for the calculation.
#' @param positions A list containing the positions in the portfolio.
#' @param base_cur An optional string containing the base currency.
#' @param horizon An optional numeric containing the horizon.
#' @param signif_level An optional numeric containing the significant level.
#' @param volatility_id An optional string containing the volatility ID.
#' @param report_depth An optional numeric containing the report depth.
#' @param simplify An optional logical value indicating whether to simplify the return values.
#'
#' @return A list containing the API response.
#' @export
#'
#' @examples
#' \dontrun{
#' dt_positions <- as.data.frame(list("symbol"        = c("AAPL.US", "DANSKE.CO", "CashUSD", "AGG.US"),
#'                                    "position_type" = c("single_stock", "single_stock", "cash", "etf"),
#'                                    "quantity"      = c(129, 768, 69000, 89)))
#'                                    
#' delta_vector_1 <- envrsk_portfolio_delta_vector(access_token = "your_token",
#'                                                 date         = "2022-12-31",
#'                                                 positions    = dt_positions)
#'                                           
#' delta_vector_2 <- envrsk_portfolio_delta_vector(access_token  = "your_token",
#'                                                 date          = "2022-12-31",
#'                                                 positions     = dt_positions,
#'                                                 base_cur      = "USD",
#'                                                 horizon       = 1,
#'                                                 volatility_id = "point_in_time",
#'                                                 report_depth  = 0,
#'                                                 simplify      = TRUE)
#' }
envrsk_portfolio_delta_vector <- function(access_token,
                                          date,
                                          positions,
                                          base_cur      = NULL,
                                          horizon       = NULL,
                                          signif_level  = NULL,
                                          volatility_id = NULL,
                                          report_depth  = NULL,
                                          simplify      = FALSE){
  end_point <- "portfolio-delta-vector"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "volatility_id" = volatility_id,
                  "report_depth"  = report_depth)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)
  
  out <- process_portfolio_return_values(res_out, simplify)
  return(out)
}

#' Function to calculate the economic capital of a portfolio
#'
#' This function sends a POST request to the 'portfolio-economic-capital-regular' API endpoint 
#' to calculate the economic capital of a portfolio on a specified date. 
#' It requires an access token, a date, and the positions in the portfolio. 
#' It also allows for optional parameters like base currency, horizon, 
#' volatility ID, expected ROE (Return on Equity), and report depth. 
#' It returns the response from the API.
#'
#' @param access_token A string containing the access token.
#' @param date A string containing the date for the calculation.
#' @param positions A list containing the positions in the portfolio.
#' @param base_cur An optional string containing the base currency.
#' @param horizon An optional numeric containing the horizon.
#' @param signif_level An optional numeric containing the significant level.
#' @param volatility_id An optional string containing the volatility ID.
#' @param expected_roe An optional numeric containing the expected Return on Equity (ROE).
#' @param report_depth An optional numeric containing the report depth.
#' @param simplify An optional logical value indicating whether to simplify the return values.
#'
#' Economic capital in market risk management is the amount of risk capital a 
#' company holds to withstand unexpected losses due to market risk. It's essentially 
#' a safety net that protects the company's financial health from severe market 
#' downturns. It's computed based on statistical measure Expected Shortfall (ES), 
#' which estimate potential losses under extreme but plausible scenarios. A higher 
#' economic capital indicates a larger buffer against market volatility but also 
#' may suggest greater exposure to risk. It's crucial in risk management, capital 
#' allocation, and strategic decision-making.

#' @return A list containing the API response.
#' @export
#'
#' @examples
#' \dontrun{
#' dt_positions <- as.data.frame(list("symbol"        = c("AAPL.US", "DANSKE.CO", "CashUSD", "AGG.US"),
#'                                    "position_type" = c("single_stock", "single_stock", "cash", "etf"),
#'                                    "quantity"      = c(129, 768, 69000, 89)))
#'                                    
#' economic_capital_1 <- envrsk_portfolio_economic_capital_regular(access_token = "your_token",
#'                                                                 date         = "2022-12-31",
#'                                                                 positions    = dt_positions)
#'                                           
#' economic_capital_2 <- envrsk_portfolio_economic_capital_regular(access_token  = "your_token",
#'                                                                 date          = "2022-12-31",
#'                                                                 positions     = dt_positions,
#'                                                                 base_cur      = "USD",
#'                                                                 horizon       = 10,
#'                                                                 signif_level  = 0.99,
#'                                                                 volatility_id = "downturn",
#'                                                                 expected_roe  = 0.10,
#'                                                                 report_depth  = 0,
#'                                                                 simplify      = TRUE)
#' }
envrsk_portfolio_economic_capital_regular <- function(access_token,
                                                      date,
                                                      positions,
                                                      base_cur      = NULL,
                                                      horizon       = NULL,
                                                      signif_level  = NULL,
                                                      volatility_id = NULL,
                                                      expected_roe  = NULL,
                                                      report_depth  = NULL,
                                                      simplify      = FALSE){
  end_point <- "portfolio-economic-capital-regular"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id,
                  "expected_roe"  = expected_roe,
                  "report_depth"  = report_depth)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)
  
  out <- process_portfolio_return_values(res_out, simplify)
  return(out)
}

#' Function to calculate the component economic capital of a portfolio
#'
#' This function sends a POST request to the 'portfolio-economic-capital-component' API endpoint 
#' to calculate the economic capital of a portfolio on a specified date. 
#' It requires an access token, a date, and the positions in the portfolio. 
#' It also allows for optional parameters like base currency, horizon, 
#' volatility ID, expected ROE (Return on Equity), and report depth. 
#' It returns the response from the API.
#'
#' @param access_token A string containing the access token.
#' @param date A string containing the date for the calculation.
#' @param positions A list containing the positions in the portfolio.
#' @param base_cur An optional string containing the base currency.
#' @param horizon An optional numeric containing the horizon.
#' @param signif_level An optional numeric containing the significant level.
#' @param volatility_id An optional string containing the volatility ID.
#' @param expected_roe An optional numeric containing the expected Return on Equity (ROE).
#' @param report_depth An optional numeric containing the report depth.
#' @param simplify An optional logical value indicating whether to simplify the return values.
#'
#' Economic capital in market risk management is the amount of risk capital a 
#' company holds to withstand unexpected losses due to market risk. It's essentially 
#' a safety net that protects the company's financial health from severe market 
#' downturns. It's computed based on the statistical measure Expected Shortfall (ES), 
#' which estimate potential losses under extreme but plausible scenarios. A higher 
#' economic capital indicates a larger buffer against market volatility but also 
#' may suggest greater exposure to risk. It's crucial in risk management, capital 
#' allocation, and strategic decision-making.
#' 
#' @return A list containing the API response.
#' @export
#'
#' @examples
#' \dontrun{
#' dt_positions <- as.data.frame(list("symbol"        = c("AAPL.US", "DANSKE.CO", "CashUSD", "AGG.US"),
#'                                    "position_type" = c("single_stock", "single_stock", "cash", "etf"),
#'                                    "quantity"      = c(129, 768, 69000, 89)))
#'                                    
#' economic_capital_1 <- envrsk_portfolio_economic_capital_component(access_token = "your_token",
#'                                                                   date         = "2022-12-31",
#'                                                                   positions    = dt_positions)
#'                                           
#' economic_capital_2 <- envrsk_portfolio_economic_capital_component(access_token  = "your_token",
#'                                                                   date          = "2022-12-31",
#'                                                                   positions     = dt_positions,
#'                                                                   base_cur      = "USD",
#'                                                                   horizon       = 10,
#'                                                                   signif_level  = 0.99,
#'                                                                   volatility_id = "downturn",
#'                                                                   expected_roe  = 0.10,
#'                                                                   report_depth  = 0,
#'                                                                   simplify      = TRUE)
#' }
envrsk_portfolio_economic_capital_component <- function(access_token,
                                                        date,
                                                        positions,
                                                        base_cur      = NULL,
                                                        horizon       = NULL,
                                                        signif_level  = NULL,
                                                        volatility_id = NULL,
                                                        expected_roe  = NULL,
                                                        report_depth  = NULL,
                                                        simplify      = FALSE){
  end_point <- "portfolio-economic-capital-component"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id,
                  "expected_roe"  = expected_roe,
                  "report_depth"  = report_depth)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)
  
  out <- process_portfolio_return_values(res_out, simplify)
  return(out)
}

#' Compute Portfolio Hypothetical Risk Adjusted Performance (Regular)
#'
#' This function communicates with a given API endpoint to compute and return the hypothetical risk adjusted performance of a given portfolio, 
#' considering positions provided.
#'
#' @param access_token A string, required for the API call. This represents the authentication token.
#' @param date         A string in the format 'yyyy-mm-dd', required for the API call. The date of the portfolio.
#' @param positions    A data frame or matrix. Each row represents a position in the portfolio with necessary details.
#' @param base_cur     A string representing the base currency for the portfolio. Default is NULL.
#' @param horizon      Numeric. The time horizon in days for which the value at risk is calculated. Default is NULL.
#' @param signif_level Numeric. The significance level for the value at risk calculation. Default is NULL.
#' @param volatility_id An optional identifier for a specific volatility model to use in the calculation. Default is NULL.
#' @param expected_roe Expected return on equity, as a decimal. Default is NULL.
#' @param report_depth The depth to which the report should calculate risk. Default is NULL.
#' @param simplify     Logical indicating whether the result should be simplified, if possible. Default is FALSE.
#' 
#' @return If simplify = FALSE, a list with the following components is returned:
#'         - "Input": A list containing the input parameters used in the API call.
#'         - "tech_opr": The timestamp of when the API call was made.
#'         - "Output": A data.table with the calculated risk performance.
#'         - "symbols_mapped": A data.table with the symbol mapping.
#'         - "symbols_unmapped": A data.table with the symbols that could not be mapped.
#'         If simplify = TRUE, only the "Output" data.table is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' dt_positions <- as.data.frame(list("symbol"        = c("AAPL.US", "DANSKE.CO", "CashUSD", "AGG.US"),
#'                                    "position_type" = c("single_stock", "single_stock", "cash", "etf"),
#'                                    "quantity"      = c(129, 768, 69000, 89)))
#'                                    
#' result <- envrsk_portfolio_portfolio_hyp_rskadj_perf_regular(access_token = "your_access_token",
#'                                                              date         = "2023-05-20",
#'                                                              positions    = dt_positions,
#'                                                              base_cur     = "USD",
#'                                                              horizon      = 1,
#'                                                              signif_level = 0.95,
#'                                                              expected_roe = 0.1,
#'                                                              report_depth = 3,
#'                                                              simplify = TRUE)
#' }
envrsk_portfolio_portfolio_hyp_rskadj_perf_regular <- function(access_token,
                                                               date,
                                                               positions,
                                                               base_cur      = NULL,
                                                               horizon       = NULL,
                                                               signif_level  = NULL,
                                                               volatility_id = NULL,
                                                               expected_roe  = NULL,
                                                               report_depth  = NULL,
                                                               simplify      = FALSE){
  end_point <- "portfolio-hyp-rskadj-perf-regular"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id,
                  "expected_roe"  = expected_roe,
                  "report_depth"  = report_depth)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)
  
  out <- process_portfolio_return_values(res_out, simplify)
  return(out)
}

#' @export
envrsk_portfolio_portfolio_hyp_rskadj_perf_component <- function(access_token,
                                                                 date,
                                                                 positions,
                                                                 base_cur      = NULL,
                                                                 horizon       = NULL,
                                                                 signif_level  = NULL,
                                                                 volatility_id = NULL,
                                                                 expected_roe  = NULL,
                                                                 report_depth  = NULL,
                                                                 simplify      = FALSE){
  end_point <- "portfolio-hyp-rskadj-perf-component"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id,
                  "expected_roe"  = expected_roe,
                  "report_depth"  = report_depth)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)
  
  out <- process_portfolio_return_values(res_out, simplify)
  return(out)
}

#' @export
envrsk_portfolio_hypothetical_performance <- function(access_token,
                                                      date,
                                                      positions,
                                                      base_cur     = NULL,
                                                      report_depth = NULL,
                                                      simplify     = FALSE){
  end_point <- "portfolio-hyp-perf"
  api_url <- paste0(base_url, base_path, end_point)

  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "report_depth"  = report_depth)
  .params <- .params[lengths(.params) != 0]

  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)
  out <- process_portfolio_return_values(res_out, simplify)
  return(out)
}

#' Process API Response
#'
#' This function processes the response from the portfolio risk API.
#' It binds rows of the 'Output', 'Positions_Mapped', and 'Positions_UnMapped' lists 
#' into data frames using the 'rbindlist' function from the 'data.table' package.
#' If the 'simplify' parameter is TRUE, it returns only the 'Output' data frame; 
#' otherwise, it returns the entire response.
#'
#' @param res_out A list containing the API response.
#' @param simplify A logical value indicating whether to simplify the return values.
#'
#' @return A list or a data frame depending on the 'simplify' parameter. 
#'         If the API response status code is not 200, it returns the original response.
#'
#' @examples
#' \dontrun{
#' processed_output <- process_portfolio_return_values(res_out = api_response, simplify = TRUE)
#' }
process_portfolio_return_values <- function(res_out, simplify){
  if(res_out[["status_code"]] == 200){
    out <- res_out[["content"]]

    if(!is.null(out[["Output"]])){
      out[["Output"]] <- data.table::rbindlist(out[["Output"]], fill = TRUE)
    }

    if(!is.null(out[["Positions_Mapped"]])){
      out[["Positions_Mapped"]] <- data.table::rbindlist(out[["Positions_Mapped"]], fill = TRUE)
    }

    if(!is.null(out[["Positions_UnMapped"]])){
      out[["Positions_UnMapped"]]     <- data.table::rbindlist(out[["Positions_UnMapped"]], fill = TRUE)
    }

    if(simplify){
      return(out[["Output"]])
    } else {
      return(out)
    }
  } else {
    return(res_out)
  }
}

#******************************************************************************
#### Instrument ####
#******************************************************************************
#' Instrument Search
#'
#' This function calls the 'search-instrument' endpoint of the EnvisionRisk API 
#' to search for financial instruments by partial name, symbol, exchange ID, or position type.
#' The search is done based on the current or specified date.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param partial_name A string, a partial name of the financial instrument.
#' @param partial_symbol A string, a partial symbol of the financial instrument.
#' @param partial_exchange_id A string, a partial exchange ID of the financial instrument.
#' @param position_type A string, the type of position to search for.
#' @param valid_at A string, date at which the financial instrument must be valid (YYYY-MM-DD).
#'
#' @return A data frame containing the details of the instruments matching the search criteria 
#'         or the original API response if the status code is not 200.
#' @export
#'
#' @examples
#' \dontrun{
#' instruments <- envrsk_instrument_search(access_token = "your_access_token", 
#'                                         partial_name = "AAPL")
#' }
envrsk_instrument_search <- function(access_token,
                                     partial_name        = NULL,
                                     partial_symbol      = NULL,
                                     partial_exchange_id = NULL,
                                     position_type       = NULL,
                                     valid_at            = NULL){
  end_point <- "search-instrument"
  api_url <- paste0(base_url, base_path, end_point)

  .params <- list("partial_name"        = partial_name,
                  "partial_symbol"      = partial_symbol,
                  "partial_exchange_id" = partial_exchange_id,
                  "position_type"       = position_type,
                  "valid_at"            = valid_at)
  .params <- .params[lengths(.params) != 0]

  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = list())

  if(res_out[["status_code"]] == 200){
    out <- data.table::rbindlist(res_out[["content"]][["Output"]], fill = TRUE)
  } else {
    return(res_out)
  }
  return(out)
}

#' Instrument Performance
#'
#' This function calls the 'instrument-performance' endpoint of the EnvisionRisk API 
#' to retrieve performance data for a set of financial instruments.
#' The performance is calculated over a specified period and frequency.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param symbols A list, the symbols of the financial instruments for which performance data is required.
#' @param base_cur A string, the base currency in which the performance is calculated.
#' @param from A string, the start date for the performance period (YYYY-MM-DD).
#' @param to A string, the end date for the performance period (YYYY-MM-DD).
#' @param days An integer, the frequency at which performance data is calculated.
#' @param direction A string, whether the performance is calculated in a leading ('lead') or lagging ('lag') manner.
#' @param overlap A boolean, whether overlapping returns are allowed in the calculation.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output performance data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' performance <- envrsk_instrument_performance(access_token = "your_access_token", 
#'                                              symbols = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_instrument_performance <- function(access_token,
                                          symbols,
                                          base_cur  = NULL,
                                          from      = NULL,
                                          to        = NULL,
                                          days      = 1,
                                          direction = "lead",
                                          overlap   = TRUE){
  end_point <- "instrument-performance"
  api_url <- paste0(base_url, base_path, end_point)
  
  .params <- list("base_cur"  = base_cur,
                  "from"      = from,
                  "to"        = to,
                  "days"      = days,
                  "direction" = direction,
                  "overlap"   = overlap)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Instrument Performance
#'
#' This function calls the 'instrument-performance-raw' endpoint of the EnvisionRisk API 
#' to retrieve performance data for a set of financial instruments. The endpoint does not 
#' apply currency conversion. The performance is calculated over a specified period 
#' and frequency.
#' 
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param symbols A list, the symbols of the financial instruments for which performance data is required.
#' @param base_cur A string, the base currency in which the performance is calculated.
#' @param from A string, the start date for the performance period (YYYY-MM-DD).
#' @param to A string, the end date for the performance period (YYYY-MM-DD).
#' @param days An integer, the frequency at which performance data is calculated.
#' @param direction A string, whether the performance is calculated in a leading ('lead') or lagging ('lag') manner.
#' @param overlap A boolean, whether overlapping returns are allowed in the calculation.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output performance data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' performance <- envrsk_instrument_performance_raw(access_token = "your_access_token", 
#'                                                  symbols = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_instrument_performance_raw <- function(access_token,
                                              symbols,
                                              from      = NULL,
                                              to        = NULL,
                                              days      = 1,
                                              direction = "lead",
                                              overlap   = TRUE){
  end_point <- "instrument-performance-raw"
  api_url <- paste0(base_url, base_path, end_point)
  
  .params <- list("from"      = from,
                  "to"        = to,
                  "days"      = days,
                  "direction" = direction,
                  "overlap"   = overlap)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Instrument Value at Risk
#'
#' This function calls the 'instrument-value-at-risk' endpoint of the EnvisionRisk API 
#' to compute the Value at Risk (VaR) for a set of financial instruments.
#' VaR is a statistical measure that quantifies the level of financial risk within a firm or investment portfolio over a specific time frame.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param date A string, the date at which VaR is to be computed (YYYY-MM-DD).
#' @param symbols A list, the symbols of the financial instruments for which VaR is to be computed.
#' @param base_cur A string, the base currency in which VaR is to be computed.
#' @param horizon An integer, the time horizon over which VaR is computed.
#' @param signif_level A numeric, the significance level for the VaR calculation (between 0 and 1).
#' @param volatility_id An integer, the ID of the volatility model to be used.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output VaR data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' var <- envrsk_instrument_value_at_risk(access_token = "your_access_token", 
#'                                        date = "2023-06-01", 
#'                                        symbols = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_instrument_value_at_risk <- function(access_token,
                                     date,
                                     symbols,
                                     base_cur      = NULL,
                                     horizon       = NULL,
                                     signif_level  = NULL,
                                     volatility_id = NULL){
  end_point <- "instrument-value-at-risk"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Instrument Value at Risk
#'
#' This function calls the 'instrument-value-at-risk-raw' endpoint of the EnvisionRisk API 
#' to compute the Value at Risk (VaR) for a set of financial instruments.
#' VaR is a statistical measure that quantifies the level of financial risk within a firm or investment portfolio over a specific time frame.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param date A string, the date at which VaR is to be computed (YYYY-MM-DD).
#' @param symbols A list, the symbols of the financial instruments for which VaR is to be computed.
#' @param base_cur A string, the base currency in which VaR is to be computed.
#' @param horizon An integer, the time horizon over which VaR is computed.
#' @param signif_level A numeric, the significance level for the VaR calculation (between 0 and 1).
#' @param volatility_id An integer, the ID of the volatility model to be used.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output VaR data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' var <- envrsk_instrument_value_at_risk_raw(access_token = "your_access_token", 
#'                                            date = "2023-06-01", 
#'                                            symbols = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_instrument_value_at_risk_raw <- function(access_token,
                                         date,
                                         symbols,
                                         horizon       = NULL,
                                         signif_level  = NULL,
                                         volatility_id = NULL){
  end_point <- "instrument-value-at-risk-raw"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Instrument Expected Shortfall
#'
#' This function calls the 'instrument-expected-shortfall' endpoint of the EnvisionRisk API 
#' to compute the Expected Shortfall (ES), also known as Conditional Value at Risk (CVaR), for a set of financial instruments.
#' ES is a risk measure that quantifies the expected value of loss given that an event beyond the VaR threshold has occurred.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param date A string, the date at which ES is to be computed (YYYY-MM-DD).
#' @param symbols A list, the symbols of the financial instruments for which ES is to be computed.
#' @param base_cur A string, the base currency in which ES is to be computed.
#' @param horizon An integer, the time horizon over which ES is computed.
#' @param signif_level A numeric, the significance level for the ES calculation (between 0 and 1).
#' @param volatility_id An integer, the ID of the volatility model to be used.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output ES data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' es <- envrsk_instrument_expected_shortfall(access_token = "your_access_token", 
#'                                            date = "2023-06-01", 
#'                                            symbols = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_instrument_expected_shortfall <- function(access_token,
                                          date,
                                          symbols,
                                          base_cur      = NULL,
                                          horizon       = NULL,
                                          signif_level  = NULL,
                                          volatility_id = NULL){
  end_point <- "instrument-expected-shortfall"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Instrument Expected Shortfall
#'
#' This function calls the 'instrument-expected-shortfall-raw' endpoint of the EnvisionRisk API 
#' to compute the Expected Shortfall (ES), also known as Conditional Value at Risk (CVaR), for a set of financial instruments.
#' ES is a risk measure that quantifies the expected value of loss given that an event beyond the VaR threshold has occurred.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param date A string, the date at which ES is to be computed (YYYY-MM-DD).
#' @param symbols A list, the symbols of the financial instruments for which ES is to be computed.
#' @param base_cur A string, the base currency in which ES is to be computed.
#' @param horizon An integer, the time horizon over which ES is computed.
#' @param signif_level A numeric, the significance level for the ES calculation (between 0 and 1).
#' @param volatility_id An integer, the ID of the volatility model to be used.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output ES data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' es <- envrsk_instrument_expected_shortfall_raw(access_token = "your_access_token", 
#'                                                date = "2023-06-01", 
#'                                                symbols = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_instrument_expected_shortfall_raw <- function(access_token,
                                              date,
                                              symbols,
                                              horizon       = NULL,
                                              signif_level  = NULL,
                                              volatility_id = NULL){
  end_point <- "instrument-expected-shortfall-raw"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Instrument Delta Vector
#'
#' This function calls the 'instrument-delta-vector' endpoint of the EnvisionRisk API 
#' to compute the delta vector for a set of financial instruments. The delta vector provides 
#' the partial derivatives of the financial instruments' value with respect to an underlying 
#' asset price, providing an indication of the sensitivity of the instruments' value to changes 
#' in the asset price.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param date A string, the date at which the delta vector is to be computed (YYYY-MM-DD).
#' @param symbols A list, the symbols of the financial instruments for which the delta vector is to be computed.
#' @param base_cur A string, the base currency in which the delta vector is to be computed.
#' @param horizon An integer, the time horizon over which the delta vector is computed.
#' @param volatility_id An integer, the ID of the volatility model to be used.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output delta vector data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' delta_vec <- envrsk_instrument_delta_vector(access_token = "your_access_token", date = "2023-06-01", symbols = c("AAPL", "GOOGL"))
#' }
envrsk_instrument_delta_vector <- function(access_token,
                                           date,
                                           symbols,
                                           base_cur      = NULL,
                                           horizon       = NULL,
                                           volatility_id = NULL){
  end_point <- "instrument-delta-vector"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "volatility_id" = volatility_id)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' @export
envrsk_instrument_delta_vector_raw <- function(access_token,
                                               date,
                                               symbols,
                                               horizon       = NULL,
                                               volatility_id = NULL){
  end_point <- "instrument-delta-vector-raw"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("date"          = date,
                  "horizon"       = horizon,
                  "volatility_id" = volatility_id)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}
#******************************************************************************
#### Time Series ####
#******************************************************************************
#' Market Price
#'
#' This function calls the 'market-price' endpoint of the EnvisionRisk API 
#' to obtain the market prices for a set of financial instruments. The prices are 
#' reported in the specified base currency.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param symbols A list, the symbols of the financial instruments for which the market prices are to be obtained.
#' @param base_cur A string, the base currency in which the market prices are to be reported.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output market price data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' market_prices <- envrsk_market_price(access_token = "your_access_token", 
#'                                      symbols = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_market_price <- function(access_token,
                                symbols,
                                base_cur = NULL){
  end_point <- "market-price"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list("base_cur" = base_cur)
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Market Price
#'
#' This function calls the 'market-price-raw' endpoint of the EnvisionRisk API 
#' to obtain the market prices for a set of financial instruments. The prices are 
#' reported in the specified base currency.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param symbols A list, the symbols of the financial instruments for which the market prices are to be obtained.
#' @param base_cur A string, the base currency in which the market prices are to be reported.
#'
#' @return A list containing the input parameters, the time of operation, 
#'         the output market price data, and details of mapped and unmapped symbols. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' market_prices <- envrsk_market_price_raw(access_token = "your_access_token", 
#'                                          symbols = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_market_price_raw <- function(access_token,
                                    symbols){
  end_point <- "market-price-raw"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list()
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Market Volatility
#'
#' This function calls the 'market-volatility' endpoint of the EnvisionRisk API to 
#' obtain the market volatilities for a set of financial instruments.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param symbols A list, the symbols of the financial instruments for which the market volatilities are to be obtained.
#'
#' @return A list containing the input parameters, the time of operation, the output market volatility data, 
#'         and details of mapped and unmapped symbols. If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' market_volatilities <- envrsk_market_volatility(access_token = "your_access_token", 
#'                                                 symbols      = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_market_volatility <- function(access_token,
                                     symbols){
  end_point <- "market-volatility"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list()
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#' Market Stress Volatility
#'
#' This function calls the 'market-stress-volatility' endpoint of the EnvisionRisk API to 
#' obtain the market stress volatilities for a set of financial instruments.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param symbols A list, the symbols of the financial instruments for which the market stress volatilities are to be obtained.
#'
#' @return A list containing the input parameters, the time of operation, the output market stress volatility data, 
#'         and details of mapped and unmapped symbols. If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' stress_volatilities <- envrsk_market_stress_volatility(access_token = "your_access_token", 
#'                                                        symbols      = c("AAPL.US", "DANSKE.CO"))
#' }
envrsk_market_stress_volatility <- function(access_token,
                                            symbols){
  end_point <- "market-stress-volatility"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list()
  .params <- .params[lengths(.params) != 0]
  
  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = symbols)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    
    out <- list(
      "Input"            = out_raw[["Input"]],
      "tech_opr"         = Sys.time(),
      "Output"           = data.table::rbindlist(out_raw[["Output"]], fill=TRUE),
      "symbols_mapped"   = data.table::rbindlist(out_raw[["Symbols_Mapped"]], fill = TRUE),
      "symbols_unmapped" = data.table::rbindlist(out_raw[["Symbols_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }
  return(out)
}

#******************************************************************************
#### Workflow ####
#******************************************************************************

# workflow-risk-snapshot #
#' @export
envrsk_workflow_risk_snapshot <- function(access_token,
                                          date,
                                          positions,
                                          risk_measure = "ES",
                                          base_cur      = NULL,
                                          horizon       = NULL,
                                          signif_level  = NULL,
                                          volatility_id = NULL){
  end_point <- "workflow-risk-snapshot"
  api_url <- paste0(base_url, base_path, end_point)

  .params <- list("date"          = date,
                  "risk_measure"  = risk_measure,
                  "base_cur"      = base_cur,
                  "horizon"       = horizon,
                  "signif_level"  = signif_level,
                  "volatility_id" = volatility_id)
  .params <- .params[lengths(.params) != 0]

  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = positions)

  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]

    out <- list(
      "Input"                  = out_raw[["Input"]],
      "tech_opr"               = out_raw[["tech_opr"]],
      "positions"              = data.table::rbindlist(out_raw[["positions"]]),
      "portfolio_delta_vector" = data.table::rbindlist(out_raw[["portfolio_delta_vector"]]),
      "portfolio_risk"         = data.table::rbindlist(out_raw[["portfolio_risk"]]),
      "positions_mapped"       = data.table::rbindlist(out_raw[["Positions_Mapped"]], fill = TRUE),
      "positions_unmapped"     = data.table::rbindlist(out_raw[["Positions_UnMapped"]], fill = TRUE)
    )
  } else {
    return(res_out)
  }

  return(out)
}

# workflow-backtest #
#' @export
envrsk_workflow_backtest <- function(access_token,
                                     backtestdata,
                                     base_cur      = NULL,
                                     signif_level  = NULL){

  end_point <- "workflow-backtest"
  api_url <- paste0(base_url, base_path, end_point)

  .params <- list("base_cur"      = base_cur,
                  "signif_level"  = signif_level)
  .params <- .params[lengths(.params) != 0]

  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = backtestdata)

  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]

    out <- list("Title"  = out_raw[["Title"]],
                "Input"  = list("backtestdata" = data.table::rbindlist(out_raw[["Input"]][["BacktestData"]]),
                                "base_cur"     = out_raw[["Input"]][["BaseCur"]],
                                "signif_level" = out_raw[["Input"]][["SignifLevel"]]),
                "TechOpr"  = out_raw[["TechOpr"]],
                "Output"   = data.table::rbindlist(out_raw[["Output"]]))
  } else {
    return(res_out)
  }

  return(out)
}

#' @export
envrsk_workflow_weight_2_quantities <- function(access_token, dt_snapshot_weight,
                                                init_port_market_value, base_cur,
                                                is_wide = FALSE, to_date = NULL){
  if(is.null(to_date)){
    to_date <- Sys.Date()
  }

  end_point <- "workflow-weight-2-quantities"
  api_url <- paste0(base_url, base_path, end_point)

  .params <- list("init_port_market_value" = init_port_market_value,
                  "is_wide"                = is_wide,
                  "base_cur"               = base_cur,
                  "to_date"                = to_date)
  .params <- .params[lengths(.params) != 0]

  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = .params,
                         body         = dt_snapshot_weight)

  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]

    out <- list("Title"  = out_raw[["Title"]],
                "Input"  = list("PortfolioWeights" = data.table::rbindlist(out_raw$Input$PortfolioWeights),
                                "base_cur"         = out_raw[["Input"]][["BaseCur"]],
                                "signif_level"     = out_raw[["Input"]][["SignifLevel"]]),
                "TechOpr"  = out_raw[["TechOpr"]],
                "Output"  = list("PortfolioEvents"    = data.table::rbindlist(out_raw$Output$Events, fill = TRUE),
                                 "PortfolioQuantites" = data.table::rbindlist(out_raw$Output$Positions)),
                "UnMappedSymbols" = data.table::rbindlist(out_raw$Output$UnmappedSymbols, fill = TRUE))
  } else {
    return(res_out)
  }
}

#******************************************************************************
#### Manifest ####
#******************************************************************************
#' Get Manifest
#'
#' This function calls the 'get-manifest' endpoint of the EnvisionRisk API to 
#' obtain the manifest, which includes available parameters for portfolio construction and risk computation.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#'
#' @return If the API call is successful, a list containing the manifest data is returned, 
#'         with portfolio constituents combined into a single vector. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' manifest <- envrsk_get_manifest(access_token = "your_access_token")
#' }
envrsk_get_manifest <- function(access_token){
  end_point <- "get-manifest"
  api_url <- paste0(base_url, base_path, end_point)
  
  # Query parameters
  .params <- list()
  
  res_out <- envrsk_get(url          = api_url,
                        access_token = access_token,
                        params       = .params)
  
  if(res_out[["status_code"]] == 200){
    out_raw <- res_out[["content"]]
    out_raw[["PORT_CONSTITUENTS"]] <- do.call(c, out_raw[["PORT_CONSTITUENTS"]])
  } else {
    return(res_out)
  }
  return(out_raw)
}

#******************************************************************************
#### Miscellaneous ####
#******************************************************************************
# common-decorate-table-id #
#' @export
envrsk_decorate_portfolio_id <- function(access_token, positions, simplify = TRUE){
  end_point <- "decorate-table-id"
  api_url <- paste0(base_url, base_path, end_point)

  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = list(),
                         body         = positions)
  if(res_out[["status_code"]] == 200){
    out <- res_out[["content"]]

    if(!is.null(out[["Output"]])){
      out[["Output"]] <- data.table::rbindlist(out[["Output"]], fill = TRUE)
    }

    if(simplify){
      return(out[["Output"]])
    } else {
      return(out)
    }
  } else {
    return(res_out)
  }
  return(out)
}

# common-decorate-position-id #
#' Decorate Portfolio ID
#'
#' This function calls the 'decorate-table-id' endpoint of the EnvisionRisk API 
#' to enrich portfolio position data with additional information based on position ID.
#'
#' @param access_token A string, the access token obtained from the EnvisionRisk API for authentication.
#' @param positions A list of positions to be enriched with additional information.
#' @param simplify Logical, indicating whether to simplify the output. If TRUE, only the output content is returned. 
#'        If FALSE, the entire API response is returned. Default is TRUE.
#'
#' @return If the API call is successful, a list containing the enriched positions is returned. 
#'         If the API call is unsuccessful, the original API response is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' dt_positions <- as.data.frame(list("symbol"        = c("AAPL.US", "DANSKE.CO", "CashUSD", "AGG.US"),
#'                                    "position_type" = c("single_stock", "single_stock", "cash", "etf"),
#'                                    "quantity"      = c(129, 768, 69000, 89)))
#' decorated_positions <- envrsk_decorate_portfolio_id(access_token = "your_access_token", 
#'                                                     positions    = dt_positions)
#' }
envrsk_decorate_position_id <- function(access_token, positions, simplify = TRUE){
  end_point <- "decorate-position-id"
  api_url <- paste0(base_url, base_path, end_point)

  res_out <- envrsk_post(url          = api_url,
                         access_token = access_token,
                         params       = list(),
                         body         = positions)

  if(res_out[["status_code"]] == 200){
    out <- res_out[["content"]]

    if(!is.null(out[["Output"]])){
      out[["Output"]] <- data.table::rbindlist(out[["Output"]], fill = TRUE)
    }

    if(simplify){
      return(out[["Output"]])
    } else {
      return(out)
    }
  } else {
    return(res_out)
  }
  return(out)
}

#******************************************************************************
#### R Functionality ####
#******************************************************************************



library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyjs)

if (interactive()) {
  header <- dashboardHeader()
  sidebar <- dashboardSidebar(disable = TRUE)
  
  body <- dashboardBody(
    tabItems(
      tabItem("dashboard",
              div(p("Dashboard tab content"))
      ),
      tabItem("widgets",
              "Widgets tab content"
      ),
      tabItem("subitem1",
              "Sub-item 1 tab content"
      ),
      tabItem("subitem2",
              "Sub-item 2 tab content"
      )
    )
  )
  
  shinyApp(
    ui = dashboardPage(header, sidebar, body),
    server = function(input, output) { }
  )
}


#libraries
{
  library(purrr)
  library(zoo)
  library(xts)
  library(TTR)
  library(ggplot2)    ## grammar of graphics
  library(reshape2)   ##reshaping data frames
  library(lattice)    ##More graphics
  library(hexbin)     ## ... and more graphics
  library(gridExtra)  ## even more graphics
  library(xtable)     ##Latex formatting of tables
  library(splines)    ##splines -- surprise :-)
  library(survival)   ##survival analysis
  library(grid)       ##for 'unit'
  library(lpSolve)    ##linear programming
  library(tidyverse)  ##
  library(tidyquant)  ## quant library 1
  library(quantmod)   ## quant library 2
  library(Quandl)     ## quant library 3
  library(fasttime)   ## time conversion
  library(xlsx)       ## omskrive til excel
  library(readxl)     ## read excel files
  library(readODS)    ## read ODS files
  library(xml2)       ## read xml files
  library(data.table)
  library(haven)
  library(dplyr)
  library(plyr)
  library(curl)
  library(jsonlite)
  library(nloptr)
  library(readr)
}

{
  Moneyness <- function(S, K, R, T)  #actual formula
  {
    K*exp(-R*T)/S
  }
  
  #rettes til parametre eller slettes
  BSprice <- function(S, K, R, T, sig, q, typen) 
  {
    typen <- tolower(typen)
    d_1 <- (log(S/K) + (R- q + (sig^2/2))*T) / (sig*sqrt(T))
    d_2 <- d_1 - (sig*sqrt(T))
    
    
    
    if(typen=="put")
    {
      price <- (K*exp(-R*T)*pnorm(-d_2)) - (S*exp(-q*T)*pnorm(-d_1))
      if (T < 0.01)
      {price <- max(S-K,0)}
      else if (price >=0)
      {price <- price}
      else
      {price <- 0}
    }
    else if(typen=="call") 
    {
      price <- (S*exp(-q*T)*pnorm(d_1)) - (K*exp(-R*T)*pnorm(d_2))
      if (T < 0.01)
      {price <- max(S-K,0)}
      else if (price >=0)
      {price <- price}
      else
      {price <- 0}
    }
    
    return(price)
  }
  
  #rettes til parametre
  implvoli <- function(p,s,k,r,t,q,typen)
  {
    volOptimFun <- function(p, s, k, r, t, sig, q, typen){
      abs(p - BSprice(s, k, r, t, sig, q, typen))
    }
    
    return(optimize(volOptimFun, interval = c(0, 2), p = p, s = s, k = k, r = r,t = t, q = q, type = typen)$minimum)
  }
  
  #rettes til fundamental pris funktion
  HestonCallClosedForm <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K) 
  {
    
    PIntegrand <- function(u, lambda, vbar, eta, rho, v0, r, tau, S0, K, j) 
    {
      F <- S0*exp(r*tau)
      x <- log(F/K)
      a <- lambda * vbar
      
      if (j == 1) {
        b <- lambda - rho* eta
        alpha <- - u^2/2 - u/2 * 1i + 1i * u
        beta <- lambda - rho * eta - rho * eta * 1i * u
      } else {
        b <- lambda
        alpha <- - u^2/2 - u/2 * 1i
        beta <- lambda - rho * eta * 1i * u
      }
      
      gamma <- eta^2/2
      d <- sqrt(beta^2 - 4*alpha*gamma)
      rplus <- (beta + d)/(2*gamma)
      rminus <- (beta - d)/(2*gamma)
      g <- rminus / rplus
      
      D <- rminus * (1 - exp(-d*tau))/(1-g*exp(-d*tau))
      C <- lambda * (rminus * tau - 2/(eta^2) * log( (1-g*exp(-d*tau))/(1-g) ) )
      
      top <- exp(C*vbar + D*v0 + 1i*u*x)
      bottom <- (1i * u)
      Re(top/bottom)
    }
    
    P <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K, j) 
    {
      value <- integrate(PIntegrand, lower = 0, upper = Inf, lambda, vbar, eta, rho, v0, r, tau, S0, K, j,subdivisions=1000)$value
      0.5 + 1/pi * value
    }
    
    A <- S0*P(lambda, vbar, eta, rho, v0, r, tau, S0, K, 1)
    B <- K*exp(-r*tau)*P(lambda, vbar, eta, rho, v0, r, tau, S0, K, 0)
    A-B
  }
  
  Hestoncf <- function(params, u, t, S)
  {
    kappa <- params[1]
    theta <- params[2]
    sigma <- params[3]
    rho <- params[4]
    v0 <- params[5]
    r <- params[6]
    
    lambda <- 0
    x <- log(S)
    
    a <- -u * (u + 1i) / 2
    b <- kappa - rho * sigma * 1i * u
    d <- sqrt(b^2 - 4 * a * sigma^2)
    g1 <- (b - d) / (2 * sigma^2)
    g2 <- (b + d) / (2 * sigma^2)
    
    Cf <- exp( (1i * u * (x + r * t)) + (kappa * theta * t * g1) / sigma^2 ) * (1 - exp(-d * t)) / (1 - g1 * exp(-d * t))
    Cf <- Cf * exp( (a * v0) / (1 - exp(-d * t)) / sigma^2 * (1 - exp(-d * t)) / (1 - g1 * exp(-d * t)))
    
    return(Cf)
  }
  
  #rettes eller slettes
  Hestonprice <- function(params, t, S, K) 
  {
    integrand <- function(u) 
    {
      Re(Hestoncf(params, u - (1i / 2), t, S) * exp(-1i * u * log(K)) / (u^2 + 0.25))
    }
    
    integral_value <- integrate(integrand, lower = 0, upper = Inf, subdivisions = 1000)$value
    price <- S * (0.5 + (1 / pi) * integral_value) - K * exp(-params[[6]] * t) * (0.5 + (1 / pi) * integral_value)
    
    return(price)
  }
  
  vol_smile <- function(data,choice)
  {
    
    #data struktur  
    {  
      last <- data$Last
      stock <- tail(tq_get("AAPL", get="stock.prices", from = as.Date(Sys.Date()-3), to = as.Date(Sys.Date()))['close'],1)[[1]]
      strike <- data$Strike
      expdate <- data$expdate
      typen <- data$type
    }
    
    strikes <- list()
    implied_volatility <- list()
    
    
    for (i in 1:length(last))
    {
      if (typen[i]==choice)
      {
        strikes <- append(strikes, strike[i])
        implied_volatility <- append(implied_volatility,implvoli(last[i], stock, strike[i], 0.05, expdate[i],0, typen[i]))
      }
      else if (choice=="both")
      {
        strikes <- append(strikes, strike[i])
        implied_volatility <- append(implied_volatility,implvoli(last[i], stock, strike[i], 0.05, expdate[i],0, typen[i]))}
      else
      {}
    }
    plot(strikes,implied_volatility)
    
  }
  
  Calibration <- function(S,K,Market)
  {
    
    params <- c(kappa = 2, theta = 0.05, sigma = 0.5, rho = -0.5, v0 = 0.01, r = 0.03)
    lower_bounds <- c(0.1, 0.01, 0.1, -0.99, 0.0001, 0.0001)
    upper_bounds <- c(10, 1, 2, 0.99, 1, 0.5)
    constraints <- list("lower" = lower_bounds, "upper" = upper_bounds)
    
    #minimize squared error between market price and expected price via heston
    Hestoncalibration <- function(params,S,K) 
    {
      market_prices <- list()
      heston_prices <- list()
      errors <- list()
      sum_errors <- 0
      for (i in 1:nrow(Market))
      {
        market_prices <- append(market_prices, as.numeric(Market[i,1]))
        heston_prices <- append(heston_prices, as.numeric(mapply(Hestonprice, 1, S, K[[i,1]], MoreArgs = list(params = params))) )
        errors <- append(errors,(heston_prices[[i]] - market_prices[[i]])^2)
        sum_errors <- sum_errors + errors[[i]]
      }
      
      return(sum_errors)
    }
    
    #optimization of objective function with nonlinear optimization
    {
      result <- nloptr(
        x0 = params,
        S = S,
        K = Kk,
        eval_f = Hestoncalibration,
        lb = constraints$lower,
        ub = constraints$upper,
        opts = list("algorithm" = "NLOPT_LN_COBYLA", "xtol_rel" = 1.0e-6, "maxeval" = 10000)
      )
      
      
    }
    calibrated_params <- result$solution
  }
  
  HestonSurface <- function(lambda, vbar, eta, rho, v0, r, tau, S0,choice) #skal rettes
  {
    
    if (choice=="data")
    {
      N= 20
      LogStrikes <- seq(-0.5, 0.5, length=N)
      Ks <- rep(0.0,N)
      taus <- seq(1/250, tau, length=N)
      vols <- matrix(0,N,N)
      
      TTM <- Money <- Vol <- rep(0,N*N)
      
      HestonPrice <- function(K, tau) {
        HestonCallClosedForm(lambda, vbar, eta, rho, v0, r, tau, S0, K)
      }
      
      n <- 1
      for (i in 1:N) {
        for (j in 1:N) {
          Ks[i] <- exp(r * taus[j]+LogStrikes[i]) * S0
          price <- HestonPrice(Ks[i],taus[j])
          iv <- implvoli(price, S0, Ks[i], r, taus[j],0,"call")
          TTM[n] <- taus[j] # in days
          Money[n] <- Moneyness(S0,Ks[i], r,taus[j])
          Vol[n] <- iv
          n <- n+1
        }
      }
      
      data.frame(TTM=TTM, Moneyness=Money, ImpliedVol=Vol)
    }
    
    else if (choice == "plot")
    {
      r <- 0.05
      tau <- 0.839
      N <- 40
      LogStrikes <- seq(-0.5, 0.5, length=N)
      Ks <- rep(0.0,N)
      taus <- seq(0.1*tau, tau*1.2, length=N)
      vols <- matrix(0,N,N)
      
      TTM <- Money <- Vol <- rep(0,N*N)
      
      HestonPrice <- function(K, tau) {
        HestonCallClosedForm(resultat[1], resultat[2], resultat[3], resultat[4], resultat[5], resultat[6], tau, S0, K)
      }
      
      n <- 1
      for (i in 1:N) {
        for (j in 1:N) {
          Ks[i] <- exp(r * taus[j]+LogStrikes[i]) * S0
          price <- HestonPrice(Ks[i],taus[j])
          iv <- implvoli(price, S0, Ks[i], r, taus[j],0,"call")
          TTM[n] <- taus[j] # in days
          Money[n] <- Moneyness(S0,Ks[i],r,taus[j])
          Vol[n] <- iv
          n <- n+1
        }
      }
      
      
      IVHeston <- Vectorize(function(K,T) { implvoli( HestonPrice(K,T), S0, K, r, T, 0,"call") })
      Ks <- as.double(Ks)
      taus <- as.double(taus)
      
      z <- outer(Ks, taus, IVHeston)
      
      
      persp(x=Ks, y=taus, z, theta = 45, phi = 20, expand = 0.5,
            xlab="Strikes", ylab="Time to maturity", zlab="Implied Volatility",
            ticktype="detailed")
    }
    
  }
  
  volsmilet <- function(optionheston, datoudvalg)
  {
    snittet <- rep(0,20)
    snitte <- rep(0,20)
    for (j in 0:19) {
      k <- j*20+datoudvalg
      snittet[j] <- OptionHest[k,2] *St #moneyness
      snitte[j] <- OptionHest[k,3] #implvol
    }
    snittet <- snittet[-20]
    snitte <- snitte[-20]
    smilet <- cbind(snittet,snitte) #moneyness = 1, implvol = 2
    plot(smilet[,2],smilet[,1])
  }
  
} 



#gemte funktioner
{
  y1 <- as.character(year(Sys.Date()))
  y2 <- as.character(year(Sys.Date())+1)
  optchainy1 <- getOptionChain("AAPL",y1)
  optchainy2 <- getOptionChain("AAPL",y2)
  
  
  for (i in 1:length(optchainy1))
  {
    if (i==1)
    {
      optionchain <- optchainy1[[i]]$calls; optionchain <- rbind(optionchain, optchainy1[[i]]$puts)
    }
    else
    {
      optionchain <- rbind(optionchain, optchainy1[[i]]$calls)
      optionchain <- rbind(optionchain, optchainy1[[i]]$puts)
    }
  }
  
  for (i in 1:length(optchainy2))
  {
    optionchain <- rbind(optionchain, optchainy2[[i]]$calls)
    optionchain <- rbind(optionchain, optchainy2[[i]]$puts)
  }
}










options(scipen=999)

#### DEPENDENCIES ####
source("envrsk_api_bridge_2_R.R")

#### AUTHENTICATE ####
envrsk_auth_renew_access_token()
access_token <- my_access_token[["access-token"]]


resultat <- c(0.10000000, 0.56795006, 0.10000000, 0.99000000, 0.04056063, 0.41827654)
S <- envrsk_market_price(access_token,"AAPL.US")['Output']
for (i in 1:nrow(S$Output))
{  if (S$Output$date[i] == "2023-05-12")
{St <- as.integer(S$Output$close[i])}}


OptionHest <- HestonSurface(resultat[1], resultat[2], resultat[3], resultat[4], resultat[5], resultat[6], 0.839, St, "data")
HestonSurface(resultat[1], resultat[2], resultat[3], resultat[4], resultat[5], resultat[6], 0.839, St, "plot")

volsmilet(OptionHest['AAPL.US',"2023-07-23"],10)


delta_vector <- envrsk_instrument_delta_vector_raw(access_token = access_token, "2023-05-12", "AAPL.US")[['Output']]

# variabel valg
underliggende_værdi <- 121.3
price_change <- 0.03  #er altid vektorform(procent eller tal) - delta_vector

strike_v <- 100
delta_vector <- delta_vector[,1]
symbol = "AAPL.US"
ttm <- 1 #af et år anden type ttm <- "2023-07-23"
korseldato <- "2023-05-12"

implvol_vector()
{
  pc <- price_change*underliggende_værdi
  #1. timedifference
  time_dif <- as.integer(as.Date(ttm)) - as.integer(as.Date(korseldato)) 
  
  #2. danne volflade - sættes udenfor
  OptionHest #[korseldato]
  
  #3. trække slice for time_diff, her skal der findes den slice som har tættes time_diff til den valgte
  
  #slice[time_dif]
  {
    k <- time_dif
    TTMs <- OptionHest[k,1]
    snittet <- rep(0,20)
    snitte <- rep(0,20)
    snittet <- OptionHest[OptionHest$TTM == TTMs,2]*St
    snitte <- OptionHest[OptionHest$TTM == TTMs,3]#implvol
    smilet <- cbind(snittet,snitte) #moneyness = 1, implvol = 2
    smilet <- data.frame(smilet)
    plot(smilet[,1],smilet[,2])
  }
  
  #[moneyness = strike/stock_price] vi skal kigge på moneyness og ændre stock_price, for at se ændring i moneyness og trække på den data.
  
  #4. sigma_moneyness_p0[moneyness = strike/stock_price]    slå op i slice, hvad implvol er, ligger vi i sigma_moneyness_p0-value
  #
  sigma_moneyness_p0 <- mean(smilet[smilet$snittet > strike_v-4 & smilet$snittet < strike_v+4 ,2])
  #4. note, er ikke afhængig af price_change, kan lægges andet sted
  
  
  
  #5. sigma_moneyness_p1[moneyness = strike/(stock_price+change)]    slå op i slice, hvad implvol er, ligger vi i sigma_moneyness_p1-value
  #5. note, denne er vektor format.
  
  
  #kontinuert ikke stykvis.
  sigma_moneyness_p1 <- mean(smilet[smilet$snittet > (strike_v+pc)-4 & smilet$snittet < (strike_v+pc)+4 ,2])
  
}

#

{ 
  #5. prisnings_black_scholes_func en med sigma_moneyness_p0 og en med sigma_moneyness_p1
  
  simprice1 <- BSprice(strike_v,,0.05,1,sigma_moneyness_p0,0.03,"call") # 
  #BSprice(strike,underliggend_1,0.05,1,sigma_moneyness_p0,0.03,"call") # 
  simprice2 <- BSprice(strike_v,110,0.05,1,sigma_moneyness_p1,0.03,"call") #
  
  #BSprice(strike,underliggend_2,0.05,1,sigma_moneyness_p1,0.03,"call") #
  deltaPrice <- (simprice2 - simprice1)/simprice1 * 100
}

rente modeller DL kapitel 14

#source("DLkap14eksempel.R")

nkrenter<-0.0001*c(767,827,881,931,975,1016,1052,1085,1115,1142,1167,1189,1209,1227)

capT<-14

disk<-1/((1+nkrenter[1:capT])^(1:capT))

r<-q<-lambda<-matrix(0,ncol=(capT+1),nrow=(capT+3))

b<-0.02  # b<-0.0002  genskaber fuldstændig Luenbergers tal i Figure 14.11

a<-1:capT

q[,]<-0.5
lambda[2,1]<-1

for(i in 2:(capT+1)){
  
  crit <- function(a){
    dummy<-lambda[1:i,i-1]*q[1:i,i-1]/(1+a+b*(-1:(i-2)))+lambda[2:(i+1),i-1]*q[2:(i+1),i-1]/(1+a+b*(0:(i-1)))
    crit<-abs( sum(dummy) - 1/((1+nkrenter[i-1])^(i-1))) 
  }
  
  a[i-1]<-nlm(crit,p=c(0.08))$estimate[1]
  
  lambda[2:(i+1),i]<-lambda[1:i,i-1]*q[1:i,i-1]/(1+a[i-1]+b*(-1:(i-2)))+lambda[2:(i+1),i-1]*q[2:(i+1),i-1]/(1+a[i-1]+b*(0:(i-1)))
  
  r[2:i,(i-1)]<-a[i-1]+b*(0:(i-2))
  
}


tid<-0:capT

plot(tid,tid,ylim=c(0,0.30),type='n', main="A Ho/Lee-model calibrated to the yield curve from \n Luenbergers example 14.7")

for(i in 1:(capT-1)){
  for(j in 1:i){
    points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j,i+1]),type='b',lty=2)
    points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j+1,i+1]),type='b',lty=2)
  }
  
  
}




#source("Opg2HoLee.R")

nelsonsiegelyield<-function(tau,param){
  nelsonsiegelyield<-param[1]+(param[2]+param[3])*(1-exp(-tau/param[4]))/(tau/param[4])-param[3]*exp(-tau/param[4])
}

param<-c(0.044, -0.0069, -0.028,  0.67)

capT<-30

nkrenter<-nelsonsiegelyield(1:capT,param)

disk<-exp(-tid*nkrenter)

r<-q<-lambda<-matrix(0,ncol=(capT+1),nrow=(capT+3))

b<-0.02  # 

a<-1:capT

q[,]<-0.5
lambda[2,1]<-1

for(i in 2:(capT+1)){
  
  a[i-1]<- log(sum((lambda[1:i,i-1]*q[1:i,i-1]/exp(b*(-1:(i-2)))+lambda[2:(i+1),i-1]*q[2:(i+1),i-1]/exp(b*(0:(i-1)))))/disk[i-1]) 
  
  lambda[2:(i+1),i]<-lambda[1:i,i-1]*q[1:i,i-1]*exp(-a[i-1]-b*(-1:(i-2)))+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])*exp(-a[i-1]-b*(0:(i-1)))
  
  r[2:i,(i-1)]<-a[i-1]+b*(0:(i-2))
  
}


tid<-1:capT

graph<-FALSE

if (graph==TRUE){
  
  plot(tid,tid,ylim=c(-0.10,0.30),type='n', main="A Ho/Lee-model calibrated to a \n Danish yield curve May 2006 ")
  
  for(i in 1:(capT-1)){
    for(j in 1:i){
      points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j,i+1]),type='b',lty=2)
      points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j+1,i+1]),type='b',lty=2)
    }
    
  }
}

dt<-1

# Price caplet 

expiry<-5
pick1<-tid==expiry
pick2<-tid==(expiry+dt)

strike<-(disk[pick1]/disk[pick2] - 1)/dt

capletprice<-sum(lambda[,pick1]*exp(-dt*r[,pick1])*pmax((exp(dt*r[,pick1])-1)/dt-strike,0))

#source("Opg2Lognormal.R")

alfahage<-function (n,R) alfahage<-(1-(1+R)^(-n))/R

nelsonsiegelyield<-function(tau,param){
  nelsonsiegelyield<-param[1]+(param[2]+param[3])*(1-exp(-tau/param[4]))/(tau/param[4])-param[3]*exp(-tau/param[4])
}

param<-c(0.044, -0.0069, -0.028,  0.67)

capT<-120
dt<-0.25

tid<-dt*(1:capT)

nkrenter<-nelsonsiegelyield(tid,param)

disk<-exp(-tid*nkrenter)

x<-r<-q<-lambda<-matrix(0,ncol=(capT+1),nrow=(capT+3))

kappa<-0.0 # kappa=0 gives BDT

sigma<-0.25 # b in the BDT paramterization = 2*sigma

for(i in 1:capT){
  x[2:(i+1),i]<-exp(sqrt(dt)*sigma*seq( -(i-1), (i-1), 2 ))
  #q[2:(i+1),i]<-pmin(pmax(0.5-sqrt(dt)*kappa*x[2:(i+1),i]/(2*sigma),0),1)
  q[2:(i+1),i]<-pmin(pmax(0.5-sqrt(dt)*kappa*x[2:(i+1),i]/(2*sigma),0.01),0.99)
}

theta<-1:capT

lambda[2,1]<-1

for(i in 2:(capT+1)){
  crit <- function(a){
    dummy<-lambda[1:i,i-1]*q[1:i,i-1]*exp(-dt*a*x[1:i,(i-1)])+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])*exp(-dt*a*x[2:(i+1),(i-1)])
    crit<-sum(dummy) - disk[i-1] 
  }
  
  theta[i-1]<-uniroot(crit,c(0,1),tol=10^-8)$root
  
  lambda[2:(i+1),i]<-lambda[1:i,i-1]*q[1:i,i-1]*exp(-dt*theta[i-1]*x[1:i,(i-1)])+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])*exp(-dt*theta[i-1]*x[2:(i+1),(i-1)])
  r[2:i,(i-1)]<-theta[i-1]*x[2:i,(i-1)]
  
}

graph<-TRUE

if (graph==TRUE){
  
  plot(tid,tid,ylim=c(-0.01,0.20),type='n', main="A Lognormal model calibrated to a \n Danish yield curve May 2006",ylab='interest rate')
  
  for(i in 1:(capT-1)){
    for(j in 1:i){
      points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j,i+1]),type='b',lty=2)
      points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j+1,i+1]),type='b',lty=2)
    }
    
  }
  points(tid[2:(capT+1)],nkrenter,type='l')
}


# Price a caplet 

expiry<-5
pick1<-tid==expiry
pick2<-tid==(expiry+dt)

strike<-(disk[pick1]/disk[pick2] - 1)/dt

capletprice<-sum(lambda[,pick1]*exp(-dt*r[,pick1])*pmax((exp(dt*r[,pick1])-1)/dt-strike,0))


# Price the capped adjustable rate loan 

asifcoupon<-(1/disk[1] - 1)/dt

H<-100*alfahage(capT:0, dt*asifcoupon )/alfahage(capT, dt*asifcoupon )

Lbar<-0.07

CappedPrice<-H[1]

for (i in 1:capT){
  CappedPrice<-CappedPrice-H[i]*sum(lambda[,i]*exp(-dt*r[,i])*pmax((exp(dt*r[,i])-1)/dt-Lbar,0))
}




#source("Opg2Normal.R") 

alfahage<-function (n,R) alfahage<-(1-(1+R)^(-n))/R # nyttig fkt.def

nelsonsiegelyield<-function(tau,param){
  nelsonsiegelyield<-param[1]+(param[2]+param[3])*(1-exp(-tau/param[4]))/(tau/param[4])-param[3]*exp(-tau/param[4])
}

param<-c(0.044, -0.0069, -0.028,  0.67)

capT<-120
dt<-0.25

tid<-dt*(1:capT)

nkrenter<-nelsonsiegelyield(tid,param)

disk<-exp(-tid*nkrenter)

x<-r<-q<-lambda<-matrix(0,ncol=(capT+1),nrow=(capT+3))

kappa<-0.25 # kappa=0 gives Ho/Lee
# a(t) in the HL paramterization = theta(t) -sigma*t 

sigma<-0.01 # b in the HL paramterization = 2*sigma

for(i in 1:capT){
  x[2:(i+1),i]<-sqrt(dt)*sigma*seq( -(i-1), (i-1), 2 )
  q[2:(i+1),i]<-pmin(pmax(0.5-sqrt(dt)*kappa*x[2:(i+1),i]/(2*sigma),0),1)
  #q[2:(i+1),i]<-pmin(pmax(0.5-sqrt(dt)*kappa*x[2:(i+1),i]/(2*sigma),0.01),0.99)
}

theta<-1:capT

lambda[2,1]<-1

for(i in 2:(capT+1)){
  crit <- function(a){
    dummy<-lambda[1:i,i-1]*q[1:i,i-1]*exp(-dt*(a+x[1:i,(i-1)]))+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])*exp(-dt*(a+x[2:(i+1),(i-1)]))
    crit<-sum(dummy) - disk[i-1] 
  }
  
  #theta[i-1]<- log(sum((lambda[1:i,i-1]*q[1:i,i-1]*exp(-dt*x[1:i,(i-1)])+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])*exp(-dt*x[2:(i+1),(i-1)]))/disk[i-1]))/dt 
  # this is the explicit/closed-form solution
  
  theta[i-1]<-uniroot(crit,c(0,1),tol=10^-8)$root
  
  lambda[2:(i+1),i]<-lambda[1:i,i-1]*q[1:i,i-1]*exp(-dt*(theta[i-1]+x[1:i,(i-1)]))+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])*exp(-dt*(theta[i-1]+x[2:(i+1),(i-1)]))
  r[2:i,(i-1)]<-theta[i-1]+x[2:i,(i-1)]
  
}


graph<-FALSE

if (graph==TRUE){
  
  plot(tid,tid,ylim=c(-0.1,0.10),type='n', main="A Vasicek-model calibrated to a \n Danish yield curve May 2006,ylab='interest rate' ")
  
  for(i in 1:(capT-1)){
    for(j in 1:i){
      points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j,i+1]),type='b',lty=2)
      points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j+1,i+1]),type='b',lty=2)
    }
    
  }
  points(tid[2:(capT+1)],nkrenter,type='l')
}

# Price caplet 

expiry<-5
pick1<-tid==expiry
pick2<-tid==(expiry+dt)

strike<-(disk[pick1]/disk[pick2] - 1)/dt

capletprice<-sum(lambda[,pick1]*exp(-dt*r[,pick1])*pmax((exp(dt*r[,pick1])-1)/dt-strike,0))

# Price the capped adjustable rate loan 

asifcoupon<-(1/disk[1] - 1)/dt

H<-100*alfahage(capT:0, dt*asifcoupon )/alfahage(capT, dt*asifcoupon )

Lbar<-0.05

CappedPrice<-H[1]

for (i in 1:capT){
  CappedPrice<-CappedPrice-H[i]*sum(lambda[,i]*exp(-dt*r[,i])*pmax((exp(dt*r[,i])-1)/dt-Lbar,0))
}

#source("Opg2Spg1BDT.R")

nelsonsiegelyield<-function(tau,param){
  nelsonsiegelyield<-param[1]+(param[2]+param[3])*(1-exp(-tau/param[4]))/(tau/param[4])-param[3]*exp(-tau/param[4])
}

param<-c(0.044, -0.0069, -0.028,  0.67)

capT<-30
dt<-1
tid<-dt*(1:capT)

nkrenter<-nelsonsiegelyield(tid,param)
disk<-exp(-tid*nkrenter)

r<-q<-lambda<-matrix(0,ncol=(capT+1),nrow=(capT+3))

b<-0.5  # b = 2*sigma

a<-1:capT

q[,]<-0.5
lambda[2,1]<-1

for(i in 2:(capT+1)){
  crit <- function(a){
    dummy<-lambda[1:i,i-1]*q[1:i,i-1]/(exp(dt*a*exp(sqrt(dt)*b*(-1:(i-2)))))+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])/(exp(dt*a*exp(sqrt(dt)*b*(0:(i-1)))))
    crit<-sum(dummy) - disk[i-1] 
  }
  a[i-1]<-uniroot(crit,c(0,1),tol=10^-8)$root
  lambda[2:(i+1),i]<-lambda[1:i,i-1]*q[1:i,i-1]/(exp(dt*a[i-1]*exp(sqrt(dt)*b*(-1:(i-2)))))+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])/(exp(dt*a[i-1]*exp(sqrt(dt)*b*(0:(i-1)))))
  r[2:i,(i-1)]<-a[i-1]*exp(sqrt(dt)*b*(0:(i-2)))
}

graph<-FALSE

if (graph==TRUE){
  
  plot(tid,tid,ylim=c(-0.0,0.20),type='n', main="BDT-lattice")
  
  for(i in 1:(capT-1)){
    for(j in 1:i){
      points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j,i+1]),type='b',lty=2)
      points(c(tid[i],tid[i+1]),c(r[1+j,i],r[1+j+1,i+1]),type='b',lty=2)
    }
  }
}

# Price caplet 

expiry<-5
pick1<-tid==expiry
pick2<-tid==(expiry+dt)

strike<-(disk[pick1]/disk[pick2] - 1)/dt

capletprice<-sum(lambda[,pick1]*exp(-dt*r[,pick1])*pmax((exp(dt*r[,pick1])-1)/dt-strike,0))


#source("Opg2Spg2Vasicek.R")

nelsonsiegelyield<-function(tau,param){
  nelsonsiegelyield<-param[1]+(param[2]+param[3])*(1-exp(-tau/param[4]))/(tau/param[4])-param[3]*exp(-tau/param[4])
}

param<-c(0.044, -0.0069, -0.028,  0.69)

capT<-120
dt<-0.25
tid<-dt*(1:capT)

nkrenter<-nelsonsiegelyield(tid,param)

disk<-exp(-tid*nkrenter)

x<-r<-q<-lambda<-matrix(0,ncol=(capT+1),nrow=(capT+3))

kappa<-0.25   # sættes kappa<-0 fås Ho/Lee
sigma<-0.01

for(i in 1:capT){
  x[2:(i+1),i]<-sqrt(dt)*sigma*seq( -(i-1), (i-1), 2 )
  q[2:(i+1),i]<-pmin(pmax(0.5-sqrt(dt)*kappa*x[2:(i+1),i]/(2*sigma),0),1)
}

a<-1:capT

lambda[2,1]<-1

for(i in 2:(capT+1)){
  
  a[i-1]<- log(sum((lambda[1:i,i-1]*q[1:i,i-1]*exp(-dt*x[1:i,(i-1)])+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])*exp(-dt*x[2:(i+1),(i-1)]))/disk[i-1]))/dt 
  
  lambda[2:(i+1),i]<-lambda[1:i,i-1]*q[1:i,i-1]*exp(-dt*(a[i-1]+x[1:i,(i-1)]))+lambda[2:(i+1),i-1]*(1-q[2:(i+1),i-1])*exp(-dt*(a[i-1]+x[2:(i+1),(i-1)]))
  
  r[2:i,(i-1)]<-a[i-1]+x[2:i,(i-1)]
  
}

plot(tid,nkrenter)

# Price caplet 

expiry<-5
pick1<-tid==expiry
pick2<-tid==(expiry+dt)

strike<-(disk[pick1]/disk[pick2] - 1)/dt

capletprice<-sum(lambda[,pick1]*exp(-dt*r[,pick1])*pmax((exp(dt*r[,pick1])-1)/dt-strike,0))

print(a-sigma*tid)

library(ggplot2)
library(EnvisionRiskRaaS)

#Set the date and symbol (Apple) to use in the example
use_date   <- Sys.Date()
use_symbol <- "AAPL.US"

help(EnvisionRiskRaaS)

envrsk_auth_renew_access_token()
access_token <- my_access_token[["access-token"]]


#### Get the delta vector (simulated price change) ####
# The term '_raw' within the function name is indicative of a key feature: 
# the simulated price changes are denominated in the same currency as 
# the stock. This implies that the analysis maintains the original currency 
# perspective of the stock, allowing for more accurate and relevant 
# insights. It enhances ease of comprehension and direct applicability, 
# bringing us closer to the context of the actual trading environment.
api_response <- EnvisionRiskRaaS::envrsk_instrument_delta_vector_raw(
  date   = use_date, 
  symbol = use_symbol)

# Leverage our sophisticated API to conduct an Expected-Shortfall computation, 
# specified at a 97.5% confidence level across a single-day span, utilizing a 
# point-in-time volatility scenario.
api_response_es <- EnvisionRiskRaaS::envrsk_instrument_expected_shortfall_raw(
  date   = use_date, 
  symbol = use_symbol,
  signif_level = 0.975,
  volatility_id = "point_in_time")
expected_shortfall_estimate <- api_response_es[["Output"]]$expected_shortfall

# Leverage the EnvisionRiskRaaS::envrsk_instrument_delta_vector function with 
# base_cur set to "DKK" to incorporate the risk associated with  USD/DKK 
# currency exchange fluctuations. This allows you to evaluate and strategize 
# around the additional layer of market risk presented by currency movements, 
# thereby providing a more comprehensive understanding of the potential impacts 
# on your investments.
# api_response <- EnvisionRiskRaaS::envrsk_instrument_delta_vector(
#   date     = use_date, 
#   symbol   = use_symbol,
#   base_cur = "DKK")

# Plot the P/L distribution
ggplot(api_response[["Output"]], aes(x=PnL)) +
  geom_histogram(aes(y=..density..), 
                 colour = "#27647B", 
                 fill = "#27647B", 
                 position="identity", 
                 alpha=0.75, 
                 bins = 50)+
  geom_density(alpha=1, 
               colour = "#CA3542")+
  geom_vline(xintercept = expected_shortfall_estimate, linetype = "dashed", colour = "#AEC0C9")+
  geom_text(aes(x=expected_shortfall_estimate, y=0.1, label = "Expected-Shortfall (97.5%, 1 day)"), colour="#57575F", angle=90)+
  labs(title="Price Uncertainty",
       subtitle = paste0("Profit/Loss distribution (one day) for ", use_symbol, " as seen from the ", use_date),
       x = "Profit/Loss (in $)", 
       y = "Density",
       caption = expression("In the world of financial markets, price uncertainty is a key element that contributes to market risk - the risk of losses in positions arising \nfrom movements in market prices. Risk management aims to quantify this risk and devise strategies to mitigate potential losses."))+
  xlim(c(-15, 15))+
  theme_bw()+
  theme(axis.text.y = element_blank(),
        plot.caption = element_text(size=7.5, hjust=0, margin=margin(t=15))) 

# Check out the comprehensive guide below for step-by-step instructions on how to 
# generate Profit/Loss (P/L) distribution for your bespoke portfolio. This 
# detailed resource is designed to assist you in understanding the financial 
# impact of potential market changes on your portfolio.
?EnvisionRiskRaaS::envrsk_portfolio_delta_vector

# Logout from the risk server
EnvisionRiskRaaS::envrsk_auth_log_out()

??EnvisionRiskRaaS

#libraries
{
  library(purrr)
  library(zoo)
  library(xts)
  library(TTR)
  library(ggplot2)    ## grammar of graphics
  library(reshape2)   ##reshaping data frames
  library(lattice)    ##More graphics
  library(hexbin)     ## ... and more graphics
  library(gridExtra)  ## even more graphics
  library(xtable)     ##Latex formatting of tables
  library(splines)    ##splines -- surprise :-)
  library(survival)   ##survival analysis
  library(grid)       ##for 'unit'
  library(lpSolve)    ##linear programming
  library(tidyverse)  ##
  library(tidyquant)  ## quant library 1
  library(quantmod)   ## quant library 2
  library(Quandl)     ## quant library 3
  library(fasttime)   ## time conversion
  library(xlsx)       ## omskrive til excel
  library(readxl)     ## read excel files
  library(readODS)    ## read ODS files
  library(xml2)       ## read xml files
  library(data.table)
  library(haven)
  library(dplyr)
  library(plyr)
  library(curl)
  library(jsonlite)
  library(nloptr)
}

#functions
{
Moneyness <- function(S, K, R, T)  #actual formula
{
    K*exp(-r*tau)/S
}
  
BSprice <- function(S, K, R, T, sig, q, typen) 
{
    typen <- tolower(typen)
    d_1 <- (log(S/K) + (R- q + (sig^2/2))*T) / (sig*sqrt(T))
    d_2 <- d_1 - (sig*sqrt(T))
    
    
    
    if(typen=="p"||typen=="put")
    {
      price <- (K*exp(-R*T)*pnorm(-d_2)) - (S*exp(-q*T)*pnorm(-d_1))
      if (T < 0.01)
      {price <- max(S-K,0)}
      else if (price >=0)
      {price <- price}
      else
      {price <- 0}
    }
    else if(typen=="c" || typen=="call") 
    {
      price <- (S*exp(-q*T)*pnorm(d_1)) - (K*exp(-R*T)*pnorm(d_2))
      if (T < 0.01)
      {price <- max(S-K,0)}
      else if (price >=0)
      {price <- price}
      else
      {price <- 0}
    }
    
    return(price)
  }
  
implvoli <- function(p,s,k,r,t,q,typen)
{
  volOptimFun <- function(p, s, k, r, t, sig, q, typen){
    abs(p - BSprice(s, k, r, t, sig, q, typen))
  }
  
  return(optimize(volOptimFun, interval = c(0, 2), p = p, s = s, k = k, r = r,t = t, q = q, type = typen))
}

#implvoli(price,stockclose,strike,0.05,timetomat,0,"call")


implVolil <- function(price, S, K, R, T,  typen) 
{
  root <- function(sig) {BSprice(S,K,R,T,sig,q=0,typen) - price}
  
  uniroot(root,c(0,2),extendInt="yes")$root
}

#ImpliedVol2(30,110,20,0.05,1,"call")


Hestoncf <- function(params, u, t, S)
{
  kappa <- params[1]
  theta <- params[2]
  sigma <- params[3]
  rho <- params[4]
  v0 <- params[5]
  r <- params[6]
  
  lambda <- 0
  x <- log(S)
  
  a <- -u * (u + 1i) / 2
  b <- kappa - rho * sigma * 1i * u
  d <- sqrt(b^2 - 4 * a * sigma^2)
  g1 <- (b - d) / (2 * sigma^2)
  g2 <- (b + d) / (2 * sigma^2)
  
  Cf <- exp( (1i * u * (x + r * t)) + (kappa * theta * t * g1) / sigma^2 ) * (1 - exp(-d * t)) / (1 - g1 * exp(-d * t))
  Cf <- Cf * exp( (a * v0) / (1 - exp(-d * t)) / sigma^2 * (1 - exp(-d * t)) / (1 - g1 * exp(-d * t)))
  
  return(Cf)
}

Hestonprice <- function(params, t, S, K) 
{
  integrand <- function(u) 
  {
    Re(Hestoncf(params, u - (1i / 2), t, S) * exp(-1i * u * log(K)) / (u^2 + 0.25))
  }
  
  integral_value <- integrate(integrand, lower = 0, upper = Inf, subdivisions = 1000)$value
  price <- S * (0.5 + (1 / pi) * integral_value) - K * exp(-params[[6]] * t) * (0.5 + (1 / pi) * integral_value)
  
  return(price)
}

HestonCallClosedForm <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K) 
{
  
  PIntegrand <- function(u, lambda, vbar, eta, rho, v0, r, tau, S0, K, j) 
  {
    F <- S0*exp(r*tau)
    x <- log(F/K)
    a <- lambda * vbar
    
    if (j == 1) {
      b <- lambda - rho* eta
      alpha <- - u^2/2 - u/2 * 1i + 1i * u
      beta <- lambda - rho * eta - rho * eta * 1i * u
    } else {
      b <- lambda
      alpha <- - u^2/2 - u/2 * 1i
      beta <- lambda - rho * eta * 1i * u
    }
    
    gamma <- eta^2/2
    d <- sqrt(beta^2 - 4*alpha*gamma)
    rplus <- (beta + d)/(2*gamma)
    rminus <- (beta - d)/(2*gamma)
    g <- rminus / rplus
    
    D <- rminus * (1 - exp(-d*tau))/(1-g*exp(-d*tau))
    C <- lambda * (rminus * tau - 2/(eta^2) * log( (1-g*exp(-d*tau))/(1-g) ) )
    
    top <- exp(C*vbar + D*v0 + 1i*u*x)
    bottom <- (1i * u)
    Re(top/bottom)
  }
  
  P <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K, j) 
  {
    value <- integrate(PIntegrand, lower = 0, upper = Inf, lambda, vbar, eta, rho, v0, r, tau, S0, K, j,subdivisions=1000)$value
    0.5 + 1/pi * value
  }
  
  A <- S0*P(lambda, vbar, eta, rho, v0, r, tau, S0, K, 1)
  B <- K*exp(-r*tau)*P(lambda, vbar, eta, rho, v0, r, tau, S0, K, 0)
  A-B
}

HestonCallMonteCarlo <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K, nSteps=250, nPaths=3000, vneg=2) 
{
  
  #meandrift
  #mean volatility
  #return rate of volatility
  #volatility of volatility
  
  n <- nSteps
  N <- nPaths
  
  dt <- tau / n
  
  negCount <- 0
  
  S <- rep(S0,N) 
  v <- rep(v0,N) #
  
  for (i in 1:n)
  {
    W1 <- rnorm(N);
    W2 <- rnorm(N);
    W2 <- rho*W1 + sqrt(1 - rho^2)*W2;
    
    sqvdt <- sqrt(v*dt)
    S <- S*exp((r-v/2)*dt + sqrt(v * dt) * W1)
    
    if ((vneg == 3) & (2*lambda*vbar/(eta^2) <= 1)) {
      cat("Variance not guaranteed to be positive with choice of lambda, vbar, and eta\n")
      cat("Defaulting to Reflection + Milstein method\n")
      vneg = 2
    }
    
    if (vneg == 0){
      ## Absorbing condition
      v <- v + lambda*(vbar - v)* dt + eta * sqvdt * W2
      negCount <- negCount + length(v[v < 0])
      v[v < 0] <- 0
    }
    if (vneg == 1){
      ## Reflecting condition
      sqvdt <- sqrt(v*dt)
      v <- v + lambda*(vbar - v)* dt + eta * sqvdt * W2
      negCount <- negCount + length(v[v < 0])
      v <- ifelse(v<0, -v, v)
    }
    if (vneg == 2) {
      ## Reflecting condition + Milstein
      v <- (sqrt(v) + eta/2*sqrt(dt)*W2)^2 - lambda*(v-vbar)*dt - eta^2/4*dt
      negCount <- negCount + length(v[v < 0])
      v <- ifelse(v<0, -v, v)     
    }
    if (vneg == 3) {
      ## Alfonsi - See Gatheral p.23
      v <- v -lambda*(v-vbar)*dt +eta*sqrt(v*dt)*W2 - eta^2/2*dt      
    }
  }
  
  negCount <- negCount / (n*N);
  
  ## Evaluate mean call value for each path
  V <- exp(-r*tau)*(S>K)*(S - K); # Boundary condition for European call
  AV <- mean(V);
  AVdev <- 2 * sd(V) / sqrt(N);
  
  list(value=AV, lower = AV-AVdev, upper = AV+AVdev, zerohits = negCount)
}


} 



# Hvis vi kan lave det for 10,

# 2. estimere vol.flade, moneyness, ttm og impliedvol per symbol per dag.
# 3. flade til opslag for symbol og dato -> heston/... vol.flade
# 4. fladen/smil til input, ændring i underliggende, returner ny implied vol

#pris idag 160
#moneyness idag 0

#simuleret prisændring 140, 145, 170, etc
#simuleret moneyness 0.5, 0.4, -0.5,...
#simuleret implvol



# 1. trække optionskæder dagligt og cleanup
#
#calls, options, stock price, moneyness, implied volatility

# downloads







St <- tail(tq_get(symb, get="stock.prices", from = from_d, to = to_d)['close'],1)[[1]]
opt2 <- subset(opt, opt$typen == "call")
x <- opt2$calls.Strike
y <- list()
for (i in 1:(length(x)))
{
  y <- append(y,implVolil(opt2$calls.Last, St, x[i], 0.05,1,"call"))
}

x[1]

# 2. estimere vol.flade, moneyness, ttm og impliedvol per symbol per dag.


#simuleret volatility smil
Moneyness <- function(S, K)  #actual formula
{
  log(K/S)
}



x <- seq(10, 40, length=30)
x2 <- seq(0,20,length= 30)
y <- list()
for (i in 1:(length(x)))
{
  y <- append(y,implVolil(x2[i],St,x[i],0.05,1,"put"))
}

for (i in 1:(length(x)))
{
  #y <- append(y,x[i])
  y <- append(y,implVolil(x2[i],St,x[i],0.05,1,"call"))
}
plot(x, y)

#simuleret volatility flade













params <- c(kappa = 2, theta = 0.05, sigma = 0.5, rho = -0.5, v0 = 0.01, r = 0.03)
S <- tail(tq_get("TSLA", get="stock.prices", from = from_d, to = to_d)['close'],1)[[1]]

#hestonsurface(symbol,dato)
{
N <- 60
S <- tail(tq_get("TSLA", get="stock.prices", from = from_d, to = to_d)['close'],1)[[1]]
Ks <- seq(0.5*S, 1.5*S, length=N)  #moneyness
taus <- seq(0.2, 1.2, length=N)

IVHeston <- Vectorize(function(K,T)
{
  implvoli(HestonCallClosedForm( params[[1]], params[[2]], params[[3]], params[[4]], params[[5]], params[[6]], T, S, K), S, K, params[[6]], T, 0,"c")$minimum
}#moneyness
)
z <- outer(Ks, taus, IVHeston)


#plot
nrz <- nrow(z)
ncz <- ncol(z)
nb.col <- 256
color <- heat.colors(nb.col)
facet <- - (z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz])
facetcol <- cut(facet, nb.col)
persp(x=Ks, y=taus, z, theta = 40, phi = 20, expand = 0.5, col=color[facetcol],
      xlab="Moneyness", ylab="Time to maturity", zlab="Implied Volatility",
      ticktype="detailed")
}




















HestonSurface <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K, N=5, min.tau = 1/250) #skal rettes
{
  LogStrikes <- seq(-0.5, 0.5, length=N)
  Ks <- rep(0.0,N)
  taus <- seq(min.tau, tau, length=N)
  vols <- matrix(0,N,N)
  
  TTM <- Money <- Vol <- rep(0,N*N)
  
  HestonPrice <- function(K, tau) {
    HestonCallClosedForm(lambda, vbar, eta, rho, v0, r, tau, S0, K)
  }
  
  n <- 1
  for (i in 1:N) {
    for (j in 1:N) {
      Ks[i] <- exp(r * taus[j]+LogStrikes[i]) * S0
      price <- HestonPrice(Ks[i],taus[j])
      iv <- ImpliedVol(S0, Ks[i], taus[j], r, price)
      TTM[n] <- taus[j] * ONEYEAR # in days
      Money[n] <- Moneyness(S0,Ks[i],taus[j],r)
      Vol[n] <- iv
      n <- n+1
    }
  }
  
  data.frame(TTM=TTM, Moneyness=Money, ImpliedVol=Vol)
}

PlotHestonSurface <- function(param, tau, S, K, min.tau = 1/ONEYEAR, ...)
{
  N=nrow(S)
  Ks <- seq(min(K), max(K), length=N)  
  taus <- seq(0.2*tau, 1.2*tau, length=N)

  IVHeston <- Vectorize(function(K,T) { implvoli(HestonPrice(K,T), S, K, param[[6]], T, 0,"c")})
  
  z <- outer(Ks, taus, IVHeston)
  
  nrz <- nrow(z)
  ncz <- ncol(z)
  nb.col <- 256
  color <- heat.colors(nb.col)
  facet <- - (z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz])
  facetcol <- cut(facet, nb.col)
  
  persp(x=Ks, y=taus, z, theta = 40, phi = 20, expand = 0.5, col=color[facetcol],
        xlab="Strikes", ylab="Time to maturity", zlab="Implied Volatility",
        ticktype="detailed", ...) -> res
  
  return(invisible(z))
}






# call og put

# 1. Option prices
{
Calls <- getOptionChain("AAPL", exp = "2023")['calls'];Calls <- data.frame(Calls); 
type <- array()
for (i in 1:nrow(Calls))
{
 type <- append(type, "CALL")
}
type <- type[-1]
Calls <- cbind(Calls, type); rm(type)
Calls <- select(Calls, "calls.ContractID", "calls.ConractSize", "calls.Currency", "type", "calls.ITM", 
         "calls.LastTradeTime", "calls.Expiration", "calls.Strike","calls.Last", 
         "calls.Bid", "calls.Ask", "calls.Chg", "calls.ChgPct",
         "calls.Vol", "calls.OI","calls.IV")

Calls_hist <- readRDS("C:/Users/Markb/StockOptionsImplVol2023.rds"); Calls_hist  <- data.frame(Calls_hist )
Calls_hist  <- subset(Calls_hist, Calls_hist$UnderlyingSymbol == "AAPL.US")
Calls_hist <- subset(Calls_hist, Calls_hist$type == "CALL")
Calls_hist <- Calls_hist[!duplicated(Calls_hist[, 1:6]),1:16]
Calls_hist$lastTradeDateTime <- as.Date(Calls_hist$lastTradeDateTime)
Calls_hist <- Calls_hist[!(is.na(Calls_hist$lastTradeDateTime)),]
colnames(Calls) <- colnames(Calls_hist)
Calls_hist <- rbind(Calls_hist, Calls)

#Calls_100 <- subset(Calls_hist, Calls_hist$strike == 100)
}

# 2. Stock prices
{
from_d = '2019-01-01'; to_d = as.Date(Sys.Date()-1) #for downloading stockdata
Stocks_hist <- cbind(tq_get("AAPL", get="stock.prices", from = from_d, to = to_d)['date'],tq_get("AAPL", get="stock.prices", from = from_d, to = to_d)['close'])
colnames(Stocks_hist) <- c("lastTradeDateTime", "Close") 
Calls_stocks_hist <- left_join(Calls_hist, Stocks_hist, "lastTradeDateTime", nomatch=0)
}

# 3. delta-greeks, implied volatility
{
delta <- list()
impliedvol <- list()
ref <- list()
for (i in 1:100)
{
  #status <- append(status, Calls_stocks_hist$inTheMoney)
  delta_p <- (Calls_stocks_hist$lastPrice[i])/(Calls_stocks_hist$Close[i])
  delta <- append(delta, delta_p)
  tryCatch(
    expr = {
      implvol <- implvoli(Calls_stocks_hist$lastPrice[i],Calls_stocks_hist$Close[i],Calls_stocks_hist$strike[i],0.05,(as.integer(as.Date(Calls_stocks_hist$expirationDate[i]))-as.integer(Calls_stocks_hist$lastTradeDateTime[i])),0,"call")$minimum*10
      impliedvol <- append(impliedvol, implvol)
    },
    error = function(e){paste("error at",i);
      impliedvol <- append(impliedvol, 0)
    }
  )
  ref <- append(ref, Calls_stocks_hist$impliedVolatility[i])

}
delta <- as.data.frame(cbind(delta,impliedvol,ref));rm(impliedvol,ref)

}


money <- list()
  for (i in 1:10)
  {
    x <- Moneyness(Calls_stocks_hist$Close[i], Calls_stocks_hist$strike[i])
    money <- append(money,x)
  }



implvole <- list()
for (i in 1:10)
{
y <- implvoli(Calls_stocks_hist$lastPrice[i],Calls_stocks_hist$Close[i],Calls_stocks_hist$strike[i],0.05,(as.integer(as.Date(Calls_stocks_hist$expirationDate[i]))-as.integer(Calls_stocks_hist$lastTradeDateTime[i])),0,"call")$minimum*10
implvole <- append(implvole, y)
}

plot(money, implvole)

#time to maturity













TimeToMaturity <- list()
for (i in 1:nrow(calls))
{
  
  time <- as.integer(as.Date(calls[i,'calls.Expiration'])) - as.integer( Sys.Date() )
  
  
  #1. Moneyness
  TimeToMaturity <-append(TimeToMaturity, time ) #needs to be better calculated, needs to be list as well
}





















#simulering 

#### AUTHENTICATE With EnvisionRisk Server ####
envrsk_auth_renew_access_token()
access_token <- my_access_token[["access-token"]]

# DEFINE UNIVERSE OF INSTRUMENTS
instr_universe <- c("EEM.US", "VNQ.US", "MDY.US", "SLY.US", "SPY.US", "EFA.US", "TIP.US", "AGG.US", "DJP.US", "SHV.US")

date_of_analysis <- Sys.Date()-1

#### SETTINGS ####
base_cur <- "DKK"
confidence_level <- 0.975
risk_horizon <- 10
volatility_scenario <- "point_in_time"

#### IMPORT SIMULATED DELTA VECTORS ####
sim_pnl <- get_simulated_pnl(dt_prices,
                             date_of_analysis,
                             instr_universe,
                             base_cur,
                             risk_horizon,
                             volatility_scenario)
























calibrate.quadvol <- function(options, valuedate, precision=2, type="delta"){
  
  if(NROW(options)<3)
    stop("Too few inputs, need minimum 3 points to calibrate.")
  
  if(type == "delta"){
    options$k <- options$strike/ options$forward - 1
    options$k <- round(options$k, (2+precision))
  } else if(type == "strike"){
    options$k <- options$strike - options$forward
  } else{
    stop("Unknown volatility type: should be either delta or strike.")
  }
  
  reg_data <- data.frame(y=options$IV, x=options$k, xsq=(options$k)^2)
  fit <- stats::lm(y~.,data=reg_data); fit <- summary(fit)
  if(fit$r.squared < 0.9) warning("Goodness of fit is below threshold.")
  atm <- mean(options$IV); skew <- convexity <- 0
  if(abs(fit$coefficients[1,3])>2)atm <- fit$coefficients[1,1]
  if(abs(fit$coefficients[2,3])>2)skew <- fit$coefficients[2,1]
  if(abs(fit$coefficients[3,3])>2)convexity <- fit$coefficients[3,1]
  
  discfact <- 1
  if(!is.na(match("discount",colnames(options))))discfact<-options$discount[1]
  vol <- list(valuedate=valuedate,atmvol=atm,skew=skew,convexity=convexity,
              t=options$t[1], discfact= discfact, type=type)
  class(vol) <- "quadvol"
  fitted_vols <- bsoption::getVol(vol,options$forward,options$strike)
  err <- (fitted_vols - options$IV)^2; err <- sqrt(sum(err))
  if(err/NROW(options) > 1e-03){
    rms <- round(err/NROW(options),6)
    warning(paste("Average error:",rms,". Goodness of fit is below threshold."))
  }
  
  return(vol)
}

#'@export
getVol.quadvol <- function(vol,atm, strike){
  ret <- vol$atm
  if(vol$type=="delta"){
    k <- strike/atm -1
  } else if(vol$type=="strike"){
    k <- strike - atm
  } else {
    stop("Unknown volatility type: should be either delta or strike")
  }
  
  ret <- vol$atm + k*vol$skew + (k^2)*vol$convexity
  return(ret)
}
#'@export
bumpVol.quadvol <- function(vol,bump=0.01){
  vol$atmvol <- vol$atmvol + bump
  return(vol)
}


#'Calibrate vols (SABR or quadratic smile fit) from market prices
#'@description The first input is option chain data (dataframe) for a single
#'maturity, the expected columns include the forward, expiry (in date format),
#'strike, price and type (either call or put).
#'@param options dataframe with options chain details
#'@param valuedate valuation date for the calibration
#'@param model Volatility model, can be either sabr or quadratic
#'@param atmvol ATM volatility, if provided used in sabr calibration
#'(else ATM vol is estimated with a quadratic vol fit first)
#'@param precision degree of precision
#'@param type Type of fit in case of quadratic model (either delta or strike)
#'@return Fitted volatility object. The object is either of class quadvol or
#'sabrvol depending upon the fit. The object includes atm vol level, and model
#'specific parameters. It also stores the valuation date of calibration. The
#'sabr model implements calibration of a lognormal SABR model (ref Hagan(2002)
#'"Managing smile risk" and West (2005) "Calibration of the SABR Model in
#'Illiquid Markets"). The model assumes a beta of 0 (lognormal behaviour) and
#'calibrates other parameters of SABR. The quadratic model is a simple two
#'parameters model of volatility smile, fitted with least square regression.
#'The calibration type delta fits this quadratic smile based on percentage
#'offset from ATM, while strike fits absolute deviation from ATM forward.
#'@export
calibrate <- function(options, valuedate, model="quadratic",atmvol=0,
                      precision=2, type="delta"){
  cols <- tolower(colnames(options))
  expected_cols <- c("forward","expiry","strike","price","type")
  idx <- unlist(apply(as.matrix(expected_cols),1,FUN = function(x){
    if(length(grep(x,cols))>0)return(grep(x,cols))
    return(0)
  }))
  
  if(any(idx==0))
    stop("Input option prices are not in correct format. See help.")
  colnames(options)[idx] <- expected_cols
  
  if(NROW(unique(options$forward)) !=1 | NROW(unique(options$forward)) !=1)
    stop("Multiple expiries found. Calibrate one expiry series at a time.")
  
  options$type <- tolower(options$type)
  options$price[options$forward > options$strike & options$type=="call"] <- NA
  options$price[options$forward < options$strike & options$type=="put"] <- NA
  options <- stats::na.omit(options)
  
  if(NROW(unique(options)) != NROW(options))
    stop("Duplicate strikes found. Remove duplicate strikes.")
  
  discfact <- 1
  if(!is.na(match("discount",colnames(options))))discfact<-options$discount[1]
  
  options$IV <- bsImpliedVol(valuedate,options$forward,options$strike,
                             options$expiry,options$price,options$type,discfact)
  options$IV <- round(options$IV,(2+precision))
  
  suppressWarnings(if(class(options$expiry)=="Date")
    options$expiry <- as.POSIXct.Date(options$expiry))
  suppressWarnings(if(class(valuedate)=="Date")
    valuedate <- as.POSIXct.Date(valuedate))
  
  options$t <- (as.numeric(options$expiry) - as.numeric(valuedate))
  options$t <- options$t/(24*60*60*260)
  
  if(model=="quadratic"){
    vol <- bsoption:::calibrate.quadvol(options, valuedate, precision, type)
  } else if(model=="sabr"){
    vol <- bsoption:::calibrate.sabrvol(options, valuedate, atmvol, precision)
  } else{
    stop("Unknown volatility model: only sabr and quadratic implemented.")
  }
  return(vol)
}

#'get volatility at a given strike
#'@description Returns the volatility at a given strike. This function is
#'vectorized.
#'@param vol Object returned from earlier calibration. Either a quadvol or a
#'sabrvol object.
#'@param atm ATM forward(s)
#'@param strike Options strike(s)
#'@return Black volatility at the given strike
#'@seealso \code{\link{calibrate}} for calibration and models
#'@export
getVol <- function(vol, atm, strike){
  UseMethod("getVol",vol)
}

#'bump the level of volatility for scenario analysis
#'@description Returns the volatility with a bumped up ATM vol levels
#'@param vol Object returned from earlier calibration. Either a quadvol or a
#'sabrvol object.
#'@param bump Bump amount. This is added to the ATM vol level
#'@return A volatility object of class quadvol or sabrvol
#'@seealso \code{\link{calibrate}} for calibration and models
#'@export
bumpVol <- function(vol,bump=0.01){
  UseMethod("bumpVol",vol)
}







{
# Black-Scholes model: value function and some greeks
# Dale Roberts (c) 2010

# S = Asset price
# K = Strike price
# r = Risk-free rate
# tau = Time to maturity
# sigma = Volatility of asset price

EPS <- 1./365. 

bscall.value <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  d2 <- d1 - sigma*sqrt(tau)
  if (tau < EPS) { # Small time to expiry
    return(max(S-K,0))
  } else {
    return(S*pnorm(d1) - K*exp(-r*(tau))*pnorm(d2))
  }
}

bsput.value <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  d2 <- d1 - sigma*sqrt(tau)
  if (tau < EPS) { # Small time to expiry
    return(max(K-S,0))
  } else {
    return(K*exp(-r*(tau))*pnorm(-d2) - S*pnorm(-d1))
  }
}

bscall.delta <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  if (tau < EPS) { # by hand for small time to expiry
    if (K-S < 0) {
      return(1.0)
    } else {
      return(0.0)
    }
  } else {
    return(pnorm(d1))
  }
}

bsput.delta <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  if (tau < EPS) { # by hand for small time to expiry
    if (K-S > 0) {
      return(-1.0)
    } else {
      return(0.0)
    }
  } else {
    return(pnorm(d1)-1)
  }
}

bscall.gamma <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  return(dnorm(d1)/(S*sigma*sqrt(tau)))
}

bscall.theta <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  d2 <- d1 - sigma*sqrt(tau)
  return(-S*dnorm(d1)*sigma/(2*sqrt(tau)) - r*K*exp(-r*tau)*pnorm(d2))
}

bsput.theta <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  d2 <- d1 - sigma*sqrt(tau)
  return(-S*dnorm(d1)*sigma/(2*sqrt(tau)) + r*K*exp(-r*tau)*pnorm(-d2))
}

bscall.vega <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  return(S*sqrt(tau)*dnorm(d1))
}

bscall.rho <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  d2 <- d1 - sigma*sqrt(tau)
  return(K*tau*exp(-r*tau)*pnorm(d2))
}

bsput.rho <- function(S, K, tau, r, sigma) {
  d1 <- (log(S/K) + (r + 0.5*sigma^2)*tau)/(sigma*sqrt(tau))
  d2 <- d1 - sigma*sqrt(tau)
  return(-K*tau*exp(-r*tau)*pnorm(-d2))
}



par(family="sans", mar=c(4,4,1,2)+0.1, mgp=c(2,1,0))

dump <- function(filename) {
  fn <- paste("images/", filename, ".pdf", sep="")
  dev.copy2pdf(file=fn, family="sans")
}

plot(function(S){bscall.value(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="")
plot(function(S){bsput.value(S,100,0.5,0.05,0.20)}, 70, 130, add=T, col="#d63d00", lwd=3)
title(main='', xlab='Stock Price', ylab='Value')
legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
abline(v=100,lty=3)
dump('bs-value')

plot(function(S){bscall.delta(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(-1,1))
plot(function(S){bsput.delta(S,100,0.5,0.05,0.20)}, 70, 130, add=T, col="#d63d00", lwd=3)
abline(0,0)
title('', xlab='Stock Price', ylab='Delta')
legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-delta')

plot(function(S){bscall.delta(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="")
plot(function(S){bscall.delta(S,100,0.5,0.05,0.10)}, 70, 130, col="#d63d00", lwd=3, xlab="", ylab="", ylim=c(0,30), add=T)
plot(function(S){bscall.delta(S,100,0.5,0.05,0.05)}, 70, 130, col="#227711", lwd=3, xlab="", ylab="", ylim=c(0,30), add=T)
title('', xlab='Stock Price', ylab='Delta')
legend('topleft', c('sigma = 0.2','sigma = 0.1','sigma = 0.05'), lwd=3, col=c("#19304f","#d63d00","#227711"), bty='n')
dump('bs-delta-sigma')

plot(function(S){bscall.delta(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="")
plot(function(S){bscall.delta(S,100,0.2,0.05,0.20)}, 70, 130, col="#d63d00", lwd=3, xlab="", ylab="", ylim=c(0,30), add=T)
plot(function(S){bscall.delta(S,100,0.05,0.05,0.20)}, 70, 130, col="#227711", lwd=3, xlab="", ylab="", ylim=c(0,30), add=T)
title('', xlab='Stock Price', ylab='Delta')
legend('topleft', c('TTM = 0.5','TTM = 0.2','TTM = 0.05'), lwd=3, col=c("#19304f","#d63d00","#227711"), bty='n')
dump('bs-delta-ttm')

plot(function(S){bscall.gamma(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(0,0.03))
title('', xlab='Stock Price', ylab='Gamma')
legend('topleft', c('Call Gamma'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-gamma')

plot(function(S){bscall.value(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="")
plot(function(S){bscall.value(S,100,0.2,0.05,0.20)}, 70, 130, col="#d63d00", lwd=3, xlab="", ylab="", ylim=c(0,30), add=T)
plot(function(S){bscall.value(S,100,0.01,0.05,0.20)}, 70, 130, col="#227711", lwd=3, xlab="", ylab="", ylim=c(0,30), add=T)
title('', xlab='Stock Price', ylab='Value')
legend('topleft', c('TTM = 0.5','TTM = 0.2','TTM = 0.01'), lwd=3, col=c("#19304f","#d63d00","#227711"), bty='n')
dump('bs-value-ttm')

plot(function(S){bscall.theta(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(-10,8))
plot(function(S){bsput.theta(S,100,0.5,0.05,0.20)}, 70, 130, add=T, col="#d63d00", lwd=3)
abline(0,0)
title('', xlab='Stock Price', ylab='Theta')
legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-theta')

plot(function(S){bscall.gamma(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(0,0.07))
plot(function(S){bscall.gamma(S,100,0.2,0.05,0.20)}, 70, 130, col="#d63d00", lwd=3, xlab="", ylab="", add=T)
plot(function(S){bscall.gamma(S,100,0.1,0.05,0.20)}, 70, 130, col="#227711", lwd=3, xlab="", ylab="", add=T)
title('', xlab='Stock Price', ylab='Gamma')
legend('topleft', c('TTM = 0.5','TTM = 0.2','TTM = 0.1'), lwd=3, col=c("#19304f","#d63d00","#227711"), bty='n')
dump('bs-gamma-ttm')

plot(function(S){bscall.theta(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(-15,5))
plot(function(S){bscall.theta(S,100,0.2,0.05,0.20)}, 70, 130, col="#d63d00", lwd=3, xlab="", ylab="", add=T)
plot(function(S){bscall.theta(S,100,0.1,0.05,0.20)}, 70, 130, col="#227711", lwd=3, xlab="", ylab="", add=T)
abline(0,0)
title('', xlab='Stock Price', ylab='Theta')
legend('topleft', c('TTM = 0.5','TTM = 0.2','TTM = 0.1'), lwd=3, col=c("#19304f","#d63d00","#227711"), bty='n')
dump('bs-theta-ttm')

plot(function(S){bscall.vega(S,100,0.5,0.05,0.20)}, 70, 130, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(0,30))
title('', xlab='Stock Price', ylab='Vega')
legend('topleft', c('Call Vega'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
dump('bs-vega')



heat.persp <- function(t,s,v,expand=0.45,...) { 
  nrz <- nrow(v) 
  ncz <- ncol(v)
  nb.col <- 256
  color <- heat.colors(nb.col) 
  facet <- - (v[-1, -1] + v[-1, -ncz] + v[-nrz, -1] + v[-nrz, -ncz])
  facetcol <- cut(facet, nb.col) 
  
  persp(t,s,v,col=color[facetcol],expand=expand,...) -> res
  
  return(res)
}

the.lines <- function(t,s,v,res) {
  hs <- head(s,1)
  ts <- tail(s,1)
  ms <- 100
  ht <- head(t,1)
  tt <- tail(t,1)
  hv <- max(v,na.rm=TRUE)
  lv <- min(v,na.rm=TRUE)
  
  lines(trans3d(c(ht,ht,ht,tt,tt,tt),
                c(ms,ms,ms,ms,ms,ms),
                c(lv,hv,hv,hv,hv,lv),
                res),
        lty='dashed')
  
  text(trans3d(c(tt),
               c(ms),
               c(lv),
               res),
       labels=c("S=K"),
       pos=1,
       offset=.5)
}

S <- 100
K <- 100
N <- 10
r <- 0.10
tau <- 1
sigma <- 0.15

s <- sort(c(K-EPS/10,K+EPS/10,seq(0.5*K,1.5*K,length=31)))
t <- sort(c(EPS/10,seq(0,tau,length=31)))

opar <- par(mar=rep(0,4))

doit <- function(f, filename, name) {
  fn <- paste("images/", filename, sep="")
  png(file=fn,width=480,height=480)
  v <- outer(t,s,Vectorize(function(t, s) f(s,K,t,r,sigma)))
  heat.persp(t,s,v,
             zlab="",
             xlab="TTM",
             ylab="S",
             theta=108,
             phi=40,
             axes=FALSE) -> res
  the.lines(t,s,v,res)
  #title(name, line=0)
  dev.off()
  system(paste("convert -trim", fn, fn))
}

doit(bscall.value, "bscall-value.png", "Black-Scholes Call Value")
doit(bscall.delta, "bscall-delta.png", "Black-Scholes Call Delta")
doit(bscall.gamma, "bscall-gamma.png", "Black-Scholes Call Gamma")
doit(bscall.vega, "bscall-vega.png", "Black-Scholes Call Vega")
doit(bscall.rho, "bscall-rho.png", "Black-Scholes Call Rho")

par(opar)


}
{
  ###########################################################################
  #       Pricing European Put Options Through Simulated Levy Processes 
  #       Research proposed by Liming Feng, Zisheng Chen, and Xiong Lin
  #               University of Illinois, Urbana-Champaign
  #
  # Created by Joseph Loss on 12/17/2018
  # Co-developers: Yuchen Duan (UIUC MSFE) and Daniel Liberman (UIC Finance)
  #
  # Algorithm 1: Simulating a Normal Inverse Gaussian process through a Brownian subordination
  #
  ###########################################################################
  # set.seed(2017)
  library(tictoc)
  
  no_of_simulations.1 <-  256 * 10 ^ 3
  no_of_simulations.2 <- (256 * 4) * 10 ^ 3
  no_of_simulations.3 <- (256 * 8) * 10 ^ 3
  no_of_simulations.4 <- (256 * 16) * 10 ^ 3
  no_of_simulations.5 <- (256 * 32) * 10 ^ 3
  no_of_simulations.6 <- (256 * 64) * 10 ^ 3
  
  no_of_simulations.list <- c(no_of_simulations.1, no_of_simulations.2, 
                              no_of_simulations.3, no_of_simulations.4, 
                              no_of_simulations.5, no_of_simulations.6)
  
  for (i in 1:6)
  {
    # Input Parameters --------------------------------------------------------
    # taken from Feng et al, pg.22-23
    alpha = 15;
    beta = -5; 
    delta = 0.5; 
    r = 0.05; 
    q = 0.02; 
    s0 = 100; 
    K = s0; 
    T = 0.5; 
    N = 1.0; 
    
    # no_of_simulations = no_of_simulations.list[i];       # run through difference total no_of_simulations back-to-back
    no_of_simulations = no_of_simulations.3;       # change number of iterations here
    
    # calculate mu using the formula given at the top of pg. 19
    mu = r - q + delta*(sqrt(alpha^2 - (beta+1)^2) - sqrt(alpha^2 - beta^2));
    
    # calculate gamma using the formula given in the Algorithm 1 pseudocode
    gamma = sqrt(alpha^2 - beta^2)
    
    stock_prc <- rep(0, no_of_simulations)       # create array of possible stock_prices (1 for each iteration)
    put_prc <- rep(0, no_of_simulations)         # create array of possible put_prices (1 for each iteration)
    call_prc <- rep(0, no_of_simulations)        # create array of possible call_prices (1 for each iteration)
    euro_vanilla_put <- rep(0, no_of_simulations)    
    nigv <- rep(0, no_of_simulations)            # create NIG random vector
    
    # Box-Muller Function Template --------------------------------------------
    BoxMuller <- function() 
    {
      n = 2 * N
      z = numeric(n)
      
      u1 = runif(n / 2, 0, 1)
      u2 = runif(n / 2, 0, 1)
      
      z1 = sqrt(-2 * log(u1)) * cos(2 * pi * u2)      # half of normal variates
      z2 = sqrt(-2 * log(u1)) * sin(2 * pi * u2)      # other half
      z[seq(1, n, by = 2)] = z1                   # interleave
      z[seq(2, n, by = 2)] = z2                   # two halves
      
      return(z1)                                # return half
    }
    
    
    # Algorithm 1: Normal Inverse Gaussian, Monte-Carlo Simulation --------------------------------------------
    for (j in 1:no_of_simulations) 
    {
      # Step 1: Generate G1 and compute zeta --------------------------------------------------
      G1 <- BoxMuller()           # generate standard normal random variable G1
      Z <- (G1^2)/gamma              # compute Z
      
      zeta <- rep(0, N)
      for (i in 1:N) 
      {
        zeta[i] = (1/gamma)*((delta*T) + (0.5*Z[i]) - sqrt((delta*T*Z[i]) + (Z[i]^2)/4))  
      }
      
      
      # Step 2: Generate uniform random variable U on (0,1) -----------------------------------
      Uniform <- function()       # function to generate uniform r.v. using Algorithm 1, Step 2, on pg. 17
      {
        U = runif(N, 0, 1)
        zt <- rep(0, N)
        for (i in 1:N)  
        {
          if (U[i] < (delta*T) / ((delta*T) + gamma * zeta[i])) {
            zt[i] = zeta[i]
          } else  {
            zt[i] = (delta ^ 2 * T^2) / (gamma ^ 2 * zeta[i])
          }
        }
        return(zt)
      }
      
      zt = Uniform()          # generate zt using uniform function above
      
      
      # Step 3: Generate StdNorm variable G2 -------------------------------------------------
      G2 <- rnorm(1,0,1)
      
      St <- rep(0, N)        # create empty vector for St
      Xt <- rep(0, N)        # create empty vector for Xt 
      
      for (i in 1:N)
      {
        Xt[i] = mu * T + beta * zt[i] + sqrt(zt[i]) * G2[i]     # compute Xt = mu*t + beta*zt + sqrt(zt)*G2
        St[i] = s0 * exp(Xt[i])                         # from pg 16. compute St = S0 * e^(Xt)
      }
      
      stock_prc[j] = St[N]                                  # reassign variable, ie St = ST (stock value at maturity)
      put_prc[j] = exp(-r*T) * max(0, K - stock_prc[j])     # compute put price at maturity 
      call_prc[j] = exp(-r*T) * max(0, stock_prc[j] - K)    # compute call price at maturity
      nigv[j] = Xt[N]                                       
      
      
      # Section 5.4, pg.19: European Vanilla Options -------------------------------------------
      # We also calculate the option value "V" using the formula given in Section 5.4.
      
      # note that the resulting output is identical 
      # to the result we generated through St = S0 * e^(Xt) above. 
      euro_vanilla_put[j] = s0 * exp(-r * T) * max(0, K/s0 - exp(log(stock_prc[j] / s0)))
      
    }
    # END MonteCarlo Simulation --------------------------------------------------------------
    # ----------------------------------------------------------------------------------------
  }
  
  # Average the computed prices: -----------------------------------------------------------
  "NIG Stock Price (t=T)"
  sum(stock_prc) / no_of_simulations
  
  NIG_Put_Value <- sum(euro_vanilla_put) / no_of_simulations
  "NIG Put Value: " 
  NIG_Put_Value
  
  # NIG_Put_Prc <- sum(put_prc) / no_of_simulations
  # "NIG Put Value: "
  # NIG_Put_Prc
  # euro_vanilla_put.value <- sum(euro_vanilla_put) / no_of_simulations
  # "European Vanilla Put Value: "
  # euro_vanilla_put.value
  
  # values.table <- cbind(NIG_Put_Prc, euro_vanilla_put.value)
  # values.table
  
  toc(log = TRUE)
  tic.clearlog()
  tic.clear()
  
  
  
  # Model Benchmarking & Verification ------------------------------------------------------------------
  # NIG Verification --------------------------------------------------------
  library(GeneralizedHyperbolic)      # testing our NIG model with GeneralizedHyperbolic built-in "rnig"
  
  GenHyp.NIG <- rnig(no_of_simulations, delta=delta, alpha=alpha, beta=beta)+mu
  algo1.NIG <- nigv
  
  par(mfrow=c(1,2))       # Plot NIG distributions
  
  # GeneralizedHyperbolic NIG Histogram
  GenHyp.NIG.hist <-
    hist(GenHyp.NIG,
         breaks = 40,
         col = "grey",
         main = "GeneralizedHyperbolic NIG")
  xfit <- seq(min(GenHyp.NIG), max(GenHyp.NIG), length = 40)
  yfit <- dnorm(xfit, mean = mean(GenHyp.NIG), sd = sd(GenHyp.NIG))
  yfit <- yfit * diff(GenHyp.NIG.hist$mids[1:2]) * length(GenHyp.NIG)
  lines(xfit, yfit, col = "blue", lwd = 3)
  
  # Algorithm 1 NIG Histogram
  algo1.NIG.hist <-
    hist(algo1.NIG,
         breaks = 40,
         col = "grey",
         main = "Algorithm 1 NIG")
  xfit <- seq(min(algo1.NIG), max(algo1.NIG), length = 40)
  yfit <- dnorm(xfit, mean = mean(algo1.NIG), sd = sd(algo1.NIG))
  yfit <- yfit * diff(algo1.NIG.hist$mids[1:2]) * length(algo1.NIG)
  lines(xfit, yfit, col = "blue", lwd = 3)
  
  
  # NIG Mean Comparison
  GenHyp.NIG.mu <- (mean(rnig(no_of_simulations, delta=delta, alpha=alpha, beta=beta)+mu))
  GenHyp.NIG.mu
  algo1.NIG.mu = mean(nigv)                            # our NIG 
  algo1.NIG.mu
  
  nig_comparison_table <- cbind(algo1.NIG.mu, GenHyp.NIG.mu)
  nig_comparison_table
  
  (algo1.NIG.mu - GenHyp.NIG.mu)/GenHyp.NIG.mu         # computed difference in model means
  
  nig_comparison_table
  
  # RQuantLib::EuropeanOption('put',s0,K,q,r,T,0.191)
  
}
{###########################################################################
  #       Pricing European Put Options Through Simulated Levy Processes
  #       Research proposed by Liming Feng, Zisheng Chen, and Xiong Lin
  #               University of Illinois, Urbana-Champaign
  #
  # Created by Joseph Loss on 1/01/2019
  # Co-developers: Yuchen Duan (UIUC MSFE) and Daniel Liberman (UIC Finance)
  #
  # Algorithm 2: Inverse-Transform Algorithm
  #
  ###########################################################################
  # set.seed(2017)
  library(tictoc)
  
  no_of_simulations.1 <-  256 * 10 ^ 3     
  no_of_simulations.2 <- (256 * 4) * 10 ^ 3
  no_of_simulations.3 <- (256 * 8) * 10 ^ 3
  no_of_simulations.4 <- (256 * 16) * 10 ^ 3
  no_of_simulations.5 <- (256 * 32) * 10 ^ 3
  no_of_simulations.6 <- (256 * 64) * 10 ^ 3
  no_of_simulations.list <- c(no_of_simulations.1, no_of_simulations.2, 
                              no_of_simulations.3, no_of_simulations.4, 
                              no_of_simulations.5, no_of_simulations.6)
  
  for (i in 1:6)
  {
    
    # Inital Parameters  -------------------------------------------------------------
    chi.0 = -0.477;         # Feng, Table 1, pg. 23
    chi.K = 0;              # Feng, Table 1, pg. 23
    K = 22;                 # Feng, Table 1, pg. 23
    s0 = 100;               # Feng, Section 6.1, pg. 22
    strike = 100;           # Feng, Section 6.1, pg. 22
    T = 0.5;                # Feng, Section 6.1, pg. 22
    q = 0.02;               # Feng, Section 6.1, pg. 22
    r = 0.05 - q;           # Feng, Section 6.1, pg. 22
    
    # r = 0.03;           # Feng, Section 6.1, pg. 22
    
    
    # no_of_simulations = no_of_simulations.list[i];       # run through difference total no_of_simulations back-to-back
    no_of_simulations = no_of_simulations.5                # change number of MC iteriations here
    
    # tic(no_of_simulations)
    
    # List Function (for initializing variable arrays) ------------------------
    seqlist <- function(a, b, n)  {
      list1 <- rep(0, n)
      list1[1] = a
      list1[n] = b
      for (i in 2:(n - 1)) {
        list1[i] = (list1[n] - list1[i - 1]) * .326 + list1[i - 1]
      }
      return(list1)
    }
    
    
    # Initialize Variable Arrays ----------------------------------------------
    chi.list = seqlist(chi.0, chi.K, K + 1)
    Fhat.list = seq(0, 1, by = (1) / K)
    eta = (Fhat.list[K + 1] - Fhat.list[1]) / K
    Fhat.list
    
    # Brute-Force-Search function: chi ------------------------------------
    # input = -0.1
    brute_force_search.chi <- function(input) {
      stock_prices.list = 0
      for (variable in chi.list) {
        if (variable > input)  {
          return(stock_prices.list)
        }
        stock_prices.list = stock_prices.list + 1
      }
    }
    
    # Brute-Force-Search function: Fhat ------------------------------------
    brute_force_search.Fhat <- function(input)  {
      stock_prices.list = 0
      for (variable in Fhat.list) {
        if (variable > input)  {
          return(stock_prices.list)
        }
        stock_prices.list = stock_prices.list + 1
      }
    }
    
    #Binary Search
    binary_search <- function(values, input, start, end) {
      mid = floor((start + end) / 2)
      if (values[mid] <= input && values[mid + 1] >= input) {
        return(mid)
      }
      if (values[mid] > input) {
        end = mid
        return(binary_search(values, input, start, end))
      }
      if (values[mid] < input) {
        start = mid
        return(binary_search(values, input, start, end))
      }
    }
    
    # Fhat Distribution Function ----------------------------------------------
    # piecewise function for Fhat(x) taken from Feng, pg. 8 (Equation 3.12)
    Fhat.distribution <- function(input)
    {
      stock_prices.list = 0
      if (input < chi.list[1])
        # x < x0
      {
        stock_prices.list = 0
        return(stock_prices.list)
      }
      else if (input >= chi.list[K + 1])
        # x > 0 xK
      {
        stock_prices.list = 1
        return(stock_prices.list)
      }
      else
        # (xk-1) <= chi
      {
        xk_1 =  binary_search(chi.list, input, 1, length(chi.list))
        #print(binary_search(chi.list,input,1,length(chi.list)))# xk = bs(input);
        #xk_1 = brute_force_search.chi(input)
        #print(brute_force_search.chi(input))
        
        # Fhat[k-1] location:
        stock_prices.list = Fhat.list[xk_1] + (Fhat.list[xk_1 + 1] - Fhat.list[xk_1]) /
          eta * (input - chi.list[xk_1])
      }
      return(stock_prices.list)
    }
    
    # Inverse Transform Function ------------------------------------------------
    # Approximation to F-1(U) using brute-force search
    inverse_transform_method <- function() {
      U = runif(1,0,1)
      xk_1 = binary_search(Fhat.list, U, 1, length(Fhat.list))
      
      if (xk_1 < (K-1)) {                   # function returns K-1
        return(chi.list[xk_1 + 1] + (chi.list[xk_1 + 2] - chi.list[xk_1 + 1]) / 
                 (Fhat.list[xk_1 + 2] - Fhat.list[xk_1 + 1]) * (U - Fhat.list[xk_1 + 1]))
      } else {
        return(0) 
      }
    }
    Xt = inverse_transform_method()
    
    # initialize price lists
    stock_prices.list <- rep(0, no_of_simulations)
    put_prices.list <- rep(0, no_of_simulations)
    
    # Inverse Transform Method 1 -----------------------------------------------
    # Calculate V using Section 5.4 of Feng's Paper (pg.19)
    put_prcs <- rep(0, no_of_simulations)
    for (j in 1:no_of_simulations) {
      put_prcs[j] = s0 * exp(-r*T) * max(0, strike/s0 - exp(inverse_transform_method()))
    }
    
    # Method 1 Result
    put_prc.InvT <- sum(put_prcs) / no_of_simulations
    
    toc(log = TRUE)
    tic.clearlog()
    tic.clear()
  }
  # END  --------------------------------------------------------------------
  # -------------------------------------------------------------------------
  
  
  plot(chi.list)
  
  # OPTIONAL: Inverse Transform Method 2 ----------------------------------------------
  # uses default calculation for option price: V = e^(-r*T) * max(0, K - St)
  for (j in 1:no_of_simulations) 
  {
    Xt = inverse_transform_method()
    stock_prices.list[j] = s0 * exp(Xt)
    put_prices.list[j] = exp(-r * T) * max(0, strike - stock_prices.list[j])
  }
  
  # Method 2 Result
  sum(stock_prices.list) / no_of_simulations
  put_prc.method2 <- sum(put_prices.list) / no_of_simulations
  
  # Output both methods to table:
  # note both methods should output very similar results:
  values.table <- cbind(put_prc.InvT, put_prc.method2)
  values.table
  
  
  # RQuantLib benchmarking -----------------------------------------------------
  # Use the EuropeanOption function of RQuantLib to calculate the Black-Scholes
  # price of the European Put (all inputs are identical to the NIG inputs above, except volatility)
  library(RQuantLib)
  q = 0.0
  
  # QuantLib Price of the European Put option using Black-Scholes
  # to be compared with the FFT price and the PC-Parity Price
  quantlib.bsm.put.prc <-
    EuropeanOption(
      type = "put",
      underlying = s0,
      strike = strike,
      dividendYield = q,
      riskFreeRate = r,
      maturity = 0.5,
      volatility = 0.19
    )
  
  put_prices <- cbind(put_prc.InvT, quantlib.bsm.put.prc)
  
  print("NIG Put Price vs Black-Scholes:")
  put_prices}
{
  #source("Bachelier.R")
  source("BlackScholesFormula.R")
  
  BachelierFormula  <- function (spot,timetomat,strike, sigma){
    d<-(spot-strike)/(sigma*sqrt(timetomat))
    BachelierFormula<-(spot-strike)*pnorm(d)+sigma*sqrt(timetomat)*dnorm(d)
  }
  
  
  
  S0<-100
  sigmaBach<-15
  timetomat<-1
  strikes<-seq(75,125,2)
  impvol<-1:length(strikes)
  
  for(i  in 1:length(impvol)){
    Bachprice<-BachelierFormula(S0,timetomat,strikes[i],sigmaBach)
    impvol[i]<-BlackScholesImpVol(Bachprice,S0,timetomat,strikes[i],r=0, q=0, opttype=1)
  }
  
  plot(strikes,impvol,xlab="strike",ylab="implied volatility",main="Implied volatility skew in the Bachelier model")
  
  
  print<-TRUE
  
  
  if(print==T)
  {
    postscript(file="BachSmile.ps")
    plot(strikes,impvol,xlab="strike",ylab="implied volatility",main="Implied volatility skew in the Bachelier model")
    dev.off()
  }
  
  
  #' Calculate Bachelier model implied volatility
  #'
  #' @param price (vector of) option price
  #' @param strike (vector of) strike price
  #' @param spot (vector of) spot price
  #' @param texp (vector of) time to expiry
  #' @param intr interest rate (domestic interest rate)
  #' @param divr dividend/convenience yield (foreign interest rate)
  #' @param cp call/put sign. \code{1} for call, \code{-1} for put.
  #' @param forward forward price. If given, \code{forward} overrides \code{spot}
  #' @param df discount factor. If given, \code{df} overrides \code{intr}
  #' @return Bachelier implied volatility
  #'
  #' @references Choi, J., Kim, K., & Kwak, M. (2009).
  #'   Numerical Approximation of the Implied Volatility Under Arithmetic Brownian
  #'   Motion. Applied Mathematical Finance, 16(3), 261-268.
  #'   \doi{10.1080/13504860802583436}
  #'
  #' @export
  #'
  #' @examples
  #' spot <- 100
  #' strike <- 100
  #' texp <- 1.2
  #' sigma <- 20
  #' intr <- 0.05
  #' price <- 20
  #' FER::BachelierImpvol(price, strike, spot, texp, intr=intr)
  #'
  #' @seealso \code{\link{BachelierPrice}}
  #'
  BachelierImpvol <- function(
    price, strike=forward, spot, texp=1,
    intr=0, divr=0, cp=1L,
    forward=spot*exp(-divr*texp)/df, df=exp(-intr*texp)
  ){
    
    price.straddle <- 2*price/df - cp*(forward - strike)
    
    # vectors a and b used for rational Chebyshev approximation
    a <- c(
      3.994961687345134e-1,
      2.100960795068497e1,
      4.980340217855084e1,
      5.988761102690991e2,
      1.848489695437094e3,
      6.106322407867059e3,
      2.493415285349361e4,
      1.266458051348246e4
    )
    
    b <- c(
      4.990534153589422e1,
      3.093573936743112e1,
      1.495105008310999e3,
      1.323614537899738e3,
      1.598919697679745e4,
      2.392008891720782e4,
      3.608817108375034e3,
      -2.067719486400926e2,
      1.174240599306013e1
    )
    
    v <- abs( forward - strike ) / price.straddle
    
    # when the time value is very slightly negative, we correct to give zero vol.
    v[price>0 & 1<v & v<1+8*.Machine$double.eps] <- 1
    nu <- ifelse(v<1e-8, 1/(1+v*v*(1/3 + v*v/5)), v/atanh(v))
    
    poly.nu <- (((((((a[8]*nu+a[7])*nu+a[6])*nu+a[5]))*nu+a[4])*nu+a[3])*nu+a[2])*nu+a[1]
    poly.de <- (((((((((b[9]*nu+b[8])*nu+b[7])*nu+b[6]))*nu+b[5])*nu+b[4])*nu+b[3])*nu+b[2])*nu+b[1])*nu+1
    
    vol.norm <- sqrt(pi*nu/(2*texp)) * price.straddle * (poly.nu/poly.de)
    
    return(vol.norm)
  }
  
  
  
}



{
  
  
  bsOptionPrice <- function(forward, strike, time, vol,
                            type="call", discount=1, model='lognormal'){
    if (model != 'lognormal')
      stop('not implemented yet')
    
    d1 <- (log(forward/strike) + 0.5*time*vol^2)/(vol*sqrt(time))
    d2 <- (log(forward/strike) - 0.5*time*vol^2)/(vol*sqrt(time))
    
    if (type=="call"){
      price <- discount*(forward*stats::pnorm(d1) - strike*stats::pnorm(d2))
    } else{
      price <- discount*(strike*stats::pnorm(-d2) - forward*stats::pnorm(-d1))
    }
    return(price)
  }
  bsOptionsGreek <- function(forward, strike, time, vol, greek="delta",
                             type="call", discount=1, model='lognormal'){
    if (model != 'lognormal')
      stop('not implemented yet')
    t <- time
    price <- bsOptionPrice(forward, strike, t, vol, type, discount, model)
    
    if(greek=="price"){
      return(price)
    } else if(greek=="delta"){
      price.up <- bsOptionPrice(forward*1.0025, strike, t, vol, type, discount, model)
      price.dn <- bsOptionPrice(forward*0.9975, strike, t, vol, type, discount, model)
      delta.up <- price.up - price
      delta.dn <- price - price.dn
      delta.ave <- 0.5*(delta.up + delta.dn)/(0.0025*forward)
      return(delta.ave)
    } else if(greek=="vega"){
      price.up <- bsOptionPrice(forward, strike, t, vol+0.01, type, discount, model)
      price.dn <- bsOptionPrice(forward, strike, t, vol-0.01, type, discount, model)
      vega.up <- price.up - price
      vega.dn <- price - price.dn
      vega.ave <- 0.5*(vega.up + vega.dn)
      return(vega.ave)
    } else if(greek=="theta"){
      price.up <- bsOptionPrice(forward, strike, t-1/260, vol, type, discount, model)
      theta <- price.up - price
      return(theta)
    } else if(greek=="gamma"){
      delta <- bsOptionsGreek(forward, strike, t, vol,"delta", type, discount, model)
      delta.up <- bsOptionsGreek(forward*1.01, strike, t, vol,"delta", type, discount, model)
      delta.dn <- bsOptionsGreek(forward*0.99, strike, t, vol, "delta" , type, discount, model)
      gamma.up <- delta.up - delta
      gamma.dn <- delta - delta.dn
      gamma.ave <- 0.5*(gamma.up + gamma.dn)
      return(gamma.ave)
    } else{
      stop("not implemented yet")
    }
  }
  bsVolSolve <- function(forward, strike, time, price,
                         type="call", discount=1, model='lognormal',
                         tolerance = 0.00001, iteration=100){
    if (model != 'lognormal')
      stop('not implemented yet')
    
    #guess <- price/(0.4*forward*sqrt(time))
    guess <- 0.5
    i=1; vol = guess; h=tolerance
    while(i<iteration){
      px <- bsOptionPrice(forward, strike, time, vol,
                          type, discount, model) - price
      px.dv <- bsOptionPrice(forward, strike, time, vol+ h,
                             type, discount, model) - price
      dpx.dvol <- (px.dv - px)/(h)
      vol.1 <- vol - px/dpx.dvol
      i <- i+1
      if(abs(vol.1 - vol) < tolerance) break
      vol <- vol.1
    }
    
    return(vol)
  }
  
  #'Compute price and greeks of plain vanilla European options
  #'@description Compute price and greeks of plain vanilla European options (
  #'calls and puts) using lognormal Black-76 model.
  #'@param date Value date of the option.
  #'@param forward Forward level(s) of the underlying.
  #'@param strike strike(s) of the option.
  #'@param expiry Expiry date(s).
  #'@param vol Volatility(s).
  #'@param type Option type - "call" or "put".
  #'@param discount Discount factor.
  #'@param output Output type, "price" or any other standard greeks.
  #'@param model Model type, only lognormal is implemented.
  #'@return Price or greek estimate. The function is vectorized.
  #'@details Black's formula is arguably more useful for pricing index options
  #'compared to traditional Black-Scholes formula. The Black-76 option pricing
  #'model uses the price of futures directly, instead of accreting the spot
  #'index at the cost of carry. This is useful where the index futures trade
  #'at prices below spot plus cost of carry, providing a model consistent with
  #'market. In many places this is now standard to use Black-76 for index
  #'options valuation for margining and fair value determination purposes. For
  #'greeks the return values are as follows: 1) delta: this returns the
  #'standard black-scholes delta, the first derivative of option price with
  #'respect to underlying. 2) gamma: this returns the change in delta for a
  #'1 percentage point change in underlying (averaged for up and down move) 3)
  #'vega: this returns the change in option price for a absolute 1 percentage
  #'points increase in volatility 4) theta: this returns the decay in option
  #'price over one day (assumeing 260 business days in a year).
  #'@export
  bsPlainVanillaOption <- function(date, forward, strike, expiry, vol,
                                   type="call", discount=1, output='price', model='lognormal'){
    type <- tolower(type)
    output <- tolower(output)
    if (model != 'lognormal')stop('not implemented yet')
    
    N <- max(NROW(forward),NROW(strike),NROW(expiry),NROW(vol),NROW(type),
             NROW(discount))
    forward <- utils::head(rep(forward,N),N)
    strike <- utils::head(rep(strike,N),N)
    expiry <- utils::head(rep(expiry,N),N)
    vol <- utils::head(rep(vol,N),N)
    type <- utils::head(rep(type,N),N)
    discount <- utils::head(rep(discount,N),N)
    price <- rep(0,N)
    
    suppressWarnings(if(class(expiry)=="Date")expiry <- as.POSIXct.Date(expiry))
    suppressWarnings(if(class(date)=="Date")date <- as.POSIXct.Date(date))
    
    t = (as.numeric(expiry) - as.numeric(date))/(60*60*24*260)
    
    for(i in 1:N){
      price[i] <- bsOptionsGreek(forward[i], strike[i], t[i], vol[i], output,
                                 type[i], discount[i], model)
    }
    return(price)
  }
  
  #'Compute implied volatility of plain vanilla European options from market
  #'price
  #'@description Compute implied volatility of plain vanilla European options
  #'from market price using lognormal Black-76 model.
  #'@param date Value date of the option.
  #'@param forward Forward level(s) of the underlying.
  #'@param strike strike(s) of the option.
  #'@param expiry Expiry date(s).
  #'@param price Option market price(s).
  #'@param type Option type - "call" or "put".
  #'@param discount Discount factor.
  #'@param model Model type, only lognormal is implemented.
  #'@return Implied volatility estimate. The function is vectorized.
  #'@details Black's formula is arguably more useful for pricing index options
  #'compared to traditional Black-Scholes formula. The Black-76 option pricing
  #'model uses the price of futures directly, instead of accreting the spot
  #'index at the cost of carry. This is useful where the index futures trade
  #'at prices below spot plus cost of carry, providing a model consistent with
  #'market. In many places this is now standard to use Black-76 for index
  #'options valuation for margining and fair value determination purposes.
  #'@export
  bsImpliedVol <- function(date, forward, strike, expiry, price,
                           type="call", discount=1, model='lognormal'){
    type <- tolower(type)
    if (model != 'lognormal')
      stop('not implemented yet')
    
    N <- max(NROW(forward),NROW(strike),NROW(expiry),NROW(price),NROW(type),
             NROW(discount))
    forward <- utils::head(rep(forward,N),N)
    strike <- utils::head(rep(strike,N),N)
    expiry <- utils::head(rep(expiry,N),N)
    price <- utils::head(rep(price,N),N)
    type <- utils::head(rep(type,N),N)
    discount <- utils::head(rep(discount,N),N)
    vol <- rep(0,N)
    
    suppressWarnings(if(class(expiry)=="Date")expiry <- as.POSIXct.Date(expiry))
    suppressWarnings(if(class(date)=="Date")date <- as.POSIXct.Date(date))
    
    t = (as.numeric(expiry) - as.numeric(date))/(60*60*24*260)
    
    for(i in 1:N){
      vol[i] <- bsVolSolve(forward[i], strike[i], t[i], price[i], type[i])
    }
    
    return(vol)
  }
}

{
  
  #'Extract implied distribution of the underlying from options prices
  #'@description Extract implied probability distribution from option prices
  #'from a fitted vol model calibrated to market prices.
  #'@param vol A vol object (either sabrvol or quadvol) obtained by calibrating
  #'to market prices of options.
  #'@param n Number of division for the range of strikes to generate the
  #'distribution.
  #'@param bounds The range (in percentage) of the underlying to estimate the
  #'distribution.
  #'@param normalization A logical value. If true, the implied distribution is
  #'normalized to sum up to 1, else not.
  #'@return A dataframe with strikes and corresponding probability density
  #'function estimates.
  #'@details Extracting probability density from the implied volatility of
  #'options is done using the standard method of taking the second derivatives
  #'of option prices with respect to strikes. The second derivative is estimated
  #'using the usual finite difference approach. The resulting distribution is
  #'the option implied risk neutral distribution. The strikes of the underlying
  #'of the distribution is always scaled so that the current forward is at 100.
  #'@seealso \code{\link{calibrate}} for calibration and volatility models
  #'@export
  impliedDistribution <- function(vol, n=512, bounds=c(-0.2, 0.2),
                                  normalization=TRUE){
    lowstrike <- 100*(1+bounds[1])
    highstrike <- 100*(1+bounds[2])
    strikes <- seq(lowstrike,highstrike,length.out = n)
    px <- rep(0,n)
    d <- abs(strikes[2] - strikes[1]); h <- 0.025*d
    
    for(i in 1:n){
      k <- strikes[i]
      x1 <- bsoption:::bsOptionPrice(100,k+h,vol$t,getVol(vol,100,k+h),"call",vol$discfact)
      x2 <- bsoption:::bsOptionPrice(100,k,vol$t,getVol(vol,100,k),"call",vol$discfact)
      x3 <- bsoption:::bsOptionPrice(100,k-h,vol$t,getVol(vol,100,k-h),"call",vol$discfact)
      px[i] <- (x1 - 2*x2 + x3)/h^2
    }
    
    #0-th momemnt normalization to sum up to 1
    if(normalization){
      px <- px/sum(px*d)
    }
    
    p <- data.frame(k=strikes,p=px)
    return(p)
  }
  
  #'Extract realized distribution of the underlying prices
  #'@description Extract realized probability distribution from the time series
  #'data of the underlying price.
  #'@param x Time series of underlying prices in xts format. The frequency is
  #'assumed to be daily.
  #'@param t Maturity (in years). This is used to scale the daily returns using
  #'a square root of time scaling.
  #'@param n Number of division for the range of strikes to generate the
  #'distribution. This number should ideally be a power of 2 (becuase of Fourier
  #'transform used within) although it is not a requirement.
  #'@param bounds The range (in percentage) of the underlying to estimate the
  #'distribution.
  #'@param normalization A logical value. If true, the implied distribution is
  #'normalized to sum up to 1, as well as the first moment is normalized to
  #'be equal to the forward level (100).
  #'@return A dataframe with strikes and corresponding probability density
  #'function estimates.
  #'@details Extracting probability density from the prices data is done in two
  #'steps. First the prices are converted to returns and appropriately scaled.
  #'Then these scaled returns are use to fit a  (gaussian) kernel density
  #'estimate. The probability distribution is normalized in the zero-th
  #'moment to sum up to 1 and also in the first moment to match the forward
  #'(100). The strikes of the underlying of the distribution is always scaled
  #'so that the current forward is at 100.
  #'@export
  realizedDistribution <- function(x,t,n=512,bounds=c(-0.2, 0.2),
                                   normalization=TRUE){
    lowstrike <- 100*(1+bounds[1])
    highstrike <- 100*(1+bounds[2])
    strikes <- seq(lowstrike,highstrike,length.out = n)
    
    x <- stats::na.omit(TTR::ROC(quantmod::Cl(x)))
    dt <- t/(1/260)
    x <- x*sqrt(dt)
    y <- stats::density(x, n=n, from = bounds[1], to = bounds[2])
    k <- 100*(1+y$x); px=y$y
    d <- abs(k[2] - k[1])
    
    #0-th momemnt normalization to sum up to 1
    if(normalization)
      px <- px/sum(px*d)
    
    #1st moment normalization to forward level 100
    if(normalization){
      offset <- 100 - sum(k*px)*d
      k <- k + offset
    }
    
    p <- data.frame(k=k,p=px)
    return(p)
  }
  
  #'Price vanilla European options from a given underlying distribution
  #'@description Price vanilla European call or put options from a given
  #'underlying distribution, using the first principle.
  #'@param forward Forward level of the underlying.
  #'@param strike Strike of the option.
  #'@param voldist The distribution of the underlying (obtained using either
  #'impliedDistribution or realizedDistribution function).
  #'@param type The type of the option (call or put).
  #'@param discount Discount factor.
  #'@param model Model type, only lognormal is implemented.
  #'@return Price of the option.
  #'@details The underlying distribution is used to compute the payoff profile
  #'of option and this is then integrated within the range to arrive at the
  #'price of the option. All values are assumed to be zero outside the specified
  #'distribution range.
  #'#'@seealso \code{\link{impliedDistribution}}
  #'@export
  distributionPricer <- function(forward, strike, voldist,
                                 type="call", discount=1, model='lognormal'){
    type <- tolower(type)
    f <- function(x, voldist, k){
      payoff <- voldist$p*(voldist$k-k)
      payoff <- ifelse(payoff<0,0,payoff)
      y <- stats::approx(voldist$k,payoff,x,n=NROW(x),rule=2,yleft = 0,yright = 0)$y
      return(y)
    }
    k <- 100*strike/forward
    payoff <- stats::integrate(f,k,Inf,voldist=voldist,k=k,subdivisions = 500)$value
    if(type=="call"){
      px <- payoff
    } else if(type=="put"){
      px <- payoff - (100-k)
    } else{
      stop("Unknown option type. Can be either call or put")
    }
    px <- discount*px*forward/100
    return(px)
  }
}










 
 












##
## PARAMETERS
##
## lambda: mean-reversion speed
## vbar: long-term average volatility
## eta: volatility of vol process
## rho: correlation between stock and vol
## v0: initial volatility
## r: risk-free interest rate
## tau: time to maturity
## S0: initial share price
## K: strike price



path <- "D:/R/StockOptionsImplVol2023.rds"
symbol <- "AAPL"
#data indlæs
{
  symbol <- paste(symbol,".US",sep="")
  dt_impl_vol <- readRDS(path); dt_impl_vol <- data.frame(dt_impl_vol)
  AAPL <- subset(dt_impl_vol, dt_impl_vol$UnderlyingSymbol == symbol);AAPL <- AAPL[substr(AAPL$lastTradeDateTime,1,10) != "0000-00-00", ]; AAPL <- AAPL[!duplicated(AAPL[, 1:6]),1:21]
  
  added_rows <- data.frame(contractName = c(0), 
                           contractSize = c(0), 
                           currency = c(0), 
                           type = c(0), 
                           inTheMoney = c(0), 
                           lastTradeDateTime = c(0), 
                           expirationDate = c(0), 
                           strike = c(0), 
                           lastPrice = c(0), 
                           bid = c(0),
                           ask = c(0),
                           change = c(0),
                           changePercent = c(0),
                           volume = c(0),
                           openInterest = c(0),
                           impliedVolatility = c(0),
                           UnderlyingSymbol = c(0),
                           Tech_opr = c(0),
                           User = c(0),
                           updatedAt = c(0),
                           Event = c(0)
  )
  
  #new calls and puts data, with cleanup
  {

   
    
    
    
    
    
    
    
    
    
    
    
    
    
     names(Calls) <- c("contractName","contractSize","currency","expirationDate","strike","lastPrice","change","changePercent","bid","ask","volume","openInterest","lastTradeDateTime","impliedVolatility","inTheMoney")
    for (i in 1:nrow(Calls))
    {
      if (
        is.na(Calls[i:i,"volume"])
      ) 
      {
        Calls[i:i,"volume"] <- 0
      }
    }
    
    Puts  <- getOptionChain("AAPL", exp = "2023")['puts'];Puts <- data.frame(Puts); Puts <- Puts[!is.na(Puts$puts.Bid),];
    names(Puts) <- c("contractName","contractSize","currency","expirationDate","strike","lastPrice","change","changePercent","bid","ask","volume","openInterest","lastTradeDateTime","impliedVolatility","inTheMoney")
    for (i in 1:nrow(Puts))
    {
      if (
        is.na(Puts[i:i,"volume"])
      ) 
      {
        Puts[i:i,"volume"] <- 0
      }
    }
  }
  
  for (i in 1:nrow(AAPL))
  {
    l <- AAPL[i:i,]
    added_rows <- rbind(added_rows,l)
  }
  for (i in 1:nrow(Calls))
  {
    lc <- c(as.character(Calls[i:i,"contractName"]), 
            as.character(Calls[i:i,"contractSize"]),
            as.character(Calls[i:i,"currency"]),
            as.character("CALL"),
            as.character(Calls[i:i,"inTheMoney"]),
            as.character(as.Date(substr(Calls[i:i,"lastTradeDateTime"],1,10))),
            as.character(as.Date(substr(Calls[i:i,"expirationDate"],1,10))),
            as.double(Calls[i:i,"strike"]),
            as.double(Calls[i:i,"lastPrice"]),
            as.double(Calls[i:i,"bid"]),
            as.double(Calls[i:i,"ask"]),
            as.double(Calls[i:i,"change"]),
            as.double(Calls[i:i,"changePercent"]),
            as.integer(Calls[i:i,"volume"]),
            as.integer(Calls[i:i,"openInterest"]),
            as.double(Calls[i:i,"impliedVolatility"]),
            as.character(symbol),
            as.double(Sys.Date()),
            as.character("Admin"),
            as.double(Sys.Date()),
            as.character("NONE")
    )
    added_rows <- rbind(added_rows,lc)
  }
  for (i in 1:nrow(Puts))
  {
    lp <-  c(as.character(Puts[i:i,"contractName"]), 
             as.character(Puts[i:i,"contractSize"]),
             as.character(Puts[i:i,"currency"]),
             as.character("PUT"),
             as.character(Puts[i:i,"inTheMoney"]),
             as.character(as.Date(substr(Puts[i:i,"lastTradeDateTime"],1,10))),
             as.character(as.Date(substr(Puts[i:i,"expirationDate"],1,10))),
             as.double(Puts[i:i,"strike"]),
             as.double(Puts[i:i,"lastPrice"]),
             as.double(Puts[i:i,"bid"]),
             as.double(Puts[i:i,"ask"]),
             as.double(Puts[i:i,"change"]),
             as.double(Puts[i:i,"changePercent"]),
             as.integer(Puts[i:i,"volume"]),
             as.integer(Puts[i:i,"openInterest"]),
             as.double(Puts[i:i,"impliedVolatility"]),
             as.character(symbol),
             as.double(Sys.Date()),
             as.character("Admin"),
             as.double(Sys.Date()),
             as.character("NONE")
    )
    added_rows <- rbind(added_rows,lp)
  }
  
  added_rows <- added_rows[-1,]
  AAPL <- added_rows
  
  rm("added_rows", "Calls", "Puts", "dt_impl_vol", "l", "li", "lc", "lp")
}

#process
{
  from_d = '2019-01-01'; to_d = as.Date(Sys.Date()+1) #for downloading stockdata
  S <- tq_get("AAPL", get="stock.prices", from = from_d, to = to_d)
  li <- list()
  OptDF <- data.frame (Contract = c(0), LastTrade = c(0), Expiration = c(0), moneyness = c(0), Strike = c(0), last_contract_price = c(0), Stockprice = c(0), BSPrice = c(0), moneyTrue = c(0), Implied_volatility = c(0))
  
  S <- tq_get("AAPL", get="stock.prices", from = from_d, to = to_d)
  
  
  for (i in 1:nrow(AAPL))
  {
    
    if ( substr(AAPL[i:i,"lastTradeDateTime"],1,10) == "0000-00-00")
    {
      St <- tail(S,1)["close"][[1]]; St <- as.numeric(St)
      texp <- 1  #time till maturity
    }
    else if ( substr(AAPL[i:i,"lastTradeDateTime"],1,10) != "0000-00-00")
    {
      St <- S[S$date == substr(AAPL[i:i,"lastTradeDateTime"],1,10),1:8]["close"][[1]]; St <- as.numeric(St)
      texp <- as.integer(as.Date(AAPL[i:i,"expirationDate"])) - as.integer(as.Date(substr(AAPL[i:i,"lastTradeDateTime"],1,10)))  #time till maturity
      texp <- texp/365
    }
    K <- as.numeric(AAPL[i,"strike"])#strike price 
    r <- 0.05#risk-free rate
    
    sigma <- 0.05
    rho <- 0
    #1. Moneyness
    if (moneyness(K,St)=="TRUE" & AAPL[i:i,"inTheMoney"]=="TRUE")
    {mnyT <- "ITM = ITM"}
    else if (moneyness(K,St)=="TRUE" & AAPL[i:i,"inTheMoney"]=="FALSE")
    {mnyT <- "ITM not ITM"}
    else if (moneyness(K,St)=="FALSE" & AAPL[i:i,"inTheMoney"]=="FALSE")
    {mnyT <- "OTM = OTM"}
    else if (moneyness(K,St)=="FALSE" & AAPL[i:i,"inTheMoney"]=="TRUE")
    {mnyT <- "OTM not OTM"}
    
    tryCatch( 
      {
        impl <- mean(impl_vol1(K,St,texp,r), impl_vol2(as.numeric(AAPL[i:i,"lastPrice"]),St,r,texp), impl_vol3(K,St,r,texp,rho,AAPL[i:i,"type"],as.numeric(AAPL[i:i,"lastPrice"]))) },
      error = function(e)
      {impl <- 0}
    )
    
    li <- c(AAPL[i:i,"contractName"], AAPL[i:i,"lastTradeDateTime"], AAPL[i:i,"expirationDate"],moneyness(K,St), K, AAPL[i:i,"lastPrice"], St, BSprice(K,St,r,texp,sigma,rho,AAPL[i:i,"type"]), mnyT, impl)
    OptDF <- rbind(OptDF, li)
    
  }
  OptDF <- OptDF[-1,];OptDF <- OptDF[substr(OptDF$LastTrade,1,10) != "0000-00-00", ]; OptDF <- OptDF[!duplicated(OptDF[, 1:2]),1:10]
  rm("from_d","i","impl","K", "li", "mnyT", "r", "rho", "sigma", "St", "texp", "to_d")
}

write.xlsx(OptDF, 'C:\\Users\\DstMove\\Documents\\test1.xlsx')
write.xlsx(AAPLJonasCalls, 'C:\Users\DstMove\Documents\test2.xlsx')


#LSM example
{
#####################
## The First Example in the Paper
#####################

#Example Paths 
EXAMPLE = matrix( c(1,1.09,1.08,1.34,1,1.16,1.26,1.54,1,1.22,1.07,1.03,1,0.93,0.97,0.92,1,1.11,1.56,1.52,1,0.76,0.77,0.90,1,0.92,0.84,1.01,1,0.88,1.22,1.34), nrow=8, ncol=4, byrow=TRUE)

#EXAMPLE PARAMETERS
paths = 8
steps = 4
strike=1.1
startprice = 1
r<-0.06
dt = 1
disc=exp(dt*r*(-(1:(steps-1))))

P = matrix( 0, nrow = paths, ncol = steps)

#EXAMPLE PATHS
S = EXAMPLE

# First Cashflow at T is done outside the loop
for (j in 1:paths) P[j,steps] = max(strike-S[j,steps],0)

#Now do LSM within a loop

for (h in (steps-1):2){
  Y<-rep(0,paths) # slow!
  pick <- strike - S[,h] > 0
  for (j in 1:paths) Y[j] = sum(disc[1:(steps-h)]*P[j,(h+1):steps])
  Y<-Y[pick]
  dummy<-S[pick,h]
  X<-cbind (rep(1,length(pick[pick>0])),dummy,dummy^2) # slow!
  b = solve(t(X)%*%X)%*%t(X)%*%Y
  # if (h==3) {print(Y*exp(r)); print(dummy); print(b)}
  
  for (j in 1:paths){ 
    if (pick[j] > 0 & c(1,S[j,h],S[j,h]^2)%*%b < max(strike-S[j,h],0)){ 
      P[j,h]<-max(strike-S[j,h],0)
      P[j,(h+1):steps]<-0
    }  
  }
  
}

Z<-rep(0,paths)

for (j in 1:paths) Z[j]<-sum(disc*P[j,2:steps])

#print(mean(Z))

#time_RP<-system.time(for (dummy in 1:100) {source('Least Squares Monte Carlo.R')})[3]
}


#not the american option
{
capT<-1
strike<-100
S0<-100
sigma<-0.2
r<-0.03
n<-252
dt<-capT/n
disc<-exp(-dt*r)
dummy<-1+0:n

u<-exp(sigma*sqrt(dt))
d<-1/u
q<-(exp(r*dt)-d)/(u-d)

Nsim<-10000

DiscPayoff<-rep(0,Nsim)

S<-rep(S0,(n+1))

for (j in 1:Nsim){
  
  for(i in 2:(n+1)){
    GoingUp<-(runif(1) > q)
    if (GoingUp) S[i]<-S[i-1]*u    
    if (!GoingUp) S[i]<-S[i-1]*d
  }
  
  SnellZ<-gS<-pmax(strike-S,0)
  
  for (i in n:1) SnellZ[i]<-max(gS[i],disc*SnellZ[i+1])
  tau.index<-dummy[SnellZ==gS][1]
  DiscPayoff[j]<-disc^((tau.index-1))*gS[tau.index]
  
}

print(c(mean(DiscPayoff), sd(DiscPayoff)/sqrt(Nsim)))
}


#combined
{
  #####################
  ## The First Example in the Paper
  #####################
  
  #Example Paths 
  EXAMPLE = matrix( c(1, 1.09, 1.08, 1.34,
                      1, 1.16, 1.26, 1.54,
                      1, 1.22, 1.07, 1.03,
                      1, 0.93, 0.97, 0.92,
                      1, 1.11, 1.56, 1.52,
                      1, 0.76, 0.77, 0.90,
                      1, 0.92, 0.84, 1.01,
                      1, 0.88, 1.22, 1.34), 
                    nrow=8, ncol=4, byrow=TRUE)
  
  #EXAMPLE PARAMETERS
  strike     <-  1.1
  startprice <-  1.0
  r          <-  0.06
  
  periods  <- 4
  nperiods <- seq(0,periods-1,1)
  
  paths    <- 8
  npaths   <- seq(1,paths, 1)
  
  # Renove t0 because it is trivial
  disc     <- exp( - r * nperiods[-1])
  
  # Generate matrix for actual option pricing
  P           <- matrix( 0, nrow = paths, ncol = periods)
  colnames(P) <- paste0("Period ", nperiods, sep = "")
  rownames(P) <- paste0("Path ",   npaths,   sep = "")
  
  # Matrix of simulated paths (here manufactured from article example)
  S           <- EXAMPLE
  colnames(S) <- paste0("Period ", nperiods, sep = "")
  rownames(S) <- paste0("Path ",   npaths,   sep = "")
  
  # First Cashflow at T is done outside the loop
  P[, periods] <- pmax(strike - S[,periods], 0)
  
  #Now do LSM within a loop, backwards iteration
  for (h in (periods-1):2){
    # Only in the money (itm) paths carry a potential trade-off
    itm <- strike - S[, h] > 0
    
    # Essentially just P[x, y]. Applying matrix(P) avoids a dimension-error when using apply()
    p <- matrix(P[,(h+1): periods], ncol = length(P[1,(h+1):periods]))
    d <- disc[1: (periods - h)]
    
    # Regressand Y is the npv of future paths
    Y <- apply(p, 1, function(x) sum(x * d) )
    
    # Considering only itm paths increases computational efficiency
    Y <- Y[itm]
    
    # Regression on two basis functions and a constant. Could increase to e.g. fifth power
    s_itm  <- S[itm, h]
    s_itm2 <- s_itm**2
    one    <- rep(1, length(s_itm))
    X <- cbind(one, s_itm, s_itm2)
    
    # solve() for inverse; %*% for matrix multiplication
    # We get b equivalently from running lm(Y ~ X)
    b <- solve(t(X) %*% X) %*% (t(X) %*% Y)
    
    exercise_value <- pmax(strike - s_itm, 0)
    exp_cont_value <- X %*% b
    exercise       <- exp_cont_value < exercise_value
    idx            <- names(exercise[exercise == T,])
    
    P[idx, h] <- exercise_value[idx]
    P[idx, (h+1):periods] <- 0
  }
  
  Z <- apply(P[,2:periods], 1, function(x) sum(x * disc) )
  
  #print(mean(Z))
  
  #time_WG<-system.time(for (dummy in 1:100) {source('WG speed-up of LSM.R')})[3]
}








## Rosenbrock Banana function
eval_f <- function(x) {   
  return( 100 * (x[2] - x[1] * x[1])^2 + (1 - x[1])^2 )
}

## Gradient of Rosenbrock Banana function
eval_grad_f <- function(x) { 
  return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
             200 * (x[2] - x[1] * x[1]) ) )
}


x0 <- c( 1, 1 )

opts <- list("algorithm"="NLOPT_LD_LBFGS",
             "xtol_rel"=1.0e-8)

# solve Rosenbrock Banana function
res <- nloptr( x0=x0, 
               eval_f=eval_f, 
               eval_grad_f=eval_grad_f,
               opts=opts)

print( res )

eval_f(x0)


# libraries


#functions
{
moneyness <- function(K,S)
{ 
    #money <- k*exp(-r*time)/s
    #return(money)
    if (K<S) {mon = "TRUE"}
    else if (K>=S) {mon = "FALSE"}
    else {mon = "error"}
    return(mon)
}
   
BSprice <- function(K, S, r, Ti, sig, rho, typen) 
{
    type <- tolower(typen)
    d_1 <- (log(S/K) + (r- rho + (sig^2/2))*Ti) / (sig*sqrt(Ti))
    d_2 <- d_1 - (sig*sqrt(Ti))
    
    if(type=="p"||type=="put")
    {
      price <- (K*exp(-r*Ti)*pnorm(-d_2,0,1)) - (S*exp(-rho*Ti)*pnorm(-d_1,0,1))
    }
    else if(type=="c" || type=="call") 
    {
      price <- (S*exp(-rho*Ti)*pnorm(d_1,0,1)) - (K*exp(-r*Ti)*pnorm(d_2,0,1))
    }
    return(price)
}

impl_vol1 <- function(K,S,r,Ti)
{
  res <- sqrt((2*3.1415926)/Ti)*(K*exp(-r))/S
  return(res)
}

impl_vol2 <- function(C,S,r,Ti)
{
  res <- C/(0.4*S*exp(-r*Ti))*sqrt(Ti)
  return(res)
}

impl_vol3 <- function(K, S, r, Ti, rho, type, price) 
{
  root <- function(sigma) 
  {
    BSprice(K,S,r,Ti,sigma,rho, type) - price
  }
  
  uniroot(root,c(-1,10),extendInt = "no")$root
} 
  

}

path <- "D:/R/StockOptionsImplVol2023.rds"
symbol <- "AAPL"
#data indlæs
{
symbol <- paste(symbol,".US",sep="")
dt_impl_vol <- readRDS(path); dt_impl_vol <- data.frame(dt_impl_vol)
AAPL <- subset(dt_impl_vol, dt_impl_vol$UnderlyingSymbol == symbol);AAPL <- AAPL[substr(AAPL$lastTradeDateTime,1,10) != "0000-00-00", ]; AAPL <- AAPL[!duplicated(AAPL[, 1:6]),1:21]

added_rows <- data.frame(contractName = c(0), 
                         contractSize = c(0), 
                         currency = c(0), 
                         type = c(0), 
                         inTheMoney = c(0), 
                         lastTradeDateTime = c(0), 
                         expirationDate = c(0), 
                         strike = c(0), 
                         lastPrice = c(0), 
                         bid = c(0),
                         ask = c(0),
                         change = c(0),
                         changePercent = c(0),
                         volume = c(0),
                         openInterest = c(0),
                         impliedVolatility = c(0),
                         UnderlyingSymbol = c(0),
                         Tech_opr = c(0),
                         User = c(0),
                         updatedAt = c(0),
                         Event = c(0)
                         )

#new calls and puts data, with cleanup
{
  Calls <- getOptionChain("AAPL", exp = "2023")['calls'];Calls <- data.frame(Calls); Calls <- Calls[!is.na(Calls$calls.Bid),];
  names(Calls) <- c("contractName","contractSize","currency","expirationDate","strike","lastPrice","change","changePercent","bid","ask","volume","openInterest","lastTradeDateTime","impliedVolatility","inTheMoney")
  for (i in 1:nrow(Calls))
  {
    if (
      is.na(Calls[i:i,"volume"])
    ) 
    {
      Calls[i:i,"volume"] <- 0
    }
  }
  
  Puts  <- getOptionChain("AAPL", exp = "2023")['puts'];Puts <- data.frame(Puts); Puts <- Puts[!is.na(Puts$puts.Bid),];
  names(Puts) <- c("contractName","contractSize","currency","expirationDate","strike","lastPrice","change","changePercent","bid","ask","volume","openInterest","lastTradeDateTime","impliedVolatility","inTheMoney")
  for (i in 1:nrow(Puts))
  {
    if (
      is.na(Puts[i:i,"volume"])
    ) 
    {
      Puts[i:i,"volume"] <- 0
    }
  }
}

for (i in 1:nrow(AAPL))
{
  l <- AAPL[i:i,]
  added_rows <- rbind(added_rows,l)
}
for (i in 1:nrow(Calls))
{
  lc <- c(as.character(Calls[i:i,"contractName"]), 
          as.character(Calls[i:i,"contractSize"]),
          as.character(Calls[i:i,"currency"]),
          as.character("CALL"),
          as.character(Calls[i:i,"inTheMoney"]),
          as.character(as.Date(substr(Calls[i:i,"lastTradeDateTime"],1,10))),
          as.character(as.Date(substr(Calls[i:i,"expirationDate"],1,10))),
          as.double(Calls[i:i,"strike"]),
          as.double(Calls[i:i,"lastPrice"]),
          as.double(Calls[i:i,"bid"]),
          as.double(Calls[i:i,"ask"]),
          as.double(Calls[i:i,"change"]),
          as.double(Calls[i:i,"changePercent"]),
          as.integer(Calls[i:i,"volume"]),
          as.integer(Calls[i:i,"openInterest"]),
          as.double(Calls[i:i,"impliedVolatility"]),
          as.character(symbol),
          as.double(Sys.Date()),
          as.character("Admin"),
          as.double(Sys.Date()),
          as.character("NONE")
  )
  added_rows <- rbind(added_rows,lc)
}
for (i in 1:nrow(Puts))
{
  lp <-  c(as.character(Puts[i:i,"contractName"]), 
           as.character(Puts[i:i,"contractSize"]),
           as.character(Puts[i:i,"currency"]),
           as.character("PUT"),
           as.character(Puts[i:i,"inTheMoney"]),
           as.character(as.Date(substr(Puts[i:i,"lastTradeDateTime"],1,10))),
           as.character(as.Date(substr(Puts[i:i,"expirationDate"],1,10))),
           as.double(Puts[i:i,"strike"]),
           as.double(Puts[i:i,"lastPrice"]),
           as.double(Puts[i:i,"bid"]),
           as.double(Puts[i:i,"ask"]),
           as.double(Puts[i:i,"change"]),
           as.double(Puts[i:i,"changePercent"]),
           as.integer(Puts[i:i,"volume"]),
           as.integer(Puts[i:i,"openInterest"]),
           as.double(Puts[i:i,"impliedVolatility"]),
           as.character(symbol),
           as.double(Sys.Date()),
           as.character("Admin"),
           as.double(Sys.Date()),
           as.character("NONE")
  )
  added_rows <- rbind(added_rows,lp)
}

added_rows <- added_rows[-1,]
AAPL <- added_rows

rm("added_rows", "Calls", "Puts", "dt_impl_vol", "l", "li", "lc", "lp")
}

#process
{
from_d = '2019-01-01'; to_d = as.Date(Sys.Date()+1) #for downloading stockdata
li <- list()
OptDF <- data.frame (Contract = c(0), LastTrade = c(0), Expiration = c(0), moneyness = c(0), Strike = c(0), last_contract_price = c(0), Stockprice = c(0), BSPrice = c(0), moneyTrue = c(0), Implied_volatility = c(0))

S <- tq_get("AAPL", get="stock.prices", from = from_d, to = to_d)


for (i in 1:nrow(AAPL))
{
  
  if ( substr(AAPL[i:i,"lastTradeDateTime"],1,10) == "0000-00-00")
    {
    St <- tail(S,1)["close"][[1]]; St <- as.numeric(St)
    texp <- 1  #time till maturity
    }
  else if ( substr(AAPL[i:i,"lastTradeDateTime"],1,10) != "0000-00-00")
    {
    St <- S[S$date == substr(AAPL[i:i,"lastTradeDateTime"],1,10),1:8]["close"][[1]]; St <- as.numeric(St)
    texp <- as.integer(as.Date(AAPL[i:i,"expirationDate"])) - as.integer(as.Date(substr(AAPL[i:i,"lastTradeDateTime"],1,10)))  #time till maturity
    texp <- texp/365
    }
  K <- as.numeric(AAPL[i,"strike"])#strike price 
  r <- 0.05#risk-free rate
  
  sigma <- 0.05
  rho <- 0
  #1. Moneyness
  if (moneyness(K,St)=="TRUE" & AAPL[i:i,"inTheMoney"]=="TRUE")
  {mnyT <- "ITM = ITM"}
  else if (moneyness(K,St)=="TRUE" & AAPL[i:i,"inTheMoney"]=="FALSE")
  {mnyT <- "ITM not ITM"}
  else if (moneyness(K,St)=="FALSE" & AAPL[i:i,"inTheMoney"]=="FALSE")
  {mnyT <- "OTM = OTM"}
  else if (moneyness(K,St)=="FALSE" & AAPL[i:i,"inTheMoney"]=="TRUE")
  {mnyT <- "OTM not OTM"}
  
  tryCatch( 
    {
      impl <- mean(impl_vol1(K,St,texp,r), impl_vol2(as.numeric(AAPL[i:i,"lastPrice"]),St,r,texp), impl_vol3(K,St,r,texp,rho,AAPL[i:i,"type"],as.numeric(AAPL[i:i,"lastPrice"]))) },
    error = function(e)
    {impl <- 0}
  )
  
  li <- c(AAPL[i:i,"contractName"], AAPL[i:i,"lastTradeDateTime"], AAPL[i:i,"expirationDate"],moneyness(K,St), K, AAPL[i:i,"lastPrice"], St, BSprice(K,St,r,texp,sigma,rho,AAPL[i:i,"type"]), mnyT, impl)
  OptDF <- rbind(OptDF, li)
  
}
OptDF <- OptDF[-1,];OptDF <- OptDF[substr(OptDF$LastTrade,1,10) != "0000-00-00", ]; OptDF <- OptDF[!duplicated(OptDF[, 1:2]),1:10]
rm("from_d","i","impl","K", "li", "mnyT", "r", "rho", "sigma", "St", "texp", "to_d")
}

write.xlsx(OptDF, 'C:\\Users\\DstMove\\Documents\\test1.xlsx')
write.xlsx(AAPLJonasCalls, 'C:\Users\DstMove\Documents\test2.xlsx')



#3. volatility surface

#black scholes assumes volatility is constant
#volatility isn't actually constant
#stochastic volatility simply means volatility is stochastic/random

meandrift <- repeated mean of mean of daily returns
k vol_mean_reversion_C <- rate of return to longterm volatility
theta long run average volatility/variance
epsilon vol_vol <- var(vol)
dwalk_v/s <- wiener process
ds[t] = meandrift * s[t] * dt + sqrt(v[t]) * s[t] * dWalk_s[t]
dv[t] = k*(theta-v[t])*dt+epsilon *sqrt(v[t]) dwalk_v[t]





for (j in 1:N) {
  Ks[i] <- exp(r * taus[j]+LogStrikes[i]) * S0
  price <- HestonPrice(Ks[i],taus[j])
  iv <- ImpliedVolCall(S0, Ks[i], taus[j], r, price)
  TTM[n] <- taus[j] * ONEYEAR # in days
  Money[n] <- Moneyness(S0,Ks[i],taus[j],r)
  
  Vol[n] <- iv
  n <- n+1
}


funke <- function(asset, volatility, model, type)
{
  asset <- tolower(asset);  volatility <- tolower(volatility);  model <- tolower(model);  type <- tolower(type)
  

  
  if (asset == "option")
  {
    print("Asset chosen: Options")

    # S = current stock price
    # K = Exercise (Strike) price
    # T = time to expieration
    # r = continuously compounded (annualized) risk-free rate
    # sigma = annualized volatility of log returns\
    # rho = continuously compounded dividend yield
    S <- readline(prompt="Enter Stockprice: ");K <- readline(prompt="Enter strike price: ");r <- readline(prompt="Enter interest rate: ");T <- readline(prompt="Enter time to expiration: "); sig <- readline(prompt="Enter sigma: "); rho <- readline(prompt="Enter rho: ")
    S <- as.numeric(S); K <- as.numeric(K); r <- as.numeric(r); T <- as.numeric(T); sig <- as.numeric(sig); rho <- as.numeric(rho)
    
    Moneyness <- K*exp(-r*T)/S
    print(paste("Moneyness is calculated to be: ", Moneyness))
    
    if (volatility == "constant")
    {
      print("volatility is constant")
      
      if (model == "black-scholes")
      {
        
        BlackScholes <- function(S0, K0, r0, T0, sig0, rho0, type) {
          d_1 <- (log(S0/K0) + (r0- rho0 + (sig0^2/2))*T0) / (sig0*sqrt(T0))
          d_2 <- d_1 - (sig0*sqrt(T0))
          if(type=="p"||type=="put")
          {
            price <- (K0*exp(-r0*T0)*pnorm(-d_2,0,1)) - (S0*exp(-rho0*T0)*pnorm(-d_1,0,1))
          }
          if(type=="c" || type=="call") {
            price <- (S0*exp(-rho0*T0)*pnorm(d_1,0,1)) - (K0*exp(-r0*T0)*pnorm(d_2))
          }
          return(price)
        }
      
        impl_volatility <- function(S, K, r, T, rho, price) 
        {
          root <- function(sigma) 
          {
            BlackScholes(S,K,r,T,sigma,rho,"c") - price
          }
          #for (i in 0:100)
          #print(root(i/10))
          uniroot(root,c(0,1),extendInt = "yes")$root
        }
        price <- readline(prompt="Enter realized price: ");price <- as.numeric(price)
        
        print(paste("This is the price of the option: ",BlackScholes(S, K, r, T, sig, rho, type)))
        print(paste("this is the implied volatility: ",impl_volatility(S, K, T, r, rho, price)))
        
      }
      else
      {
        print("unknown model chosen")
      }
    }
    
    else if (volatility == "stochastic")
    {
      print("Volatility is a stochastic variable")
      
      if (model == "Heston model") 
      { 
        print("heston model")
      } 
      
      else if (model == "CEV model") 
      {
        print("CEV model")
      } 
      
      else if  (model == "SABR model") 
      {
        print("SABR model")
      } 
      
      else if  (model == "GARCH model") 
      {
        print("GARCH model")
      } 
      
      else if  (model == "3/2 model") 
      {
        print("3/2 model")
      }
      
      else 
      {
        print("unknown model chosen")
      }
      
    }
    
  
  }
  
  
  else if (asset == "stock") {}
  else if (asset == "future") {}
  else if (asset == "swap") {}
  else if (asset == "derivative") {}
  else if (asset == "bond") {}
  
}

funke("option", "Constant", "black-scholes", "p")



#put-call parity
#american and european options
#calibration of model

n <- 2290
(1-(364/365)^n)^365*100


n <- 22
mean(replicate(10000, length( unique( sample(1:365,n,TRUE) ) )<n) )


prob = function(n) {
  mean(replicate(10000, length( unique( sample(1:365,n,TRUE) ) )==365) )
}
prob(3000)




#d as dividend yield, annualized, continuously
bscallimpvol <- function(s, k, r, t, d, value, lowvol=0.0001,
                         highvol=1e06, .tol=.Machine$double.eps^0.5) 
{
  ## this function is not vectorized
  if (value <= s*exp(-d*t)-k*exp(-r*t)) {
    print("Option price violates minimum bound")
  } else if (value > s*exp(-d*t)) {
    print("Option price violates maximum bound")
  } else {
    f <- function(v, s, k, r, t, d, value) {
      return(bscall(s, k, v, r, t, d) - value)
    }
    x <- uniroot(f, c(lowvol,highvol), s, k, r, t, d, value, tol=.tol)
    return(x$root)
  }
}

call_fun <- function(s0, K, r, TT, sig) {
  d1 <- (log(s0/K) + (r + sig^2/2)*TT) / (sig*sqrt(TT))
  d2 <- d1 - sig*sqrt(TT)
  s0*pnorm(d1) - K*exp(-r*TT)*pnorm(d2)
  
}





sig_impl(100,70,0.05,1,36)



HestonCallClosedForm <-
  function(lambda, vbar, eta, rho, v0, r, tau, S0, K) {
    PIntegrand <- function(u, lambda, vbar, eta, rho, v0, r, tau, S0, K, j) {
      F <- S0*exp(r*tau)
      x <- log(F/K)
      a <- lambda * vbar
      
      if (j == 1) {
        b <- lambda - rho* eta
        alpha <- - u^2/2 - u/2 * 1i + 1i * u
        beta <- lambda - rho * eta - rho * eta * 1i * u
      } else {
        b <- lambda
        alpha <- - u^2/2 - u/2 * 1i
        beta <- lambda - rho * eta * 1i * u
      }
      
      gamma <- eta^2/2
      d <- sqrt(beta^2 - 4*alpha*gamma)
      rplus <- (beta + d)/(2*gamma)
      rminus <- (beta - d)/(2*gamma)
      g <- rminus / rplus
      
      D <- rminus * (1 - exp(-d*tau))/(1-g*exp(-d*tau))
      C <- lambda * (rminus * tau - 2/(eta^2) * log( (1-g*exp(-d*tau))/(1-g) ) )
      
      top <- exp(C*vbar + D*v0 + 1i*u*x)
      bottom <- (1i * u)
      Re(top/bottom)
    }
    
    P <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K, j) {
      value <- integrate(PIntegrand, lower = 0, upper = Inf,
                         lambda, vbar, eta, rho, v0, r, tau,
                         S0, K, j, subdivisions=1000)$value
      0.5 + 1/pi * value
    }
    
    A <- S0*P(lambda, vbar, eta, rho, v0, r, tau, S0, K, 1)
    B <- K*exp(-r*tau)*P(lambda, vbar, eta, rho, v0, r, tau, S0, K, 0)
    A-B
  }

HestonCallMonteCarlo <-
  function(lambda, vbar, eta, rho, v0, r, tau, S0, K, nSteps=2000, nPaths=3000, vneg=2) {
    
    n <- nSteps
    N <- nPaths
    
    dt <- tau / n
    
    negCount <- 0
    
    S <- rep(S0,N)
    v <- rep(v0,N)
    
    for (i in 1:n)
    {
      W1 <- rnorm(N);
      W2 <- rnorm(N);
      W2 <- rho*W1 + sqrt(1 - rho^2)*W2;
      
      sqvdt <- sqrt(v*dt)
      S <- S*exp((r-v/2)*dt + sqrt(v * dt) * W1)
      
      if ((vneg == 3) & (2*lambda*vbar/(eta^2) <= 1)) {
        cat("Variance not guaranteed to be positive with choice of lambda, vbar, and eta\n")
        cat("Defaulting to Reflection + Milstein method\n")
        vneg = 2
      }
      
      if (vneg == 0){
        ## Absorbing condition
        v <- v + lambda*(vbar - v)* dt + eta * sqvdt * W2
        negCount <- negCount + length(v[v < 0])
        v[v < 0] <- 0
      }
      if (vneg == 1){
        ## Reflecting condition
        sqvdt <- sqrt(v*dt)
        v <- v + lambda*(vbar - v)* dt + eta * sqvdt * W2
        negCount <- negCount + length(v[v < 0])
        v <- ifelse(v<0, -v, v)
      }
      if (vneg == 2) {
        ## Reflecting condition + Milstein
        v <- (sqrt(v) + eta/2*sqrt(dt)*W2)^2 - lambda*(v-vbar)*dt - eta^2/4*dt
        negCount <- negCount + length(v[v < 0])
        v <- ifelse(v<0, -v, v)     
      }
      if (vneg == 3) {
        ## Alfonsi - See Gatheral p.23
        v <- v -lambda*(v-vbar)*dt +eta*sqrt(v*dt)*W2 - eta^2/2*dt      
      }
    }
    
    negCount <- negCount / (n*N);
    
    ## Evaluate mean call value for each path
    V <- exp(-r*tau)*(S>K)*(S - K); # Boundary condition for European call
    AV <- mean(V);
    AVdev <- 2 * sd(V) / sqrt(N);
    
    list(value=AV, lower = AV-AVdev, upper = AV+AVdev, zerohits = negCount)
  }

HestonSurface <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K, N=5, min.tau = 1/ONEYEAR) {
  LogStrikes <- seq(-0.5, 0.5, length=N)
  Ks <- rep(0.0,N)
  taus <- seq(min.tau, tau, length=N)
  vols <- matrix(0,N,N)
  
  TTM <- Money <- Vol <- rep(0,N*N)
  
  HestonPrice <- function(K, tau) {
    HestonCallClosedForm(lambda, vbar, eta, rho, v0, r, tau, S0, K)
  }
  
  n <- 1
  for (i in 1:N) {
    for (j in 1:N) {
      Ks[i] <- exp(r * taus[j]+LogStrikes[i]) * S0
      price <- HestonPrice(Ks[i],taus[j])
      iv <- ImpliedVolCall(S0, Ks[i], taus[j], r, price)
      TTM[n] <- taus[j] * ONEYEAR # in days
      Money[n] <- Moneyness(S0,Ks[i],taus[j],r)
      Vol[n] <- iv
      n <- n+1
    }
  }
  
  data.frame(TTM=TTM, Moneyness=Money, ImpliedVol=Vol)
}

PlotHestonSurface <-
  function(lambda=6.21, vbar=0.019, eta=0.61, rho=-0.7, v0=0.010201, r=0.0319,
           tau=1.0, S0=100, K=100, N=30, min.tau = 1/ONEYEAR, ...) {
    
    Ks <- seq(0.8*K, 1.25 * K, length=N)  
    taus <- seq(0.21, tau, length=N)
    
    HestonPrice <- Vectorize(function(k, t) {
      HestonCallClosedForm(lambda, vbar, eta, rho, v0, r, t, S0, k)})
    
    IVHeston <- Vectorize(function(k,t) { ImpliedVolCall(S0, k, t, r, HestonPrice(k,t))})
    
    z <- outer(Ks, taus, IVHeston)
    
    nrz <- nrow(z)
    ncz <- ncol(z)
    nb.col <- 256
    color <- heat.colors(nb.col)
    facet <- - (z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz])
    facetcol <- cut(facet, nb.col)
    
    persp(x=Ks, y=taus, z, theta = 40, phi = 20, expand = 0.5, col=color[facetcol],
          xlab="Strikes", ylab="Time to maturity", zlab="Implied Volatility",
          ticktype="detailed", ...) -> res
    
    return(invisible(z))
  }






## lambda: mean-reversion speed
## vbar: long-term average volatility
## eta: volatility of vol process
## rho: correlation between stock and vol
## v0: initial volatility
## r: risk-free interest rate
## tau: time to maturity
## S0: initial share price
## K: strike price


{
# Parameters
S     <- 100
K     <- 70
r     <- 0
T     <- 1       # seq(10/52,1/52,-1/52)
sigma <- c(.16,.21,.3, .4,.5,.6,.75,1,1.06) 
C <- 1.50
d1  <-  (log(S/K) + (r + sigma^2/2)*T) / (sigma*sqrt(T))
d2  <-  d1 - sigma*sqrt(T)
p   <-  cbind(S, K, T, sigma,  p = -S * pnorm(-d1) + K*exp(-r*T)*pnorm(-d2))  
c   <-  cbind(S, K, T, sigma,  c =  S * pnorm(d1)  - K*exp(-r*T)*pnorm(d2)) 



Call <- function(S, K, r, T, sigma) {
  d1  <-  (log(S/K) + (r + sigma^2/2)*T) / (sigma*sqrt(T))
  d2  <-  d1 - sigma*sqrt(T)
  S * pnorm(d1)  - K*exp(-r*T)*pnorm(d2)
}

Put <- function(S, K, r, T, sigma) {
  d1  <-  (log(S/K) + (r + sigma^2/2)*T) / (sigma*sqrt(T))
  d2  <-  d1 - sigma*sqrt(T)
  -S * pnorm(-d1) + K*exp(-r*T)*pnorm(-d2)
}

K*pnorm(d2)

cprct <- c[,c(1,5)] / matrix(rep(c[1,c(1,5)],each=length(c[,5]) ),ncol = 2) * 100
ts.plot(cprct, col = c(1,4), main = "Evolution of Stocks and Calls in %")
legend('topleft', c(paste("Stock +", tail(cprct,1)[1]-100, "%") , 
                    paste("Long Call +", round(tail(cprct,1)[2])-100, "%")), 
       col=c(1,4), lty=1)
pprct <- p[,c(1,5)] / matrix(rep(p[1,c(1,5)],each=length(c[,5]) ),ncol = 2) * 100
ts.plot(pprct, col=1:2, main = "Evolution of Stocks and Puts in %")

VperSigma <- Call(S,K,r,T,seq(0.01,0.50,0.005))
IV <- which.min(abs(VperSigma-C))/2

mu <- 0
sd <- 0.2

x <- rlnorm(10000, mu,sd)
plot(density(x), xlim=c(0,4)) ; abline(v=c(1, 1.5), lty=2)
dlnorm(1.2, mu,sd,log = T)   # pdf
plnorm(1.54, mu,sd)          # CDF
qlnorm(0.95, mu,sd)          # Quantile Function

par(mfrow = c(1, 2))
curve(dnorm, from = -3, to = 3, n = 1000, main = "Normal Probability Density Function")
text(-2, 0.3, expression(f(x) == paste(frac(1, sqrt(2 * pi * sigma^2)),
                                       " ", e^{
                                         frac(-(x - mu)^2, 2 * sigma^2)
                                       })), cex = 1.2)
x <- dnorm(seq(-3, 3, 0.001))
plot(seq(-3, 3, 0.001), cumsum(x)/sum(x), type = "l", col = "blue",
     xlab = "x", main = "Normal Cumulative Distribution Function")
text(-1.5, 0.7, expression(phi(x) == paste(frac(1, sqrt(2 * pi)),
                                           " ", integral(e^(-t^2/2) * dt, -infinity, x))), cex = 1.2)
}




#WG speed-up of LSM?
#####################
## The First Example in the Paper
#####################

#Example Paths 
EXAMPLE = matrix( c(1,1.09,1.08,1.34,1,1.16,1.26,1.54,1,1.22,1.07,1.03,1,0.93,0.97,0.92,1,1.11,1.56,1.52,1,0.76,0.77,0.90,1,0.92,0.84,1.01,1,0.88,1.22,1.34), nrow=8, ncol=4, byrow=TRUE)

#EXAMPLE PARAMETERS
paths = 8
steps = 4
strike=1.1
startprice = 1
r<-0.06
dt = 1
disc=exp(dt*r*(-(1:(steps-1))))

P = matrix( 0, nrow = paths, ncol = steps)

#EXAMPLE PATHS
S = EXAMPLE

# First Cashflow at T is done outside the loop
for (j in 1:paths) P[j,steps] = max(strike-S[j,steps],0)

#Now do LSM within a loop

for (h in (steps-1):2){
  Y<-rep(0,paths) # slow!
  pick <- strike - S[,h] > 0
  for (j in 1:paths) Y[j] = sum(disc[1:(steps-h)]*P[j,(h+1):steps])
  Y<-Y[pick]
  dummy<-S[pick,h]
  X<-cbind (rep(1,length(pick[pick>0])),dummy,dummy^2) # slow!
  b = solve(t(X)%*%X)%*%t(X)%*%Y
  # if (h==3) {print(Y*exp(r)); print(dummy); print(b)}
  
  for (j in 1:paths){ 
    if (pick[j] > 0 & c(1,S[j,h],S[j,h]^2)%*%b < max(strike-S[j,h],0)){ 
      P[j,h]<-max(strike-S[j,h],0)
      P[j,(h+1):steps]<-0
    }  
  }
  
}

Z<-rep(0,paths)

for (j in 1:paths) Z[j]<-sum(disc*P[j,2:steps])

#print(mean(Z))

#time_RP<-system.time(for (dummy in 1:100) {source('Least Squares Monte Carlo.R')})[3]


#####################
## The First Example in the Paper
#####################

#Example Paths 
EXAMPLE = matrix( c(1, 1.09, 1.08, 1.34,
                    1, 1.16, 1.26, 1.54,
                    1, 1.22, 1.07, 1.03,
                    1, 0.93, 0.97, 0.92,
                    1, 1.11, 1.56, 1.52,
                    1, 0.76, 0.77, 0.90,
                    1, 0.92, 0.84, 1.01,
                    1, 0.88, 1.22, 1.34), 
                  nrow=8, ncol=4, byrow=TRUE)

#EXAMPLE PARAMETERS
strike     <-  1.1
startprice <-  1.0
r          <-  0.06

periods  <- 4
nperiods <- seq(0,periods-1,1)

paths    <- 8
npaths   <- seq(1,paths, 1)

# Renove t0 because it is trivial
disc     <- exp( - r * nperiods[-1])

# Generate matrix for actual option pricing
P           <- matrix( 0, nrow = paths, ncol = periods)
colnames(P) <- paste0("Period ", nperiods, sep = "")
rownames(P) <- paste0("Path ",   npaths,   sep = "")

# Matrix of simulated paths (here manufactured from article example)
S           <- EXAMPLE
colnames(S) <- paste0("Period ", nperiods, sep = "")
rownames(S) <- paste0("Path ",   npaths,   sep = "")

# First Cashflow at T is done outside the loop
P[, periods] <- pmax(strike - S[,periods], 0)

#Now do LSM within a loop, backwards iteration
for (h in (periods-1):2){
  # Only in the money (itm) paths carry a potential trade-off
  itm <- strike - S[, h] > 0
  
  # Essentially just P[x, y]. Applying matrix(P) avoids a dimension-error when using apply()
  p <- matrix(P[,(h+1): periods], ncol = length(P[1,(h+1):periods]))
  d <- disc[1: (periods - h)]
  
  # Regressand Y is the npv of future paths
  Y <- apply(p, 1, function(x) sum(x * d) )
  
  # Considering only itm paths increases computational efficiency
  Y <- Y[itm]
  
  # Regression on two basis functions and a constant. Could increase to e.g. fifth power
  s_itm  <- S[itm, h]
  s_itm2 <- s_itm**2
  one    <- rep(1, length(s_itm))
  X <- cbind(one, s_itm, s_itm2)
  
  # solve() for inverse; %*% for matrix multiplication
  # We get b equivalently from running lm(Y ~ X)
  b <- solve(t(X) %*% X) %*% (t(X) %*% Y)
  
  exercise_value <- pmax(strike - s_itm, 0)
  exp_cont_value <- X %*% b
  exercise       <- exp_cont_value < exercise_value
  idx            <- names(exercise[exercise == T,])
  
  P[idx, h] <- exercise_value[idx]
  P[idx, (h+1):periods] <- 0
}

Z <- apply(P[,2:periods], 1, function(x) sum(x * disc) )

#print(mean(Z))

#time_WG<-system.time(for (dummy in 1:100) {source('WG speed-up of LSM.R')})[3]





##### american option price?
capT<-1
strike<-100
S0<-100
sigma<-0.2
r<-0.03
n<-252
dt<-capT/n
disc<-exp(-dt*r)
dummy<-1+0:n

u<-exp(sigma*sqrt(dt))
d<-1/u
q<-(exp(r*dt)-d)/(u-d)

Nsim<-10000

DiscPayoff<-rep(0,Nsim)

S<-rep(S0,(n+1))

for (j in 1:Nsim){
  
  for(i in 2:(n+1)){
    GoingUp<-(runif(1) > q)
    if (GoingUp) S[i]<-S[i-1]*u    
    if (!GoingUp) S[i]<-S[i-1]*d
  }
  
  SnellZ<-gS<-pmax(strike-S,0)
  
  for (i in n:1) SnellZ[i]<-max(gS[i],disc*SnellZ[i+1])
  tau.index<-dummy[SnellZ==gS][1]
  DiscPayoff[j]<-disc^((tau.index-1))*gS[tau.index]
  
}

print(c(mean(DiscPayoff), sd(DiscPayoff)/sqrt(Nsim)))



#heston alpha lipton
BS.Fourier <- function(spot,timetoexp,strike,r,divyield,sigma,greek=1){
  
  X<-log(spot/strike)+(r-divyield)*timetoexp
  
  integrand<-function(k){
    integrand<-Re(exp( (-1i*k+0.5)*X- 0.5*(k^2+0.25)*sigma^2*timetoexp)/(k^2+0.25))
  } 
  dummy<-integrate(integrand,lower=-Inf,upper=Inf)$value
  
  BS.Fourier<-exp(-divyield*timetoexp)*spot-strike*exp(-r*timetoexp)*dummy/(2*pi)
}

Heston.Fourier <- function(spot,timetoexp,strike,r,divyield,V,theta,kappa,epsilon,rho,greek=1){
  
  X<-log(spot/strike)+(r-divyield)*timetoexp
  kappahat<-kappa-0.5*rho*epsilon
  xiDummy<-kappahat^2+0.25*epsilon^2
  
  integrand<-function(k){
    xi<-sqrt(k^2*epsilon^2*(1-rho^2)+2i*k*epsilon*rho*kappahat+xiDummy)
    Psi.P<--(1i*k*rho*epsilon+kappahat)+xi
    Psi.M<-(1i*k*rho*epsilon+kappahat)+xi
    alpha<--kappa*theta*(Psi.P*timetoexp + 2*log((Psi.M + Psi.P*exp(-xi*timetoexp))/(2*xi)))/epsilon^2
    beta<--(1-exp(-xi*timetoexp))/(Psi.M + Psi.P*exp(-xi*timetoexp))
    numerator<-exp((-1i*k+0.5)*X+alpha+(k^2+0.25)*beta*V)
    
    if(greek==1) dummy<-Re(numerator/(k^2+0.25))
    if(greek==2) dummy<-Re((0.5-1i*k)*numerator/(spot*(k^2+0.25)))
    if(greek==3) dummy<--Re(numerator/spot^2)
    if(greek==4) dummy<-Re(numerator*beta)
    
    integrand<-dummy
  } 
  
  
  dummy<-integrate(integrand,lower=-100,upper=100,stop.on.error = FALSE)$value
  
  if (greek==1) dummy<-exp(-divyield*timetoexp)*spot-strike*exp(-r*timetoexp)*dummy/(2*pi)
  
  if(greek==2) dummy<-exp(-divyield*timetoexp)-strike*exp(-r*timetoexp)*dummy/(2*pi)
  
  if(greek==3) dummy<--strike*exp(-r*timetoexp)*dummy/(2*pi)
  
  if(greek==4) dummy<--strike*exp(-r*timetoexp)*dummy/(2*pi)
  
  Heston.Fourier<-dummy
}

Andreasen.Fourier <- function(spot,timetoexp,strike,Z,lambda,beta,epsilon){
  
  X<-log(spot/strike)
  
  integrand<-function(k){
    neweps<-lambda*epsilon
    xi<-sqrt(k^2*neweps^2+beta^2+0.25*neweps^2)
    Psi.P<--beta+xi
    Psi.M<-beta+xi
    A<--beta*(Psi.P*timetoexp + 2*log((Psi.M + Psi.P*exp(-xi*timetoexp))/(2*xi)))/(epsilon^2)
    B<-(1-exp(-xi*timetoexp))/(Psi.M + Psi.P*exp(-xi*timetoexp))
    integrand<-Re(exp( (-1i*k+0.5)*X+A-(k^2+0.25)*B*lambda^2*Z)/(k^2+0.25))
  } 
  
  dummy<-integrate(integrand,lower=-Inf,upper=Inf)$value
  
  Andreasen.Fourier<-spot-strike*dummy/(2*pi)
  
}







#install.packages("quantmod") -The package needs to be installed first
#library(quantmod)            -This may sound obvious but quantmod requires internet to operate
library(rugarch)

getSymbols(Symbols = "AAPL", 
           src = "yahoo",     #Other sources include: google, FRED, etc.
           from="2008-12-31",
           to="2022-12-31",
           verbose=F)

chartSeries(AAPL, theme="white")


#The following commands will compute GARCH(m,s). Keep in mind that it may not converge for certain combinations of m and s.

Apple_garch <-  ugarchspec(variance.model = list(model="sGARCH",         #Other options are egarch, fgarch, etc.
                                                 garchOrder=c(1,2)), # You can modify the order GARCH(m,s) here
                           mean.model = list(armaOrder=c(3,2)), #Specify your ARMA model implying your model should be stationary.
                           distribution.model = "norm")         #Other distribution are "std" for t-distribution, and "ged" for General Error Distribution
Apple_Garch2 <- ugarchfit(spec=Apple_garch, 
                          data=AAPL_rtn)

garch <- Apple_Garch3@sigma.t   #this is your volatility series

garch_plot <- ggplot()+
  geom_line(aes(x=as.numeric(row.names(AAPL_rtn2)),
                y=Apple,
                color="log returns"),
            data=AAPL_rtn2)+
  geom_line(aes(x=as.numeric(row.names(AAPL_rtn2)),
                y=garch,
                color="Volatility"))+
  geom_line(aes(x=as.numeric(row.names(AAPL_rtn2)),
                y=-garch,
                color="Volatility"))+
  theme_bw()+
  theme1+
  ylab("AAPL log returns")+
  ggtitle("GARCH(1,2)")

garch_plot 




callbs <- function(S, K, R, T, sig, q=0) {
  d1 <- (log(S/K) + (R +q+ sig^2/2)*T) / (sig*sqrt(T))
  d2 <- d1 - sig*sqrt(T)
  c <- S*exp(-q*T)*pnorm(d1) - K*exp(-R*T)*pnorm(d2)
  if(c>=0){return(c)}
  else{return(0)}
}
put_bs <- function(S, K, R, T, sig, q=0) {
  d1 <- (log(S/K) + (R + q+ sig^2/2)*T) / (sig*sqrt(T))
  d2 <- d1 - sig*sqrt(T)
  p <- K*exp(-R*T)*pnorm(-d2)-S*exp(-q*T)*pnorm(-d1)
  if(p>=0){return(p)}
  else{return(0)}
}

suppressPackageStartupMessages(library(quantmod))
suppressMessages(suppressWarnings(getSymbols("AAPL",from= Sys.Date()-3, auto.assign = TRUE)))
S= as.numeric(AAPL$AAPL.Close)[1]

suppressPackageStartupMessages(library(quantmod))
AAPL.OPTS <- getOptionChain("AAPL",NULL)
AAPL.OPTS <- AAPL.OPTS[[length(AAPL.OPTS)]]


#call
call <- AAPL.OPTS$calls
C= call$Last
K= call$Strike
R= 0.0013
# US treasury bill 2 year rate= 0.13%


year= paste0("20",substring(unlist(labels(call))[1],5,6))
month= substring(unlist(labels(call))[1],7,8)
day= substring(unlist(labels(call))[1],9,10)
date= paste0(year,"-",month,"-",day)
T= as.numeric(difftime(date,Sys.Date(), units = "days")/365)

sig_impl <- function(S, K, R, T, C){
  High= 1
  Low=0
  while((High-Low)>0.000001){
    if(callbs(S,K,R,T,(High+Low)/2) > C){
      High= (High+Low)/2
    }else{
      Low= (High+Low)/2
    }
  }
  return((High + Low)/2)}

Impl_Vol=c()
for(i in 1:nrow(call)){
  Impl_Vol[i]= sig_impl(S, K=call$Strike[i],R,T,C=call$Last[i])
}
#print(Impl_Vol)
#plot(x= call$Strike, y=Impl_Vol)

df_c <- as.data.frame(cbind(call$Strike, Impl_Vol))
names(df_c)[1] <- "Strike"
suppressPackageStartupMessages(library(ggplot2))
g1 <- ggplot(data= df_c)+ geom_point(aes(x= Strike, y= Impl_Vol))+ xlab("Strike Price")+ ylab("Implied Volatility")+ ggtitle("Volatility Skew for Call options")



suppressPackageStartupMessages(library(quantmod))
AAPL.OPTS <- getOptionChain("AAPL",NULL)
AAPL.OPTS <- AAPL.OPTS[[length(AAPL.OPTS)]]

#puts
put <- AAPL.OPTS$puts
P= put$Last
K= put$Strike
R= 0.0013
# US treasury bill 2 year rate= 0.13%


year= paste0("20",substring(unlist(labels(put))[1],5,6))
month= substring(unlist(labels(put))[1],7,8)
day= substring(unlist(labels(put))[1],9,10)
date= paste0(year,"-",month,"-",day)
T= as.numeric(difftime(date,Sys.Date(), units = "days")/365)

sig_impl <- function(S, K, R, T, P){
  High= 1
  Low=0
  while((High-Low)>0.000001){
    if(put_bs(S,K,R,T,(High+Low)/2) > P){
      High= (High+Low)/2
    }else{
      Low= (High+Low)/2
    }
  }
  return((High + Low)/2)}

Impl_Vol=c()
for(i in 1:nrow(put)){
  Impl_Vol[i]= sig_impl(S, K=put$Strike[i],R,T,P=put$Last[i])
}
#print(Impl_Vol)
#plot(x= call$Strike, y=Impl_Vol)

df_p <- as.data.frame(cbind(put$Strike, Impl_Vol))
names(df_p)[1] <- "Strike"
suppressPackageStartupMessages(library(ggplot2))

g2 <- ggplot(data= df_p)+ geom_point(aes(x= Strike, y= Impl_Vol))+ xlab("Strike Price")+ ylab("Implied Volatility")+ ggtitle("Volatility Skew for Put options")


library(gridExtra)
grid.arrange(g1,g2,ncol=2)

AAPL2 <- getSymbols("AAPL",auto.assign = FALSE, from= Sys.Date()-180)
ret <- diff(log(AAPL2$AAPL.Close))
ret[1] <- 0
vol <- sd(ret)
callbs(311.41, 120, 0.0013, 2.095776, vol, 0.0106)


target <- 192.40
v0 = 0.2
vT = 0.2
rho= 0.5
k= 0.2
sig= 0.05

library(NMOF)
x <- c(v0,vT,rho,k,sig)
optim_func <- function(x){
  v0= x[1]
  vT= x[2]
  rho= x[3]
  k= x[4]
  sig= x[5]
  mse <- (callHestoncf(315.01,120,2.095776, 0.0013,0.0106, v0, vT, rho,k,sig)-target)^2
  return(mse)
}

optim(x, optim_func)

mat <- matrix(nrow=5, ncol=3)
mat[1,] <- c("v0","current variance",0.20940146)
mat[2,] <- c("vT", "long-run variance", 0.21366057)
mat[3,] <- c("rho","correlation between spot and variance", 0.50481539)
mat[4,] <- c("k","speed of mean-reversion", 0.21543664)
mat[5,] <- c("sigma", "volatility of variance", 0.04229108)
df <- as.data.frame(mat)
colnames(df) <- c("Parameters","Meaning","Value")
print(df)

callHestoncf(311.41 ,120,2.095776, 0.0013,0.0106,0.20940146, 0.21366057, 0.50481539, 0.21543664, 0.04229108)

mat <- matrix(nrow=2, ncol=4)
mat[1,] <- c("In-the-Money",184.8947,189.0168, 192.4)
mat[2,] <- c("Out-of-Money",0,11.24569,10.5)
df <- as.data.frame(mat)
colnames(df) <- c(" ","Black-Scholes","Heston","Market Quote")
print(df)




R> set.seed(123)
R> library("stochvol")
R> data("exrates")
R> ret <- logret(exrates$USD, demean = TRUE)
R> par(mfrow = c(2, 1), mar = c(1.9, 1.9, 1.9, 0.5), mgp = c(2, 0.6, 0))
R> plot(exrates$date, exrates$USD, type = "l",
        + main = "Price of 1 EUR in USD")
R> plot(exrates$date[-1], ret, type = "l", main = "Demeaned log returns")

R> sim <- svsim(500, mu = -9, phi = 0.99, sigma = 0.1)
R> par(mfrow = c(2, 1))
R> plot(sim)

R> ret <- ret[1:200]
R> res <- svsample(ret, priormu = c(-10, 1), priorphi = c(20, 1.1),
                   + priorsigma = 0.1, thin = 10)
summary(res, showlatent = FALSE)
volplot(res, forecast = 100, dates = exrates$date[seq_along(ret)])
R> res <- updatesummary(res, quantiles = c(0.01, 0.1, 0.5, 0.9, 0.99))
R> volplot(res, forecast = 100, dates = exrates$date[seq_along(ret)])
R> par(mfrow = c(3, 1))
R> paratraceplot(res)
R> par(mfrow = c(1, 3))
R> paradensplot(res, showobs = FALSE)
plot(res, showobs = FALSE)
R> myresid <- resid(res)
R> plot(myresid, ret)

R> set.seed(123456)
R> n <- 200
R> beta.true <- c(0.1, 0.5)
R> sigma.true <- 0.01
R> X <- matrix(c(rep(1, n), rnorm(n, sd = sigma.true)), nrow = n)
R> y <- rnorm(n, X %*% beta.true, sigma.true)

R> burnin <- 100
R> draws <- 1000
R> b0 <- matrix(c(0, 0), nrow = ncol(X))
R> B0inv <- diag(c(10^-10, 10^-10))
R> c0 <- 0.001
R> C0 <- 0.001

R> p <- ncol(X)
R> preCov <- solve(crossprod(X) + B0inv)
R> preMean <- preCov %*% (crossprod(X, y) + B0inv %*% b0)
R> preDf <- c0 + n/2 + p/2

R> draws1 <- matrix(NA_real_, nrow = draws, ncol = p + 1)
R> colnames(draws1) <- c(paste("beta", 0:(p-1), sep = "_"), "sigma")
R> sigma2draw <- 1

R> for (i in -(burnin-1):draws) {
  + betadraw <- as.numeric(mvtnorm::rmvnorm(1, preMean,
                                            + sigma2draw * preCov))
  + tmp <- C0 + 0.5 * (crossprod(y - X %*% betadraw) +
                         + crossprod((betadraw - b0), B0inv) %*% (betadraw - b0))
  + sigma2draw <- 1 / rgamma(1, preDf, rate = tmp)
  + if (i > 0) draws1[i, ] <- c(betadraw, sqrt(sigma2draw))
  + }

colMeans(draws1)

plot(coda::mcmc(draws1))


R> mu.true <- log(sigma.true^2)
R> phi.true <- 0.97
R> vv.true <- 0.3
R> simresid <- svsim(n, mu = mu.true, phi = phi.true, sigma = vv.true)
R> y <- X %*% beta.true + simresid$y

R> draws <- 5000
R> burnin <- 500
R> thinning <- 10
R> priors <- specify_priors(
  + mu = sv_normal(-10, 2),
  + phi = sv_beta(20, 1.5),
  + sigma2 = sv_gamma(0.5, 0.5)
  + )

R> draws2 <- matrix(NA_real_, nrow = floor(draws / thinning),
                    + ncol = 3 + n + p)
R> colnames(draws2) <- c("mu", "phi", "sigma",
                         + paste("beta", 0:(p-1), sep = "_"), paste("h", 1:n, sep = "_"))
R> betadraw <- c(0, 0)
R> paradraw <- list(mu = -10, phi = 0.9, sigma = 0.2)
R> latentdraw <- rep(-10, n)
R> paranames <- names(paradraw)


for (i in -(burnin-1):draws) {
  + ytilde <- y - X %*% betadraw
  + svdraw <- svsample_fast_cpp(ytilde, startpara = paradraw,
                                + startlatent = latentdraw, priorspec = priors)
  + paradraw <- svdraw$para
  + latentdraw <- drop(svdraw$latent)
  + normalizer <- as.numeric(exp(-latentdraw / 2))
  + Xnew <- X * normalizer
  + ynew <- y * normalizer
  + Sigma <- solve(crossprod(Xnew) + B0inv)
  + mu <- Sigma %*% (crossprod(Xnew, ynew) + B0inv %*% b0)
  + betadraw <- as.numeric(mvtnorm::rmvnorm(1, mu, Sigma))
  + if (i > 0 && i %% thinning == 0) {
    + draws2[i/thinning, 1:3] <- drop(paradraw)[paranames]
    + draws2[i/thinning, 4:5] <- betadraw
    + draws2[i/thinning, 6:(n+5)] <- latentdraw
    + }
  + }

plot(coda::mcmc(draws2[, 4:8]))
colMeans(draws2[, 4:8])



x <- log(exrates$USD[-length(exrates$USD)])
R> y <- log(exrates$USD[-1])
R> X <- matrix(c(rep(1, length(x)), x), nrow = length(x))
R> par(mfrow=c(1,1), mar = c(2.9, 2.9, 2.7, .5), mgp = c(1.8,.6,0), tcl = -.4)
R> plot(x,y, xlab=expression(log(p[t])), ylab=expression(log(p[t+1])),
        + main="Scatterplot of lagged daily log prices of 1 EUR in USD",
        + col="#00000022", pch=16, cex=1)
R> abline(0,1)

source("envrsk_api_bridge_2_R.R")

#### AUTHENTICATE With EnvisionRisk Server ####
envrsk_auth_renew_access_token()
access_token <- my_access_token[["access-token"]]
delta_vector <- envrsk_instrument_delta_vector_raw(access_token = access_token, "2023-06-04", "GOOG.US")[['Output']]

#approximationer, "nærmeste data, hvis fejl", max hvis over
#estimation er overnight heston parameter beregning.
#er der stor forskel i resultaterne fra høj fejl margin og lav fejl margin.
#vi skal gerne have den ned på sekund basis.
#overnight, men skal samle både call og put i separate
#spændende at kigge mere på forbedringer i hastighed

#anvendelse, specifikt for kunden, volflade og beregne for impl vol
#for datoer, der er udenfor området, giv advarsel korriger for fejlgrupper.



#libraries
{
  library(purrr)
  library(zoo)
  library(xts)
  library(TTR)
  library(tidyverse)  ##
  library(quantmod)   ## quant library 2
  library(Quandl)     ## quant library 3
  library(fasttime)   ## time conversion
  library(data.table)
  library(dplyr)
  library(plyr)
  library(nloptr)
  library(tidyquant)  ## quant library 1
  library(quantmod)   ## quant library 2
  library(RODBC)
}

#functions
{
  Moneyness <- function(S, K)  #actual formula
  {
    K/S
    #K*exp(-R*T)/S
  }
  
  #rettes til parametre eller slettes
  BSprice <- function(S, K, R, T, sig, q, typen) 
  {
    typen <- tolower(typen)
    d_1 <- (log(S/K) + (R- q + (sig^2/2))*T) / (sig*sqrt(T))
    d_2 <- d_1 - (sig*sqrt(T))
    
    
    # europæiske optioner
    if(typen=="put")
    {
      price <- (K*exp(-R*T)*pnorm(-d_2)) - (S*exp(-q*T)*pnorm(-d_1))
      if (T < 0.01)
      {price <- max(S-K,0)}
      else if (price >=0)
      {price <- price}
      else
      {price <- 0}
    }
    
    #pga. early exercise kan, black scholes være misvisende mht. early exercise premiums, man bruger binomial pricing til dette, håbet er lukket form løsninger
    
    else if(typen=="call") 
    {
      price <- (S*exp(-q*T)*pnorm(d_1)) - (K*exp(-R*T)*pnorm(d_2))
      if (T < 0.01)
      {price <- max(S-K,0)}
      else if (price >=0)
      {price <- price}
      else
      {price <- 0}
    }
    
    return(price)
  }
  
  #rettes til parametre
  implvoli <- function(p,s,k,r,t,q,typen)
  {
    volOptimFun <- function(p, s, k, r, t, sig, q, typen){
      abs(p - BSprice(s, k, r, t, sig, q, typen))
    }
    
    return(optimize(volOptimFun, interval = c(0, 2), p = p, s = s, k = k, r = r,t = t, q = q, type = typen)$minimum)
  }
  
  #rettes til fundamental pris funktion
  HestonCallClosedForm <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K) 
  {
    
    PIntegrand <- function(u, lambda, vbar, eta, rho, v0, r, tau, S0, K, j) 
    {
      F <- S0*exp(r*tau)
      x <- log(F/K)
      a <- lambda * vbar
      
      if (j == 1) {
        b <- lambda - rho* eta
        alpha <- - u^2/2 - u/2 * 1i + 1i * u
        beta <- lambda - rho * eta - rho * eta * 1i * u
      } else {
        b <- lambda
        alpha <- - u^2/2 - u/2 * 1i
        beta <- lambda - rho * eta * 1i * u
      }
      
      gamma <- eta^2/2
      d <- sqrt(beta^2 - 4*alpha*gamma)
      rplus <- (beta + d)/(2*gamma)
      rminus <- (beta - d)/(2*gamma)
      g <- rminus / rplus
      
      D <- rminus * (1 - exp(-d*tau))/(1-g*exp(-d*tau))
      C <- lambda * (rminus * tau - 2/(eta^2) * log( (1-g*exp(-d*tau))/(1-g) ) )
      
      top <- exp(C*vbar + D*v0 + 1i*u*x)
      bottom <- (1i * u)
      Re(top/bottom)
    }
    
    P <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K, j) 
    {
      value <- integrate(PIntegrand, lower = 0, upper = Inf, lambda, vbar, eta, rho, v0, r, tau, S0, K, j,subdivisions=1000)$value
      0.5 + 1/pi * value
    }
    
    A <- S0*P(lambda, vbar, eta, rho, v0, r, tau, S0, K, 1)
    B <- K*exp(-r*tau)*P(lambda, vbar, eta, rho, v0, r, tau, S0, K, 0)
    A-B
  }
  
  Hestoncf <- function(params, u, t, S)
  {
    kappa <- params[1]
    theta <- params[2]
    sigma <- params[3]
    rho <- params[4]
    v0 <- params[5]
    r <- params[6]
    
    lambda <- 0
    x <- log(S)
    
    a <- -u * (u + 1i) / 2
    b <- kappa - rho * sigma * 1i * u
    d <- sqrt(b^2 - 4 * a * sigma^2)
    g1 <- (b - d) / (2 * sigma^2)
    g2 <- (b + d) / (2 * sigma^2)
    
    Cf <- exp( (1i * u * (x + r * t)) + (kappa * theta * t * g1) / sigma^2 ) * (1 - exp(-d * t)) / (1 - g1 * exp(-d * t))
    Cf <- Cf * exp( (a * v0) / (1 - exp(-d * t)) / sigma^2 * (1 - exp(-d * t)) / (1 - g1 * exp(-d * t)))
    
    return(Cf)
  }
  
  #rettes eller slettes
  Hestonprice <- function(params, t, S, K) 
  {
    integrand <- function(u) 
    {
      Re(Hestoncf(params, u - (1i / 2), t, S) * exp(-1i * u * log(K)) / (u^2 + 0.25))
    }
    
    integral_value <- integrate(integrand, lower = 0, upper = Inf, subdivisions = 1000)$value
    price <- S * (0.5 + (1 / pi) * integral_value) - K * exp(-params[[6]] * t) * (0.5 + (1 / pi) * integral_value)
    
    return(price)
  }
  
  
  Calibration <- function(S,K,Market)
  {
    
    params <- c(kappa = 2, theta = 0.05, sigma = 0.5, rho = -0.5, v0 = 0.01, r = 0.03)
    lower_bounds <- c(0.1, 0.01, 0.1, -0.99, 0.0001, 0.0001)
    upper_bounds <- c(10, 1, 2, 0.99, 1, 0.5)
    constraints <- list("lower" = lower_bounds, "upper" = upper_bounds)
    
    #minimize squared error between market price and expected price via heston
    Hestoncalibration <- function(params,S,K) 
    {
      market_prices <- list()
      heston_prices <- list()
      errors <- list()
      sum_errors <- 0
      for (i in 1:length(Market))
      {
        market_prices <- append(market_prices, as.numeric(Market[[i]]))
        heston_prices <- append(heston_prices, as.numeric(mapply(Hestonprice, 1, S, K[[i]], MoreArgs = list(params = params))) )
        errors <- append(errors,(heston_prices[[i]] - market_prices[[i]])^2)
        sum_errors <- sum_errors + errors[[i]]
      }
      
      return(sum_errors)
    }
    
    #forsøg at kigge på hurtigere optimering/calibration funktioner
    #optim, nlm
    #
    
    
    #optimization of objective function with nonlinear optimization
    {
      result <- nloptr(
        x0 = params,
        S = S,
        K = K,
        eval_f = Hestoncalibration,
        lb = constraints$lower,
        ub = constraints$upper,
        opts = list("algorithm" = "NLOPT_LN_COBYLA", "xtol_rel" = 1.0e-6, "maxeval" = 1000)
      )
      
      
    }
    calibrated_params <- result$solution
  }
  
  optchains <- function(symbol, type)
  {
    {
      if (type=="call")
      {
      y1 <- as.character(year(Sys.Date()))
      y2 <- as.character(year(Sys.Date())+1)
      optchainy1 <- getOptionChain(symbol,y1)
      optchainy2 <- getOptionChain(symbol,y2)
      
      
      for (i in 1:length(optchainy1))
      {
        if (i==1)
        {
          optionchain <- optchainy1[[i]]$calls
        }
        else
        {
          optionchain <- rbind(optionchain, optchainy1[[i]]$calls)
        }
      }
      
      for (i in 1:length(optchainy2))
      {
        optionchain <- rbind(optionchain, optchainy2[[i]]$calls)
      }
      
      }
      else if (type=="put")
      {
        y1 <- as.character(year(Sys.Date()))
        y2 <- as.character(year(Sys.Date())+1)
        optchainy1 <- getOptionChain(symbol,y1)
        optchainy2 <- getOptionChain(symbol,y2)
        
        
        for (i in 1:length(optchainy1))
        {
          if (i==1)
          {
            optionchain <- optchainy1[[i]]$puts
          }
          else
          {
            optionchain <- rbind(optionchain, optchainy1[[i]]$puts)
          }
        }
        
        for (i in 1:length(optchainy2))
        {
          optionchain <- rbind(optionchain, optchainy2[[i]]$puts)
        } 
      }
    
    St <- tail(tq_get(symbol, get="stock.prices", from = as.Date(Sys.Date()-4), to = as.Date(Sys.Date()-1))['close'],1)[[1]] #stock price today
    Kk <- optionchain$Strike;Kk <- data.frame(Kk)           #strikes
    Market <- optionchain$Last;Market <- data.frame(Market)
    result <- Calibration(St,Kk,Market)
    result <- append(result,as.character(as.Date(Sys.Date()))); result <- append(result, symbol); result <- append(result,type)
    return(result)
    }
  }
  
  HestonSurface <- function(dato,  ttm, symbol, type,choice) #skal rettes mht. aktiepris og moneyness.
  {
    params  <- sqlQuery(dbconnection,paste("SELECT * FROM dbo.Heston WHERE dato= '",dato,"' AND SYMBOL ='",symbol,"' AND TYPE ='",type,"'",sep="", collapse=","))
    lambda <- as.numeric(params[1])
    vbar <- as.numeric(params[2])
    eta <- as.numeric(params[3])
    rho <- as.numeric(params[4])
    v0 <- as.numeric(params[5])
    r <- as.numeric(params[6])
    S0 <- tail(tq_get(symbol, get="stock.prices", from = as.Date(Sys.Date()-4), to = as.Date(Sys.Date()-1))['close'],1)[[1]] #stock price today
    N <- 200
    LogStrikes <- seq(-0.5, 0.5, length=N)
    Ks <- rep(0.0,N)
    taus <- seq(0.1, ttm, length=N)
    vols <- matrix(0,N,N)
    
    TTM <- Money <- Vol <- rep(0,N*N)
    
    HestonPrice <- function(K, ttm) {
      HestonCallClosedForm(lambda, vbar, eta, rho, v0, r, ttm, S0, K)
    }
    
    n <- 1
    for (i in 1:N) {
      for (j in 1:N) {
        Ks[i] <- exp(r * taus[j]+LogStrikes[i]) * S0
        price <- HestonPrice(Ks[i],taus[j])
        iv <- implvoli(price, S0, Ks[i], r, taus[j],0,"call")
        TTM[n] <- taus[j] # in days
        Money[n] <- Moneyness(S0,Ks[i])
        Vol[n] <- iv
        n <- n+1
      }
    }
    
    if (choice=="data")
    { 
      data.frame(TTM=TTM, Moneyness=Money, ImpliedVol=Vol)
    }
    
    else if (choice == "plot")
    {
      IVHeston <- Vectorize(function(K,T) { implvoli( HestonPrice(K,T), S0, K, r, T, 0,"call") })
      Ks <- as.double(Ks)
      taus <- as.double(taus)
      #Money <- as.double(Money)
      
      z <- outer(Ks, taus, IVHeston)
      
      persp(x=Ks, y=taus, z, theta = 45, phi = 20, expand = 0.5,
            xlab="Moneyness", ylab="TTM", zlab="Implied Volatility",
            ticktype="detailed")
    }
    
  }
  
  volsmilet <- function(optionheston, datoudvalg)
  {
    OptionHeston <- OptionHest[OptionHest$TTM > datoudvalg-0.001 & OptionHest$TTM < datoudvalg+0.001,]
    Moneynes <- rep(0,nrow(OptionHeston))
    Implivol <- rep(0,nrow(OptionHeston))
    
    for (j in 0:nrow(OptionHeston)) {
      Moneynes[j] <- OptionHeston[j,2]#moneyness
      Implivol[j] <- OptionHeston[j,3] #implvol
    }
    #moneyness = 1, implvol = 2
    plot(Moneynes,Implivol)
  }
  
  implvol_vector <- function(St,pc,K,symbol,ttm,type,dato)
  {
    
    #1. timedifference
    if (typeof(ttm)=="double")
    {
      ttm <- ttm
    }
    if (typeof(ttm)=="character")
    {
      time_dif <- as.integer(as.Date(ttm))
    }
    #2. danne volflade - sættes udenfor
    OH <- HestonSurface(dato, ttm ,symbol, type,"data")
    
    tm <- rep(0,nrow(OH))
    for (i in 1:nrow(OH))
    {
      tm[i] <- OH$TTM[i] - ttm
    }
    OH <- OH[OH$TTM-ttm == min(ABS(tm)),]
    
    Moneynes <- rep(0,nrow(OH))
    Implivol <- rep(0,nrow(OH))
    
    for (j in 0:nrow(OH)) {
      Moneynes[j] <- OH[j,2] #moneyness
      Implivol[j] <- OH[j,3] #implvol
    }
    OH <- cbind(Moneynes,Implivol)
    Mny <- K/St
    #[moneyness = strike/stock_price] vi skal kigge på moneyness og ændre stock_price, for at se ændring i moneyness og trække på den data.
    
    #4. sigma_moneyness_p0[moneyness = strike/stock_price]    slå op i slice, hvad implvol er, ligger vi i sigma_moneyness_p0-value
    #
    #sigma_moneyness_p0 <- mean(smilet[smilet$snittet > strike_v-4 & smilet$snittet < strike_v+4 ,2])
    #4. note, er ikke afhængig af price_change, kan lægges andet sted
    
    
    
    #5. sigma_moneyness_p1[moneyness = strike/(stock_price+change)]    slå op i slice, hvad implvol er, ligger vi i sigma_moneyness_p1-value
    #5. note, denne er vektor format.
    pc <- delta_vector
    tryCatch(               
      expr = {  if (nrow(pc>0)) {
        sigma_moneyness_p1 <- rep(0,nrow(pc))
      }
      },
      # Specifying error message
      error = function(e){         
        sigma_moneyness_p1 <- rep(0,length(pc))
      }
    )
    
    for (i in 1:length(sigma_moneyness_p1))
    { 
      M <- rep(0,nrow(OH))
      
      for (j in 1:nrow(OH))
      {
      M[j] <- OH[[j,1]] - ((St+pc[[i,1]])/K)
      }
      
      for (k in 1:length(M))
      {
      if(ABS(M[k]) == min(ABS(M)))
      {num <- k}
      }
      sigma_moneyness_p1[i] <- OH[num,2]
    }

    return(sigma_moneyness_p1)
  }
  
  dbcon <- function(resultat)
  {
    dbconnection <- odbcDriverConnect("Driver=SQL Server Native Client 11.0;Server=localhost; Database=FinanceTest;Uid=; Pwd=; trusted_connection=yes")
    df <- resultat
    values <- paste("(",df[1],",", df[2],",",df[3],",",df[4],",",df[5],",",df[6],",","'",df[7],"'",",","'",df[8],"'",",","'",df[9],"'",")", sep="", collapse=",")
    cmd <- paste("insert into dbo.Heston values ", values)
    sqlQuery(dbconnection, cmd, as.is=TRUE)
    odbcClose(dbconnection)
  }
} 

#volsmilet(OptionHest['AAPL.US',"2023-07-23"],0.1)#,strike) - moneyness skala.

#delta_vector <- envrsk_instrument_delta_vector_raw(access_token = access_token, "2023-05-12", "AAPL.US")[['Output']]
#mistake with puts
OH <- optchains("GS","put")

dbcon(OH)
dbconnection <- odbcDriverConnect("Driver=SQL Server Native Client 11.0;Server=localhost; Database=FinanceTest;Uid=; Pwd=; trusted_connection=yes")
dataudvalg <- sqlQuery(dbconnection,paste("SELECT * FROM dbo.Heston"))

test <- HestonSurface("2023-06-04", 1.5,"GOOG","call", "data")
HestonSurface("2023-06-04", 1.5,"JPM","call", "plot")
volsmilet(HestonSurface("2023-06-04", 1.5,"GOOG","call", "data"),0.104)

delta_vector <- envrsk_instrument_delta_vector_raw(access_token = access_token, "2023-06-04", "GOOG.US")[['Output']]

implvol_vector(125,delta_vector,90,"GOOG",0.5,"call","2023-06-04")








#binomial pricing
{
binom <- getBinomTree(S, 100,0.05,0.1,0.05,0,10)

getBinomTree <- function(S0, K, vol, dT, r, qdiv, N_steps, isPut=F, isAmerican=F, 
                         isAvgStrike=F, isKO=F, isChooser=F, H=NA, Kc=NA, Kp=NA, choose_t1=NA)
{
  # number of nodes in tree
  N_nodes <- (N_steps+1)*(1 + (N_steps+1))/2 # sum(1:(N_steps+1)) = n*(a_1 + a_n)/2 
  
  # time difference between steps
  dT_step <- dT/N_steps
  
  # discount factor for one step
  D_step <- exp(-r*dT_step) 
  
  # up-movement factor
  u <- exp(vol*dT_step^0.5)
  
  # down-movement factor
  d <- 1/u 
  
  # probability of up movement in a risk-neutral world
  p <- (exp((r - qdiv)*dT_step) - d)/(u - d)
  
  # create a data frame to keep nodes of tree with a mapping: dt(row_i) -> node_id like:
  # 0|1|2|...|i                 ... |n
  # ....................................................
  #                                 (n+1)*(1+n+1)/2 - n
  #                             ...
  #          (i+1)*(1+i+1)/2-i
  #     4 ...
  #   2     
  # 1   5 ...(i+1)*(1+i+1)/2-j
  #   3
  #     6 ...
  #          (i+1)*(1+i+1)/2    ...
  #                                 (n+1)*(1+n+1)/2
  
  df <- data.frame(i_node = 1:N_nodes, step=NA, N_u = NA, S = NA, P = NA)
  if (isAmerican) {
    df <- data.frame(i_node = 1:N_nodes, step=NA, N_u = NA, S = NA, P = NA, dP_Exerc = NA)
  }
  if (isChooser) {
    df <- data.frame(i_node = 1:N_nodes, step=NA, N_u = NA, S = NA, P_Call = NA, P_Put = NA, P = NA)
  }
  
  for (i in N_steps:0)
  {
    for (j in 0:i)
    {
      i_node <- (i+1)*(1+i+1)/2-j  # get id of node
      df$step[i_node] <- i  # time step
      df$N_u[i_node] <- j  # number of u multiplication
      df$S[i_node] <- S0 * d^(i-j) * u^j # underlying asset price
      
      # at terminal node - payoff at expir:
      if (i == N_steps) 
      {
        df$P[i_node] <- ifelse(isPut, max(K - df$S[i_node], 0), max(df$S[i_node] - K, 0))
        if (isAmerican)
        {
          df$dP_Exerc[i_node] <- 0
        }
        if (isAvgStrike)
        {
          Savg <- getAvgStrikes(S0, j, i-j, d, u) # avg values of underlying price along all possible paths
          if (isPut) {
            df$P[i_node] <- mean(pmax(Savg - df$S[i_node], 0))
          } else {
            df$P[i_node] <- mean(pmax(df$S[i_node] - Savg, 0))
          }
        }
        if (isChooser)
        {
          df$P_Call[i_node] <- max(df$S[i_node] - Kc, 0)
          df$P_Put[i_node] <- max(Kp - df$S[i_node], 0)
          df$P[i_node] <- NA
        }
      } 
      # at interim nodes - backward induction:
      if (i < N_steps) 
      { 
        i_node_u <- ((i+1)+1)*(1+(i+1)+1)/2-(j+1) # find id of up node
        i_node_d <- ((i+1)+1)*(1+(i+1)+1)/2-j     # find if of down node
        df$P[i_node] <- D_step * (p*df$P[i_node_u] + (1-p)*df$P[i_node_d])
        if (isAmerican)
        {
          P_Exerc <- ifelse(isPut, max(K - df$S[i_node], 0), max(df$S[i_node] - K, 0))
          df$dP_Exerc[i_node] <- P_Exerc - df$P[i_node]
          df$P[i_node] <- max(df$P[i_node], P_Exerc)
        }
        if (isChooser)
        {
          df$P_Call[i_node] <- D_step * (p*df$P_Call[i_node_u] + (1-p)*df$P_Call[i_node_d])
          df$P_Put[i_node] <- D_step * (p*df$P_Put[i_node_u] + (1-p)*df$P_Put[i_node_d])
          if (i == round(choose_t1/(dT/N_steps), 0)){
            df$P[i_node] <- max(df$P_Call[i_node], df$P_Put[i_node])
          }
        }
      }
      if (isKO)
      {
        if (isPut) {
          if (df$S[i_node] >= H) { df$P[i_node] <- 0 }
        } else {
          if (df$S[i_node] <= H) { df$P[i_node] <- 0 }
        }
      }
    }
  }
  return(df)
}

# example of inputs
getExampleInputs <- function()
{
  # standard inputs for European and American options
  S0 <<- 100         # asset price at t=0
  K <<- 105          # strike
  vol <<- 0.15       # volatility
  dT <<- 1           # time to maturity (years)
  r <<- 0.05         # risk-free rate
  qdiv <<- 0         # dividend rate
  N_steps <<- 50     # number of steps in tree
  isPut <<- F        # default: F (Call)
  isAmerican <<- F   # default: F (European)
  
  # additional inputs for exotic options
  isAvgStrike <<- F  # is average strike options
  isKO <<- F         # is knock-out option
  H <<- 110          # barrier strike for knock-out
  isChooser <<- F    # is chooser option
  Kc <<- 105         # call strike for chooser option
  Kp <<- 95          # put strike for chooser option
  choose_t1 <<- 0.5  # time to choose for chooser option
}

# "envelope" functions for different type of options
# chooser option
getBinomTree.chooser <- function(S0, K, vol, dT, r, qdiv, N_steps, Kc, Kp, choose_t1)
{
  df <- getBinomTree(S0, K, vol, dT, r, qdiv, N_steps, isPut=F, isAmerican=F, 
                     isAvgStrike=F, isKO=F, isChooser=T, H=NA, Kc, Kp, choose_t1)
  return(df)
}
# knock-out option
getBinomTree.ko <- function(S0, K, vol, dT, r, qdiv, N_steps, isPut, H)
{
  df <- getBinomTree(S0, K, vol, dT, r, qdiv, N_steps, isPut, isAmerican=F, 
                     isAvgStrike=F, isKO=T, isChooser=F, H, Kc=NA, Kp=NA, choose_t1=NA)
  return(df)
}
# average strike option
getBinomTree.avgK <- function(S0, vol, dT, r, qdiv, N_steps, isPut)
{
  if (N_steps > 10)
  {
    N_steps <- 10
    print("(!) N_steps set equal to 10. N_steps enters as factorial in number of possible paths!")
  }
  df <- getBinomTree(S0, K=NA, vol, dT, r, qdiv, N_steps, isPut, isAmerican=F, 
                     isAvgStrike=T, isKO=F, isChooser=F, H=NA, Kc=NA, Kp=NA, choose_t1=NA)
  return(df)
}

# get the average values of all possible paths of the underlying until the terminal node
# used for average strike options
getAvgStrikes <- function(S0, N_u, N_d, d, u)
{
  # (!) N of permutations of multisets = (N_u+N_d)!/(N_d!*N_u!)
  if ((N_u + N_d) > 10)
  {
    print("(!) Give a lower number of N steps for the tree. N enters as factorial!")
    return(NA)
  }
  mx_comb <- combn(1:(N_u + N_d), N_u, simplify = FALSE)
  mx_perm <- data.frame(matrix(unlist(mx_comb), nrow = length(mx_comb), byrow = T))
  mx_ud <- data.frame(matrix(d, nrow = nrow(mx_perm), ncol = (N_u + N_d)))
  mx_Savg <- rep(NA, nrow(mx_ud))
  for (i in 1:nrow(mx_ud))
  {
    mx_ud[i, unlist(mx_perm[i, ])] <- u
    St <- S0
    sumS <- 0
    for (j in 1:ncol(mx_ud))
    {
      St <- mx_ud[i, j] * St
      sumS <- sumS + St
    }
    mx_Savg[i] <- sumS/(ncol(mx_ud))
  }
  return(mx_Savg)
}

}

#ekstra
{
HestonCallMonteCarlo <- function(lambda, vbar, eta, rho, v0, r, tau, S0, K, nSteps=250, nPaths=3000, vneg=2) 
{
  
  #meandrift
  #mean volatility
  #return rate of volatility
  #volatility of volatility
  
  n <- nSteps
  N <- nPaths
  
  dt <- tau / n
  
  negCount <- 0
  
  S <- rep(S0,N) 
  v <- rep(v0,N) #
  
  for (i in 1:n)
  {
    W1 <- rnorm(N);
    W2 <- rnorm(N);
    W2 <- rho*W1 + sqrt(1 - rho^2)*W2;
    
    sqvdt <- sqrt(v*dt)
    S <- S*exp((r-v/2)*dt + sqrt(v * dt) * W1)
    
    if ((vneg == 3) & (2*lambda*vbar/(eta^2) <= 1)) {
      cat("Variance not guaranteed to be positive with choice of lambda, vbar, and eta\n")
      cat("Defaulting to Reflection + Milstein method\n")
      vneg = 2
    }
    
    if (vneg == 0){
      ## Absorbing condition
      v <- v + lambda*(vbar - v)* dt + eta * sqvdt * W2
      negCount <- negCount + length(v[v < 0])
      v[v < 0] <- 0
    }
    if (vneg == 1){
      ## Reflecting condition
      sqvdt <- sqrt(v*dt)
      v <- v + lambda*(vbar - v)* dt + eta * sqvdt * W2
      negCount <- negCount + length(v[v < 0])
      v <- ifelse(v<0, -v, v)
    }
    if (vneg == 2) {
      ## Reflecting condition + Milstein
      v <- (sqrt(v) + eta/2*sqrt(dt)*W2)^2 - lambda*(v-vbar)*dt - eta^2/4*dt
      negCount <- negCount + length(v[v < 0])
      v <- ifelse(v<0, -v, v)     
    }
    if (vneg == 3) {
      ## Alfonsi - See Gatheral p.23
      v <- v -lambda*(v-vbar)*dt +eta*sqrt(v*dt)*W2 - eta^2/2*dt      
    }
  }
  
  negCount <- negCount / (n*N);
  
  ## Evaluate mean call value for each path
  V <- exp(-r*tau)*(S>K)*(S - K); # Boundary condition for European call
  AV <- mean(V);
  AVdev <- 2 * sd(V) / sqrt(N);
  
  list(value=AV, lower = AV-AVdev, upper = AV+AVdev, zerohits = negCount)
}


}

library(latex2exp)
#
#plot(TeX(r'(A $\LaTeX$ formula: $\frac{2hc^2}{\lambda^{\frac{1}{2}}}\frac{1}{e^{\frac{hc}{\lambda k_B T}} - 1}$)'), cex=2, main="")

{
if (Fordeling == "Uniform")
{ }
  else if (Fordeling == "binomial")
  { }
  else if (Fordeling == "Geometrisk")
  {f <- (1-p)^(k-1)*p }
  else if (Fordeling == "Hypergeometrisk")
  { }
  else if (Fordeling == "Normal")
  { }
  else if (Fordeling == "Poisson")
  { }
  else if (Fordeling == "Exponentiel")
  { }
  else if (Fordeling == "")
  { }
  
}
#

a = 1
b = 36
v1 = 20
v2 = -10

#rouletten
{
listen <- list();prob <- list()
for (x in a:b) 
{
  listen <- append(listen, x)
  prob <- append(prob, 1/(a-b))
}

udvalgte <- list(); udvalgte <- append(udvalgte, c(1,2,3,4,5,6,7,8,9,10,11,12))
p <- length(udvalgte)/length(listen); q <- (1-p)
pv <- p * v1 # forventet gevinst
pl <- q*(v2) # forventet tab
ev <- pv + pl #forventet værdi
}

#plat og krone
{}

#conditional prob

f <- function(x) 
{
  if (x ==-4){out <- 0.1}
  else if (x ==-3){out <- 0.2}
  else if (x ==1){out <- 0.6}
  else if (x ==2){out <- 0.1}
  else {out <- 0}
#out <- 1/sqrt(2*x)
return(out)
}

#PMF test
{
positivity <- function(a,b)
{
    pos <- "True"
    
    for (x in a:b) 
    {
      if (f(x) < 0)
      {
        pos <- "False"
      }
    }
    return(pos)
  }

integratable <- function(a,b)
{
  result = tryCatch({
    if (integrate(f, lower = a, upper = b)$value == 1){result <- "True"}
    else {result <- "False"}
  }, error = function(e) {
    summer <- 0
    for (y in a:b)
    {
      summer <- summer + f(y)
    }
    
    if (summer == 1){result <- "True"}
    else {result <- "False"}
  })
  return(result)
}
   
if (positivity(a,b) == "True" & integratable(a,b)=="True") { print("PMF")} 
  else if (positivity(a,b) == "True" & integratable(a,b)=="False") {print("not PMF, but positive")}
  else if (positivity(a,b) == "False" & integratable(a,b)=="True") {print("not positive, but integral to 1")}
  else {print("not positive and no integral to 1")}
}

#middelværdi, varians, sigma
{
  #Middelværdi og varians funktion

fe <- function(x)
{
  out <- f(x)*x
  return(out)
}
fv <- function(x)
{
  out <- fe(x)*x
  return(out)
} 

  

if (is.null(tryCatch( {middel_k <- integrate(fe, lower = a, upper= b)$value},error = function(e){} ))){middel_d <- 0;for(y in a:b) {middel_d <- middel_d + f(y)}} else{middel_d <- sum(fe(a:b))}
                     

if (is.null(tryCatch( {varians_k <- integrate(fv, lower = a, upper= b)$value - middel_k^2},error = function(e){} ))){varians_d <- 0;for(y in a:b) {varians_d <- varians_d + fv(y)}; varians_d - middel_d^2} else{varians_d <- sum(fv(a:b)) - middel_d^2}                

if (is.null(tryCatch( {sigma_k <- sqrt(abs(varians_k))} , error=function(e){}) ) ) {sigma_d <- sqrt(abs(varians_d))} else{sigma_k <- sqrt(abs(varians_k))}

}

#P(X>=k), P(<=k) P(<k) P(>k) P(c<x<K)
{
  
}

#plot process
{
  xval <- list()
  fval <- list()
  fstval <- list()
  fsum <- 0
  for (x in (a*10):(b*10)) 
  {
    xval <- append(xval, x/10)
    fval <- append(fval,f(x/10))
    fsum <- fsum + f(x/10)
    fstval <- append(fstval, fsum)
  }
  plot(xval,fval, type = "l")
  plot(xval,fstval, type = "l")
}



f_to <- function(x,y) 
{
  if (x ==-1 & y==-1){out <- 0.1}
  else if (x ==1 & y==-1){out <- 0.3}
  else if (x ==1){out <- 0.6}
  else if (x ==2){out <- 0.1}
  else {out <- 0}
  #out <- 1/sqrt(2*x)
  return(out)
}

datasaet <- c(1,2,3,4,5,6,1,2,3,4,3,5)
{
  middel <- mean(datasaet)
  vari <- var(datasaet)
  standiv <- sd(datasaet)
  medi <- median(datasaet)
  #Mostfrequent <- mlv(datasaet)
  stanscor <- scale(datasaet)
  N <- length(datasaet)
  attrib <- attr(stanscor,"scaled:center")
}
rank(datasaet)
rank(datasaet, ties.method = "min")

sort(rank(datasaet, ties.method = "min"))
quantile(rank(datasaet, ties.method = "min"))
sum(datasaet[datasaet<3])
max(datasaet)
min(datasaet)
range(datasaet)

round(datasaet,2)
margin.table(datasaet)

hist(datasaet, plot=T, breaks=6)
cumsum(datasaet)
plot(cumsum(datasaet), main="Cumulative Histogram", xlab="test", ylab="values")
plot(ecdf(datasaet), main="Cumulative Histogram", xlab="test", ylab="values")

library(ggplot2)

ggplot(NULL, aes(x=datasaet)) + geom_step(stat="ecdf") + labs(x="price",y="fn(price") + geom_vline(aes(xintercept=quantile(datasaet),linetype="dashed")) + scale_x_continuous(breaks = quantile(datasaet), labels = quantile(datasaet) )

summary(datasaet)
#describe.data.frame(datasaet)
#datadensity(datasaet)

cen.mom <- function(x,y){mean((x-mean(x))^y)}
cen.mom(datasaet,3)/cen.mom(datasaet,2)^1.5
cen.mom(datasaet,4)/cen.mom(datasaet,2)^2

skewness(datasaet)
kurtosis((datasaet))
#MLE
#den værdi af thetat, som maksimere likelihood funktionen
install.packages("tigerstats")
library(moments)
library(Hmisc)
library(tigerstats)
#Confidence interval

#hypotese testing

#lineær regression


#t.test(x, y)
t.test(1:10, y = c(7:20))


#integrationstest
integrate(f, lower = a, upper = b)$value 
#integration of function of 2 variables
{
  b <- function(t,x) { 2*(t-x)* exp(-(1-exp(-3*x))) }
  z <- function(t) sapply(t, function (t_i) integrate(b, lower = 0, upper = t_i, t = t_i)$value)
  integrate(z, lower = 0, upper = 10)
}
#extra integration help
{
  integrate(dnorm, -1.96, 1.96)
  integrate(dnorm, -Inf, Inf)
  
  ## a slowly-convergent integral
  integrand <- function(x) {1/((x+1)*sqrt(x))}
  integrate(integrand, lower = 0, upper = Inf)
  
  ## some functions do not handle vector input properly
  f <- function(x) 2.0
  try(integrate(f, 0, 1))
  integrate(Vectorize(f), 0, 1)  ## correct
  integrate(function(x) rep(2.0, length(x)), 0, 1)  ## correct  
}




x <- runif(n=10000,min=-1,max=1)
y <- runif(n=10000,min=-1,max=1)
A = x^2+y^2
B =sum(A < 1)/10000
x1 <- runif(n=100000,min=-1,max=1)
y1 <- runif(n=100000,min=-1,max=1)
A1 = x1^2+y1^2
B2 = sum(A1 < 1)/100000
x2 <- runif(n=1000000,min=-1,max=1)
y2 <- runif(n=1000000,min=-1,max=1)
A2 = x2^2+y2^2
B3 =sum(A2 < 1)/1000000
pi/4


a = replicate(1000, rnorm(5, mean=-2, sd=1))
a
thetastupid = (a[1,]+a[2,]+a[3,])/3
thetaclever = (a[1,]+a[2,]+a[3,]+a[4,]+a[5,])/5
varestimate = ((a[1,]+2)^2+(a[2,]+2)^2+(a[3,]+2)^2+(a[4,]+2)^2+(a[5,]+2)^2)/5
m = replicate(1000, rnorm(1, mean=-2, sd=0))

plot(thetastupid, col=c("black"));
par(new=T);
plot(thetaclever, col=c("red"));
par(new=T);
plot(m,col=c("blue"))





dnorm(100,m=100,s=15) #point
pnorm(100,m=100,s=15) #cumulative
pnorm(85,m=100,s=15) #less than 85
pnorm(85,m=100,s=15, lower.tail=FALSE) #greater than 85

qnorm(0.15,m=100,s=15) #quantile of the area with acc. value 0.15 and below
qnorm(0.15,m=100,s=15, lower.tail=FALSE) #greater than 0.15

x.values <- seq(40,160,1)
sd.values <- seq(40,160,15)
zeros9 <- rep(0,9)

ggplot(NULL, aes( x=x.values,y=dnorm(x.values,m=100,s=15) )) +geom_line() + labs(x="IQ",y="f(IQ)") + scale_x_continuous(breaks=sd.values,labels=sd.values) + geom_segment(( aes ( x=sd.values,y=zeros9,xend=sd.values,yend=dnorm(sd.values,m=100,s=15))),linetype="dashed")+scale_y_continuous(expand = c(0,0))

q.values <- round(qnorm(c(.25,.50,.75),m=100,s=15))
zeros3 <- c(0,0,0)

ggplot(NULL, aes( x=x.values,y=pnorm(x.values,m=100,s=15) )) +geom_line() + labs(x="IQ",y="f(IQ)") + scale_x_continuous(breaks=q.values,labels=q.values) + geom_segment(( aes ( x=q.values,y=zeros3,xend=q.values,yend=pnorm(q.values,m=100,s=15))),linetype="dashed")+scale_y_continuous(expand = c(0,0))
pnormGC(c(85,100),region="between",m=100,s=15,graph=TRUE)
qnormGC(.15,region="below", m=100, s=15, graph=TRUE)

rnorm(5,m=100,s=15)

dnorm(0)
pnorm(0)
qnorm(c(.25,.50,.75))
rnorm(5)








values <- c(1,2,3)
probabilities <- rep(1/length(values),length(values))
smpl.mean <- NULL
for (i in 1:600)
{

smpl <- sample(x=values,prob=probabilities,size=3,replace=TRUE)
smpl.mean <- append(smpl.mean,mean(smpl))
}

m.values <- round(unique(sort(smpl.mean)),2)

ggplot(NULL,aes(x=smpl.mean)) + geom_histogram() + scale_x_continuous(breaks=m.values,label=m.values) + scale_y_continuous(expand=c(0,0))+
  labs(x=expression(bar(X)),y=expression(frequency(bar(X))))
E.values <- sum(values*probabilities)
var.values <- sum((values-E.values)^2*probabilities)
sd.values <- sqrt(var.values)

E.values - mean(smpl.mean)
mean(smpl.mean)
sd(smpl.mean)

sd.mean <- sd(smpl.mean)/sqrt(length(smpl.mean))
mean.battery <- 60
sd.battery <- 20
N <- 20
error <- qnorm(.025, lower.tail=FALSE)*sd.battery/sqrt(N)
lower <- mean.battery - error
upper <- mean.battery + error

battery.data <- c(82,64,68,44,54,47,50,85,51,41,61,84,53,83,91,43,35,36,33,87,90,86,49,37,48)
t.test(battery.data, conf.level= .90)

setup = 1
while (setup == 1)
{
  library(ggplot2)    ## grammar of graphics
  library(reshape2)   ##reshaping data frames
  library(lattice)    ##More graphics
  library(hexbin)     ## ... and more graphics
  library(gridExtra)  ## even more graphics
  library(xtable)     ##Latex formatting of tables
  library(splines)    ##splines -- surprise :-)
  library(survival)   ##survival analysis
  library(grid)       ##for 'unit'
  library(lpSolve)    ##linear programming
  library(tidyverse)  ##
  library(tidyquant)  ##
  library(quantmod)   ##
  library(Quandl)     ##
  library(fasttime)   ## time conversion
  library(xlsx)       ## omskrive til excel
  library(readxl)     ## read excel files
  library(readODS)    ## read ODS files
  library(xml2)       ## read xml files
  library(data.table)
  library(haven)
  library(dplyr)
  library(party)
  setup = 0
}

#
titanic <- read.csv("http://www.math.ku.dk/~susanne/titanic.txt", 
                    header = TRUE,
                    colClasses = c("factor", "integer","factor", "numeric", "integer", "integer"))
summary(titanic)
#

#data transformation, binde siblings, spouses, children and parents sammen til family
fam = titanic[5] + titanic[6]; colnames(fam) <- "family" #hvor mange familiemedlemmer har vedkommende på skibet
titanic <- cbind(titanic[1:4], fam)
rm(fam)
#


#
T_na <- subset(titanic, is.na(age)); print(nrow(T_na))
T_not_na <- subset(titanic, !is.na(age)); print(nrow(T_not_na))
#

#grupperinger af NA'er
NAmatrix = matrix( c(1, 0, 0, 2, 0, 0, 3, 0, 0),nrow=3, ncol=3, byrow = TRUE) 
colnames(NAmatrix) <- c("Pclass", "Alone", "With someone"); rownames(NAmatrix) <- c("First class", "Second class", "Third class")

for (i in 1:nrow(T_na))
{
  if (T_na[i,5] == 0 & T_na[i,1]==1)
  {
    NAmatrix[1,2] <- as.numeric(NAmatrix[1,2]) + 1 
  }
  
  else if (T_na[i,5] == 0 & T_na[i,1]==2)
  {
    NAmatrix[2,2] <- as.numeric(NAmatrix[2,2]) + 1 
  }
  
  else if (T_na[i,5] == 0 & T_na[i,1]==3)
  {
    NAmatrix[3,2] <- as.numeric(NAmatrix[3,2]) + 1  
  }
  
  else if (T_na[i,5] > 0 & T_na[i,1]==1)
  {
    NAmatrix[1,3] <- as.numeric(NAmatrix[1,3]) + 1  
  }
  
  else if (T_na[i,5] > 0 & T_na[i,1]==2)
  {
    NAmatrix[2,3] <- as.numeric(NAmatrix[2,3]) + 1 
  }
  
  else if (T_na[i,5] > 0 & T_na[i,1]==3)
  {
    NAmatrix[3,3] <- as.numeric(NAmatrix[3,3]) + 1 
  }
  
}
# Hvordan viser vi at NA "with someone" er familier. Således at vi kan forklare at det var fordi hele familien døde.

NNAmatrix = matrix( c(0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0),nrow=6, ncol=3, byrow = TRUE) 
colnames(NNAmatrix) <- c("Young", "Middle", "Old"); rownames(NNAmatrix) <- c("1 class alone", "1 class w. someone", "2 class alone", "2 class w. someone", "3 class alone", "3 class w. someone")
for (i in 1:nrow(T_not_na))
{
  if (T_not_na[i,5] == 0 & T_not_na[i,1]==1 & T_not_na[i,4] <= 20.00)
  {
    NNAmatrix[1,1] <- as.numeric(NNAmatrix[1,1]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==1 & T_not_na[i,4] <= 20.00)
  {
    NNAmatrix[2,1] <- as.numeric(NNAmatrix[2,1]) + 1 
  }
  
  else if (T_not_na[i,5] == 0 & T_not_na[i,1]==2 & T_not_na[i,4] <= 20.00)
  {
    NNAmatrix[3,1] <- as.numeric(NNAmatrix[3,1]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==2 & T_not_na[i,4] <= 20.00)
  {
    NNAmatrix[4,1] <- as.numeric(NNAmatrix[4,1]) + 1 
  }
  
  else if (T_not_na[i,5] == 0 & T_not_na[i,1]==3 & T_not_na[i,4] <= 20.00)
  {
    NNAmatrix[5,1] <- as.numeric(NNAmatrix[5,1]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==3 & T_not_na[i,4] <= 20.00)
  {
    NNAmatrix[6,1] <- as.numeric(NNAmatrix[6,1]) + 1 
  }
  
  
  
  else if (T_not_na[i,5] == 0 & T_not_na[i,1]==1 & T_not_na[i,4] >= 65.00 )
  {
    NNAmatrix[1,3] <- as.numeric(NNAmatrix[1,3]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==1 & T_not_na[i,4] >= 65.00)
  {
    NNAmatrix[2,3] <- as.numeric(NNAmatrix[2,3]) + 1 
  }
  
  
  else if (T_not_na[i,5] == 0 & T_not_na[i,1]==2 & T_not_na[i,4] >= 65.00)
  {
    NNAmatrix[3,3] <- as.numeric(NNAmatrix[3,3]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==2 & T_not_na[i,4] >= 65.00)
  {
    NNAmatrix[4,3] <- as.numeric(NNAmatrix[4,3]) + 1 
  }
  
  
  else if (T_not_na[i,5] == 0 & T_not_na[i,1]==3 & T_not_na[i,4] >= 65.00)
  {
    NNAmatrix[5,3] <- as.numeric(NNAmatrix[5,3]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==3 & T_not_na[i,4] >= 65.00)
  {
    NNAmatrix[6,3] <- as.numeric(NNAmatrix[6,3]) + 1 
  }
  
  
  
  
  
  else if (T_not_na[i,5] == 0 & T_not_na[i,1]==1 & T_not_na[i,4] < 65.00 & T_not_na[i,4] > 20.00)
  {
    NNAmatrix[1,2] <- as.numeric(NNAmatrix[1,2]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==1 & T_not_na[i,4] < 65.00 & T_not_na[i,4] > 20.00)
  {
    NNAmatrix[2,2] <- as.numeric(NNAmatrix[2,2]) + 1 
  }
  
  
  else if (T_not_na[i,5] == 0 & T_not_na[i,1]==2 & T_not_na[i,4] < 65.00 & T_not_na[i,4] > 20.00)
  {
    NNAmatrix[3,2] <- as.numeric(NNAmatrix[3,2]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==2 & T_not_na[i,4] < 65.00 & T_not_na[i,4] > 20.00)
  {
    NNAmatrix[4,2] <- as.numeric(NNAmatrix[4,2]) + 1 
  }
  
  
  else if (T_not_na[i,5] == 0 & T_not_na[i,1]==3 & T_not_na[i,4] < 65.00 & T_not_na[i,4] > 20.00)
  {
    NNAmatrix[5,2] <- as.numeric(NNAmatrix[5,2]) + 1 
  }
  
  else if (T_not_na[i,5] > 0 & T_not_na[i,1]==3 & T_not_na[i,4] < 65.00 & T_not_na[i,4] > 20.00)
  {
    NNAmatrix[6,2] <- as.numeric(NNAmatrix[6,2]) + 1 
  }
  
  else {print(i & T_not_na[i,4])}
  
  
}

print(titanic %>% count(pclass)); print("and average age is:");print(mean(T_not_na$age))
Fem_surv<- subset(titanic, survived==1 & sex=="female" )
Male_surv <- subset(titanic, survived==1 & sex=="male")
nrow(subset(titanic, family > 4 & sex=="male" & age < 9.5))
surv = Male_surv %>% count(age); print(surv)

shuffle_index <- sample(1:nrow(titanic))
titanic_shuffle <- titanic[shuffle_index, ]
glimpse(titanic_shuffle)


library(rpart)
library(rpart.plot)
fit <- rpart(survived~., data = titanic_shuffle, method = 'class')
rpart.plot(fit, type=4, extra = 106)


fit <- rpart(survived ~ sex + pclass +(age + family),
             data=titanic,
             method="class")

plot(fit)
text(fit)
fancyRpartPlot(fit)



glmp <- glm(titanic_NAM, family = binomial(link=logit), data=titanic_NAM)
coefficients(glmp)
glmb <- fortify(glmp)
grid.arrange(
  qplot(.fitted, .resid, data=glmb, alpha=I(0.2)) + geom_smooth(),
  qplot(.resid, data=glmb, bins=I(40)),
  qplot(sample = .stdresid, data=glmb, geom="qq") + geom_abline(),
        ncol = 3
  
)

qplot(survived, sexmale, data =titanic_NAM, geom="line", color= "red") + ylab("test")




print(nrow(subset(titanic, survived==0 & sex=="female" )))
print(nrow(subset(titanic, survived==1 & sex=="male" )))

surv = titanic %>% count(survived); print(surv)
sexes = titanic %>% count(sex); print(sexes) #antal mænd og kvinder


tmp <- lapply(names(titanic), function(x) ggplot(titanic[, x, drop = FALSE])  + aes_string(x) + xlab(x) + ylab("")  )
gb <- geom_bar(fill = gray(0.5))
tmp[[1]] + gb + annotate(geom="text", x=1, y= 800, label=classes[1,2], color="black") + annotate(geom="text", x=2, y= 800, label=classes[2,2], color="black") + annotate(geom="text", x=3, y= 800, label=classes[3,2], color="black")
tmp[[2]] + gb + annotate(geom="text", x=0, y= 850, label=surv[1,2], color="black") + annotate(geom="text", x=1, y= 850, label=surv[2,2], color="black")

survived <- colnames(titanic)
died <- colnames(titanic)
for (i in 1:nrow(titanic))
{
  if (titanic[i,2] == 1)
  {
    survived <- rbind(survived, titanic[i,]) 
  }
  
  else if (titanic[i,2] == 0)
  {
    died <- rbind(died, titanic[i,])
  }

}
survived = survived[-1,];survived_na <- subset(survived, is.na(age)); 
died = died[-1,]; died_na <- subset(died, is.na(age));
runprocess = 1
while (runprocess == 1)
{
  library(ggplot2)    ## grammar of graphics
  library(reshape2)   ##reshaping data frames
  library(lattice)    ##More graphics
  library(hexbin)     ## ... and more graphics
  library(gridExtra)  ## even more graphics
  library(xtable)     ##Latex formatting of tables
  library(splines)    ##splines -- surprise :-)
  library(survival)   ##survival analysis
  library(grid)       ##for 'unit'
  library(lpSolve)    ##linear programming
  library(tidyverse)  ##
  library(tidyquant)  ## quant library 1
  library(quantmod)   ## quant library 2
  library(Quandl)     ## quant library 3
  library(fasttime)   ## time conversion
  library(xlsx)       ## omskrive til excel
  library(readxl)     ## read excel files
  library(readODS)    ## read ODS files
  library(xml2)       ## read xml files
  library(data.table)
  library(haven)
  library(dplyr)
  library(curl)
  library(jsonlite)
  library(plyr)
  runprocess = 0
}


color <- "##830E0D"
##########################################################################################################################################################
options(scipen=999)

#sadly at current this has to be added by hand.
stocks <- c("KO", "JPM");stocks = data.frame(symbol = stocks)

#can read, .csv, .txt, .xlsx, some website-data and stocks in above list with tq_get.
data = "C:\\Users\\Markb\\OneDrive\\Skrivebord\\Excel arks\\bogliste.xlsx" 

texcol = "no" #yes, no, true, false
NA_remove = "no" #yes, no, true, false

##########################################################################################################################################################
# data load process
runprocess = 1
while (runprocess == 1)
{
  #setup of basic stuff for running the process.
  #variables and functions
  from_d = '1980-01-01' #for downloading stockdata
  to_d   = '2022-12-01' #for downloading stockdata
  l <- list() #for finding the corresponding columns to matching names.
  substrRight <- function(x, n){substr(x, nchar(x)-n+1, nchar(x))} #for extracting the last letters in a string
  substrLeft <- function (x, n) {substr(x,1,n)}
  #######################################################
  if(substrRight(data, 4) == paste("xlsx")) 
  {
    data2 <- read.xlsx(data, 1)
  }
  else if (substrRight(data,4) == paste("xlsm"))
  {
    data2 <- read.xlsx(data, 1)
  }
  else if (substrRight(data,3) == paste("xls"))
  {
    data2 <- read.xlsx(data, 1)
  }
  
  #######################################################
  else if (substrRight(data,3) == paste("ods"))
  {
    data2 <- read_ods(data, sheet = 1)
  }
  else if (substrRight(data,3) == paste("xml"))
  {
    data2 <- read_xml(data)
  }
  
  #######################################################
  else if (substrRight(data,3) == paste("csv"))
  {
    data2 <- read.table(data)
    if (unlist(gregexpr('\"',data2[1,]))[1]>0) {data2 <- as.data.frame(sapply(data2, function(x) gsub("\"", "", x)))}
    else if (unlist(gregexpr('\"',data2[1,]))[2]>0) {data2 <- as.data.frame(sapply(data2, function(x) gsub("\"", "", x)))}
    
    if ( unlist(gregexpr(';', data2[1,]))[1]>0 ) {data2 <- read.table(data, sep = ";", header=TRUE)}
    else if ( unlist(gregexpr(';', data2[1,]))[2]>0 ) {data2 <- read.table(data, sep = ";", header=TRUE)}
    else if ( unlist(gregexpr(',', data2[1,]))[1]>0 ) {data2 <- read.table(data, sep = ",", header=TRUE)}
    else if ( unlist(gregexpr(',', data2[1,]))[2]>0 ) {data2 <- read.table(data, sep = ",", header=TRUE)}
    else if ( unlist(gregexpr(' ', data2[1,]))[1]>0 ) {data2 <- read.table(data, sep = " ", header=TRUE)}
    else if ( unlist(gregexpr(' ', data2[1,]))[2]>0 ) {data2 <- read.table(data, sep = " ", header=TRUE)}
    else {data2 <- read.table(data)}
    if (colnames(data2)[1] == paste0("V",1) & colnames(data2)[2] == paste0("V",2)) 
    {
      data2 <- read.table(data, header = TRUE)
    }
  }
  else if (substrRight(data,3) == paste("txt"))
  {
    data2 <- read.table(data)
    if (unlist(gregexpr('\"',data2[1,]))[1]>0) {data2 <- as.data.frame(sapply(data2, function(x) gsub("\"", "", x)))}
    else if (unlist(gregexpr('\"',data2[1,]))[2]>0) {data2 <- as.data.frame(sapply(data2, function(x) gsub("\"", "", x)))}
    
    if ( unlist(gregexpr(';', data2[1,]))[1]>0 ) {data2 <- read.table(data, sep = ";", header=TRUE)}
    else if ( unlist(gregexpr(';', data2[1,]))[2]>0 ) {data2 <- read.table(data, sep = ";", header=TRUE)}
    else if ( unlist(gregexpr(',', data2[1,]))[1]>0 ) {data2 <- read.table(data, sep = ",", header=TRUE)}
    else if ( unlist(gregexpr(',', data2[1,]))[2]>0 ) {data2 <- read.table(data, sep = ",", header=TRUE)}
    else if ( unlist(gregexpr(' ', data2[1,]))[1]>0 ) {data2 <- read.table(data, sep = " ", header=TRUE)}
    else if ( unlist(gregexpr(' ', data2[1,]))[2]>0 ) {data2 <- read.table(data, sep = " ", header=TRUE)}
    else {data3 <- read.table(data)}
    if (colnames(data2)[1] == paste0("V",1) & colnames(data2)[2] == paste0("V",2))  
    {
      data2 <- read.table(data, header = TRUE)
    }
  }
  
  #######################################################
  else if (substrRight(data,3) == paste("dta"))
  {
    data2 <- read_stata(NULL)
  }
  else if (substrRight(data,8) == paste("sas7bdat"))
  {
    data2 <- read_sas(NULL, NULL)
  }
  
  #######################################################
  else if (substrLeft(data,4) == paste("www."))
  {
    data2 <- read.table(data) 
  }
  else if (is.null(
    for(x in 1:nrow(stocks))
    {
      if ( (unlist(gregexpr(stocks[x,1], data, TRUE))>0)  & (substrRight(data,2) == substrRight(stocks,2)) & (substrLeft(data,2) == substrLeft(stocks,2)) )
      {
        cat("This is stock number",print(x),"on the list")
      }
    }
  )
  ) 
  {
    data2 <- tq_get(data, get="stock.prices", from = from_d,to = to_d, period = "daily")
    # skip_to_next <- FALSE
    # tryCatch({
    #  a <- tq_get(x, get="dividends", from = from_d, to = to_d)
    #  write.xlsx(a, paste(path,x,".xlsx", sep=""), sheetName = "Dividend", append=FALSE)
    # },error = function(e) {skip_to_next = TRUE})
    # if(skip_to_next) {next}
    # b <- tq_get(x, get="stock.prices", from = from_d,to = to_d, period = "daily")            # daily stock prices
    # c <- tq_get(x, get="stock.prices",from = from_d, to = to_d)%>%
    #  tq_transmute(select = close, mutate_fun = to.period, period = "weeks")                   # weekly transform
    # d <- tq_get(x, get="stock.prices",from = from_d, to = to_d)%>%
    #  tq_transmute(select = close,mutate_fun = to.period, period = "months")                   # montly transform
    # write.xlsx(b, paste(path,x,".xlsx", sep=""), sheetName = "Daily", append=TRUE)      # write excel for dividends
    # write.xlsx(c, paste(path,x,".xlsx", sep=""), sheetName = "Weekly", append=TRUE)      # write excel for dividends
    # write.xlsx(d, paste(path,x,".xlsx", sep=""), sheetName = "Monthly", append=TRUE)     # write excel for dividends
    # yeardifs <- c((tail(d,1)[1,2]-tail(d,3)[1,2])/tail(d,3)[1,2], (tail(d,1)[1,2]-tail(d,12)[1,2])/tail(d,12)[1,2],(tail(d,1)[1,2]-tail(d,36)[1,2])/tail(d,36)[1,2],(tail(d,1)[1,2]-tail(d,60)[1,2])/tail(d,60)[1,2])
    # meanvals <- c(sum(tail(d,3)[1:3,2])/3,sum(tail(d,12)[1:12,2])/12,sum(tail(d,36)[1:36,2])/36,sum(tail(d,60)[1:60,2])/60)
    # volatilvals <- c((max(tail(d,3)[,2])-min(tail(d,3)[,2]))/meanvals[1],(max(tail(d,12)[,2])-min(tail(d,12)[,2]))/meanvals[2],(max(tail(d,36)[,2])-min(tail(d,36)[,2]))/meanvals[3],(max(tail(d,60)[,2])-min(tail(d,60)[,2]))/meanvals[4])
    # h <- cbind(yeardifs,meanvals,volatilvals)
    #rownames(h) <- c("3month","1year", "3year", "5year")
    #
    #write.xlsx(h, paste(path,x,".xlsx", sep=""), sheetName = "financials", append=True)
  }
  
  if (texcol == "yes" | texcol == "Yes" | texcol == "YES"| texcol == "1" | texcol == "y" | texcol == "true" | texcol == "True" | texcol == "TRUE")
  {
    data3 <- list()
    cat("you have decided to remove text columns\n")
    for (x in 1:ncol(data2))
    {
      if (is.character(data2[,x][[1]]))
      {
        cat("column",x,"is a column containing text\n")
      }
      else if (is.numeric(data2[,x][[1]]))
      {
        l[x] = x
        data3 <- append(data3, data2[,x][[1]])
        data <- data.frame(matrix(unlist(data3), nrow = nrow(data2), byrow = FALSE)) #aktie = (nrow = nrow(data2), byrow = FALSE)
      }
      else
      {print("something went wrong")}
    }
    for (i in 1:length(data))
    {
      if (l[i] == "NULL")
      {k <- l[ - which(l == "NULL")]}
      else {k <- append(l,l[i])
      k <- k[-which(duplicated(k))]}
    }
    kp = ncol(data) 
    j = 1
    for (i in 1:kp)
    {
      if (k[i] != "NULL")
      {
        colnames(data)[i] = colnames(data2)[k[[j]]]
      }
      else if (k[i] == "NULL") 
      {
        j = i+1
        colnames(data)[i] = colnames(data2)[k[[j]]]
        kp = kp + 1
      }
      j = j+1
    }
  }
  else if (texcol == "no" | texcol == "No" | texcol == "NO" | texcol == "0" | texcol == "n" | texcol == "false" | texcol == "False" | texcol == "FALSE")
  {
    data <- data2
    cat("you have decided not to remove text columns\n")
    for (x in 1:ncol(data))
    {
      if (is.character(data[,x]))
      {
        cat("column",x,"is a column containing text\n")
      }
    }
    
  }
  else 
  {
    data <- data2
    cat("you haven't responded to the question on whether to remove text columns\n")
    for (x in 1:ncol(data))
    {
      if (is.character(data[,x]))
      {
        cat("column",x,"is a column containing text\n")
      }
    }
  }
  
  if (NA_remove == "yes" | NA_remove == "Yes" | NA_remove == "YES"| NA_remove == "1" | NA_remove == "y" | NA_remove == "true" | NA_remove == "True" | NA_remove == "TRUE")
  {
    data <- na.omit(data)
    cat("You have decided to remove NAs & NULLs\n")
  }
  else if (NA_remove == "no" | NA_remove == "No" | NA_remove == "NO"| NA_remove == "0" | NA_remove == "n" | NA_remove == "false" | NA_remove == "False" | NA_remove == "FALSE")
  {
    data <- data
    cat("You have decided not to remove NAs & NULLs\n") 
  }
  else
  {
    data <- data
    cat("You haven't responded to the question on whether to remove NAs & NULLs")  
  }
  for (i in 1:ncol(data))
  {
    if (i == 1) {cat(paste("data loaded!!! \nyou can now choose between\n\n"))}
    cat(paste(colnames(data)[i], collapse = " "), "\n")
  }
  rm(data2, from_d, stocks, l, i, NA_remove, texcol, to_d, x)
  runprocess = 0
}

summary(data)
