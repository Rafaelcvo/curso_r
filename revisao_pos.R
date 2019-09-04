#instalando os pacotes
install.packages("knitr")
install.packages("ggplot2")
install.packages("broom")
install.packages("ggfortify")
install.packages("readxl")
install.packages("PerformanceAnalytics")
#install.packages("car")
install.packages("MASS")
install.packages("pscl")

#carregando os pacotes
library(knitr)
library(dplyr)
library(ggplot2)
library(broom)
library(ggfortify)
library(readxl)
library(PerformanceAnalytics)
#library(car)
library(MASS)
library(pscl)

#Exercicio 1
# Regressão Linear Simples
# Como parte de um teste de energia solar, foi mensurado o total de fluxo de 
# calor (Heatflux). Deseja-se examinar se o total de fluxo de calor (HeatFlux) 
# pode ser previsto pela posição dos pontos focais nas direções leste (East), 
# sul (South) e norte (North).
# O arquivo com os dados estão em Heatflux.xlsx
HeatFlux <- read_excel("/home/rafael/git/curso_r/Heatflux.xlsx")
HeatFlux

# a) Faça uma matriz de dispersão entre as quatro variáveis desse estudo.
chart.Correlation(HeatFlux)

# b) Construa um modelo de regressão linear simples para cada par de 
#    variável: Heatflux vs East, Heatflux vs South e Heatflux vs North.
regr1 <- lm(HeatFlux ~ East, data = HeatFlux)
summary(regr1)
regr2 <- lm(HeatFlux ~ South, data = HeatFlux)
summary(regr2)
regr3 <- lm(HeatFlux ~ North, data = HeatFlux)
summary(regr3)
# c) Qual dos três modelos melhor explica o total de fluxo de calor?











