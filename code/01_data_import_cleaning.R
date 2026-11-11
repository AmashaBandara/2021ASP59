
# ==========================================
# Bioinformatics ICA 03
# Breast Cancer Classification
# Step 1: Data Import and Cleaning
# ==========================================

# 1. Locate dataset
data_file <- "data/raw/wdbc.data"

if (!file.exists(data_file)) {
  stop("Dataset file wdbc.data was not found.")
}

# 2. Define column names
features <- c(
  "radius", "texture", "perimeter", "area",
  "smoothness", "compactness", "concavity",
  "concave_points", "symmetry",
  "fractal_dimension"
)

column_names <- c(
  "id",
  "diagnosis",
  paste0(features, "_mean"),
  paste0(features, "_se"),
  paste0(features, "_worst")
)

# 3. Import dataset
breast_cancer <- read.csv(
  data_file,
  header = FALSE,
  col.names = column_names
)

# 4. Convert diagnosis labels
breast_cancer$diagnosis <- factor(
  ifelse(
    breast_cancer$diagnosis == "M",
    "Malignant",
    "Benign"
  ),
  levels = c("Benign", "Malignant")
)

# 5. Check dataset dimensions
dim(breast_cancer)

# 6. Check structure
str(breast_cancer)

# 7. Display first six rows
head(breast_cancer)

# 8. Check missing values
colSums(is.na(breast_cancer))

# 9. Diagnosis distribution
table(breast_cancer$diagnosis)

# 10. Save cleaned dataset
dir.create(
  "data/processed",
  recursive = TRUE,
  showWarnings = FALSE
)

write.csv(
  breast_cancer,
  "data/processed/breast_cancer_clean.csv",
  row.names = FALSE
)

# 11. Summary
summary(breast_cancer)

# End of script
