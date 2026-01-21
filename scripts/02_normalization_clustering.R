# 02_normalization_clustering.R
setwd("C:/Users/namal/Downloads/visium_breast_cancer")

library(Seurat)
library(ggplot2)

# Load raw seurat object (before labels)
visium <- readRDS("visium_breast_cancer_seurat.rds")

# Show the clustering distribution (0–11)
Idents(visium) <- "seurat_clusters"
print(table(Idents(visium)))

# Optional: quick sanity plot (no labels)
dir.create("figures", showWarnings = FALSE)
p0 <- SpatialDimPlot(visium, label = TRUE, label.size = 3) + NoLegend()
ggsave("figures/QC_spatial_clusters_unlabeled.png", plot = p0, width = 8, height = 6, dpi = 300)

# Save object again (safe checkpoint)
saveRDS(visium, file = "visium_breast_cancer_seurat.rds")
