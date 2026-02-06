# Phase 2: Source Mapping

**Goal**: Map each extracted item to its specific source document so verification can proceed efficiently.

## Mapping Process

### For Interview Sources

#### Step 1: Inventory Available Transcripts

List all transcript files:

```bash
ls -la /path/to/interviews/
```

Create a participant-to-file mapping:

| Participant Name | Transcript File | Status |
|-----------------|-----------------|--------|
| Maria | maria.md | Available |
| Jose | jose.md | Available |
| Patricia | patricia.md | Available |
| Carlos | | **MISSING** |

#### Step 2: Match Items to Transcripts

For each extracted item with an interview attribution:

1. **Parse the source name**: Extract participant name from attribution
2. **Normalize the name**: Handle variations (e.g., "Maria" vs "Maria G.")
3. **Match to transcript**: Find corresponding file
4. **Record the mapping**: Item ID -> Transcript path

**Common mapping issues**:

| Issue | Example | Resolution |
|-------|---------|------------|
| Name variant | "Maria" in text, "Maria_Garcia" in filename | Ask user to confirm mapping |
| Missing transcript | Quote from "Carlos" but no carlos.md | Flag as unverifiable |
| Multiple participants with same name | Two "Marias" in study | Ask user which one |
| Composite pseudonym | "Maria/Patricia" | Need to check both transcripts |

#### Step 3: Handle Aggregate Claims

For aggregate claims ("most participants"):

1. **Identify scope**: How many participants should support this?
   - "Most" = majority (>50%)
   - "Many" = substantial number (>25%?)
   - "Several" = 3+
   - "A few" = 2-3
   - "All" = 100%

2. **List relevant transcripts**: Which participants could potentially support this claim?

3. **Create verification plan**: Will need to check multiple sources

### For Literature Sources

#### Step 1: Inventory Available Literature

Check available sources:

**If folder-based**:
```bash
ls -la /path/to/literature/
```

**If Zotero-based**:
- Search for each cited work
- Record Zotero key or note if not found

Create a citation-to-source mapping:

| Citation | Source File/Key | Status |
|----------|----------------|--------|
| Smith 2020 | smith-2020.pdf | Available |
| Jones & Lee 2019 | jones-lee-2019.md | Available |
| Brown et al. 2021 | | **NOT FOUND** |

#### Step 2: Match Items to Sources

For each extracted item with a literature citation:

1. **Parse the citation**: Extract author(s) and year
2. **Search for source**: Check folder or Zotero
3. **Handle ambiguity**: Same author, same year = need title match
4. **Record the mapping**: Item ID -> Source path/key

**Common mapping issues**:

| Issue | Example | Resolution |
|-------|---------|------------|
| Citation not in collection | Brown 2021 cited but no PDF | Flag as unverifiable |
| Multiple works same author/year | Smith 2020a, Smith 2020b | Match via title |
| Name variation | "MacDonald" vs "Macdonald" | Fuzzy match, confirm |
| Secondary citation | "Smith 2020, citing Brown 2015" | Note: verify in Smith, not Brown |

### Mapping Output

Update `verification/verification-items.md` with mappings:

```markdown
## Item [number]

**Type**: exact-quote
**Text**: "I didn't really think about it until my kids started asking questions"
**Source**: Maria
**Page/Location**: n/a
**Manuscript Location**: Findings, paragraph 3
**Verification Level**: exact
**Verification Note**: Find this exact quote in Maria's transcript

### Mapping
**Source Type**: interview
**Mapped To**: /path/to/interviews/maria.md
**Mapping Status**: CONFIRMED
**Mapping Notes**: Direct match on participant name
```

### Create Mapping Summary

Add to verification-items.md:

```markdown
## Mapping Summary

### Interview Mappings
| Participant | Transcript | Items | Status |
|-------------|-----------|-------|--------|
| Maria | maria.md | 5 | Mapped |
| Jose | jose.md | 3 | Mapped |
| Carlos | | 2 | **UNMAPPED** |

### Literature Mappings
| Citation | Source | Items | Status |
|----------|--------|-------|--------|
| Smith 2020 | smith-2020.pdf | 4 | Mapped |
| Brown 2021 | | 1 | **UNMAPPED** |

### Unmapped Items
These items cannot be verified without source access:

1. **Item 7**: Quote from Carlos - no transcript available
2. **Item 12**: Claim from Brown 2021 - source not found

### Aggregate Claim Verification Plan
| Claim | Scope | Transcripts to Check |
|-------|-------|---------------------|
| Item 15: "Most participants felt isolated" | >50% (8+ of 15) | all 15 transcripts |
| Item 23: "Several mentioned family pressure" | 3+ | all 15 transcripts |
```

## Handling Unmapped Items

For items that can't be mapped:

### Option 1: User Provides Source
> "I couldn't find a transcript for Carlos. Can you provide the file path?"

### Option 2: Exclude from Verification
> "Without access to Brown 2021, I'll mark this claim as UNVERIFIABLE. You may want to verify manually or remove the citation."

### Option 3: Alternative Source
> "Quote attributed to 'the participant' without a name. Can you identify which participant this refers to?"

## Pre-Verification Optimization

Before Phase 3, optimize for efficiency:

### Group by Source File

Rather than verifying item-by-item, group items by source:

```markdown
## Verification Batches

### Batch 1: maria.md (5 items)
- Item 1: "I didn't really think about it..."
- Item 4: "My kids were the ones who..."
- Item 8: "After about six months..."
- Item 12: "The hardest part was..."
- Item 19: "Looking back now..."

### Batch 2: jose.md (3 items)
- Item 2: "When I first arrived..."
- Item 6: "Nobody tells you about..."
- Item 11: "I wish someone had..."
```

This reduces file reads and context switching.

### Identify Candidates for Fast Search

Mark items likely to succeed with grep:

- Long, distinctive phrases (good for grep)
- Short common phrases (may need deep read)
- Quotes with unusual words (good for grep)
- Paraphrases (may need deep read)

## Checkpoint for User

Before proceeding to verification:

1. **Confirm mappings**:
   > "I've mapped [X] items to sources. Please review any flagged as ambiguous."

2. **Resolve unmapped items**:
   > "These [X] items couldn't be mapped. How should we handle them?"

3. **Approve verification batches**:
   > "I'll verify in batches by source file. Ready to proceed?"

## Transition to Phase 3

Once user confirms:
1. All possible mappings are complete
2. Unmapped items are acknowledged or resolved
3. Verification batches are approved

Proceed to Phase 3: Verification.
