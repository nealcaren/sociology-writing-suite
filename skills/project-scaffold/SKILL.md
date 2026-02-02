---
name: project-scaffold
description: Initialize research project structure with standardized directories and metadata files. Creates project.yaml (configuration) and progress.yaml (state tracking) that other skills use for canonical paths and workflow coordination. Use when starting a new project or adopting an existing one.
---

# Project Scaffold

Initialize and manage research project structure. Creates standardized directories and metadata files that enable seamless handoffs between skills.

## Why This Exists

Without scaffolding, every skill asks "Where are your transcripts?" and "Where should I save this?" Project scaffold solves this by:

1. Creating canonical paths that all skills respect
2. Tracking project state so coordinator knows what's done
3. Enabling prerequisite checking ("Can't write findings until coding is done")
4. Providing audit trail for reproducibility

## Two Modes

### Mode 1: New Project

Creates full directory structure and blank metadata files.

```
/project-scaffold

Title: Why Activists Leave Social Movements
```

### Mode 2: Adopt Existing Project

Maps existing directories to canonical paths without moving files.

```
/project-scaffold adopt

My transcripts are in interviews/
My literature is in lit-review/pdfs/
```

## Workflow

### Step 1: Gather Project Info

Ask for:
- **Project title** (required)
- **Research question** (recommended)
- **Project type**: `interviews`, `ethnography`, `mixed` (affects which directories to create)
- **Mode**: `new` or `adopt`

### Step 2: Create/Map Structure

**For new projects**, create:

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
├── submissions/          # Final manuscripts, cover letters
├── project.yaml          # Project configuration
├── progress.yaml         # State tracking
└── README.md             # Project overview
```

**For adopt mode**, ask where existing files live and write paths to `project.yaml`.

### Step 3: Write Metadata Files

Create `project.yaml` with user input:

```yaml
# Project configuration - edit as needed
title: "Why Activists Leave Social Movements"
research_question: "How do committed activists disengage from movements?"

# Theoretical framing (updated by lit-synthesis, argument-builder)
theoretical_frame: ""
contribution_type: ""  # gap-filler, theory-extender, etc.

# Data summary (updated by interview-analyst)
data:
  type: interviews
  count: 0
  population: ""
  collection_period: ""

# Target outlets
target_journals:
  - "Social Problems"
  - "Mobilization"

# Canonical paths - all skills use these
paths:
  transcripts: data/raw/
  clean_data: data/clean/
  codebook: analysis/codes/
  memos: analysis/memos/
  quotes: analysis/outputs/
  literature_db: literature/database/
  reading_notes: literature/notes/
  lit_synthesis: literature/synthesis/
  drafts: drafts/sections/
  revisions: drafts/revisions/
  submissions: submissions/

# Zotero integration (optional)
zotero:
  collection_key: ""
  indexed: false

# Created by project-scaffold
created: TIMESTAMP
last_updated: TIMESTAMP
```

Create `progress.yaml` with initial state:

```yaml
# Progress tracking - auto-updated by skills
# Do not edit manually unless correcting errors

phase: setup  # setup, literature, analysis, writing, revision

# Artifact registry - skills register outputs here
artifacts: {}

# Completion flags - derived from artifacts where possible
status:
  scaffold: done
  lit_search: not_started
  lit_synthesis: not_started
  coding: not_started
  interpretation: not_started
  theory_draft: not_started
  methods_draft: not_started
  findings_draft: not_started
  bookends_draft: not_started
  verification: not_started
  revision: not_started

# Blocked tasks with reasons
blocked: []

# Quality checks
checks:
  quotes_verified: false
  bibliography_complete: false
  coherence_checked: false

# Session log
sessions: []

last_updated: TIMESTAMP
```

### Step 4: Create README

Generate project README with overview and current status.

### Step 5: Report

Show user what was created and next steps.

---

## Progress Dashboard

When invoked with `status` argument, generate a dashboard:

```
/project-scaffold status
```

**Dashboard output:**

```markdown
# Project: Why Activists Leave Social Movements

## Current Phase: Analysis

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

## Blocked
- **Verification**: Cannot verify quotes until findings draft exists

## Suggested Next Steps
1. Complete interpretation (IA.3) - you have codes but no analytical memos
2. Start theory draft with /argument-builder
3. Run /interview-analyst to continue analysis

## Quality Checks Pending
- [ ] Quote verification
- [ ] Bibliography completeness
- [ ] Intro/conclusion coherence
```

---

## Integration with Other Skills

### research-coordinator

On session start:
1. Check for `project.yaml` - if missing, invoke `project-scaffold`
2. Read `progress.yaml` and generate dashboard
3. Set session agenda based on status and blocked items

### All other skills

Skills read `project.yaml` for paths:

```python
# Instead of asking "Where are your transcripts?"
import yaml
with open("project.yaml") as f:
    config = yaml.safe_load(f)
transcript_path = config["paths"]["transcripts"]
```

Skills update `progress.yaml` when done:

```python
# After completing coding
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

## Filesystem Scanning

When generating dashboard or updating progress, scan for known artifacts:

| Artifact | Detection |
|----------|-----------|
| Transcripts | `*.txt`, `*.md`, `*.docx` in `paths.transcripts` |
| Codebook | `codebook.md` or `codebook.yaml` in `paths.codebook` |
| Quote database | `quote-database.md` or `quotes.json` in `paths.quotes` |
| Reading notes | `*.md` files in `paths.reading_notes` |
| Literature database | `database.json` in `paths.literature_db` |
| Section drafts | `theory-*.md`, `methods-*.md`, `findings-*.md` in `paths.drafts` |

---

## Schema Versioning

Include schema version for forward compatibility:

```yaml
# project.yaml
schema_version: 1
```

If skills encounter newer schema, warn but continue.

---

## Starting the Scaffold

When user invokes:

1. **Check if project.yaml exists**
   - If yes and no `adopt`/`status` flag: "Project already scaffolded. Use `/project-scaffold status` for dashboard or `/project-scaffold adopt` to remap paths."

2. **Ask project type**:
   > "What kind of project is this?
   > 1. Interview-based research
   > 2. Ethnography/fieldwork
   > 3. Mixed methods
   > 4. Literature review only"

3. **Ask for basics**:
   > "Project title?"
   > "Research question (one sentence)?"
   > "Target journals? (optional)"

4. **For adopt mode**, ask path questions:
   > "Where are your transcripts/fieldnotes?"
   > "Where is your literature?"
   > "Where are your drafts?"

5. **Create structure and files**

6. **Report**:
   > "Project scaffolded. Created:
   > - 8 directories
   > - project.yaml (edit to add theoretical frame, data details)
   > - progress.yaml (auto-managed by skills)
   > - README.md
   >
   > Next: Add your transcripts to `data/raw/` and run `/research-coordinator` to begin."
