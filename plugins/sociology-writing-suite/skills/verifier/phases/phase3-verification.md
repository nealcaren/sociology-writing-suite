# Phase 3: Verification

**Goal**: Systematically verify each item against its source, using efficient search first and escalating to deep reading when needed.

## Verification Strategy

The key principle: **Start fast, escalate when needed**.

```
┌─────────────────────────────────────────────────────────┐
│                    For Each Item                        │
├─────────────────────────────────────────────────────────┤
│  1. FAST SEARCH (Grep)                                  │
│     └── Found? → VERIFIED ✓                             │
│                                                         │
│  2. FUZZY SEARCH (Grep with variations)                 │
│     └── Found? → VERIFIED (with notes) ✓                │
│                                                         │
│  3. DEEP READ (Haiku Agent)                             │
│     └── Found? → VERIFIED ✓                             │
│     └── Partial? → PARTIAL MATCH ⚠                      │
│     └── Not found? → NOT FOUND ✗                        │
└─────────────────────────────────────────────────────────┘
```

## Step 1: Fast Search (Grep)

Use the Grep tool for initial search. This is fast and handles most cases.

### Selecting Search Phrases

**For exact quotes**, extract a distinctive phrase:

| Quote | Good Search Phrase | Why |
|-------|-------------------|-----|
| "I didn't really think about it until my kids started asking questions" | "think about it until my kids" | Distinctive, unlikely to appear elsewhere |
| "It was hard" | (skip to fuzzy) | Too common |
| "The phenomenological implications of this structural transformation" | "phenomenological implications of this structural" | Distinctive academic phrase |

**Guidelines for phrase selection**:
- Use 5-10 words from the middle of the quote
- Include distinctive words (names, unusual terms)
- Avoid very common phrases
- Avoid beginning/end which may have been edited

### Executing Fast Search

```
Grep tool:
- pattern: "think about it until my kids"
- path: /path/to/interviews/maria.md
- output_mode: "content"
- -C: 2  (context lines to verify surrounding text)
```

**Interpreting results**:

| Result | Action |
|--------|--------|
| Exact match | Mark VERIFIED, record location |
| Match with minor differences | Note differences, mark VERIFIED |
| Multiple matches | Check each, pick correct one |
| No match | Proceed to fuzzy search |

## Step 2: Fuzzy Search

When exact search fails, try variations.

### Common Variations to Try

| Variation Type | Original | Try |
|----------------|----------|-----|
| Contraction | "didn't" | "did not" |
| Punctuation | "kids—they" | "kids - they" or "kids, they" |
| Quote marks | "so-called 'experts'" | "so-called experts" |
| Spacing | "a lot" | "alot" |
| OCR errors | "didn't" | "didnt" or "didn'i" |
| British/American | "behaviour" | "behavior" |

### Fuzzy Search Patterns

```
# Try contraction expansion
Grep pattern: "did not really think about"

# Try partial phrase (beginning)
Grep pattern: "I didn't really think about"

# Try partial phrase (end)
Grep pattern: "kids started asking questions"

# Try key distinctive words
Grep pattern: "kids.*asking.*questions"
```

### When Fuzzy Succeeds

If you find a match with variations:

1. **Record the source text exactly**
2. **Note the discrepancy**: "Manuscript has 'didn't', source has 'did not'"
3. **Assess severity**:
   - Minor (punctuation, contraction): VERIFIED with note
   - Moderate (word change): PARTIAL MATCH
   - Significant (different meaning): NEEDS REVIEW

## Step 3: Deep Reading (Haiku Agent)

When grep fails, spawn a haiku agent to do semantic search.

### When to Use Deep Read

- Quote not found after fuzzy search
- Paraphrase that needs semantic matching
- Aggregate claim requiring pattern confirmation
- Source is PDF that may have OCR issues

### Haiku Agent Prompt Template

```
Task: Deep read verification
subagent_type: general-purpose
model: haiku
prompt: |
  You are verifying a quote/claim from an academic manuscript against source material.

  ## Task
  Search the following source document for this quote (or close semantic equivalent):

  **Quote to verify**:
  "[exact quote from manuscript]"

  **Attributed to**: [source name]
  **Verification type**: [exact-quote / paraphrase / aggregate]

  ## Source Document
  [paste source content here]

  ## Instructions

  1. Search for the exact phrase first
  2. If not found, search for semantic equivalents or paraphrases
  3. If verifying a paraphrase, look for content that supports the claim
  4. If verifying an aggregate claim, note supporting and counter instances

  ## Response Format

  Respond with ONE of:

  **FOUND**
  - Source text: "[exact text from source]"
  - Location: [where in document - beginning/middle/end, or line numbers if visible]
  - Match quality: [exact / near-exact / semantic match]
  - Notes: [any relevant observations]

  **PARTIAL**
  - Source text: "[what you found]"
  - Discrepancy: [how it differs from manuscript quote]
  - Location: [where in document]
  - Assessment: [whether difference is significant]

  **NOT FOUND**
  - Searched for: [what you looked for]
  - Closest match: [if any similar content exists]
  - Assessment: [quote may be from different source / may be fabricated / unclear]
```

### Interpreting Agent Results

| Agent Response | Verification Status | Action |
|----------------|--------------------| -------|
| FOUND (exact) | VERIFIED | Record source location |
| FOUND (near-exact) | VERIFIED with note | Record source text and note difference |
| FOUND (semantic) | PARTIAL | Flag for user review |
| PARTIAL | PARTIAL | Document discrepancy |
| NOT FOUND | NOT FOUND | Flag for user review |

## Verification by Item Type

### Exact Quotes

**Success criteria**: Source contains quote verbatim or with only minor punctuation differences.

**Process**:
1. Fast search with distinctive phrase
2. Fuzzy search with variations
3. Deep read if needed
4. Accept if source text matches manuscript text

**Acceptable differences**:
- Punctuation normalization (... vs . . .)
- Quote mark style (" vs ")
- Contraction consistency (didn't vs did not)

**Unacceptable differences**:
- Changed words
- Missing/added content
- Different speaker

### Block Quotes

**Success criteria**: Entire block appears in source as continuous text.

**Process**:
1. Search for first sentence
2. Search for last sentence
3. Verify continuity (no omitted content between)
4. Check for proper ellipsis marking if content omitted

**Flag if**:
- Content between start and end is omitted without [...]
- Quote is actually composite from multiple places

### Paraphrases

**Success criteria**: Source contains content that supports the paraphrased claim.

**Process**:
1. Identify key claim in the paraphrase
2. Search for distinctive terms
3. Use deep read to find semantic match
4. Assess whether source actually supports claim

**Example**:
> Manuscript: "Maria described feeling unprepared for the transition."

Search transcript for:
- "unprepared"
- "not ready"
- "didn't expect"
- "transition" context

**Accept if**: Transcript shows Maria expressing unpreparedness, even if wording differs.

### Aggregate Claims

**Success criteria**: Sufficient sources support the claim given its scope.

**Process**:
1. Identify claim scope (most, many, several)
2. Determine threshold:
   - "Most" = >50% of relevant sample
   - "Many" = >25% of sample
   - "Several" = 3+
3. Check each relevant source for supporting content
4. Count instances
5. Verify threshold met

**Example**:
> Manuscript: "Most participants reported feeling isolated."

With 15 participants:
- Need 8+ transcripts showing isolation
- Search each for: "isolated", "alone", "nobody", "lonely", etc.
- Record supporting instances
- Verify 8+ found

## Recording Results

Update `verification/verification-results.md`:

```markdown
## Item [number]: [first few words of quote...]

**Status**: VERIFIED / PARTIAL / NOT FOUND / NEEDS REVIEW

### Verification Log

**Step 1: Fast Search**
- Search phrase: "think about it until my kids"
- Result: [found/not found]
- Source location: [if found]

**Step 2: Fuzzy Search** (if needed)
- Variations tried: [list]
- Result: [found/not found]

**Step 3: Deep Read** (if needed)
- Agent response: [summary]
- Result: [FOUND/PARTIAL/NOT FOUND]

### Verification Details

**Source text**: "[exact text from source]"
**Source location**: [file, line numbers or position]
**Match quality**: exact / near-exact / semantic
**Discrepancies**: [if any]

### Notes
[Any relevant observations about this verification]
```

## Batch Processing

Process items in batches by source file to minimize file reading:

```markdown
## Verification Batch: maria.md

### Reading source...
[Read transcript once at start of batch]

### Item 1: "I didn't really think about it..."
- Fast search: FOUND at lines 45-47
- Status: VERIFIED

### Item 4: "My kids were the ones who..."
- Fast search: NOT FOUND
- Fuzzy search: Found as "My kids were the first ones who"
- Status: VERIFIED (minor word difference: "the ones" vs "the first ones")

### Item 8: "After about six months..."
- Fast search: NOT FOUND
- Fuzzy search: NOT FOUND
- Deep read: PARTIAL - found similar sentiment but different timeframe
- Status: NEEDS REVIEW

[Continue for all items in batch]

### Batch Summary: maria.md
- Verified: 4
- Partial: 1
- Not Found: 0
- Needs Review: 1
```

## Progress Reporting

After each batch (~20 items or 1 source file), report to user:

```markdown
## Progress Update

**Completed**: [X] of [Y] items ([Z]%)

### Current Batch: [source name]
- Verified: [n]
- Partial: [n]
- Not Found: [n]
- Needs Review: [n]

### Cumulative
- Verified: [n] ([%])
- Partial: [n] ([%])
- Not Found: [n] ([%])
- Needs Review: [n] ([%])

### Issues Found This Batch
1. Item [X]: [brief description of issue]
2. Item [Y]: [brief description of issue]

Continue to next batch?
```

## Transition to Phase 4

Once all items are verified:
1. All results recorded in verification-results.md
2. User has been notified of progress
3. Outstanding issues are documented

Proceed to Phase 4: Report.
