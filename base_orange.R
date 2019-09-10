data(Orange)

#chegar dados com grafico de pontos
plot(Orange$age, Orange$circumference)

#correlação de Pearson
cor(Orange$age, Orange$circumference)

#teste estatistico
cor.test(Orange$age, Orange$circumference)
