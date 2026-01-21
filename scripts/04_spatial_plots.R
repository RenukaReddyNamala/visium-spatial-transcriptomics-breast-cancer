# 04_spatial_plots.R
setwd("C:/Users/namal/Downloads/visium_breast_cancer")

library(Seurat)
library(ggplot2)

visium <- readRDS("visium_breast_cancer_seurat.rds")

# Ensure identities are original 0–11 clusters
Idents(visium) <- "seurat_clusters"

final.labels <- c(
  "Immune (B/T niche)",        # 0
  "Stroma (fibroblast)",       # 1
  "Activated stroma (CAF)",    # 2
  "Tumor (basal-like)",        # 3
  "Tumor (luminal/secretory)", # 4
  "Tumor (metabolic state)",   # 5
  "Mixed (IFN response)",      # 6
  "Tumor epithelial",          # 7
  "Tumor (metabolic/hypoxic)", # 8
  "Adipocytes",                # 9
  "Tumor (differentiated)",    # 10
  "Tumor (immune-modulatory)"  # 11
)
names(final.labels) <- levels(visium)
visium <- RenameIdents(visium, final.labels)

# Make folders (safe if they already exist)
dir.create("figures", showWarnings = FALSE)
dir.create("results", showWarnings = FALSE)

# Final labeled spatial plot
p_main <- SpatialDimPlot(
  visium,
  label = TRUE,
  label.size = 3.5,
  repel = TRUE
)

ggsave("figures/Fig1_spatial_clusters_labeled.png",
       plot = p_main, width = 8, height = 6, dpi = 300)

# Save final labeled object
saveRDS(visium, file = "visium_breast_cancer_final_labeled.rds")

# Quick table of spot counts per label
write.csv(as.data.frame(table(Idents(visium))),
          "results/spot_counts_per_cluster.csv",
          row.names = FALSE)

p_main
