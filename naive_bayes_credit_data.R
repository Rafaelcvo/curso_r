#carregando a base de dados
base <- read.csv("credit-data.csv")

#limpando o dataset. Foi apagado a coluna cliente
base$clientid = NULL

#substituindo os valores pela media
base$age = ifelse(base$age < 0, 40.92, base$age)

#substituindo NA pela media
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#escalonamento
base[, 1:3] = scale(base[,1:3])

#Encode de classe
base$default <- factor(base$default, levels = c(0,1))

#carregando as bibliotecas
library(caTools)
library(e1071)
library(caret)
set.seed(1)

#quebrando a base de dados
divisao = sample.split(base$default, SplitRatio = 0.75)
x_treino = subset(base, divisao == TRUE)
x_teste = subset(base, divisao == FALSE)

#criando o classificador da base de treinamento
classif = naiveBayes(x = x_treino[-4], y = x_treino$default)
previsoes <- predict(classif, newdata = x_teste[-4])
matriz_confusao = table(x_teste[,4], previsoes)
print(matriz_confusao)

confusionMatrix(matriz_confusao)







# #calculando taxa de acerto e erros
# acertos <- ((416+42)/500)*100
# erros <-((29+13)/500)*100
# sprintf("Acetos: %.2f - Erros: %.2f", acertos,erros)



