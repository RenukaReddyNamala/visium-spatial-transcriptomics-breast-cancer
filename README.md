# Spatial Transcriptomic Profiling of Breast Cancer Using 10x Visium

This project presents a spatial transcriptomics analysis of a public breast cancer dataset generated using the 10x Genomics Visium platform. Using Seurat, spatial gene expression patterns were analyzed to identify distinct tissue regions and biologically meaningful spatial domains within the tumor microenvironment.

## Dataset

- Platform: 10x Genomics Visium
- Organism: Human
- Tissue: Breast cancer
- Data type: Spatial RNA-seq
- Source: Publicly available dataset
## Tools & Technologies

- R
- Seurat
- 10x Genomics Visium
- ggplot2
- dplyr
## Methods

### Data Preprocessing and Quality Control

Raw Visium spatial count data and corresponding histology images were loaded into Seurat. Low-quality spots were filtered based on total UMI counts, number of detected genes, and mitochondrial gene expression. Spatial visualization of QC metrics was used to ensure retention of tissue-associated spots while removing background noise.
### Normalization and Dimensionality Reduction

Gene expression data were normalized using the SCTransform method to correct for technical variation while preserving biological signal. Principal component analysis (PCA) was performed on the normalized data to reduce dimensionality, and informative principal components were selected for downstream spatial clustering.
### Spatial Clustering

Spatial domains were identified using graph-based clustering on the PCA-reduced data. Cluster assignments were visualized in their spatial context by overlaying results on the corresponding histology image, enabling interpretation of spatially distinct tissue regions.
