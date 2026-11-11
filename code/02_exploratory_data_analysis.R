
# ==========================================
# Bioinformatics ICA 03
# Step 2: Exploratory Data Analysis
# Diagnosis Distribution
# ==========================================

# Load package
library(ggplot2)

# Load cleaned dataset
breast_cancer <- read.csv(
  "data/processed/breast_cancer_clean.csv"
)

# Create diagnosis distribution chart
diagnosis_plot <- ggplot(
  breast_cancer,
  aes(x = diagnosis, fill = diagnosis)
) +
  geom_bar() +
  labs(
    title = "Breast Cancer Diagnosis Distribution",
    x = "Diagnosis",
    y = "Number of Samples"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Display chart
print(diagnosis_plot)

# Save chart
ggsave(
  "figures/01_diagnosis_distribution.png",
  plot = diagnosis_plot,
  width = 7,
  height = 5,
  dpi = 300
)

# End


# ==========================================
# Boxplot: Radius Mean by Diagnosis
# ==========================================

radius_plot <- ggplot(
  breast_cancer,
  aes(x = diagnosis, y = radius_mean, fill = diagnosis)
) +
  geom_boxplot() +
  labs(
    title = "Mean Radius by Breast Cancer Diagnosis",
    x = "Diagnosis",
    y = "Mean Radius"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Display chart
print(radius_plot)

# Save chart
ggsave(
  "figures/02_radius_boxplot.png",
  plot = radius_plot,
  width = 7,
  height = 5,
  dpi = 300
)

# ==========================================
# Correlation Analysis
# ==========================================

# Select mean measurement features
mean_features <- c(
  "radius_mean",
  "texture_mean",
  "perimeter_mean",
  "area_mean",
  "smoothness_mean",
  "compactness_mean",
  "concavity_mean",
  "concave_points_mean",
  "symmetry_mean",
  "fractal_dimension_mean"
)

# Calculate correlation matrix
correlation_matrix <- cor(
  breast_cancer[, mean_features]
)

# Convert matrix into data frame
correlation_data <- as.data.frame(
  as.table(correlation_matrix)
)

# Create correlation heatmap
correlation_plot <- ggplot(
  correlation_data,
  aes(x = Var1, y = Var2, fill = Freq)
) +
  geom_tile(color = "white") +
  scale_fill_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0,
    limits = c(-1, 1),
    name = "Correlation"
  ) +
  labs(
    title = "Correlation Between Mean Features",
    x = "Features",
    y = "Features"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1,
      size = 8
    ),
    axis.text.y = element_text(size = 8)
  )

# Display heatmap
print(correlation_plot)

# Save heatmap
ggsave(
  "figures/03_correlation_heatmap.png",
  plot = correlation_plot,
  width = 10,
  height = 8,
  dpi = 300
)

