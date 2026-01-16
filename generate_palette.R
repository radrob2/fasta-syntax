#!/usr/bin/env Rscript
# Generate maximally distinguishable nucleotide color palette using Polychrome
# Constrained for visibility on dark backgrounds (#1E1E1E)

library(Polychrome)

# Seed colors: pure red (A), pure blue (C), pure yellow (G), pure green (T)
seed_colors <- c("#FF0000", "#0000FF", "#FFFF00", "#00FF00")

cat("=== Generating Polychrome Palette for Dark Background ===\n\n")

# Key parameters for dark background visibility:
# - range: lightness range in CIE LUV space (0-100)
#   For dark bg (#1E1E1E ~ L=12), we want colors with L > 40 to be visible
# - target: "normal" balances distinguishability

# Method: constrain lightness to be bright enough for dark background
set.seed(42)
pal <- createPalette(
  N = 4,
  seedcolors = seed_colors,
  range = c(60, 95),  # Lightness: 60-95 (brighter for dark bg)
  target = "normal"
)

cat("Lightness range: 60-95 (brighter for dark background)\n\n")

hex_colors <- as.vector(pal)[1:4]
names(hex_colors) <- c("A", "C", "G", "T")

cat("=== Generated Colors ===\n")
for (i in seq_along(hex_colors)) {
  cat(sprintf("%s: %s\n", names(hex_colors)[i], hex_colors[i]))
}

# Check actual lightness values
cat("\n=== Lightness Values (CIE LUV) ===\n")
for (i in seq_along(hex_colors)) {
  rgb_val <- col2rgb(hex_colors[i])
  # Convert to relative luminance (simplified)
  r <- rgb_val[1,1] / 255
  g <- rgb_val[2,1] / 255
  b <- rgb_val[3,1] / 255
  # Approximate luminance
  lum <- 0.2126 * r + 0.7152 * g + 0.0722 * b
  cat(sprintf("%s: ~%.0f%% luminance\n", names(hex_colors)[i], lum * 100))
}

# VS Code settings output
cat("\n=== VS Code Settings ===\n")
cat('{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "', hex_colors[1], '" } },\n', sep="")
cat('{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "', hex_colors[2], '" } },\n', sep="")
cat('{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "', hex_colors[3], '" } },\n', sep="")
cat('{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "', hex_colors[4], '" } },\n', sep="")
cat('{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "', hex_colors[4], '" } }\n', sep="")

# Color distance matrix
cat("\n=== Pairwise Distances (higher = more distinguishable) ===\n")
cols <- hex_colors
dist_matrix <- matrix(0, 4, 4)
rownames(dist_matrix) <- colnames(dist_matrix) <- c("A", "C", "G", "T")

for (i in 1:4) {
  for (j in 1:4) {
    if (i != j) {
      rgb1 <- col2rgb(cols[i])
      rgb2 <- col2rgb(cols[j])
      dist_matrix[i,j] <- sqrt(sum((rgb1 - rgb2)^2))
    }
  }
}
print(round(dist_matrix, 0))
cat("\nMinimum distance:", round(min(dist_matrix[dist_matrix > 0]), 0), "\n")
