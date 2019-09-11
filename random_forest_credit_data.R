#leitura dos dados
base <- read.csv("datasets/credit-data.csv")

#apaga a coluna clienteID
base$clientid <- NULL

#valores inconsistentes
base$age <- ifelse(base$age < 0, 40.92, base$age)

#Valores faltantes
base$age <- ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#Escalonamento
base[, 1:3] <- scale(base[,1:3])

# Enconding para a classe ser transformada em 0 e 1
base$default <- factor(base$default, levels = c(0,1))

#Divisao entre treino e teste
library(caTools)
set.seed(1)
div <- sample.split(base$income, SplitRatio = 0.75)
base_treino <- subset(base, div == TRUE)
base_teste <- subset(base, div == FALSE)

# Random Forest
install.packages("randomForest")
library(randomForest)
library(caret)
set.seed(1)
classificador <- randomForest(x = base_treino[-4], y = base_treino$default, ntree = 30)
previsoes <- predict(classificador, newdata = base_teste[-4])
matriz_confusao <- table(base_teste[,4], previsoes)
print(matriz_confusao)

# Mostrando as estatisticas
confusionMatrix(matriz_confusao)



