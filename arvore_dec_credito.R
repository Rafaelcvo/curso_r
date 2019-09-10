library(rpart)
library(rpart.plot)

base <- read.csv("datasets/risco-credito.csv")
View(base)

classif <- rpart(formula = risco ~ ., data = base, control = rpart.control(minbucket = 1))
print(classif)
plot(classif)
text(classif)

rpart.plot(classif)

#criando uma classificaçaão de registros novos
historia <- c('boa', 'ruim')
divida <- c('alta', 'alta')
garantias <- c('nenhuma', 'adequada')
renda <- c('acima_35', '0_15')
df <- data.frame(historia, divida, garantias, renda)

previsoes <- predict(classif, newdata = df)
print(previsoes)
