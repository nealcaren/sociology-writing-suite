# Phase 0: Intake

**Goal**: Understand the manuscript structure and source materials before extraction.

## Process

### Step 1: Read the Manuscript

Read the provided manuscript or section. As you read, note:

1. **Document structure**
   - What sections contain verifiable claims? (Abstract, Findings, Discussion, etc.)
   - Approximately how many quotes appear?
   - What attribution patterns are used?

2. **Quote formats detected**
   - Block quotes (indented, multiple lines)
   - Inline quotes (within paragraphs)
   - Paraphrased attributions ("According to Maria...")
   - Aggregate claims ("Most participants reported...")

3. **Source type indicators**
   - Participant pseudonyms (interview-based)
   - Author-year citations (literature-based)
   - Mixed sources

### Step 2: Inventory Sources

Based on source type:

**For Interviews**:
- List all participant names/pseudonyms mentioned
- Count unique participants
- Identify transcript location (folder path)
- Verify transcripts exist for each participant

```bash
# Example: List available transcripts
ls /path/to/interviews/
```

**For Literature**:
- Identify how sources are organized (folder, Zotero, mixed)
- Check accessibility of cited works
- Note any citations without accessible source material

**For Mixed**:
- Separate interview attributions from literature citations
- Create two source inventories

### Step 3: Assess Verification Scope

Determine what needs verification:

| Scope Option | Description | When to Use |
|--------------|-------------|-------------|
| **Full document** | All quotes and claims | Pre-submission check |
| **Findings only** | Interview quotes in findings section | After qualitative writeup |
| **Literature only** | Citations and paraphrases | After theory section revision |
| **Flagged items** | User-specified concerns | Targeted review |

### Step 4: Create Scope Summary

Document the verification task:

```markdown
## Verification Scope Summary

**Manuscript**: [filename/path]
**Date**: [date]

### Document Profile
- Sections to verify: [list]
- Estimated quotes: [count]
- Estimated paraphrases/claims: [count]
- Quote format: [inline/block/mixed]

### Source Type
- [ ] Interview transcripts
- [ ] Literature sources
- [ ] Mixed

### Interview Sources (if applicable)
| Participant | Transcript Available |
|-------------|---------------------|
| Maria | Yes - maria.md |
| Jose | Yes - jose.md |
| [etc.] | |

### Literature Sources (if applicable)
- Location: [folder path / Zotero collection]
- Accessible: [count] of [total] cited works

### Verification Scope
[Full / Findings / Literature / Specific sections]

### Issues Identified
- [Any missing transcripts]
- [Any inaccessible citations]
- [Any unclear attributions]
```

## Output

Save to: `verification/scope-summary.md`

## Checkpoint Questions for User

Before proceeding to extraction:

1. **Source locations confirmed?**
   > "I found transcripts at [path]. Is this the correct location?"

2. **Scope appropriate?**
   > "I plan to verify [X quotes in Y sections]. Should I expand or narrow this?"

3. **Missing sources?**
   > "I couldn't find transcripts for [participants]. Are these available elsewhere?"

4. **Priority guidance?**
   > "Any specific quotes or sections you're particularly concerned about?"

## Red Flags to Surface

Alert the user if you find:

- **No transcript for quoted participant**: Quote attributed to someone with no source file
- **Citation without accessible source**: Literature claim that can't be verified
- **Inconsistent names**: Participant referred to by different names in manuscript
- **Unusual quote density**: Section with many more quotes than others (higher error risk)
- **Secondary citations**: Quotes attributed to Author A citing Author B (verify carefully)

## Transition to Phase 1

Once user confirms:
1. Source locations are correct
2. Verification scope is appropriate
3. Missing source issues are resolved or acknowledged

Proceed to Phase 1: Extraction.
