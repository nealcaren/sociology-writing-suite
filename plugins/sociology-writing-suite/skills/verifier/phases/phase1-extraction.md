# Phase 1: Extraction

**Goal**: Extract all verifiable items (quotes and claims) from the manuscript with their source attributions.

## Item Types to Extract

### 1. Direct Quotes (Exact)

Text in quotation marks attributed to a specific source.

**Interview example**:
> Maria explained, "I didn't really think about it until my kids started asking questions."

**Literature example**:
> As Smith (2020, p. 45) argues, "institutions reproduce inequality through taken-for-granted practices."

**Extract**:
- Quote text (exactly as written)
- Attributed source (Maria / Smith 2020)
- Page number if given
- Location in manuscript

### 2. Block Quotes

Extended quotes, typically indented.

**Example**:
> The experience of leaving was particularly vivid for Jose:
>
> > I remember waking up that morning and thinking, this is it. There's no going back. My whole family was depending on me to make this work, and I had no idea what I was walking into.

**Extract**:
- Full quote text
- Introduction/framing sentence
- Attributed source
- Location in manuscript

### 3. Paraphrased Claims

Claims attributed to a source but not in quotes.

**Interview example**:
> Maria described feeling unprepared for the transition.

**Literature example**:
> According to Smith (2020), institutional practices often go unquestioned.

**Extract**:
- Claim text
- Attributed source
- Verification note: What would need to be present in source?

### 4. Aggregate Claims

Claims about patterns across multiple sources.

**Examples**:
> Most participants reported feeling isolated.
> Several interviewees mentioned family pressure as a factor.
> The literature consistently shows that...

**Extract**:
- Claim text
- Scope indicator (most, several, all, the literature)
- Verification note: How many sources must support this?

## Extraction Process

### Step 1: Systematic Scan

Read through the manuscript section by section. For each section:

1. **Identify quoted text**: Look for quotation marks, block indentation
2. **Identify attributions**: Names, citations, "according to" phrases
3. **Identify aggregate claims**: "Most," "many," "participants," "the literature"

### Step 2: Create Extraction Database

For each item, record:

```markdown
## Item [number]

**Type**: [exact-quote / block-quote / paraphrase / aggregate]
**Text**: "[the quote or claim text]"
**Source**: [participant name or citation]
**Page/Location**: [if provided]
**Manuscript Section**: [section name]
**Manuscript Location**: [paragraph number or other locator]
**Verification Level**: [exact / near / paraphrase / aggregate]
**Verification Note**: [what to look for in source]
```

### Step 3: Apply Extraction Patterns

**For Interview Quotes**:

Look for these patterns:
- `"[text]" ([Name])`
- `[Name] said, "[text]"`
- `[Name] explained/described/recalled/noted, "[text]"`
- `As [Name] put it, "[text]"`
- `In [Name]'s words, "[text]"`
- Block quotes preceded by participant introduction

**For Literature Quotes**:

Look for these patterns:
- `"[text]" (Author Year, p. X)`
- `(Author Year: X)` following quoted text
- `Author (Year, p. X) states/argues/claims "[text]"`
- `As Author (Year) writes, "[text]"`
- Block quotes with citation

**For Paraphrases**:

Look for these patterns:
- `According to [source], [claim]`
- `[Name] described [claim]`
- `[Name] felt/thought/believed [claim]`
- `Author (Year) argues that [claim]`
- `Research shows that [claim] (Author Year)`

**For Aggregates**:

Look for these patterns:
- `Most/Many/Several participants [verb]`
- `Participants generally [verb]`
- `The majority of interviewees [verb]`
- `Across interviews, [pattern]`
- `The literature/research consistently [verb]`

### Step 4: Flag Ambiguities

Note items with unclear attribution:

- Quote with no explicit source
- Paraphrase that could apply to multiple participants
- Aggregate claim without clear scope
- Citation with no page number for direct quote
- Secondary citation (Author A citing Author B)

## Output Format

Create `verification/verification-items.md`:

```markdown
# Verification Items

**Extracted from**: [manuscript path]
**Extraction date**: [date]
**Total items**: [count]

## Summary

| Type | Count |
|------|-------|
| Exact quotes | X |
| Block quotes | X |
| Paraphrases | X |
| Aggregate claims | X |
| **Total** | **X** |

## Items by Section

### [Section Name]

#### Item 1
**Type**: exact-quote
**Text**: "I didn't really think about it until my kids started asking questions"
**Source**: Maria
**Page/Location**: n/a
**Manuscript Location**: Findings, paragraph 3
**Verification Level**: exact
**Verification Note**: Find this exact quote in Maria's transcript

---

#### Item 2
...

### [Next Section]
...

## Flagged Items

### Ambiguous Attribution
- Item X: [description of issue]

### Missing Page Numbers
- Item Y: Direct quote from Author (2020) without page number

### Aggregate Claims Needing Multiple Sources
- Item Z: "Most participants" - need to verify across multiple transcripts
```

## Extraction Quality Checks

Before completing this phase, verify:

1. **Completeness**: Did you catch all quoted text?
   - Search manuscript for `"` to find any missed quotes
   - Search for attribution phrases: "said," "explained," "according to"

2. **Accuracy**: Is extracted text exactly as written?
   - Include any editorial marks: [...], [sic], emphasis
   - Preserve original punctuation

3. **Attribution**: Is the source clearly identified?
   - Every quote should have a source
   - Flag any without clear attribution

4. **Coverage**: Are all verification-relevant claims included?
   - Not just quotes but also paraphrases
   - Aggregate claims that make empirical assertions

## Checkpoint for User

Before proceeding to source mapping:

1. **Review extracted items**:
   > "I extracted [X] items. Please review to confirm I captured everything relevant."

2. **Clarify ambiguities**:
   > "Item [X] has unclear attribution. Who is this quote from?"

3. **Prioritize if needed**:
   > "Should I verify all [X] items, or would you like to prioritize certain ones?"

4. **Skip items**:
   > "Are there any items you want to exclude from verification?"

## Transition to Phase 2

Once user confirms:
1. Extracted items are complete
2. Ambiguities are resolved
3. Any exclusions are noted

Proceed to Phase 2: Source Mapping.
