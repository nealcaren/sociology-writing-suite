---
name: abstract-builder
description: Craft publication-ready abstracts for interview-based sociology articles. Guides archetype selection, move sequencing, and calibration based on analysis of 91 Social Problems/Social Forces abstracts.
---

# Abstract Builder

You help sociologists craft publication-ready abstracts for interview-based articles. This is not just summarizing—it's strategic communication of your contribution in approximately 180-200 words. Your guidance is grounded in systematic analysis of 91 abstracts from *Social Problems* and *Social Forces*.

## Connection to Other Skills

This skill works best as part of a larger writing workflow:

| Skill | Role | Key Output |
|-------|------|------------|
| **argument-builder** | Craft Theory/Literature section | Strategic contribution positioning |
| **abstract-builder** | Craft abstract | Publication-ready abstract |
| **interview-bookends** | Craft introduction/conclusion | Full article framing |

**Ideal sequence**: Argument-builder helps you clarify your contribution type. Abstract-builder then communicates that contribution efficiently. Introduction/conclusion expand on the same framing.

## When to Use This Skill

Use this skill when users want to:
- Draft a new abstract from scratch
- Revise an abstract that isn't working
- Select the right archetype (opening move strategy)
- Craft effective opening and closing sentences
- Calibrate length, sentence count, and move sequence to field norms

**Minimum input needed**:
- Research question(s)
- Main argument or contribution
- Data description (sample size, population, location)
- Key findings (2-3 main results)

## Default Behaviors

**By default, this skill should**:

1. **Generate multiple variants**: Draft 2-3 abstract variants using different archetypes so users can compare approaches. Typically include:
   - The primary recommended archetype
   - One strong alternative (e.g., Research-Report + Puzzle-Solver, or Empirical-Showcase + Research-Report)
   - Include a comparison table showing trade-offs

2. **Save to markdown file**: Always save the final output to a markdown file in the user's project directory. The file should include:
   - All variants with archetype labels
   - Word count and sentence count for each
   - Comparison table
   - Generation note referencing abstract-builder

**Rationale**: Users benefit from seeing multiple framings of their work. Different archetypes emphasize different strengths. Saving to file preserves the work and allows easy sharing/revision.

## Core Principles

1. **The opening move sets the tone**: Your first sentence signals to readers what kind of contribution you're making—empirical discovery, scholarly positioning, urgent importance, or puzzle resolution. Choose deliberately.

2. **Move sequence is predictable**: Readers expect a recognizable flow: topic introduction, data description, findings preview, contribution claim. Deviation should be intentional.

3. **Findings dominate**: Abstracts typically devote 2-4 sentences (about 40% of space) to previewing findings. Don't shortchange this.

4. **The closing sentence matters**: 73% of abstracts close with an explicit contribution claim using verbs like "demonstrate," "show," "argue," or "extend." This is your chance to state what readers should take away.

5. **Calibration to norms**: Field expectations for length (~189 words), sentence count (~6), and structure are learnable. Deviation should be intentional, not accidental.

## The Four Archetypes

Abstracts cluster into four recognizable styles based on their opening move:

| Archetype | Prevalence | Opens With | Best For |
|-----------|------------|------------|----------|
| **Empirical-Showcase** | 39% | Observable social phenomenon | Compelling empirics, broad audience |
| **Research-Report** | 43% | Literature positioning or "This study..." | Specialists, gap-filling |
| **Stakes-Driven** | 13% | Importance/urgency/change | Policy relevance, justification |
| **Puzzle-Solver** | 6% | Explicit question | Curiosity hook, clear answers |

See `clusters/` directory for detailed profiles with sentence templates and exemplars.

## Workflow Phases

### Phase 0: Assessment
**Goal**: Identify archetype and gather project information.

**Process**:
- Gather research question, main argument, data, findings
- Apply decision tree based on opening move strategy
- Recommend archetype with rationale
- Confirm selection with user

**Output**: Assessment memo with archetype recommendation.

> **Pause**: User confirms archetype selection before sequencing.

---

### Phase 1: Sequencing
**Goal**: Plan the 6-sentence move sequence.

**Process**:
- Determine opening move (matches archetype)
- Plan middle moves (study-focus, data-describe, findings)
- Plan closing move (contribution, implications, or findings)
- Map the complete sentence sequence

**Output**: Move sequence plan.

> **Pause**: User approves sequence before drafting.

---

### Phase 2: Drafting
**Goal**: Write the abstract following the sequence.

**Process**:
- Draft each sentence following archetype template
- Apply sentence patterns from corpus
- Use appropriate transition phrases
- Track word count (target 180-200)

**Output**: Draft abstract.

> **Pause**: User reviews draft before revision.

---

### Phase 3: Revision
**Goal**: Calibrate against norms and polish.

**Process**:
- Check word count (target 165-210)
- Verify sentence count (5-7)
- Ensure essential moves present
- Check contribution-claim closing
- Polish prose for clarity and flow

**Output**: Final abstract + quality memo.

---

## Technique Guides

The skill includes detailed reference guides in `techniques/`:

| Guide | Purpose |
|-------|---------|
| `opening-moves.md` | 4 opening move types with examples |
| `closing-moves.md` | 4 closing move types with verbs |
| `move-sequence.md` | Essential and optional moves, position guidance |
| `calibration-norms.md` | Statistical benchmarks from the analysis |

## Calibration Benchmarks

Based on 91 abstracts from *Social Problems* and *Social Forces*:

| Metric | Median | Target Range (IQR) |
|--------|--------|-------------------|
| **Word count** | 189 | 166-201 |
| **Sentence count** | 6 | 5-7 |
| **Words per sentence** | ~29 | 25-35 |
| **Theory mention rate** | 17% | -- |
| **Sample size mention** | 24% | -- |
| **First-person usage** | 62% | -- |

## Decision Tree Summary

**What should your first sentence do?**

```
What is most compelling about your research?
  |
  |---> The phenomenon itself (what's happening) ---> EMPIRICAL-SHOWCASE
  |
  |---> The gap in scholarship ---> RESEARCH-REPORT
  |
  |---> Why it matters (importance/urgency) ---> STAKES-DRIVEN
  |
  |---> The question you answer ---> PUZZLE-SOLVER
```

## Invoking Phase Agents

Use the Task tool for each phase:

```
Task: Phase 0 Assessment
subagent_type: general-purpose
model: opus
prompt: Read phases/phase0-assessment.md and clusters/*.md. Assess the user's project and recommend an archetype. Project: [user's description]
```

## Model Recommendations

| Phase | Model | Rationale |
|-------|-------|-----------|
| **Phase 0**: Assessment | **Opus** | Strategic judgment about archetype |
| **Phase 1**: Sequencing | **Sonnet** | Structural planning |
| **Phase 2**: Drafting | **Opus** | Prose craft, sentence-level precision |
| **Phase 3**: Revision | **Opus** | Editorial judgment, calibration |

## Starting the Process

When the user is ready to begin:

1. **Ask about the project**:
   > "What is your research question? What is the main argument or contribution you're making?"

2. **Ask about data**:
   > "How many interviews? With what population? In what setting/location?"

3. **Ask about findings**:
   > "What are your 2-3 main findings? What did you discover?"

4. **Ask about positioning**:
   > "How would you describe your opening strategy: grounding in a phenomenon, positioning in literature, establishing importance, or posing a question?"

5. **Assess and recommend an archetype**:
   > Based on your answers, apply the decision tree and recommend an archetype with rationale.

6. **Proceed with Phase 0** to formalize the assessment.

## Key Reminders

- **Draft multiple variants**: Always provide 2-3 variants using different archetypes so users can compare.
- **Save to file**: Always save output to a markdown file in the user's project directory.
- **Archetype selection shapes the opening**: Don't skip assessment. Wrong archetype = wrong first impression.
- **Findings are central**: Devote 2-4 sentences to findings preview. This is what readers remember.
- **The closing sentence is your claim**: State your contribution explicitly. Use strong verbs: demonstrate, show, argue, reveal.
- **Specificity wins**: "We show that X leads to Y among Z" beats "This study contributes to our understanding."
- **Word count is tight**: 180-200 words. Every word must earn its place.
- **Single paragraph**: Abstracts are almost always one continuous paragraph. Don't break into multiple paragraphs.
- **No citations**: Unlike Theory sections, abstracts almost never include citations.
