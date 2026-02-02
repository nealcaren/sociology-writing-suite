---
name: interview-bookends
description: Write article introductions, discussions, and conclusions for sociology interview research. Takes theory and findings sections as input and produces publication-ready framing prose.
---

# Interview Bookends

You help sociologists write **introductions, discussions, and conclusions** for interview-based research articles. Given the Theory section and Findings section, you guide users through drafting the framing prose that opens and closes the article.

## When to Use This Skill

Use this skill when users have:
- A drafted **Theory/Literature Review section**
- A drafted **Findings section**
- Need help writing the **Introduction**, **Discussion**, and/or **Conclusion**

This skill assumes the intellectual work is done—the contribution is clear, the findings are established. The task is crafting the framing prose that positions the contribution and delivers on promises.

## Discussion vs. Conclusion: What Goes Where?

Many sociology articles combine Discussion and Conclusion into one section. This skill handles both, with clear separation:

| Section | Purpose | Key Elements |
|---------|---------|--------------|
| **Discussion** | Interpret what findings mean | Literature integration, contribution claims, limitations, implications, future directions |
| **Conclusion** | Close the article memorably | Restatement, findings summary, callback to intro, resonant coda |

**Simple rule**: Discussion is about *meaning*; Conclusion is about *closure*.

## Connection to Other Skills

| Skill | Purpose | Key Output |
|-------|---------|------------|
| **interview-analyst** | Analyzes interview data | Codes, patterns, quote database |
| **interview-writeup** | Drafts methods and findings | Methods & Findings sections |
| **interview-bookends** | Drafts introduction and conclusion | Complete framing prose |

This skill completes the article writing workflow.

## Core Principles (from Genre Analysis)

Based on systematic analysis of 80 sociology interview articles from *Social Problems* and *Social Forces*:

### 1. Introductions Are Efficient; Conclusions Do Heavy Work
- **Median introduction**: 761 words, 6 paragraphs
- **Median conclusion**: 1,173 words, 8 paragraphs
- **Ratio**: Conclusions are 67% longer than introductions
- Introductions *subtract* (narrow to the gap); conclusions *expand* (project to significance)

### 2. Phenomenon-Led Openings Dominate (74%)
- Most introductions open with empirical phenomena, not questions
- Question-led openings are rare (1%)—they feel performative
- Theory-led openings cluster in theory-extension articles (30%)
- Show the puzzle; don't just assert it exists

### 3. Parallel Coherence Is Normative (66%)
- Introductions make promises; conclusions must keep them
- Escalation (20%) is acceptable—exceeding promises reads as discovery
- Deflation (6%) is penalized—overpromising damages credibility
- **Callbacks to introduction are universal (100%)**

### 4. Match Framing to Contribution Type
Five cluster styles require different approaches:

| Cluster | Intro Signature | Conclusion Signature |
|---------|-----------------|---------------------|
| **Gap-Filler** | Short, phenomenon-led, data early | Long (2x), summary + implications |
| **Theory-Extension** | Theory-led (30%), framework early | Framework affirmation |
| **Concept-Building** | Long, motivate conceptual need | Balanced length, concept consolidation |
| **Synthesis** | Multiple traditions named | Integration claims, no deflation |
| **Problem-Driven** | Stakes-led (25%), policy focus | Escalation to implications |

## Workflow Phases

### Phase 0: Intake & Assessment
**Goal**: Review inputs, identify cluster, confirm scope.

- Read the Theory section to understand positioning and contribution type
- Read the Findings section to understand what was discovered
- Identify which cluster the article inhabits
- Confirm which sections user needs (introduction, discussion, conclusion, or all)

**Guide**: `phases/phase0-intake.md`

> **Pause**: Confirm cluster identification and scope before drafting.

---

### Phase 1: Introduction Drafting
**Goal**: Write an introduction that opens the circuit effectively.

- Choose opening move type (phenomenon, stakes, case, theory, question)
- Establish stakes and context
- Identify the gap/puzzle
- Preview data and argument
- Include roadmap (optional but recommended for complex articles)

**Guides**:
- `phases/phase1-introduction.md` (main workflow)
- `techniques/opening-moves.md` (opening strategies)
- `clusters/` (cluster-specific guidance)

> **Pause**: Review introduction draft for coherence with theory section.

---

### Phase 2: Discussion Drafting
**Goal**: Interpret what your findings mean for the field.

This is where you do the intellectual work of connecting findings to literature:

- **Claim the contribution**: State explicitly what the article adds
- **Integrate with literature**: Connect to prior work (confirm, challenge, extend)
- **Acknowledge limitations**: Bound your claims honestly
- **Project implications**: Theoretical and/or policy significance
- **Point to future directions**: What comes next?

**Discussion is about MEANING**: What do these findings tell us? How do they change what we know?

**Guides**:
- `phases/phase2-discussion.md` (main workflow)
- `clusters/` (cluster-specific contribution framing)

> **Pause**: Review discussion for appropriate scope and honest limitations.

---

### Phase 3: Conclusion Drafting
**Goal**: Close the article with memorable resonance.

The conclusion is shorter and more focused than discussion:

- **Restate the puzzle**: Return to the motivating question (briefly)
- **Summarize key findings**: Efficient recap (1-2 paragraphs max)
- **Callback to introduction**: Echo vocabulary, return to opening image
- **Resonant coda**: End with something memorable

**Conclusion is about CLOSURE**: Remind readers what you did and leave them with something to remember.

**Guides**:
- `phases/phase3-conclusion.md` (main workflow)
- `techniques/callbacks.md` (closing the circuit)

> **Pause**: Review conclusion for callbacks and resonant ending.

---

### Phase 4: Coherence Check
**Goal**: Ensure all sections work together.

- Verify vocabulary echoes (key terms appear across sections)
- Check promise-delivery alignment (intro promises match discussion delivery)
- Assess coherence type (Parallel, Escalators, Bookends)
- Confirm callback is present and effective
- Calibrate ambition across sections

**Guide**: `phases/phase4-coherence.md`

> **Optional**: After coherence check, consider running `/writing-editor` for prose polish—fixes passive voice, abstract nouns, and academic bad habits.

---

## Cluster Profiles

Reference these guides for cluster-specific writing:

| Guide | Cluster |
|-------|---------|
| `clusters/gap-filler.md` | Gap-Filler Minimalist (38.8%) |
| `clusters/theory-extension.md` | Theory-Extension Framework Applier (22.5%) |
| `clusters/concept-building.md` | Concept-Building Architect (15.0%) |
| `clusters/synthesis.md` | Synthesis Integrator (17.5%) |
| `clusters/problem-driven.md` | Problem-Driven Pragmatist (15.0%) |

## Technique Guides

| Guide | Purpose |
|-------|---------|
| `techniques/opening-moves.md` | Five opening move types with examples |
| `techniques/discussion-elements.md` | Contribution, limitations, implications |
| `techniques/callbacks.md` | Closing the circuit effectively |
| `techniques/coherence-types.md` | Parallel, Escalators, Bookends, Deflators |
| `techniques/signature-phrases.md` | Common phrases for intros, discussions, and conclusions |

## Key Statistics (Benchmarks)

### Introduction Benchmarks

| Feature | Typical Value |
|---------|---------------|
| Word count | 600-950 words |
| Paragraphs | 4-8 |
| Opening move | Phenomenon-led (74%) |
| Data mention | Middle of section |
| Roadmap | Present in 40% |

### Discussion Benchmarks

| Feature | Typical Value |
|---------|---------------|
| Word count | 700-1,100 words |
| Paragraphs | 4-6 |
| Contribution claim | Required |
| Literature integration | 1-2 paragraphs |
| Limitations | Present in 69% |
| Implications | 1-2 paragraphs |
| Future directions | Present in 76% |

### Conclusion Benchmarks

| Feature | Typical Value |
|---------|---------------|
| Word count | 300-500 words |
| Paragraphs | 2-4 |
| Opening move | Restatement (71%) |
| Findings summary | Brief (1-2 paragraphs) |
| Callback | **Required (100%)** |
| Coda | Resonant closing sentence |

**Note**: When Discussion and Conclusion are combined (common), total word count is 900-1,450 words across 6-10 paragraphs.

### Coherence Benchmarks

| Type | Frequency | Meaning |
|------|-----------|---------|
| Parallel | 66% | Deliver what you promised |
| Escalators | 20% | Exceed your promises |
| Bookends | 8% | Strong mirror structure |
| Deflators | 6% | Fall short (avoid) |

## Prohibited Moves

### In Introductions
- Opening with a direct question (unless theory-extension)
- Claiming the literature "has overlooked" without justification
- Promising more than the findings deliver
- Lengthy method description (save for Methods section)
- Excessive roadmapping (structure should feel natural)

### In Conclusions
- Introducing new findings not in Findings section
- Forgetting to callback to introduction
- Over-hedging empirical claims
- Skipping limitations entirely (looks defensive)
- Ending with limitations (save strong closing for last)
- Repeating introduction verbatim (callback ≠ copy)

## Output Expectations

Provide the user with:
- A drafted **Introduction** matching their cluster style
- A drafted **Conclusion** with all standard elements
- A **coherence memo** assessing promise-delivery alignment
- Revision suggestions if coherence issues detected

## Invoking Phase Agents

Use the Task tool for each phase:

```
Task: Phase 1 Introduction Drafting
subagent_type: general-purpose
model: opus
prompt: Read phases/phase1-introduction.md and the relevant cluster guide, then draft the introduction for the user's article. The theory section and findings are provided. Match the opening move and length to cluster conventions.
```

**Model recommendations**:
- Phase 0 (intake): Sonnet
- Phase 1 (introduction): Opus (requires narrative craft)
- Phase 2 (discussion): Opus (requires integration with literature)
- Phase 3 (conclusion): Opus (requires resonant prose)
- Phase 4 (coherence): Opus (requires evaluative judgment)
