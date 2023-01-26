﻿# Next steps

1. Ask user to pick a cancer type (eg primary disease)
2. Subset the dataset for cell lines that correspond to that cancer type only
3. Perform PCA, differential gene expression, and display age and sex distribution
for that cancer type and its associated dataset (would need to create multiple
datasets for each cancer type)
    - For the genes shown to be differentially expressed, create dendrograms of them and perform cluster analysis to see how similar/different they are

The theme is interactivity -- will seek to make plots as dynamic as possible

Packages:
dendrogram plots (collapsibletree package)
diff expression plots (deseq)
age and sex distribution plots (plotly)
PCA plots (plotly)