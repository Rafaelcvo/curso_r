#Bibliotecas
library(caTools)
library(rpart)
library(rpart.plot)

#leitura da base
base <- read.csv("datasets/credit-data.csv")

#apagando a coluna cliente
base$clientid <- NULL

#valores faltantes 
base$age <- ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#escalonamento
base[,1:3] <- scale(base[,1:3])

#Encode da classe
base$default <- factor(base$default, levels = c(0,1))

# Divisao entre treinamento e teste
set.seed(1)
divisao <- sample.split(base$income, SplitRatio = 0.75)
base_treinamento <- subset(base, divisao == TRUE)
base_teste <- subset(base, divisao == FALSE)

classificador <- rpart(formula = default ~ ., data = base_treinamento)
print(classificador)
rpart.plot(classificador)

previsoes <- predict(classificador, newdata = base_teste[-4], type = "class")

#comparando as previsoes com os resultados
matriz_confusao <- table(base_teste[,4], previsoes)
print(matriz_confusao)

library(caret)
confusionMatrix(matriz_confusao)
