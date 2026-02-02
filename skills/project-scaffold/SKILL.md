---
name: project-scaffold
description: Initialize research project structure with standardized directories and metadata files. Creates project.yaml (configuration) and progress.yaml (state tracking) that other skills use for canonical paths and workflow coordination. Supports qualitative, quantitative, and mixed methods projects. Use when starting a new project or adopting an existing one.
---

# Project Scaffold

Initialize and manage research project structure. Creates standardized directories and metadata files that enable seamless handoffs between skills.

## Why This Exists

Without scaffolding, every skill asks "Where are your data?" and "Where should I save this?" Project scaffold solves this by:

1. Creating canonical paths that all skills respect
2. Tracking project state so coordinator knows what's done
3. Enabling prerequisite checking ("Can't write findings until analysis is done")
4. Providing audit trail for reproducibility

## Project Types

Scaffold supports three project types with different structures:

| Type | Use When | Key Directories |
|------|----------|-----------------|
| `qualitative` | Interview research, ethnography, content analysis | transcripts, codebook, memos |
| `quantitative` | Survey, experiments, secondary data analysis | raw_data, scripts, models, figures |
| `mixed` | Combining qual + quant methods | Both sets of directories |

## Two Modes

### Mode 1: New Project

Creates full directory structure and blank metadata files.

```
/project-scaffold

Title: Why Activists Leave Social Movements
Type: qualitative
```

### Mode 2: Adopt Existing Project

Maps existing directories to canonical paths without moving files.

```
/project-scaffold adopt

My data is in analysis/
My literature is in lit-review/pdfs/
```

## Workflow

### Step 1: Gather Project Info

Ask for:
- **Project title** (required)
- **Project type**: `qualitative`, `quantitative`, or `mixed` (required)
- **Research question** (recommended)
- **Mode**: `new` or `adopt`

### Step 2: Create/Map Structure

#### Qualitative Projects

```
project-name/
├── data/
│   ├── raw/              # Original transcripts, fieldnotes
│   └── clean/            # Processed/anonymized versions
├── analysis/
│   ├── codes/            # Codebook, code definitions
│   ├── memos/            # Analytical memos
│   └── outputs/          # Quote database, matrices
├── literature/
│   ├── database/         # lit-search outputs
│   ├── notes/            # reading-agent outputs
│   └── synthesis/        # lit-synthesis outputs
├── drafts/
│   ├── sections/         # Individual section drafts
│   └── revisions/        # Revision rounds
├── submissions/          # Final manuscripts
├── project.yaml          # Project configuration
├── progress.yaml         # State tracking
└── README.md             # Project overview
```

#### Quantitative Projects

```
project-name/
├── data/
│   ├── raw/              # Original datasets
│   ├── processed/        # Cleaned/transformed data
│   └── codebooks/        # Variable documentation
├── scripts/
│   ├── cleaning/         # Data preparation scripts
│   ├── analysis/         # Statistical analysis scripts
│   └── visualization/    # Figure generation scripts
├── models/               # Saved model objects, outputs
├── figures/              # Generated plots and visualizations
├── tables/               # Generated tables
├── literature/
│   ├── database/
│   ├── notes/
│   └── synthesis/
├── drafts/
│   ├── sections/
│   └── revisions/
├── submissions/
├── project.yaml
├── progress.yaml
└── README.md
```

#### Mixed Methods Projects

```
project-name/
├── data/
│   ├── qualitative/
│   │   ├── raw/          # Transcripts, fieldnotes
│   │   └── clean/
│   └── quantitative/
│       ├── raw/          # Datasets
│       ├── processed/
│       └── codebooks/
├── analysis/
│   ├── qualitative/
│   │   ├── codes/
│   │   ├── memos/
│   │   └── outputs/
│   └── quantitative/
│       ├── scripts/
│       ├── models/
│       └── outputs/
├── figures/
├── tables/
├── literature/
│   ├── database/
│   ├── notes/
│   └── synthesis/
├── drafts/
│   ├── sections/
│   └── revisions/
├── submissions/
├── project.yaml
├── progress.yaml
└── README.md
```

### Step 3: Write Metadata Files

Create `project.yaml` with user input. Schema varies by project type.

Create `progress.yaml` with type-appropriate phases.

### Step 4: Create README

Generate project README with overview and current status.

### Step 5: Report

Show user what was created and next steps.

---

## Progress Tracking by Type

### Qualitative Phases

```yaml
status:
  # Literature
  lit_search: not_started
  lit_synthesis: not_started

  # Analysis
  immersion: not_started
  coding: not_started
  interpretation: not_started
  synthesis: not_started

  # Writing
  theory_draft: not_started
  methods_draft: not_started
  findings_draft: not_started
  bookends_draft: not_started

  # Quality
  verification: not_started
  revision: not_started
```

### Quantitative Phases

```yaml
status:
  # Literature
  lit_search: not_started
  lit_synthesis: not_started

  # Data
  data_acquisition: not_started
  data_cleaning: not_started

  # Analysis
  eda: not_started              # Exploratory data analysis
  modeling: not_started
  robustness: not_started       # Sensitivity analyses

  # Outputs
  visualization: not_started
  tables: not_started

  # Writing
  theory_draft: not_started
  methods_draft: not_started
  results_draft: not_started
  bookends_draft: not_started

  # Quality
  replication_check: not_started
  revision: not_started
```

### Mixed Methods Phases

```yaml
status:
  # Literature
  lit_search: not_started
  lit_synthesis: not_started

  # Qualitative strand
  qual_immersion: not_started
  qual_coding: not_started
  qual_interpretation: not_started

  # Quantitative strand
  quant_data_prep: not_started
  quant_eda: not_started
  quant_modeling: not_started

  # Integration
  integration: not_started      # Combining qual + quant

  # Writing
  theory_draft: not_started
  methods_draft: not_started
  findings_draft: not_started
  bookends_draft: not_started

  # Quality
  verification: not_started
  revision: not_started
```

---

## Progress Dashboard

When invoked with `status` argument, generate a dashboard:

```
/project-scaffold status
```

**Dashboard output (qualitative example):**

```markdown
# Project: Why Activists Leave Social Movements
**Type:** Qualitative | **Phase:** Analysis

## Artifacts Found
- [x] Transcripts: 24 files in data/raw/
- [x] Codebook: analysis/codes/codebook.md
- [x] Quote database: analysis/outputs/quote-database.md
- [ ] Theory draft: not found
- [ ] Methods draft: not found

## Status
| Phase | Status |
|-------|--------|
| Literature Search | done |
| Literature Synthesis | done |
| Coding | done |
| Interpretation | in_progress |
| Theory Draft | not_started |

## Suggested Next Steps
1. Complete interpretation - you have codes but no analytical memos
2. Start theory draft with /argument-builder

## Quality Checks Pending
- [ ] Quote verification
- [ ] Bibliography completeness
```

**Dashboard output (quantitative example):**

```markdown
# Project: Income Inequality and Health Outcomes
**Type:** Quantitative | **Phase:** Analysis

## Artifacts Found
- [x] Raw data: data/raw/nhis_2020.dta
- [x] Cleaned data: data/processed/analysis_sample.csv
- [x] Cleaning script: scripts/cleaning/01_prep_data.R
- [x] Analysis script: scripts/analysis/02_main_models.R
- [ ] Figures: 0 files in figures/
- [ ] Tables: 0 files in tables/

## Status
| Phase | Status |
|-------|--------|
| Data Acquisition | done |
| Data Cleaning | done |
| EDA | done |
| Modeling | in_progress |
| Robustness | not_started |
| Visualization | not_started |

## Suggested Next Steps
1. Complete main models
2. Run robustness checks
3. Generate figures and tables

## Quality Checks Pending
- [ ] Replication check
- [ ] Code review
```

---

## Integration with Other Skills

### research-coordinator

On session start:
1. Check for `project.yaml` - if missing, invoke `project-scaffold`
2. Read `progress.yaml` and generate dashboard
3. Route to appropriate skills based on project type

### All other skills

Skills read `project.yaml` for paths:

```python
import yaml
with open("project.yaml") as f:
    config = yaml.safe_load(f)

project_type = config["type"]
if project_type == "qualitative":
    data_path = config["paths"]["transcripts"]
elif project_type == "quantitative":
    data_path = config["paths"]["raw_data"]
```

Skills update `progress.yaml` when done:

```python
progress["status"]["coding"] = "done"
progress["artifacts"]["codebook"] = "analysis/codes/codebook.md"
progress["last_updated"] = datetime.now().isoformat()
```

---

## Commands

| Command | What It Does |
|---------|--------------|
| `/project-scaffold` | Create new project structure |
| `/project-scaffold adopt` | Map existing project to schema |
| `/project-scaffold status` | Generate progress dashboard |
| `/project-scaffold update` | Rescan filesystem and update progress.yaml |

---

## Filesystem Scanning by Type

### Qualitative Artifacts

| Artifact | Detection |
|----------|-----------|
| Transcripts | `*.txt`, `*.md`, `*.docx` in `paths.transcripts` |
| Codebook | `codebook.md` or `codebook.yaml` in `paths.codebook` |
| Quote database | `quote-database.md` or `quotes.json` in `paths.quotes` |
| Memos | `*.md` files in `paths.memos` |

### Quantitative Artifacts

| Artifact | Detection |
|----------|-----------|
| Raw data | `*.csv`, `*.dta`, `*.sav`, `*.xlsx` in `paths.raw_data` |
| Processed data | `*.csv`, `*.parquet`, `*.rds` in `paths.processed` |
| Scripts | `*.R`, `*.py`, `*.do` in `paths.scripts` |
| Models | `*.rds`, `*.pkl`, `*.joblib` in `paths.models` |
| Figures | `*.png`, `*.pdf`, `*.svg` in `paths.figures` |
| Tables | `*.tex`, `*.html`, `*.csv` in `paths.tables` |

---

## Schema Versioning

Include schema version for forward compatibility:

```yaml
# project.yaml
schema_version: 1
type: qualitative  # or quantitative, mixed
```

If skills encounter newer schema, warn but continue.

---

## Starting the Scaffold

When user invokes:

1. **Check if project.yaml exists**
   - If yes and no `adopt`/`status` flag: "Project already scaffolded. Use `/project-scaffold status` for dashboard or `/project-scaffold adopt` to remap paths."

2. **Ask project type**:
   > "What kind of project is this?
   > 1. **Qualitative** - Interviews, ethnography, content analysis
   > 2. **Quantitative** - Survey, experiments, secondary data
   > 3. **Mixed methods** - Combining qual + quant approaches"

3. **Ask for basics**:
   > "Project title?"
   > "Research question (one sentence)?"
   > "Target journals? (optional)"

4. **For adopt mode**, ask path questions based on type.

5. **Create structure and files**

6. **Report**:
   > "Project scaffolded as **[type]**. Created:
   > - [N] directories
   > - project.yaml (edit to add details)
   > - progress.yaml (auto-managed by skills)
   > - README.md
   >
   > Next steps for [type] project: [type-specific guidance]"
