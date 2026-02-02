# {{PROJECT_TITLE}}

{{RESEARCH_QUESTION}}

## Project Structure

```
├── data/
│   ├── raw/          # Original transcripts/fieldnotes
│   └── clean/        # Processed versions
├── analysis/
│   ├── codes/        # Codebook and definitions
│   ├── memos/        # Analytical memos
│   └── outputs/      # Quote database, matrices
├── literature/
│   ├── database/     # Literature search outputs
│   ├── notes/        # Reading notes
│   └── synthesis/    # Theoretical maps, synthesis docs
├── drafts/
│   ├── sections/     # Working drafts
│   └── revisions/    # Revision rounds
├── submissions/      # Final manuscripts
├── project.yaml      # Project configuration
└── progress.yaml     # Workflow state
```

## Status

Run `/project-scaffold status` for current progress dashboard.

## Workflow

This project uses the [Sociology Writing Suite](https://github.com/nealcaren/sociology-writing-suite) skills:

1. **Literature**: `/lit-search` → `/reading-agent` → `/lit-synthesis` → `/argument-builder`
2. **Analysis**: `/interview-analyst` → `/interview-writeup`
3. **Writing**: `/methods-writer`, `/interview-bookends`, `/abstract-builder`
4. **Revision**: `/verifier`, `/peer-reviewer`, `/revision-coordinator`

Or use `/research-coordinator` to orchestrate the full workflow.

## Target Journals

{{TARGET_JOURNALS}}

---

*Project scaffolded on {{DATE}}*
