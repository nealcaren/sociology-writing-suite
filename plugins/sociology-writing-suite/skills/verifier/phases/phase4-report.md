# Phase 4: Report

**Goal**: Generate an actionable verification report that helps the user fix any issues.

## Report Structure

The verification report should be clear, actionable, and prioritized.

```markdown
# Verification Report

**Manuscript**: [filename]
**Verified**: [date]
**Agent**: Verifier Skill

## Executive Summary

- **Total items verified**: [X]
- **Verified successfully**: [X] ([%])
- **Issues requiring attention**: [X]

| Status | Count | % |
|--------|-------|---|
| VERIFIED | X | X% |
| PARTIAL | X | X% |
| NOT FOUND | X | X% |
| NEEDS REVIEW | X | X% |
| UNVERIFIABLE | X | X% |

### Verdict
[One sentence: "This manuscript is ready for submission" OR "X issues require attention before submission"]

---

## Issues Requiring Attention

### Critical Issues (Must Fix)

These are NOT FOUND items—quotes that could not be located in the attributed source.

#### Issue 1: Quote not found in source

**Item**: [Item number]
**Manuscript text**: "[quote as it appears in manuscript]"
**Attributed to**: [source]
**Location**: [section, paragraph]

**Problem**: This quote does not appear in [source name].

**Possible explanations**:
- Quote is from a different participant/source
- Quote was paraphrased rather than directly quoted
- Transcript may be incomplete or different version

**Recommended action**:
- [ ] Verify attribution (check if quote is from different source)
- [ ] Convert to paraphrase if exact wording unavailable
- [ ] Remove quote if source cannot be confirmed

---

#### Issue 2: [Next critical issue]
...

### Moderate Issues (Should Fix)

These are PARTIAL matches—quotes that differ from the source in potentially meaningful ways.

#### Issue 3: Quote differs from source

**Item**: [Item number]
**Manuscript text**: "[quote in manuscript]"
**Source text**: "[actual text in source]"
**Attributed to**: [source]

**Discrepancy**: [Description of difference]
- Manuscript says: "[X]"
- Source says: "[Y]"

**Assessment**: [Significant / Minor]

**Recommended action**:
- [ ] Update quote to match source: "[corrected quote]"
- [ ] Add ellipsis if content omitted: "[...] [quote continues]"
- [ ] Keep as-is (if difference is acceptable)

---

### Minor Issues (Consider Fixing)

These are verified items with small notes that don't require action.

- **Item X**: Minor punctuation difference (manuscript uses em-dash, source uses comma)
- **Item Y**: Contraction normalized (source: "did not", manuscript: "didn't")

---

## NEEDS REVIEW Items

These items require human judgment.

#### Review 1: Semantic match requires confirmation

**Item**: [Item number]
**Manuscript text**: "[paraphrase or claim]"
**Source text found**: "[what was found]"

**Question for user**: Does this source text adequately support the claim made in the manuscript?

- [ ] Yes, this supports the claim
- [ ] No, the claim needs revision
- [ ] Partially—needs qualification

---

## Successfully Verified

[List of all verified items, briefly, for completeness]

| Item | Type | Source | Status | Notes |
|------|------|--------|--------|-------|
| 1 | exact-quote | maria.md | VERIFIED | - |
| 2 | exact-quote | jose.md | VERIFIED | - |
| 3 | paraphrase | smith-2020.pdf | VERIFIED | semantic match |
| ... | | | | |

---

## Verification by Source

### Interview Sources

| Participant | Items | Verified | Issues |
|-------------|-------|----------|--------|
| Maria | 5 | 5 | 0 |
| Jose | 3 | 2 | 1 |
| Carlos | 2 | 0 | 2 (unmapped) |

### Literature Sources

| Citation | Items | Verified | Issues |
|----------|-------|----------|--------|
| Smith 2020 | 4 | 4 | 0 |
| Brown 2021 | 1 | 0 | 1 (unmapped) |

---

## Aggregate Claim Verification

| Claim | Required | Found | Status |
|-------|----------|-------|--------|
| "Most participants felt isolated" | 8+ of 15 | 11 | VERIFIED |
| "Several mentioned family pressure" | 3+ | 2 | **BELOW THRESHOLD** |

### Details for "Several mentioned family pressure"

Only 2 of 15 participants mentioned family pressure:
- Maria: "My family was putting pressure on me to..."
- Jose: "The pressure from back home was..."

**Recommendation**: Change "Several" to "Two participants" or provide additional evidence.

---

## Appendix: Full Verification Log

[Optional: Include detailed verification log if user wants full documentation]
```

## Generating Recommendations

For each issue, provide specific, actionable recommendations.

### For NOT FOUND Quotes

| Likely Cause | Signs | Recommendation |
|--------------|-------|----------------|
| Wrong attribution | Quote style matches different participant | "This quote may be from [other participant]—please verify" |
| Quote fabricated/misremembered | No similar content anywhere | "Consider removing this quote or replacing with documented content" |
| Transcript incomplete | Quote is plausible but missing | "Check if you have a more complete transcript version" |
| Merged quotes | Parts found in different places | "This appears to be a composite—either split into separate quotes or acknowledge the combination" |

### For PARTIAL Matches

| Discrepancy Type | Recommendation |
|------------------|----------------|
| Word changed | "Update to match source: '[correct text]'" |
| Content omitted | "Add ellipsis to indicate omission: '[...] [text]'" |
| Order changed | "Reorder to match source or use separate quotes" |
| Meaning affected | "Revise claim to match what source actually says" |

### For Aggregate Claims

| Issue | Recommendation |
|-------|----------------|
| Below threshold | "Change scope word: 'most' → 'some' or 'a few'" |
| Exactly at threshold | "Consider adding qualifier: 'About half of participants...'" |
| Counter-evidence exists | "Acknowledge variation: 'While most participants X, some Y...'" |

## Prioritization Framework

Order issues by severity:

### Priority 1: Potentially Fabricated Content
- Quotes that don't exist in any source
- Claims contradicted by sources
- Aggregate claims with no support

### Priority 2: Misleading Content
- Quotes significantly altered from source
- Claims that overstate source support
- Wrong attributions that change meaning

### Priority 3: Technical Accuracy
- Minor word changes
- Punctuation differences
- Formatting issues

## Quality Assurance Checks

Before finalizing the report, verify:

1. **All items accounted for**: Every extracted item has a status
2. **Issues have recommendations**: Each problem has a suggested fix
3. **Priorities are clear**: User knows what to address first
4. **Evidence is cited**: Issues reference specific source text
5. **Report is actionable**: User can act on findings without further research

## Delivering the Report

Save to: `verification/verification-report.md`

When presenting to user:

1. **Lead with summary**: "Verification complete. X items verified successfully. Y issues require attention."

2. **Highlight critical issues**: "Most importantly, I couldn't find these X quotes in their attributed sources."

3. **Provide context**: "This is common—quotes can drift during drafting. Here's how to fix each."

4. **Offer next steps**: "Would you like me to help update the manuscript with these corrections?"

## Post-Report Options

After delivering the report, offer:

1. **Manuscript correction assistance**: "I can help revise the manuscript to address these issues."

2. **Re-verification**: "After you make changes, I can re-run verification on the updated sections."

3. **Extended search**: "For NOT FOUND items, I can search additional sources if you provide them."

4. **Writing editor handoff**: "Once verification issues are resolved, /writing-editor can polish the prose."

## Archiving

Recommend user keep:
- `verification-report.md` (final report)
- `verification-results.md` (detailed verification log)

Can delete after verification is resolved:
- `verification-items.md` (extraction working file)
- `scope-summary.md` (intake working file)
