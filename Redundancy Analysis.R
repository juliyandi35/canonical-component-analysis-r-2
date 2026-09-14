library(vegan)
data(varespec)
data(varechem)

rda_model <- rda(varespec ~ ., 
                 data = varechem)
plot(rda_model)

library(vegan)
data(dune)
data(dune.env)

rda_model <- rda(dune ~ .,
                 data = dune.env)
plot(rda_model)

library(vegan)
data(dune)
data(dune.env)

rda_model <- rda(dune ~ ., 
                 data = dune.env)
print(rda_model)