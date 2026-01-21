# 03_markers_annotation.R
setwd("C:/Users/namal/Downloads/visium_breast_cancer")

library(Seurat)
library(dplyr)

# Load object
visium <- readRDS("visium_breast_cancer_seurat.rds")

# Ensure identities are original 0–11 clusters
Idents(visium) <- "seurat_clusters"

# Markers for all clusters
markers12 <- FindAllMarkers(
  visium,
  only.pos = TRUE,
  min.pct = 0.25,
  logfc.threshold = 0.25
)

dir.create("results", showWarnings = FALSE)

# Top 10 markers per cluster (0–11)
top10_12 <- markers12 %>%
  group_by(cluster) %>%
  slice_max(order_by = avg_log2FC, n = 10)

write.csv(top10_12, "results/cluster_markers_top10.csv", row.names = FALSE)

# Apply your final manual labels (same as in 04 script)
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

visium_labeled <- RenameIdents(visium, final.labels)

# Save spot counts per label (nice for Results + README)
counts <- as.data.frame(table(Idents(visium_labeled)))
colnames(counts) <- c("Label", "Num_Spots")
write.csv(counts, "results/spot_counts_per_cluster.csv", row.names = FALSE)

# Save labeled object too (optional duplicate of 04 output, but safe)
saveRDS(visium_labeled, "visium_breast_cancer_final_labeled.rds")
