# Sindimwo Thesis
Sindimwo Thesis 


**##Version 2:

The 2nd version of the dashboard contains a dropdown menu that allows users to select a primary disease. The outputs will be a PCA plot, a heatmap, and a table with differentially expressed genes (and their FC scores in treatment vs control conditions). 

To load the plots, these files will need to be downloaded:

1. breast_PCA_data.csv 
2. breast_normalized_matrix.csv
3. breast_table.csv


### Version 1:

I have one working version, currently it does the PCA and displays the results and let the user color by metadata. It is in directoyr "Version1". 

#### How to:

1. Download the files from database. We are using the files:
    - link1
    - link2
2. Run "mainScript.R" inside the "DataProcessing" directory.
    - input: the files above
    - output: "PCA_data.csv". This file has the results of the PCA, the loadings of each cell type in the first 10 components (have to cahnge to filter out higher components).
3. Move the "PCA_data.csv" to the Version1 derictory and run "mainDash1.R"

