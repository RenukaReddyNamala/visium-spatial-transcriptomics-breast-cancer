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
### Marker Gene Identification and Annotation

Cluster-specific marker genes were identified using differential expression analysis with Seurat. Marker selection was based on minimum expression frequency and log-fold change thresholds. Clusters were manually annotated using known breast cancer–related marker genes to assign biologically meaningful labels to spatial domains.

Spatial domains were identified using graph-based clustering on the PCA-reduced data. Cluster assignments were visualized in their spatial context by overlaying results on the corresponding histology image, enabling interpretation of spatially distinct tissue regions.
## Results

### Spatial Domain Identification

Distinct spatial domains were identified across the tissue section, revealing structured organization within the breast cancer sample. Spatial clustering highlighted regions corresponding to tumor-rich areas, immune-associated regions, and surrounding stromal compartments.

### Marker Gene Expression Patterns

Cluster-specific marker genes displayed spatially restricted expression patterns consistent with known breast cancer biology. These patterns supported the biological annotation of spatial domains and demonstrated clear tissue heterogeneity.
