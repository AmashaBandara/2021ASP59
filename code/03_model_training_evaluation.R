
# ==========================================
# Bioinformatics ICA 03
# Breast Cancer Classification
# Step 3: Machine Learning Model
# ==========================================

# Load required package
library(randomForest)

# Load cleaned dataset
breast_cancer <- read.csv(
  "data/processed/breast_cancer_clean.csv"
)

# Convert diagnosis into factor
breast_cancer$diagnosis <- factor(
  breast_cancer$diagnosis,
  levels = c("Benign", "Malignant")
)

# Set random seed for reproducibility
set.seed(123)

# Stratified 80:20 Train-Test Split
train_indices <- unlist(
  lapply(levels(breast_cancer$diagnosis), function(class_name) {
    
    class_indices <- which(
      breast_cancer$diagnosis == class_name
    )
    
    sample(
      class_indices,
      size = floor(0.8 * length(class_indices))
    )
  })
)

# Create training and testing datasets
train_data <- breast_cancer[train_indices, ]

test_data <- breast_cancer[-train_indices, ]

# Check dataset dimensions
cat("Training Data:\n")
print(dim(train_data))

cat("Testing Data:\n")
print(dim(test_data))

# Check diagnosis distribution
cat("Training Diagnosis Distribution:\n")
print(table(train_data$diagnosis))

cat("Testing Diagnosis Distribution:\n")
print(table(test_data$diagnosis))

# End of Step 3.2

# Train Random Forest Classification Model
set.seed(123)

breast_cancer_model <- randomForest(
  diagnosis ~ . - id,
  data = train_data,
  ntree = 500,
  importance = TRUE
)

# Display model results
print(breast_cancer_model)

# Predict diagnosis using test data
predictions <- predict(
  breast_cancer_model,
  newdata = test_data
)

# Display first 10 predictions
head(predictions, 10)

# Create Confusion Matrix
confusion_matrix <- table(
  Actual = test_data$diagnosis,
  Predicted = predictions
)

print(confusion_matrix)

# Extract values from confusion matrix
TN <- confusion_matrix["Benign", "Benign"]
FP <- confusion_matrix["Benign", "Malignant"]
FN <- confusion_matrix["Malignant", "Benign"]
TP <- confusion_matrix["Malignant", "Malignant"]

# Calculate performance metrics
accuracy <- (TP + TN) / sum(confusion_matrix)

sensitivity <- TP / (TP + FN)

specificity <- TN / (TN + FP)

# Display results
cat("Accuracy:", round(accuracy * 100, 2), "%\n")
cat("Sensitivity:", round(sensitivity * 100, 2), "%\n")
cat("Specificity:", round(specificity * 100, 2), "%\n")


# Save trained model
saveRDS(
  breast_cancer_model,
  "output/breast_cancer_random_forest.rds"
)

# Save confusion matrix
write.csv(
  as.data.frame.matrix(confusion_matrix),
  "output/confusion_matrix.csv"
)

# Create evaluation metrics table
model_metrics <- data.frame(
  Metric = c("Accuracy", "Sensitivity", "Specificity"),
  Value = c(accuracy, sensitivity, specificity)
)

# Save evaluation metrics
write.csv(
  model_metrics,
  "output/model_evaluation_metrics.csv",
  row.names = FALSE
)

# Save Variable Importance Plot
png(
  "figures/04_variable_importance.png",
  width = 1200,
  height = 900,
  res = 150
)

varImpPlot(
  breast_cancer_model,
  main = "Random Forest - Variable Importance"
)

dev.off()
