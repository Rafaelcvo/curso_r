#carregando a base de dados
base <- read.csv("/home/rafael/git/curso_r/credit-data.csv")

#limpando o dataset. Foi apagado a coluna cliente
base$clientid = NULL
summary(base)

#selecionando idadea menores que 0 e mostrando todas as colunas
base[base$age < 0, ]

#retirando o NA da selecao
idad_inval = base[base$age < 0 & !is.na(base$age), ]

#calcular a media da idade para substituir valores invalidos
#primeiro metodo
mean(base$age, na.rm = TRUE)
media = base[base$age > 0 & !is.na(base$age), ]
mean(media$age)

#segundo metodo 
mean(base$age[base$age > 0], na.rm = TRUE)

#substituindo os valores pela media
base$age = ifelse(base$age < 0, 40.92, base$age)

#substituindo NA pela media
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

mean(base$age)

#escalonamento
base[, 1:3] = scale(base[,1:3])

#pacote para fazer a divisao
install.packages('caTools')
library(caTools)
set.seed(1)

#quebrando a base de dados
divisao = sample.split(base$default, SplitRatio = 0.75)

x_treino = subset(base, divisao == TRUE)
x_teste = subset(base, divisao == FALSE)









