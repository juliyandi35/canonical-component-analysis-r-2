bioData <- read.csv("http://msekce.karlin.mff.cuni.cz/~maciak/NMST539/bioData.csv", header = T)
chemData <- read.csv("http://msekce.karlin.mff.cuni.cz/~maciak/NMST539/chemData.csv", header = T)

head(bioData)
head(chemData)

ind <- match(chemData[,1], bioData[,1])
data <- data.frame(bioData[ind, ], chemData[, 2:8])

X <- data[,2:9]
Y <- data[,19:25]

library(CCA)
correl <- matcor(X, Y )
img.matcor(correl, type = 2)

cc1 <- cancor(X, Y)  ### function from standard R instalation
cc2 <- cc(X, Y)      ### function for the R package 'CCA'

cc1$cor  ### function from standard R instalation
cc2$cor  ### function for the R package 'CCA'

par(mfrow = c(1,2))
barplot(cc1$cor, main = "Canonical correlations for 'cancor()'", col = "gray")
barplot(cc2$cor, main = "Canonical correlations for 'cc()'", col = "gray")

cc1$xcoef  ### function from standard R instalation
cc2$xcoef  ### function for the R package 'CCA'
cc1$ycoef
cc2$ycoef

plt.cc(cc2, var.label = TRUE, ind.names = data[,1])

library(vegan)
cc3 <- cca(X, Y)

plot(cc3, scaling = 1)

