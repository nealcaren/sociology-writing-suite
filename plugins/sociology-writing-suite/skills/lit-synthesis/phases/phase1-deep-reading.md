# Phase 1: Deep Reading

## Why This Phase Matters

Deep reading is where understanding happens. Abstracts tell you *what* papers argue; full text reveals *how* they argue it—how theory is deployed, what evidence is marshaled, what assumptions underlie claims. This phase creates the raw material for theoretical mapping and debate identification.

---

## Choose Your Reading Mode

This phase supports two modes. Choose based on your situation:

| Mode | When to Use | Model | How It Works |
|------|-------------|-------|--------------|
| **Zotero** | Papers in library, especially with annotations | Opus | Read via MCP, leverage highlights |
| **Docling** | Batch processing PDFs, no annotations | Haiku | Convert PDF→markdown, spawn reading agents |

You can mix modes: use Zotero for key theoretical papers you've annotated, Docling for the rest.

---

## Zotero Mode

### 1. Prepare Reading Environment

For each priority paper:
- Confirm PDF is in Zotero
- Check for existing annotations (from user's prior reading)
- Note if paper has supplementary materials

Use Zotero MCP to access:
```
Use zotero_get_item_metadata for [paper identifier]
Use zotero_get_annotations for [paper identifier]
```

### 2. Read with Purpose

For each paper, read for:

**Argument Structure**
- What is the central claim?
- How is it structured (inductive, deductive, abductive)?
- What's the contribution claim?

**Theoretical Framework**
- Which tradition(s) does it draw on?
- Who are the key theorists cited?
- Is theory used descriptively, extended, or critiqued?

**Conceptual Work**
- What key concepts are used?
- Are any new concepts introduced?
- How are concepts operationalized?

**Empirical Strategy**
- What data? What methods?
- How is theory connected to evidence?
- What are the acknowledged limitations?

**Position in Field**
- Who does this paper cite approvingly?
- Who does it critique or position against?
- Where does it claim to contribute?

### 3. Create Reading Notes

For each paper, create a note file using the template in SKILL.md:

```
reading-notes/
├── smith2020-cultural-frames.md
├── jones2019-institutional.md
└── ...
```

**Required frontmatter** (at least one identifier):
```yaml
---
openalex_id: W2123456789    # From lit-search (preferred)
doi: 10.1086/123456         # DOI if available
zotero_key: ABC123XY        # Zotero key if in library
first_author: Smith
year: 2020
short_title: cultural-frames
---
```

**Essential sections**:
- Core argument (1-2 sentences)
- Theoretical framework (tradition, key concepts)
- How theory is deployed (description vs. extension vs. critique)
- Key findings (bulleted)
- Contribution claim
- Key quotes (with page numbers)
- Your analytical notes

**Why identifiers matter**: The frontmatter identifiers let you reliably match notes back to source papers across the workflow—from lit-search database through lit-synthesis to argument-builder citations.

### 4. Flag Connections

As you read, note:
- Papers that cite each other
- Papers that contradict each other
- Papers using the same concepts differently
- Papers that seem to be in conversation

Add tags to notes:
- `[cites: Author2019]`
- `[contradicts: Author2018]`
- `[same-concept-as: Author2020]`

### 5. Extract Key Quotes

For each paper, capture 3-5 quotes that:
- Define key concepts
- State the argument clearly
- Could be used in your own writing
- Reveal assumptions or limitations

Always include page numbers.

### 6. Compile Reading Summary

After all priority papers are read, create a summary:

```markdown
# Reading Notes Summary

## Papers Read
- [N] papers deep-read
- [Date range]

## Emergent Patterns

### Theoretical Traditions Identified
1. **[Tradition 1]**: [which papers, key ideas]
2. **[Tradition 2]**: [which papers, key ideas]

### Recurring Concepts
- **[Concept A]**: Used by [papers], defined as [summary]
- **[Concept B]**: Used by [papers], defined as [summary]

### Methodological Patterns
- [Dominant approach]
- [Variations]

### Preliminary Tensions Noted
- [Tension 1]: [Paper A] vs [Paper B] on [issue]
- [Tension 2]: [description]

## Papers That Stand Out
- **Most cited within corpus**: [papers]
- **Most theoretically ambitious**: [papers]
- **Most methodologically innovative**: [papers]
- **Most relevant to user's project**: [papers]

## Gaps Emerging
- [What's missing from the conversation]

## Questions for Next Phases
- [What to investigate in theoretical mapping]
- [What to investigate in debate mapping]
```

---

## Using Zotero MCP Effectively

### Retrieving Full Text
```
Use zotero_get_item_metadata with the item key to get full text if available
```

### Getting Annotations
If user has already highlighted:
```
Use zotero_get_annotations for [item key]
```

This returns highlights and notes, accelerating your reading.

### Semantic Search for Connections
```
Use zotero_semantic_search with a concept to find related papers
```

---

## Docling Mode

For batch processing PDFs without annotations, use the **reading-agent** skill for structured note-taking.

### Option 1: Use reading-agent Skill (Recommended)

The reading-agent skill handles PDF conversion and note creation:

```
/reading-agent

Paper: Smith 2020 "Cultural Frames"
PDF: /path/to/paper.pdf
DOI: 10.1086/123456
OpenAlex: W2123456789
```

For batch processing:
```
/reading-agent

Batch process these papers:
- /papers/smith2020.pdf (DOI: 10.1086/123456, OpenAlex: W2123456789)
- /papers/jones2019.pdf (DOI: 10.1177/789456, OpenAlex: W3456789012)
- /papers/brown2021.pdf (DOI: 10.1093/567890, OpenAlex: W4567890123)
```

### Option 2: Manual Agent Spawning

For more control, manually convert PDFs and spawn agents:

#### 1. Convert PDF to Markdown

```bash
# Convert a single PDF (output cached alongside original)
./scripts/pdf-to-md.sh "/path/to/paper.pdf"
# Returns: /path/to/paper.md
```

The markdown is saved next to the PDF. Subsequent conversions use the cached file.

#### 2. Spawn Reading Agent

Use the Task tool to spawn a haiku agent for each paper:

```
Task tool parameters:
- subagent_type: "general-purpose"
- model: "haiku"
- prompt: [reading prompt with markdown content and identifiers]
```

#### 3. Reading Agent Prompt Template

When spawning the reading agent manually, provide this prompt structure:

```
You are a research assistant creating structured reading notes for a sociology literature synthesis project.

## Paper Identifiers
- OpenAlex ID: [from lit-search database, e.g., W2123456789]
- DOI: [if available]
- PDF source: [path]

## Paper Content
[Insert markdown content from docling conversion]

## Instructions

Create reading notes in this exact format, starting with the required frontmatter:

---
openalex_id: [ID from above]
doi: [DOI from above]
first_author: [extract from paper]
year: [extract from paper]
short_title: [2-3 word slug]
---

# [Author Year] - [Short Title]

## Bibliographic Info
- **Authors**: [extract all authors]
- **Year**: [publication year]
- **Title**: [full title]
- **Journal**: [venue]
- **DOI**: [link]

## Core Argument
[1-2 sentences: What is the paper arguing?]

## Theoretical Framework
- **Tradition**: [e.g., Bourdieusian, institutionalist, interactionist]
- **Key concepts**: [list main concepts used]
- **Theory deployment**: [description vs. extension vs. critique]

## Empirical Strategy
- **Data**: [what kind of data]
- **Methods**: [how analyzed]
- **Sample**: [who/what, N if applicable]

## Key Findings
1. [Finding 1]
2. [Finding 2]
3. [Finding 3]

## Contribution Claim
[What does the paper claim to contribute to the literature?]

## Limitations
[As noted by authors]

## Key Quotes
> "[Quote 1]" (p. X)
> "[Quote 2]" (p. Y)

## Connections
[What other papers or concepts does this connect to?]

## Analytical Notes
[Observations about how argument is constructed, assumptions, relevance to project]
```

### 4. Batch Processing Workflow

For processing multiple papers:

1. **Prepare list**: Gather PDF paths and their identifiers (from lit-search database)
2. **Convert all PDFs**: Run docling on each (conversions are cached)
3. **Spawn agents in parallel**: Use multiple Task calls to process papers concurrently
4. **Collect notes**: Save each agent's output to `reading-notes/author-year-slug.md`

Example batch orchestration:
```
For each paper in priority list:
  1. pdf_path = paper.pdf_location
  2. markdown = read the .md file (or convert if not cached)
  3. identifiers = {openalex_id: paper.id, doi: paper.doi}
  4. Spawn haiku agent with reading prompt + markdown + identifiers
  5. Save output to reading-notes/
```

### 5. Quality Check

After batch processing, review notes for:
- Frontmatter completeness (identifiers present?)
- Core argument clarity
- Key quotes with page numbers
- Theoretical tradition identification

Flag papers that need deeper (Opus) reading based on:
- Central to your argument
- Theoretically dense
- Haiku notes seem thin

---

## Guiding Principles

### Read the Whole Paper
Don't just skim. For priority papers, read introduction, theory, methods, findings, AND conclusion. The conclusion often reveals assumptions.

### Theory Sections Are Gold
Pay special attention to how authors construct their Theory sections—this feeds directly into argument-builder.

### Note How, Not Just What
Anyone can summarize findings. Note *how* the argument is constructed, *how* theory is deployed, *how* evidence is marshaled.

### Quotes Need Context
A quote without page number is useless. A quote without noting *why* it matters is nearly as bad.

### Your Notes Are for Future You
Write notes that will make sense when you return to them in Phase 3-4. Be explicit about connections and questions.

---

## Output Files to Create

1. **reading-notes/*.md** - One file per paper (with identifier frontmatter)
   - Filename: `author-year-slug.md` (e.g., `smith2020-cultural-frames.md`)
   - Frontmatter: Must include at least one of: `openalex_id`, `doi`, `zotero_key`
2. **reading-summary.md** - Compiled patterns and observations

---

## When You're Done

Report to the orchestrator:
- Number of papers deep-read
- Theoretical traditions identified
- Preliminary tensions noted
- Key papers for theoretical mapping

Example summary:
> "Deep reading complete. **15 papers** read in full. Three theoretical traditions identified: legal consciousness (6 papers), neighborhood effects (5 papers), recognition theory (4 papers). Preliminary tension noted between structural vs. cultural explanations for police-calling behavior. Kirk & Papachristos (2011) and Desmond (2016) emerge as most-cited anchors. Ready for Phase 2: Theoretical Mapping."
