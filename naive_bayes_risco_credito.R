base <- read.csv("risco-credito.csv")

install.packages('e1071')
library(e1071)

classif <- naiveBayes(x = base[-5], y = base$risco)

base[-5]

print(classif)

#histotia: boa, divida:alta, garantias:nunhuma, renda:>35
#historia: ruim, divida:alta, garantias: adequada, renda: <15
historia = c('boa')
divida = c('alta')
garantias = c('nenhuma')
renda = c('acima_35')
df <- data.frame(historia, divida, garantias, renda)
prev <- predict(classif, newdata = df, 'raw')
print(prev)

#teste com o segundo historico
historia = c('ruim')
divida = c('alta')
garantias = c('adequada')
renda = c('0_15')
df <- data.frame(historia, divida, garantias, renda)
prev <- predict(classif, newdata = df, 'raw')
print(prev)
