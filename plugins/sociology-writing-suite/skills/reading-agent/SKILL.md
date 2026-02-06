---
name: reading-agent
description: Create structured reading notes for academic papers. Converts PDFs to markdown and extracts bibliographic info, core arguments, theoretical frameworks, findings, and key quotes. Supports single-paper deep reading or batch processing with haiku agents.
---

# Reading Agent

Create structured reading notes for academic papers. This skill can operate standalone or integrate with lit-synthesis.

## Project Integration

This skill reads from `project.yaml` when available:

```yaml
# From project.yaml
paths:
  lit_synthesis: literature/synthesis/
```

**Project type:** This skill works for **all project types**. Reading and analyzing literature is essential for qualitative, quantitative, and mixed methods research.

Saves reading notes to `literature/synthesis/reading-notes/` by default, or to the path specified in `project.yaml`.

## When to Use This Skill

Use this skill when you need to:
- Create reading notes for a single paper
- Batch-process multiple PDFs into structured notes
- Extract consistent metadata and analysis across papers
- Prepare papers for literature synthesis

## Quick Start

```
/reading-agent

I need to read: /path/to/paper.pdf
```

Or with a Zotero reference:
```
/reading-agent

Paper: Smith 2020 "Cultural Frames"
DOI: 10.1086/123456
```

## Workflow

### Step 0: Identify the Paper

Ask the user for:
1. **Paper source**: PDF path, Zotero reference, or pasted text
2. **Identifiers** (at least one):
   - OpenAlex ID (e.g., `W2123456789`)
   - DOI (e.g., `10.1086/123456`)
   - Zotero key (e.g., `ABC123XY`)

### Step 1: Access Paper Content

**If PDF provided**:
Convert using docling:
```bash
./scripts/pdf-to-md.sh "/path/to/paper.pdf"
# Creates: /path/to/paper.md (cached for reuse)
```

**If Zotero reference**: Use `zotero_get_item_metadata` and `zotero_get_annotations` via MCP.

**If markdown/text**: Use directly.

### Step 2: Read and Extract

For **single-paper mode** (default): Read the paper directly and create structured notes.

For **batch mode**: Spawn haiku agents using the Task tool:
```
Task tool parameters:
- subagent_type: "general-purpose"
- model: "haiku"
- prompt: [reading prompt with content and identifiers]
- description: "Read paper: AuthorYear"
```

### Step 3: Save Notes

Save reading notes to: `reading-notes/author-year-slug.md`

The filename uses author-year-slug for readability, but **frontmatter identifiers** are the authoritative match back to source papers.

---

## Reading Note Template

All reading notes **must** follow this structure with required frontmatter:

```markdown
---
openalex_id: W2123456789    # From lit-search database (preferred)
doi: 10.1086/123456         # Digital Object Identifier
zotero_key: ABC123XY        # Zotero item key (if in library)
first_author: Smith
year: 2020
short_title: cultural-frames
---

# Smith 2020 - Cultural Frames

## Bibliographic Info
- **Authors**: [all authors]
- **Year**: [publication year]
- **Title**: [full title]
- **Journal**: [venue/publisher]
- **DOI**: [as link if available]
- **OpenAlex**: https://openalex.org/W2123456789

## Core Argument
[1-2 sentences: What is the paper arguing?]

## Theoretical Framework
- **Tradition**: [e.g., Bourdieusian, institutionalist, interactionist, framing theory]
- **Key concepts**: [list main theoretical concepts used]
- **Theory deployment**: [description | extension | critique | synthesis]

## Empirical Strategy
- **Data**: [what kind of data - interviews, content analysis, survey, etc.]
- **Methods**: [how data was analyzed]
- **Sample**: [who/what was studied, N if applicable]

## Key Findings
1. [Finding 1]
2. [Finding 2]
3. [Finding 3]

## Contribution Claim
[What does the paper claim to contribute to the literature?]

## Limitations
[As noted by the authors]

## Key Quotes
> "[Quote 1 - captures core argument or key concept]" (p. X)

> "[Quote 2 - methodological or theoretical insight]" (p. Y)

> "[Quote 3 - finding or implication]" (p. Z)

## Connections
[What other papers, concepts, or debates does this connect to?]

## Analytical Notes
[Your observations: How is the argument constructed? What assumptions underlie it? How does this relate to the broader project?]
```

---

## Batch Processing Mode

For multiple papers:

1. **Gather papers**: List of PDFs or Zotero collection
2. **Convert all PDFs**: Run `pdf-to-md.sh` on each (results cached)
3. **Prepare identifiers**: From lit-search database or Zotero metadata
4. **Spawn parallel agents**: Multiple haiku agents via Task tool
5. **Collect outputs**: Save to `reading-notes/` directory

Example batch invocation:
```
/reading-agent

Batch process these papers:
- /papers/smith2020.pdf (DOI: 10.1086/123456)
- /papers/jones2019.pdf (OpenAlex: W2123456789)
- /papers/brown2021.pdf (Zotero: ABC123XY)
```

The skill will spawn haiku agents in parallel for cost-effective processing.

---

## Haiku Agent Prompt

When spawning agents for batch processing, use this prompt template:

```
You are a research assistant creating structured reading notes for a sociology literature synthesis project.

## Paper Identifiers
- OpenAlex ID: {openalex_id}
- DOI: {doi}
- Zotero Key: {zotero_key}
- PDF source: {pdf_path}

## Paper Content
{markdown_content}

## Instructions

Create reading notes following the exact template structure provided. Include:
1. YAML frontmatter with all available identifiers
2. All sections from Bibliographic Info through Analytical Notes
3. At least 3 key quotes with page numbers
4. Specific, observable details rather than vague summaries

Focus on:
- What the paper ARGUES, not just what it studies
- How theory is DEPLOYED, not just what theory is mentioned
- TENSIONS or gaps the paper leaves unresolved
```

---

## Scripts

### pdf-to-md.sh

Converts PDF to markdown using docling:

```bash
#!/usr/bin/env bash
# Convert PDF to markdown with caching
# Usage: ./pdf-to-md.sh "/path/to/paper.pdf"

set -euo pipefail

PDF_PATH="$1"
MD_PATH="${PDF_PATH%.pdf}.md"

# Check for cached version
if [[ -f "$MD_PATH" ]]; then
    echo "$MD_PATH"
    exit 0
fi

# Convert using docling
docling "$PDF_PATH" --output-format md --output "${PDF_PATH%.pdf}"

echo "$MD_PATH"
```

### Setup

Install docling:
```bash
pip install docling
```

For Zotero access, use the bundled **zotero** skill. See `skills/zotero/guides/setup.md` for configuration.

For semantic search across PDFs, use the bundled **zotero-rag** skill. This enables finding passages by meaning rather than keyword.

---

## Integration with Other Skills

**From lit-search**: Use the database.json to get OpenAlex IDs and DOIs for papers you've identified.

**To lit-synthesis**: Reading notes feed directly into:
- Phase 2: Theoretical mapping (uses Tradition and Key concepts)
- Phase 3: Thematic clustering (uses Findings and Methods)
- Phase 4: Debate mapping (uses Connections and Analytical Notes)

**With argument-builder**: Key quotes and contribution claims inform prose drafting.

---

## Model Recommendations

| Mode | Model | Rationale |
|------|-------|-----------|
| **Single paper (deep)** | Opus | Nuanced analysis, theoretical depth |
| **Batch processing** | Haiku | Cost-effective structured extraction |

Use Opus when you need to understand how an argument is constructed. Use Haiku when you need consistent extraction across many papers.

---

## Output Directory Structure

```
reading-notes/
├── smith2020-cultural-frames.md
├── jones2019-institutional-logics.md
├── brown2021-movement-spillover.md
└── ...
```

Each file contains full structured notes with frontmatter identifiers for reliable cross-referencing.

---

## Starting the Reading

When the user invokes this skill:

1. **Identify source**:
   > "What paper do you want to read? Provide a PDF path, Zotero reference, or paste the text."

2. **Gather identifiers**:
   > "What identifiers do you have? I need at least one of: OpenAlex ID, DOI, or Zotero key."

3. **Choose mode** (if multiple papers):
   > "Single paper or batch? For batch, I'll spawn haiku agents to process in parallel."

4. **Confirm output location**:
   > "I'll save reading notes to `reading-notes/`. Does that work, or do you want a different location?"

5. **Begin reading**: Convert PDF if needed, then extract structured notes.

## Key Reminders

- **Identifiers are essential**: Every note needs at least one unique identifier in frontmatter
- **Quotes need page numbers**: Include (p. X) for every quote
- **Arguments over summaries**: Capture what the paper argues, not just what it describes
- **Tensions are valuable**: Note unresolved questions and potential gaps
- **Consistency enables synthesis**: Following the template exactly allows cross-paper analysis
