# Lending Club Loan Default Prediction

## Overview
A deep learning classification model that predicts whether a borrower
will repay their loan or default, using historical LendingClub data.

## Problem Statement
Given historical loan data with borrower information, predict if a 
borrower will fully repay or charge off (default) their loan.
This is a **binary classification** problem.

##  Tech Stack
- **Python 3.x**
- **Pandas & NumPy** — data manipulation
- **Matplotlib & Seaborn** — data visualization
- **Scikit-learn** — preprocessing & evaluation
- **TensorFlow / Keras** — neural network model

## Project Structure
```text

lending-club-loan-prediction/
├── data/           # Raw dataset 
├── notebooks/      # Jupyter notebooks for EDA & modeling
├── models/         # Saved trained models
├── src/            # Reusable Python modules
├── requirements.txt
└── README.md
```
## 🗄️ SQL Analysis
The `sql/` folder contains standalone MySQL queries demonstrating
analysis using pure SQL:

| File | Description |
|------|-------------|
| `01_exploration.sql` | Loan status distribution |
| `02_grade_analysis.sql` | Default rate by loan grade |
| `03_purpose_analysis.sql` | Default rate by loan purpose |
| `04_state_analysis.sql` | Top 10 states by loan volume |
| `05_window_functions.sql` | RANK & AVG window functions |
| `06_cte_high_risk.sql` | CTE — high risk borrower segments |
| `07_income_brackets.sql` | Income brackets vs default rate |
##  Getting Started
```bash
# Clone the repo
git clone https://github.com/yeasiny71/lending-club-loan-prediction.git

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

## Dataset
- Source: [LendingClub Dataset - Kaggle](https://www.kaggle.com/wordsforthewise/lending-club)
- ~490,000 loan records
- Target column: `loan_status` (Fully Paid / Charged Off)


