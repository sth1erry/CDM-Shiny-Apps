#read packages
library(data.table)
library(readr)
library(janitor)
library(dplyr)
library(ggplot2)
library(ggfortify)
library(fable)
library(rlang)
library(cluster)
library(devtools)
install_github('sinhrks/ggfortify')
library(ggfortify); library(ggplot2)

#import datasets

expression <- fread("C:\\Users\\sindimwo\\Downloads\\R-Directory\\CCLE_expression.csv")
mutations <- fread("C:\\Users\\sindimwo\\Downloads\\R-Directory\\CCLE_mutations.csv")
metadata <- fread("C:\\Users\\sindimwo\\Downloads\\R-Directory\\sample_info.csv")
metadata_shiny <- fread("C:\\Users\\sindimwo\\Downloads\\R-Directory\\sample_info.csv")
dependency <- fread("C:\\Users\\sindimwo\\Downloads\\R-Directory\\CRISPR_gene_dependency.csv")
effect <- fread("C:\\Users\\sindimwo\\Downloads\\R-Directory\\CRISPR_gene_effect.csv")
expression <- as.data.frame(expression)
names(expression)[1] <- "DepMap_ID" #rename "V1" column to "DepMap_ID"
metadata <- as.data.frame(metadata[ , c("DepMap_ID", "age", "sex", "primary_disease", "primary_or_metastasis", "lineage")])


#removing rows w/ strings to prepare for PCA

metadata <- metadata[- grep("Adult", metadata$age),]
metadata <- metadata[- grep("Pediatric", metadata$age),]
metadata <- metadata[- grep("Fetus", metadata$age),]
met_exp <- merge(metadata, expression, by.x = "DepMap_ID") 

met_expPCA <- prcomp(met_exp[ , -c(1:6)], scale. = TRUE, center = TRUE)
summary(met_expPCA)
str(met_expPCA)
ggplot2::autoplot(met_expPCA, data = met_exp, colour = "sex") #PCA of sex
ggplot2::autoplot(met_expPCA, data = met_exp, colour = "lineage") #PCA of lineage
ggplot2::autoplot(met_expPCA, data = met_exp, colour = "primary_disease")#PCA of primary disease

PCA_results <- met_expPCA$x
PCA_df <- cbind(met_exp[ , c(1:6)], PCA_results)
PCA_data <- write.csv(PCA_df, "PCA_data.csv") #working directory is in Documents

library(plotly)

results = met_expPCA$x #saving just the scores i.e. hthe value each sample has on each prinicpal component; met_exp$rotation displays the loadings i.e. the weight that each variable contributes to the principal component
results = results[ , c(1,2,3)]
test = cbind(met_exp[ , c(1:6)], results)

plot_ly(data = test, x = ~PC1, y = ~PC2, z = ~PC3, color= ~age, symbol = ~sex, symbols = c('x','o'),text = ~paste("Cell line: ", DepMap_ID, '$<br>Primary Disease:', primary_disease))

plot_ly(data = test, x = ~PC1, y = ~PC2, color= ~age, symbol = ~sex, symbols = c('x','o'),text = ~paste("Cell line: ", DepMap_ID, '$<br>Primary Disease:', primary_disease))

plot_ly(data = test, x = ~PC1, y = ~PC2, color= ~sex, text = ~paste("Cell line: ", DepMap_ID, '$<br>Primary Disease:', primary_disease))

save(met_expPCA, file = "met_expPCA.Rdata")