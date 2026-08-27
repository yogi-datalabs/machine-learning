# Analytics Vidhya Case Studies

A self-contained series of Data Science / Business Analytics teaching case studies (mirroring a
Great Learning / UTA-DSBA style course). Each topic folder contains a Jupyter notebook (business
problem statement, data, model, verified results, business insights) and, for most topics, a
from-scratch "Teaching Notes" Word document (no code, worked numeric examples, diagrams, written
for someone seeing the technique for the first time).

## How to pick this back up

Every notebook is self-documenting: each one opens with **Problem Statement → Context → Objective
→ Data Dictionary** and closes with **Business Insights and Recommendations**, and every teaching
note is a standalone reference. You don't need this README (or any prior conversation) to
understand any single notebook — start with whichever topic you need.

This file exists so a fresh start (new machine, new Claude session, or just picking this up again
after a break) can get oriented in one read: what's covered, in what order, and the conventions
used throughout.

## Topics, in pedagogical sequence

Supervised learning:

1. **Linear Regression** — `Linear Regression/` — Housing price prediction
2. **Logistic Regression** — `Logistic Regression/`
3. **Decision Trees** — `Decision Trees/` — pre/post-pruning
4. **Regularization** — `Regularization/` — Ridge and Lasso vs. plain Linear Regression
5. **Bagging and Boosting** — `Bagging and Boosting/`
6. **SVM** — `SVM/` — kernel comparison, class weighting (+ Teaching Notes)
7. **Naive Bayes** — `Naive Bayes/` — bank marketing data (+ Teaching Notes)

Clustering:

8. **KMeans Clustering** — `KMeans Clustering/` — customer segmentation
9. **Hierarchical Clustering** — `Hierarchical Clustering/` — banking products, 7 linkage methods
10. **DBSCAN** — `DBSCAN/` — ATM network, density-based clustering (+ Teaching Notes)

Dimensionality reduction / visualization:

11. **PCA** — `PCA/` — credit risk profile (+ Teaching Notes)
12. **SVD** — `SVD/` — product recommendations, proves PCA = SVD on centered data (+ Teaching Notes)
13. **t-SNE** — `t-SNE/` — nonlinear visualization vs. PCA, on the KMeans segmentation data (+ Teaching Notes)

Practical / data-prep topics:

14. **Feature Engineering** — `Feature Engineering/` — ratio, interaction, and binned features on
    a loan-default dataset (+ Teaching Notes). Also contains a pre-existing reference notebook,
    `YT_Importance_of_Feature_Engineering.ipynb`, not part of this series.
15. **Imbalanced Dataset** — `Imbalanced Dataset/` — insurance fraud detection: class weighting,
    SMOTE, and why they mostly just shift the decision threshold for a linear model (+ Teaching Notes)
16. **Fraud Detection** — `Fraud Detection/` — banking transaction fraud, ~100K rows / ~190 columns
    across three merged source extracts (KYC/bureau, core banking, transaction/device logs), a
    6-hour-scale case study on missing-data mechanisms (MCAR/MAR/MNAR/merge-induced), why blindly
    capping transaction-amount outliers destroys most of the fraud signal, feature engineering and
    correlation-based dimensionality thinning at scale, and why the resulting data-prep work barely
    moves a Gradient Boosting model but measurably improves Logistic Regression

Tying it together:

17. **PyCaret** — `PyCaret/` — manual model-comparison loop vs. PyCaret's AutoML, verified to agree
    on the same held-out test set (+ Teaching Notes). **Runs in its own virtual environment**, see below.
18. **Model Explainability** — `Model Explainability/` — explaining the loan-default Gradient
    Boosting model globally (importance, PDP/ICE, SHAP) and locally (LIME vs. SHAP for one
    applicant), with PDP cross-checked against ALE (+ Teaching Notes)

`R Programming/` is a separate, unrelated track (R, not Python).

## Conventions used throughout

- **Verification discipline**: every number quoted in a notebook's markdown was produced by
  actually running that notebook's code, not asserted. Every teaching-notes Word doc was rendered
  to PDF and read page-by-page before being called done.
- **Synthetic data, tuned to a story**: most datasets are synthetic (`numpy.random.default_rng`
  with a fixed seed), generated so the notebook's specific claims (a target recall, an overfitting
  curve, a specific silhouette score, a specific AUC) are empirically true, not just plausible.
- **No data leakage**: hyperparameters/thresholds are always chosen using a validation split or
  cross-validation, never the test set.
- **A shared bank/lending narrative**: Feature Engineering, Imbalanced Dataset, PyCaret, and Model
  Explainability all reuse the same synthetic loan-default dataset
  (`Feature Engineering/loan_applications.csv`) and, where relevant, the same Gradient Boosting
  model, so later notebooks build on earlier ones' verified results instead of starting fresh.
- **House style**: notebooks use `<font color="brown">`/`<font color="blue">` markdown headers;
  Teaching Notes docs use a consistent brown/blue color scheme, numbered sections, a Contents page,
  and a "Summary Cheat Sheet" at the end.

## Special setup: the PyCaret virtual environment

PyCaret pins older versions of numpy/pandas/matplotlib than every other notebook in this repo
relies on. Rather than downgrading those packages globally, `PyCaret/` has its own isolated
virtual environment (`PyCaret/.venv`, **gitignored**, not in this repo). To use that notebook on a
new machine, recreate it:

```bash
cd "PyCaret"
python -m venv .venv
./.venv/Scripts/pip install pycaret ipykernel
./.venv/Scripts/python -m ipykernel install --user --name pycaret-venv --display-name "Python (PyCaret venv)"
```

Then open `PyCaret/Loan Default Model Comparison (PyCaret).ipynb` and select the **"Python
(PyCaret venv)"** kernel. Every other notebook in this repo uses the regular/shared Python
environment and needs no special setup beyond the usual `numpy pandas scikit-learn matplotlib
seaborn` (plus, for Model Explainability specifically: `shap lime PyALE`, and for Imbalanced
Dataset: `imbalanced-learn`).

## Everything is committed and pushed

As of the last update, `git status` is clean and `main` is pushed to
`https://github.com/yogi-datalabs/machine-learning.git`. Cloning that repo on any machine gets you
the complete, current state of every notebook, dataset, and teaching-notes document above.

Note: `Fraud Detection/`'s three source CSVs (`customer_profile.csv`, `account_summary.csv`,
`transaction_events.csv`) are synthetic data generated by a scratch script (not committed, per the
repo's convention of not keeping data generators, see `CLAUDE.md`), each ~100K rows. Its Teaching
Notes document is still pending as of this update.
