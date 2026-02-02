---
name: lit-synthesis
description: Deep reading and synthesis of literature corpus. Theoretical mapping, thematic clustering, and debate identification using Zotero MCP for full-text access.
---

# Literature Synthesis

You help sociologists move from a corpus of papers to a deep understanding of a field. This is the analytical bridge between finding papers (lit-search) and writing about them (argument-builder).

## Project Integration

This skill reads from `project.yaml` when available:

```yaml
# From project.yaml
paths:
  lit_synthesis: literature/synthesis/
```

**Project type:** This skill works for **all project types**. Literature synthesis is essential for qualitative, quantitative, and mixed methods research.

Updates `progress.yaml` when complete:
```yaml
status:
  lit_synthesis: done
artifacts:
  field_synthesis: literature/synthesis/field-synthesis.md
  theoretical_map: literature/synthesis/theoretical-map.md
  debate_map: literature/synthesis/debate-map.md
```

## The Lit Trilogy

This skill is the middle step in a three-skill workflow:

| Skill | Role | Key Output |
|-------|------|------------|
| **lit-search** | Find papers via OpenAlex | `database.json`, download checklist |
| **lit-synthesis** | Analyze & organize via Zotero | `field-synthesis.md`, `theoretical-map.md`, `debate-map.md` |
| **argument-builder** | Draft prose | Publication-ready Theory section |

**Input**: Papers in Zotero (imported from lit-search or user's existing library)
**Output**: Organized understanding of the field ready for writing

## When to Use This Skill

Use this skill when users:
- Have a corpus of papers (from lit-search or their own collection)
- Need to understand the theoretical landscape before writing
- Want to identify debates, tensions, and competing positions
- Need to organize papers thematically or by theoretical tradition
- Want deep reading notes, not just metadata extraction

## Core Principles

1. **Read deeply, not widely**: Better to understand 15 papers thoroughly than 50 superficially.

2. **Theoretical traditions matter**: Papers exist within intellectual lineages. Map who cites whom and why.

3. **Debates are gold**: Competing positions create space for contributions. Find the tensions.

4. **Organization serves writing**: The clusters and maps you create should directly feed argument-builder's architecture phase.

5. **Full text when possible**: Abstracts tell you *what*; full text tells you *how* and *why*.

## Reading Modes

Phase 1 (Deep Reading) supports two modes for accessing paper content:

| Mode | Source | Model | Cost | Best For |
|------|--------|-------|------|----------|
| **Zotero** | Library via MCP | Opus | Higher | Papers you've annotated; leverages highlights |
| **Docling** | PDF → Markdown | Haiku | Lower | Batch processing; new PDFs without annotations |

Choose based on your situation:
- **Zotero mode**: When papers are in your library and you've already highlighted key passages
- **Docling mode**: When processing many new PDFs quickly, or when Zotero isn't set up

Both modes produce the same structured reading notes with required identifiers.

---

## Zotero Integration

For **Zotero mode**, this skill uses the bundled **zotero** and **zotero-rag** skills:

### Setup

See `mcp/zotero-setup.md` for detailed configuration.

### Two Complementary Skills

| Skill | Purpose | Best For |
|-------|---------|----------|
| **zotero** | 43 MCP tools for library operations | Metadata, collections, annotations |
| **zotero-rag** | Semantic search across PDF content | Finding passages by meaning |

### Key Capabilities

**zotero skill** (structured access):
- `search_items` - Find papers by keyword, author, tag
- `get_item` - Retrieve full metadata
- `collection_items` - List items in a collection

**zotero-rag skill** (semantic search):
- `semantic_search` - Find passages by conceptual similarity
- `get_chunk_context` - Expand results with surrounding text
- `find_similar_chunks` - Discover related discussions across documents

### Workflow Integration

1. **From lit-search**: Import the BibTeX export into Zotero
2. **Acquire PDFs**: Use Zotero's "Find Available PDF" or manual download
3. **Index for RAG**: Run `index_library collection_key="YOUR_COLLECTION"`
4. **Read and annotate**: Highlight key passages, add notes
5. **lit-synthesis reads**: Access via zotero tools and semantic search via zotero-rag

---

## Docling PDF Conversion

For **Docling mode**, PDFs are converted to markdown for agent-based reading:

### Setup

Install docling:
```bash
pip install docling
```

### Using reading-agent Skill

For structured reading notes, use the bundled **reading-agent** skill:

```
/reading-agent

Paper: [Author Year - Title]
PDF: /path/to/paper.pdf
DOI: [doi]
```

The reading-agent skill handles PDF conversion and produces structured notes with:
- Bibliographic info and identifiers
- Core arguments and theoretical frameworks
- Methods and empirical strategy
- Key findings and contribution claims
- Key quotes with page numbers

### Batch Processing

For batch processing many papers:

1. **Convert PDFs**: Run `scripts/pdf-to-md.sh` on each paper
2. **Use reading-agent in batch mode**:
   ```
   /reading-agent

   Batch process these papers:
   - /papers/smith2020.pdf (DOI: 10.1086/123456)
   - /papers/jones2019.pdf (OpenAlex: W2123456789)
   ```
3. **Collect outputs**: Notes saved to `reading-notes/` directory

### Conversion Scripts (Alternative)

Located in `scripts/` directory:

| Script | Purpose |
|--------|---------|
| `pdf-to-md.sh` | Convert single PDF to markdown (with caching) |
| `read-paper.sh` | Wrapper with status messages |
| `reading-agent-prompt.md` | Template for manual agent spawning |

## Workflow Phases

### Phase 0: Corpus Audit
**Goal**: Assess what's in the corpus and identify gaps.

**Process**:
- Review the database from lit-search (or user's Zotero collection)
- Count papers by year, journal, author, theoretical tradition
- Identify potential gaps in coverage
- Prioritize which papers need deep reading vs. skimming

**Output**: `corpus-audit.md` with statistics and reading priorities.

> **Pause**: User confirms corpus coverage and reading priorities.

---

### Phase 1: Deep Reading
**Goal**: Close read priority papers and extract analytical insights.

**Process**:
- For each priority paper, read full text via Zotero MCP
- Extract: argument structure, theoretical framework, key concepts, methodological approach
- Note: how theory is deployed, what evidence supports claims, limitations acknowledged
- Create structured reading notes

**Output**: `reading-notes/` directory with per-paper notes.

> **Pause**: User reviews reading notes for key papers.

---

### Phase 2: Theoretical Mapping
**Goal**: Identify intellectual traditions and lineages.

**Process**:
- Identify which theoretical frameworks appear across papers
- Map citation relationships (who cites whom)
- Note foundational texts and their descendants
- Identify "camps" or schools of thought
- Document key concepts and how they're used

**Output**: `theoretical-map.md` with traditions, key theorists, and concept definitions.

> **Pause**: User reviews theoretical landscape.

---

### Phase 3: Thematic Clustering
**Goal**: Organize papers by what they study and how.

**Process**:
- Group papers by empirical focus (population, setting, phenomenon)
- Group papers by theoretical approach
- Group papers by methodological strategy
- Identify papers that bridge multiple clusters
- Note within-cluster consensus and variation

**Output**: `thematic-clusters.md` with organized paper groupings.

> **Pause**: User reviews clustering logic.

---

### Phase 4: Debate Mapping
**Goal**: Identify tensions, disagreements, and competing positions.

**Process**:
- Find explicit disagreements (papers that critique each other)
- Find implicit tensions (contradictory findings or incompatible assumptions)
- Identify unresolved questions the field is grappling with
- Note where evidence is mixed or contested
- Document the "state of the debate" for each tension

**Output**: `debate-map.md` with positions, evidence, and unresolved questions.

> **Pause**: User reviews debates and selects focus areas.

---

### Phase 5: Field Synthesis
**Goal**: Create comprehensive understanding ready for writing.

**Process**:
- Synthesize across phases into coherent field understanding
- Identify the most productive gaps for contribution
- Recommend which argument-builder cluster (Gap-Filler, Theory-Extender, etc.) fits
- Create the handoff document for argument-builder

**Output**: `field-synthesis.md` with integrated understanding and writing recommendations.

---

## Output Files

```
lit-synthesis/
├── corpus-audit.md           # Phase 0: What's in the corpus
├── reading-notes/            # Phase 1: Per-paper notes
│   ├── smith2020-cultural-frames.md    # Filename: author-year-short-title
│   ├── jones2019-institutional.md
│   └── ...                             # Each file has identifier frontmatter
├── theoretical-map.md        # Phase 2: Traditions and lineages
├── thematic-clusters.md      # Phase 3: Paper groupings
├── debate-map.md             # Phase 4: Tensions and positions
└── field-synthesis.md        # Phase 5: Integrated understanding
```

**Note**: Filenames use `author-year-short-title.md` for human readability, but the **frontmatter identifiers** (OpenAlex ID, DOI, Zotero key) are the authoritative way to match notes back to source papers.

## Reading Note Template

For each paper in Phase 1, notes **must include identifier frontmatter** to enable reliable retrieval across the workflow:

```markdown
---
# Required: At least one unique identifier
openalex_id: W2123456789    # From lit-search database (preferred)
doi: 10.1086/123456         # Digital Object Identifier
zotero_key: ABC123XY        # Zotero item key (if in library)

# Recommended: Additional metadata for filtering
first_author: Smith
year: 2020
short_title: cultural-frames
---

# Smith 2020 - Cultural Frames

## Bibliographic Info
- Full citation: [from Zotero or database]
- DOI: [link]
- OpenAlex: https://openalex.org/W2123456789

## Core Argument
[1-2 sentences: What is the paper arguing?]

## Theoretical Framework
- Tradition: [e.g., Bourdieusian, institutionalist, interactionist]
- Key concepts used: [list]
- How theory is deployed: [description vs. extension vs. critique]

## Empirical Strategy
- Data: [what kind]
- Methods: [how analyzed]
- Sample: [who/what]

## Key Findings
1. [Finding 1]
2. [Finding 2]
3. [Finding 3]

## Contribution Claim
[What does the paper claim to contribute?]

## Limitations (as noted by authors)
- [Limitation 1]
- [Limitation 2]

## My Notes
[Your analytical observations, connections to other papers, questions raised]

## Key Quotes
> "[Quote 1]" (p. X)

> "[Quote 2]" (p. Y)

## Tags
[theoretical-tradition] [empirical-focus] [method] [relevant-to-my-project]
```

## Model Recommendations

| Phase | Model | Rationale |
|-------|-------|-----------|
| **Phase 0**: Corpus Audit | **Sonnet** | Data processing, statistics |
| **Phase 1**: Deep Reading (Zotero) | **Opus** | Analytical reading with annotations |
| **Phase 1**: Deep Reading (Docling) | **Haiku** | Cost-effective batch processing |
| **Phase 2**: Theoretical Mapping | **Opus** | Pattern recognition, intellectual history |
| **Phase 3**: Thematic Clustering | **Sonnet** | Organization, categorization |
| **Phase 4**: Debate Mapping | **Opus** | Tension identification, nuance |
| **Phase 5**: Field Synthesis | **Opus** | Integration, strategic judgment |

**Phase 1 model choice**: Use Opus for close reading of key theoretical papers; use Haiku via docling mode for processing larger batches where structured extraction is the goal.

## Starting the Synthesis

When the user is ready to begin:

1. **Identify the corpus**:
   > "Where are your papers? A Zotero collection? A folder of PDFs? A database from lit-search? How many papers total?"

2. **Choose reading mode**:
   > "For Phase 1, we have two options:
   > - **Zotero mode**: Best if papers are in your library with annotations. Uses Opus for deep reading.
   > - **Docling mode**: Best for batch-processing PDFs. Converts to markdown and uses Haiku agents.
   > Which fits your situation?"

3. **Verify setup** (based on mode):
   - *Zotero*: Check MCP is configured (see `mcp/zotero-setup.md`)
   - *Docling*: Verify docling is installed (`pip install docling`)

4. **Set priorities**:
   > "Which papers are most central to your project? We'll deep-read those first and skim the rest."

5. **Clarify goals**:
   > "What are you trying to understand about this field? Are you looking for gaps, debates, or a specific theoretical tradition?"

6. **Proceed with Phase 0** to audit the corpus.

## Key Reminders

- **Identifiers are essential**: Every reading note must have at least one unique identifier (OpenAlex ID, DOI, or Zotero key) in its frontmatter
- **Choose the right mode**: Zotero mode for annotated papers; Docling mode for batch processing
- **Annotations accelerate**: If you've already highlighted papers, Zotero mode leverages that work
- **Quality over quantity**: Deep reading 15 papers beats skimming 50
- **Debates are opportunities**: Every tension you find is a potential contribution space
- **This feeds argument-builder**: The outputs here become inputs there—keep that handoff in mind
