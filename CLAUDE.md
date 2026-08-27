# Working on this repo

This is a Data Science / Business Analytics teaching case-study series (Great Learning / UTA-DSBA
style). Read `README.md` first for the full topic list, sequence, and per-topic conventions — this
file is about *how to work* in this repo, not what's in it.

## Non-negotiable verification discipline

Every case study in this repo was built and reviewed under one rule: **nothing is presented as
done until it's been checked, not asserted.**

- **Notebooks**: never claim a notebook works or that a specific number/result holds without
  actually executing the code (extract all code cells, run end-to-end as a script, confirm no
  errors) and diffing the printed output against every claim made in the notebook's markdown. If a
  markdown cell says "recall improves from X% to Y%", that exact X and Y must come from real
  executed output, not from what seems plausible.
- **Teaching-notes Word docs**: never claim one is done without rendering it to PDF (PowerShell +
  Word COM automation — `New-Object -ComObject Word.Application`, `SaveAs` format 17) and visually
  reading every single page via the Read tool. This has caught real bugs before (literal `**`/`*`
  markdown asterisks rendering unescaped because the docx-building code doesn't parse markdown,
  wrong section cross-references, numbers that drifted from the actual computed values) that would
  otherwise have shipped silently.
- **Synthetic data**: when a case study needs synthetic data, generate it with
  `numpy.random.default_rng(seed)` and tune the generating process so the notebook's specific
  numeric claims come out empirically true (a target recall level, a specific silhouette score, an
  overfitting curve), verified by actually running it, not just "should roughly work."
- **No data leakage**: hyperparameters and thresholds are always chosen via a validation split or
  cross-validation, never by peeking at the test set (or, for synthetic data, never using
  information that wouldn't exist in a real deployment).

## House style (match this for any new topic)

- Notebook markdown headers use `<font color="brown">...</font>` for top-level sections and
  `<font color="blue">...</font>` for sub-sections, matching every existing notebook.
- Every notebook opens with **Problem Statement → Context → Objective → Data Dictionary** and
  closes with **Business Insights and Recommendations**.
- Teaching-notes docs are built via the `docx` npm package (`npm install docx` in a scratch
  directory — it is not preinstalled), following the helper-function pattern used in every
  existing `build_*_notes.js` script (h1/h2/body/bullet/formula/caption/image/dataTable/spacer).
  They are code-free, numbered, have a Contents/TOC page, diagrams built from the case study's own
  real (verified) numbers wherever possible, and end with a "Summary Cheat Sheet".
- Known docx-js gotchas to avoid: markdown `**bold**`/`*italic*` syntax is **not** parsed by this
  helper pattern — it renders as literal asterisks. For inline emphasis, either drop the markup or
  build a `bodyRuns([{text, bold}, ...])` paragraph with real `TextRun({bold: true})` runs instead.

## Project-specific conventions

- Feature Engineering, Imbalanced Dataset, PyCaret, and Model Explainability all reuse the same
  synthetic loan-default dataset (`Feature Engineering/loan_applications.csv`) and, where relevant,
  the same Gradient Boosting model — later notebooks build on earlier ones' verified results
  (matching numbers exactly) rather than starting over. Follow this pattern when it makes sense for
  a new topic: reusing a prior topic's dataset/model as a foundation, rather than inventing a new
  one from scratch, is preferred when there's a natural narrative link.
- `PyCaret/` runs in its own isolated virtual environment (`PyCaret/.venv`, gitignored) because
  PyCaret pins older numpy/pandas/matplotlib than every other notebook needs. See `README.md` for
  the exact recreation commands. Before adding any other heavyweight/opinionated dependency to a
  new topic, check its version constraints against the shared environment first
  (`pip download <pkg> --no-deps` and inspect `METADATA`) — isolate it in its own venv if it would
  force a downgrade, rather than downgrading the shared environment.

## How the user likes to work

- Comfortable granting broad autonomy for large batches of work ("go ahead and create all, then
  I'll review") rather than requiring per-topic confirmation, but expects the verification
  discipline above to hold regardless, autonomy is not a reason to skip checking.
- Cares about intellectual honesty in results: when a technique doesn't uniformly improve every
  metric, or an assumption needs checking rather than trusting, that nuance belongs in the
  notebook/teaching notes rather than being smoothed over (e.g. the Imbalanced Dataset case study's
  finding that resampling techniques mostly just shift the decision threshold for a linear model,
  or PDP's independence assumption being checked against ALE rather than assumed in Model
  Explainability).
- Works across multiple machines over time. All code lives at
  `https://github.com/yogi-datalabs/machine-learning.git` (branch `main`) — check `git status` /
  `git pull` at the start of a session rather than assuming local state is current.
