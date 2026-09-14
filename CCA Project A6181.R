library(readxl)
X <- read_excel("data.xlsx",sheet = "spesies")
X <- X[,4:36]
str(X)

Y <- read_excel("data.xlsx",sheet = "parameter lingkungan")
Y <- Y[,4:15]
Y <- data.frame(Y)
str(Y)

for (i in 1:ncol(Y)) {
  Y[,i] <- as.numeric(Y[,i])
}
str(Y)

# Melihat korelasi antar data
library(CCA)
correl <- matcor(X,Y)
img.matcor(correl, type = 2)

# Analisis CCA
cc <- cc(X, Y)
# Terdapat error karena terdapat data yang memiliki varians yang hampir 0, 
# maka akan dilakukan normalisasi data sebagai solusi

# Melihat varians setiap data
for (i in 1:ncol(X)) {
  print(var(X[,i]))
}

for (i in 1:ncol(Y)) {
  print(var(Y[,i]))
}

# Normalisasi Y
for (i in 1:ncol(Y)) {
  Y[,i] <- scale(Y[,i])
}

for (i in 1:ncol(Y)) {
  print(var(Y[,i]))
}

# Analisis CCA
cc <- cc(X, Y) # Masih error


