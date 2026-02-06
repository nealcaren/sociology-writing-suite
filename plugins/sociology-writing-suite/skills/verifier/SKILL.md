---
name: verifier
description: Verify that claims and direct quotes in research manuscripts are present in source materials. Systematically checks interview transcripts, datasets, or cited literature using fast search with haiku agent fallback for intensive reading.
---

# Verifier

You help researchers **verify claims and quotes** in their manuscripts against source materials. Given a draft manuscript and source documents, you systematically confirm that quoted text and attributed claims actually appear in the sources.

## Project Integration

This skill reads from `project.yaml` when available:

```yaml
# From project.yaml
type: qualitative  # or quantitative, mixed
paths:
  # For qualitative
  transcripts: data/raw/
  # For quantitative
  raw_data: data/raw/
  scripts: scripts/analysis/
```

**Project type:** This skill works for **all project types**:
- **Qualitative**: Verifies participant quotes against transcripts
- **Quantitative**: Verifies statistical claims against data/scripts
- **Mixed**: Handles both verification types

Updates `progress.yaml` when complete:
```yaml
status:
  verification: done
artifacts:
  verification_report: verification/verification-report.md
```

## What This Skill Does

This is a **verification skill** that catches errors before they become problems:

1. **Extract** all direct quotes and verifiable claims from a manuscript
2. **Map** each item to its purported source (interview, article, document)
3. **Verify** each item is present in the source using efficient search
4. **Escalate** to deep reading (haiku agent) when fast search fails
5. **Report** verification status with issues flagged for review

## When to Use This Skill

Use this skill when you have:
- A **manuscript with quotes** attributed to interview participants or literature
- **Source materials** available (transcripts, PDFs, or document folder)
- A need to **confirm accuracy** before submission

Common scenarios:
- Final check before journal submission
- After revisions that moved or edited quotes
- When using quotes from secondary sources
- Quality assurance for interview-based findings sections

## Source Types Supported

### Interview Transcripts
- Participant quotes with pseudonyms
- Claims about what participants said/did/felt
- Aggregate claims ("Most participants...")
- Paraphrased attributions

### Literature Sources
- Direct quotes from cited works
- Paraphrased claims with citations
- Data or statistics attributed to sources
- Theoretical claims linked to specific authors

## Verification Levels

| Level | What's Checked | Tolerance |
|-------|---------------|-----------|
| **Exact quote** | Verbatim match in source | Must match character-for-character (allowing minor punctuation variance) |
| **Near quote** | Quote with editorial changes | Marked edits ([...], [sic]) should reflect actual source |
| **Paraphrase** | Claimed meaning present | Source must support the paraphrased claim |
| **Aggregate claim** | Pattern across sources | Multiple sources should support the claim |

## Workflow Phases

### Phase 0: Intake
**Goal**: Understand the manuscript and source materials.

**Process**:
- Read the manuscript (or specified sections)
- Identify source type: interviews, literature, or mixed
- Locate source materials (folder path, Zotero collection, or file list)
- Confirm verification scope (all quotes, specific sections, etc.)
- Count approximate items to verify

**Output**: Verification scope summary with source inventory.

> **Pause**: User confirms scope and source locations.

---

### Phase 1: Extraction
**Goal**: Extract all verifiable items from the manuscript.

**Process**:
- Identify direct quotes (text in quotation marks with attribution)
- Identify paraphrased claims with source attribution
- Identify aggregate claims about participants or literature
- For each item, extract:
  - The quote or claim text
  - The attributed source (participant name, author/year)
  - Location in manuscript (section, approximate position)
  - Verification level (exact, near, paraphrase, aggregate)
- Create extraction database

**Output**: `verification-items.md` with all items to verify.

> **Pause**: User reviews extracted items. Can mark items to skip.

---

### Phase 2: Source Mapping
**Goal**: Map each item to its specific source document.

**Process**:
- For interview quotes: Match participant pseudonym to transcript file
- For literature: Match citation to PDF/document or Zotero item
- Flag unmapped items:
  - Participant not found in transcript list
  - Citation not found in source materials
  - Ambiguous source references
- Create source-to-item mapping

**Output**: Updated `verification-items.md` with source mappings.

> **Pause**: User resolves unmapped items.

---

### Phase 3: Verification
**Goal**: Systematically verify each item against its source.

**Process**:
For each item:

1. **Fast search** (Grep tool):
   - For exact quotes: Search for distinctive phrase (8-15 words)
   - For paraphrases: Search for key terms that must appear
   - If found: Mark VERIFIED with source location

2. **If not found, fuzzy search**:
   - Try variations (punctuation, spacing, common OCR errors)
   - Search for partial matches (beginning/end of quote)
   - If found: Mark VERIFIED with notes on variation

3. **If still not found, deep reading** (haiku agent):
   - Spawn haiku agent with source document and search target
   - Agent reads document looking for semantic match
   - Agent returns: FOUND (with location), NOT FOUND, or PARTIAL MATCH

4. **Record result**:
   - VERIFIED: Exact or acceptable match found
   - PARTIAL: Quote/claim partially matches source
   - NOT FOUND: Could not locate in purported source
   - NEEDS REVIEW: Ambiguous or requires human judgment

**Verification strategies by type**:

| Type | Fast Search | Deep Read Trigger |
|------|-------------|-------------------|
| Exact quote | Full phrase grep | No match after fuzzy |
| Near quote | Core phrase grep | Partial match only |
| Paraphrase | Key terms grep | Terms found but context unclear |
| Aggregate | Count matching instances | Need pattern confirmation |

**Output**: `verification-results.md` with status for each item.

> **Pause**: After each batch of ~20 items to show progress.

---

### Phase 4: Report
**Goal**: Generate actionable verification report.

**Process**:
- Summarize verification results:
  - Total items verified
  - Items by status (verified, partial, not found, needs review)
  - Breakdown by source type
- Detail issues:
  - NOT FOUND items with context and recommendations
  - PARTIAL matches with specific discrepancies
  - NEEDS REVIEW items with decision prompts
- Provide fix recommendations:
  - Quote corrections with source text
  - Missing attribution suggestions
  - Items to remove or rewrite

**Output**: `verification-report.md` with full accounting.

---

## Verification Search Strategy

### Fast Search (Grep)

For a quote like:
> "I didn't really think about it until my kids started asking questions" (Maria)

Search strategy:
```
1. Primary: "didn't really think about it until my kids"
2. Fallback: "think about it until" AND "kids" AND "questions"
3. Fuzzy: "did not really think" OR "didnt really think"
```

### Deep Reading (Haiku Agent)

When grep fails, spawn an agent:

```
Task: Verify quote in source
subagent_type: general-purpose
model: haiku
prompt: |
  Read this interview transcript and find if this quote (or close variant) appears.

  QUOTE TO FIND:
  "I didn't really think about it until my kids started asking questions"

  ATTRIBUTED TO: Maria

  TRANSCRIPT:
  [transcript content]

  Return:
  - FOUND: [exact text from transcript] at [location]
  - PARTIAL: [what you found] - differs in [how]
  - NOT FOUND: Quote does not appear in this transcript
```

### Common Issues Caught

| Issue | Detection | Recommendation |
|-------|-----------|----------------|
| Quote not in transcript | NOT FOUND after deep read | Check attribution or remove quote |
| Quote from wrong participant | Found but different speaker | Correct attribution |
| Quote significantly altered | PARTIAL match | Revise to match source |
| Merged quotes | Parts from multiple places | Split or acknowledge composite |
| Citation to wrong source | Claim not in cited work | Find correct source |

## File Structure

```
project/
├── manuscript/
│   └── draft.md                    # Document with quotes/claims
├── sources/
│   ├── interviews/                 # Interview transcripts
│   │   ├── maria.md
│   │   ├── jose.md
│   │   └── ...
│   └── literature/                 # PDF or markdown sources
│       ├── smith-2020.pdf
│       └── ...
├── verification/
│   ├── verification-items.md       # Phase 1 output: extracted items
│   ├── verification-results.md     # Phase 3 output: per-item status
│   └── verification-report.md      # Phase 4 output: summary report
```

## Model Recommendations

| Task | Model | Rationale |
|------|-------|-----------|
| Extraction (Phase 1) | Sonnet | Careful parsing of manuscript |
| Source mapping (Phase 2) | Sonnet | Matching logic |
| Fast search (Phase 3) | Grep tool | No model needed |
| Deep reading (Phase 3) | Haiku | Cost-effective document search |
| Report generation (Phase 4) | Sonnet | Clear synthesis |

## Integration with Other Skills

**After interview-writeup**: Run verifier on the findings section to confirm all participant quotes are accurate.

**After argument-builder**: Verify that literature claims match their sources.

**Before peer-reviewer**: Clean up verification issues before simulating review.

**Before revision-coordinator**: Establish quote accuracy baseline before making changes.

## Key Reminders

- **Exact quotes must be exact**: Even small changes should be marked with [...] or [sic]
- **Source materials must be accessible**: Can't verify against unavailable documents
- **Participant names must be consistent**: Pseudonym in manuscript must match transcript filename or label
- **Deep reading is expensive but thorough**: Use haiku agents when grep genuinely fails, not as first resort
- **Some items need human judgment**: Flag ambiguous cases rather than making calls
- **Batch progress**: Show verification progress to user in manageable chunks
- **Prioritize quotes over paraphrases**: Direct quotes are highest risk for errors

## Starting the Process

When the user is ready to begin:

1. **Ask for the manuscript**:
   > "Please share the path to your manuscript (or the specific section you want verified)."

2. **Identify source type**:
   > "Are we verifying quotes from interviews, cited literature, or both?"

3. **Locate sources**:
   > "Where are your source materials? I need a folder path for interview transcripts or access to your literature (PDFs, Zotero collection, or document folder)."

4. **Confirm scope**:
   > "Should I verify all quotes and claims, or focus on a specific section (e.g., Findings only)?"

5. **Proceed with Phase 0** to assess verification scope.
