# Carregando pacotes
install.packages('OneR')
library(OneR)

base <- read.csv("datasets/risco-credito.csv")

classificador <- OneR(x = base)
print(classificador)

# historia: boa, divida: alta, garantias: nenhuma, renda: >35
# historia: ruim, divida: alta, garantias: adequada, renda: <15
historia <- c('boa', 'ruim')
divida <- c('alta', 'alta')
garantias <- c('nenhuma', 'adequada')
renda <- c('acima_35', '0_15')
df <- data.frame(historia, divida, garantias, renda)

previsoes <- predict(classificador, newdata = df)
print(previsoes)













