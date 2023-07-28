#Commonly Used Regular Expressions in R
#Author- Shefali C.
#Last updated- July 28, 2023

library(tidyverse)


#data prep
dates <- c("23-04-2023", "11/05/2019", "06.05.1999", "15-12-2020",
           "13/02/2001", "04 09 2010", "18*01*1986")
names <- c("Mr. jay", "Mr Shah", "Shefali", "Ajay S.", "Ms. Neha", 
           "Mrs. jaya Sahay", "Menka")
pincode <- c(800001, 248001, 304022, 800015, 248008, 801503, 171010)

data <- data.frame(name = names, date = dates, pin = pincode)

##DATES

#1. Filter rows where dates are of format dd/mm/yyyy

View(data[grep("\\d{2}/\\d{2}/\\d{4}", data$date),])

#2. Are there any rows where dates do not follow the pattern 'dd/mm/yyyy'
##NOT WORKING
View(data[grep(pattern = "[^\\d{2}/\\d{2}/\\d{4}]", data$date),])

#3. Rows which contain spaces as separater in date- 'dd mm yyyy'
View(data[grep(pattern = "\\d{2}\\s\\d{2}\\s\\d{4}", data$date),])

#4. Filter rows where separater in dates is * (asterisk), - (hyphen), .(dot)
View(data[grep(pattern = "\\d{2}[*-.]\\d{2}[*-.]\\d{4}", data$date),])

#5. Filter rows where year is after 2000.
View(data[grep(pattern = "\\d{2}.\\d{2}.2\\d{3}", data$date),])

##NAMES

