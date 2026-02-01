# 📊 Data Analytics & ML - Quick Revision Guide

---

## 1️⃣ MEAN, MEDIAN, MODE

### **Mean (Average)**
```
Mean = Sum of all values / Number of values
     = Σx / n
```

| Property | Detail |
|----------|--------|
| Affected by outliers? | ✅ YES (heavily) |
| Best used when | Data is symmetric, no outliers |
| Can be calculated for | Only numerical data |

**Example:** Data: 2, 4, 6, 8, 10
Mean = (2+4+6+8+10)/5 = **6**

---

### **Median (Middle Value)**
```
Step 1: Arrange in ascending order
Step 2: 
  - If n is ODD → Middle element = (n+1)/2 th position
  - If n is EVEN → Average of (n/2)th and (n/2 + 1)th elements
```

| Property | Detail |
|----------|--------|
| Affected by outliers? | ❌ NO (robust) |
| Best used when | Data has outliers, skewed distribution |

**Example (Odd):** 3, 5, 7, 9, 11 → Median = **7**
**Example (Even):** 3, 5, 7, 9 → Median = (5+7)/2 = **6**

---

### **Mode (Most Frequent)**
```
Value that appears MAXIMUM times
```

| Property | Detail |
|----------|--------|
| Can have multiple modes? | ✅ YES (bimodal, multimodal) |
| Can have no mode? | ✅ YES (if all values unique) |
| Works for categorical data? | ✅ YES (only measure that does!) |

**Example:** 2, 3, 3, 4, 5 → Mode = **3**

---

### 🎯 **MCQ Trap: Relationship in Skewed Data**

```
RIGHT SKEWED (Positive):    Mean > Median > Mode
     ___
    /   \____
   
LEFT SKEWED (Negative):     Mean < Median < Mode
         ___
    ____/   \

SYMMETRIC:                  Mean = Median = Mode
```

---

## 2️⃣ VARIANCE & STANDARD DEVIATION

### **Variance (σ² or s²)**
Measures **spread** of data from the mean

```
Population Variance:  σ² = Σ(x - μ)² / N

Sample Variance:      s² = Σ(x - x̄)² / (n-1)   ← Bessel's correction
```

### **Standard Deviation (σ or s)**
```
SD = √Variance
```

| Property | Variance | Standard Deviation |
|----------|----------|-------------------|
| Units | Squared units | Same as original data |
| Interpretation | Hard | Easy |
| Always | ≥ 0 | ≥ 0 |

### 🎯 **MCQ Points:**
- **Why n-1 for sample?** → Bessel's correction (unbiased estimator)
- **If all values same** → Variance = 0, SD = 0
- **Adding constant to all values** → Variance UNCHANGED
- **Multiplying by constant k** → Variance becomes k² times, SD becomes k times

---

## 3️⃣ PERCENTILE & QUARTILE

### **Percentile**
```
Pth percentile = Value below which P% of data falls
```

**Example:** 
- 90th percentile = 85 marks means **90% students scored ≤ 85**

### **Quartiles (Divide data into 4 parts)**

```
Q0 = Minimum (0th percentile)
Q1 = 25th percentile (Lower Quartile)
Q2 = 50th percentile = MEDIAN
Q3 = 75th percentile (Upper Quartile)
Q4 = Maximum (100th percentile)
```

### **IQR (Interquartile Range)**
```
IQR = Q3 - Q1
```
Measures spread of **middle 50%** of data

```
|---25%---|---25%---|---25%---|---25%---|
Min      Q1        Q2        Q3       Max
         |___________|
              IQR
```

### 🎯 **MCQ Points:**
- Median = Q2 = 50th percentile
- IQR is **resistant to outliers**
- **Five Number Summary:** Min, Q1, Q2, Q3, Max

---

## 4️⃣ OUTLIERS

### **Definition**
Data points that are **significantly different** from other observations

### **Detection Methods**

#### **Method 1: IQR Method (Most Common in MCQs)**
```
Lower Bound = Q1 - 1.5 × IQR
Upper Bound = Q3 + 1.5 × IQR

If value < Lower Bound OR value > Upper Bound → OUTLIER
```

#### **Method 2: Z-Score Method**
```
Z = (x - mean) / SD

If |Z| > 3 → OUTLIER (typically)
If |Z| > 2 → Potential outlier
```

### **Handling Outliers**

| Method | When to Use |
|--------|-------------|
| Remove | If it's an error |
| Cap/Floor (Winsorization) | Replace with boundary values |
| Transform | Log, sqrt transformation |
| Keep | If it's genuine & important |
| Use robust methods | Median instead of mean |

### 🎯 **MCQ Points:**
- Mean is **sensitive** to outliers
- Median is **robust** to outliers
- IQR method uses **1.5** as multiplier
- Outliers affect: Mean, Variance, SD, Range

---

## 5️⃣ CLASS IMBALANCE

### **Definition**
When classes in classification are **not equally represented**

```
Example: Fraud Detection
- Normal transactions: 99%
- Fraud transactions: 1%    ← Minority class
```

### **Problems with Imbalanced Data**
- Model predicts **majority class** always
- **Accuracy is misleading** (99% accuracy but useless!)

### **Handling Techniques**

#### **A. Data Level Techniques**

| Technique | Description |
|-----------|-------------|
| **Oversampling** | Increase minority class samples |
| **SMOTE** | Synthetic Minority Oversampling (creates synthetic samples) |
| **Undersampling** | Reduce majority class samples |
| **Hybrid** | Combine over + undersampling |

#### **B. Algorithm Level Techniques**

| Technique | Description |
|-----------|-------------|
| **Class Weights** | Penalize misclassification of minority class more |
| **Cost-sensitive learning** | Different costs for different errors |
| **Ensemble methods** | Balanced Random Forest, EasyEnsemble |

#### **C. Evaluation Metrics (Don't use Accuracy!)**

| Metric | Formula | Use When |
|--------|---------|----------|
| **Precision** | TP/(TP+FP) | False positives costly |
| **Recall** | TP/(TP+FN) | False negatives costly (fraud, disease) |
| **F1-Score** | 2×(P×R)/(P+R) | Balance P and R |
| **AUC-ROC** | Area under curve | Overall performance |

### 🎯 **MCQ Points:**
- SMOTE = **Synthetic** samples, NOT duplicates
- Undersampling risk = **Loss of information**
- Oversampling risk = **Overfitting**
- Use **F1, AUC-ROC** for imbalanced data, NOT accuracy

---

## 6️⃣ STANDARDIZATION & NORMALIZATION

### **Normalization (Min-Max Scaling)**
```
X_normalized = (X - X_min) / (X_max - X_min)
```

| Property | Detail |
|----------|--------|
| Range | [0, 1] (or custom [a, b]) |
| Affected by outliers? | ✅ YES |
| Preserves shape? | ✅ YES |

### **Standardization (Z-Score Normalization)**
```
X_standardized = (X - Mean) / SD
```

| Property | Detail |
|----------|--------|
| Range | No fixed range (roughly -3 to +3) |
| Mean after | 0 |
| SD after | 1 |
| Affected by outliers? | ✅ YES (but less than MinMax) |

---

### 📊 **Comparison Table**

| Aspect | Normalization | Standardization |
|--------|--------------|-----------------|
| **Formula** | (X-Xmin)/(Xmax-Xmin) | (X-μ)/σ |
| **Range** | [0, 1] | Unbounded |
| **When to use** | Neural Networks, Image data | SVM, Logistic Regression, PCA |
| **Distribution assumed** | None | None (but works best for Gaussian) |
| **Outlier sensitivity** | HIGH | MODERATE |

---

### 🎯 **When to Use What?**

| Use NORMALIZATION | Use STANDARDIZATION |
|-------------------|---------------------|
| K-NN | PCA |
| Neural Networks | SVM |
| Image pixel values | Logistic Regression |
| When bounded range needed | Linear Regression |
| | When algorithm assumes Gaussian |

### **Algorithms that DON'T need scaling:**
- Decision Trees
- Random Forest
- XGBoost/Gradient Boosting
- Naive Bayes

*(Tree-based algorithms are scale-invariant!)*

---

## 🚀 QUICK FORMULA CHEAT SHEET

```
┌─────────────────────────────────────────────────────────┐
│ Mean = Σx / n                                           │
│ Variance = Σ(x-μ)² / n                                  │
│ SD = √Variance                                          │
│ IQR = Q3 - Q1                                           │
│ Outlier bounds = Q1 - 1.5×IQR  to  Q3 + 1.5×IQR        │
│ Z-score = (X - Mean) / SD                               │
│ Normalization = (X - Xmin) / (Xmax - Xmin)              │
│ Precision = TP / (TP + FP)                              │
│ Recall = TP / (TP + FN)                                 │
│ F1 = 2PR / (P + R)                                      │
└─────────────────────────────────────────────────────────┘
```

---

## 💡 MOST COMMON MCQ TRAPS

1. **Mean vs Median** → Outliers affect mean, not median
2. **Sample vs Population** variance → n-1 vs n
3. **Percentile interpretation** → "below which P% falls"
4. **SMOTE** → Creates SYNTHETIC, not duplicates
5. **Scaling** → Tree algorithms don't need it
6. **Accuracy** → Useless for imbalanced data
7. **Normalization range** → [0,1], Standardization → unbounded
8. **IQR multiplier** → 1.5 (not 1 or 2)

---

Good luck with your placements! 🎯
