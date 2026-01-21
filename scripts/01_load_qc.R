# 01_load_qc.R
setwd("C:/Users/namal/Downloads/visium_breast_cancer")

library(Seurat)
library(ggplot2)

# 1) Load the raw Visium data (you already downloaded these)
# You must have:
# - filtered_feature_bc_matrix.h5
# - spatial/ folder
visium_raw <- Load10X_Spatial(
  data.dir = ".",
  filename = "filtered_feature_bc_matrix.h5",
  assay = "Spatial",
  slice = "breast_cancer"
)

# 2) Save as the starting object for your pipeline
saveRDS(visium_raw, "objects/visium_raw.rds")

# 3) Quick basic checks
print(visium_raw)
p_qc <- SpatialDimPlot(visium_raw)
p_qc
ggsave("figures/QC_raw_tissue.png", plot = p_qc, width = 8, height = 6, dpi = 300)
