base <- read.csv("credit-data.csv")
base$clientid = NULL
summary(base)

idad_inval = base[base$age < 0 & !is.na(base$age),]
