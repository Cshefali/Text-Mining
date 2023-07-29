#Commonly Used Regular Expressions in R
#Author- Shefali C.
#Last updated- July 29, 2023

library(tidyverse)


#data prep
dates <- c("23-04-2023", "11/05/2019", "06.05.1999", "15-12-2020",
           "13/02/2001", "04 09 2010", "18*01*1986")
names <- c("Mr. jay", "Mr Shah", "Shefali", "Ajay Sinha", "Ms. Neha", 
           "Mrs. jaya Sahay", "Menka")
pincode <- c(800001, 248001, 304022, 800015, 248008, 801503, 171010)

data <- data.frame(name = names, date = dates, pin = pincode)

##DATES

#1. Filter rows where dates are of format dd/mm/yyyy

View(data[grep("\\d{2}/\\d{2}/\\d{4}", data$date),])

#2. Are there any rows where dates do not follow the pattern 'dd/mm/yyyy'

View(data[-grep("\\d{2}/\\d{2}/\\d{4}", data$date),])

#3. Rows which contain spaces as separator in date- 'dd mm yyyy'
View(data[grep(pattern = "\\d{2}\\s\\d{2}\\s\\d{4}", data$date),])

#4. Filter rows where separator in dates is * (asterisk), - (hyphen), .(dot)
View(data[grep(pattern = "\\d{2}[*-.]\\d{2}[*-.]\\d{4}", data$date),])

#5. Filter rows where year is after 2000.
View(data[grep(pattern = "\\d{2}.\\d{2}.2\\d{3}", data$date),])

##NAMES

#1. Filter rows with names having surnames
View(data[grep(pattern = "M[r|s|rs]", data$name),])

#2. Filter rows with only 1 name- i.e. only first name, only last name etc)
View(data[-grep(pattern = "\\s", data$name),])

#3. Filter rows with a full name, i.e. Title + First name + Last name
View(data[grep(pattern = "[a-Za-Z]\\s[a-zA-Z]\\s[a-zA-Z]",data$name),])
