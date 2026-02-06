# Phase 2: Skill Dispatch via Task Agents

## CRITICAL: You Do NOT Revise Text

**All revision in this phase happens through Task agents. You coordinate and dispatch; agents do the actual revision work.**

If you find yourself writing or editing prose, STOP. Spawn a Task agent instead.

## Why This Phase Matters

This is where revision actually happens—but not by you. Based on the diagnostic assessment, you spawn Task agents running specialized skills to revise each section. Your job is:
1. Prepare the dispatch context
2. Spawn the appropriate Task agent
3. Track completion
4. Update the revision map
5. Proceed to the next section

## Dispatch Principles

1. **Task agents do the work**: Never revise text yourself. Spawn an agent for every section.

2. **One section at a time**: Complete each section before moving to the next (unless dependencies require otherwise)

3. **Full context provision**: Agents need the existing text, specific feedback, cluster/pathway information, and output location

4. **Track as you go**: Update the revision map after each agent completes

5. **User checkpoints**: After each major section, pause for user review of the agent's work

## Dispatch Protocols by Section

### Theory Section → argument-builder

```
Task: Revise Theory Section
subagent_type: general-purpose
model: opus
prompt: |
  Load the argument-builder skill:
  - Read: [path]/argument-builder/SKILL.md
  - Read: [path]/argument-builder/phases/phase5-revision.md
  - Read: [path]/argument-builder/clusters/[cluster-name].md

  TASK: Revise an existing Theory section.

  EXISTING SECTION:
  [paste current theory section - FULL TEXT]

  CLUSTER: [Gap-Filler / Theory-Extender / Concept-Builder / Synthesis / Problem-Driven]

  FEEDBACK:
  1. [ID: T-1] [specific item]
  2. [ID: T-2] [specific item]

  CONTEXT:
  - RQ: [research question]
  - Argument: [main contribution]
  - Literatures: [list]

  OUTPUT: Save to revision/section-revisions/theory-revised.md
```

---

### Introduction → interview-bookends

```
Task: Revise Introduction
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-bookends skill:
  - Read: [path]/interview-bookends/SKILL.md
  - Read: [path]/interview-bookends/phases/phase1-introduction.md
  - Read: [path]/interview-bookends/clusters/[cluster-name].md

  TASK: Revise an existing Introduction.

  EXISTING SECTION:
  [paste current introduction - FULL TEXT]

  CLUSTER: [Gap-Filler / Theory-Extension / Concept-Building / Synthesis / Problem-Driven]

  FEEDBACK:
  1. [ID: I-1] [specific item]

  COHERENCE CONTEXT:
  - Theory summary: [key argument]
  - Findings delivered: [what findings show]
  - Current conclusion: [for callback alignment]

  OUTPUT: Save to revision/section-revisions/introduction-revised.md
```

---

### Conclusion → interview-bookends

```
Task: Revise Conclusion
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-bookends skill:
  - Read: [path]/interview-bookends/SKILL.md
  - Read: [path]/interview-bookends/phases/phase2-conclusion.md
  - Read: [path]/interview-bookends/techniques/callbacks.md

  TASK: Revise an existing Conclusion.

  EXISTING SECTION:
  [paste current conclusion - FULL TEXT]

  CLUSTER: [cluster name]

  FEEDBACK:
  1. [ID: C-1] [specific item]

  COHERENCE CONTEXT:
  - Introduction: [paste for callbacks]
  - Key findings: [list]
  - Contribution claim: [the paper's core contribution]

  OUTPUT: Save to revision/section-revisions/conclusion-revised.md
```

---

### Methods Section → methods-writer

```
Task: Revise Methods Section
subagent_type: general-purpose
model: opus
prompt: |
  Load the methods-writer skill:
  - Read: [path]/methods-writer/SKILL.md
  - Read: [path]/methods-writer/phases/phase2-revision.md
  - Read: [path]/methods-writer/pathways/[pathway-name].md

  TASK: Revise an existing Methods section.

  EXISTING SECTION:
  [paste current methods section - FULL TEXT]

  PATHWAY: [Efficient / Standard / Detailed]

  FEEDBACK:
  1. [ID: M-1] [specific item]

  STUDY DETAILS:
  - Sample size: [N]
  - Population: [description]
  - Recruitment: [approach]
  - Interview format: [format]
  - Analysis: [method]

  OUTPUT: Save to revision/section-revisions/methods-revised.md
```

---

### Case Justification → case-justification

```
Task: Revise Case Justification
subagent_type: general-purpose
model: opus
prompt: |
  Load the case-justification skill:
  - Read: [path]/case-justification/SKILL.md
  - Read: [path]/case-justification/phases/phase2-revision.md
  - Read: [path]/case-justification/clusters/[cluster-name].md

  TASK: Revise an existing Case Justification.

  EXISTING SECTION:
  [paste current case section - FULL TEXT]

  CLUSTER: [Minimal / Standard / Deep Historical / Comparative / Policy-Driven]

  FEEDBACK:
  1. [ID: CJ-1] [specific item]

  CASE DETAILS:
  - Site(s): [description]
  - Population: [description]
  - Relationship to theory: [why this case?]

  OUTPUT: Save to revision/section-revisions/case-revised.md
```

---

### Findings Section → interview-writeup

**Findings revision goes to interview-writeup Phase 3, NOT "direct revision."**

```
Task: Revise Findings Section
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-writeup skill:
  - Read: [path]/interview-writeup/SKILL.md
  - Read: [path]/interview-writeup/phases/phase3-revision.md
  - Read: [path]/interview-writeup/techniques/rubric.md

  TASK: Revise an existing Findings section.

  EXISTING SECTION:
  [paste current findings section - FULL TEXT]

  FEEDBACK:
  1. [ID: F-1] [specific item]

  CONTEXT:
  - RQ: [research question]
  - Argument: [main contribution]
  - Theoretical concepts: [list key concepts from theory section]

  DATA ACCESS:
  - Quote database: [path]
  - Participant profiles: [path]
  - Transcripts: [path]

  CHECKS TO RUN:
  1. Argument structure (roadmap, claim-first)
  2. Anchor-echo pattern
  3. Quote integration
  4. Voice and confidence
  5. Variation handling
  6. Prevalence indicators

  If quotes are insufficient, flag as NEEDS DATA RETURN.

  OUTPUT: Save to revision/section-revisions/findings-revised.md
```

---

### Discussion Section → argument-builder + interview-analyst

Discussion revision depends on the feedback type:

**For scope/framing issues** (limitations, implications, scope conditions):

```
Task: Revise Discussion - Scope and Framing
subagent_type: general-purpose
model: opus
prompt: |
  Load the argument-builder skill:
  - Read: [path]/argument-builder/SKILL.md
  - Read: [path]/argument-builder/techniques/scope-conditions.md

  TASK: Revise Discussion for scope conditions and framing.

  EXISTING SECTION:
  [paste current discussion - FULL TEXT]

  FEEDBACK:
  1. [ID: D-1] [specific item about scope/limitations]

  CONTEXT:
  - Theory literatures: [list]
  - Contribution claim: [claim]
  - Key findings: [list]

  Ground scope conditions in actual study design. Do not invent.

  OUTPUT: Save to revision/section-revisions/discussion-revised.md
```

**For evidence issues** (claims need more support):

```
Task: Return to Data for Discussion Evidence
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-analyst skill:
  - Read: [path]/interview-analyst/SKILL.md
  - Read: [path]/interview-analyst/phases/phase2-coding.md

  TASK: Find additional evidence for discussion claims.

  CLAIM NEEDING SUPPORT:
  [describe the claim]

  QUOTE DATABASE: [path]
  TRANSCRIPTS: [path]

  Find relevant quotes. Update quote database. Return evidence summary.
```

---

### Abstract → abstract-builder

```
Task: Revise Abstract
subagent_type: general-purpose
model: opus
prompt: |
  Load the abstract-builder skill:
  - Read: [path]/abstract-builder/SKILL.md
  - Read: [path]/abstract-builder/phases/phase3-revision.md

  TASK: Revise an existing abstract.

  EXISTING ABSTRACT:
  [paste current abstract]

  ARCHETYPE: [Empirical-Showcase / Research-Report / Stakes-Driven / Puzzle-Solver]

  FEEDBACK:
  1. [ID: A-1] [specific item]

  CONTEXT:
  - RQ: [question]
  - Argument: [contribution]
  - Findings: [2-3 key findings]
  - Data: [sample, population, location]

  Generate 2-3 variants using different archetypes.

  OUTPUT: Save to revision/section-revisions/abstract-variants.md
```

---

## Dispatch Sequencing

Follow dependencies established in Phase 1:

### Typical Sequence

1. **Theory section first** (if changing) — Foundation
2. **Methods** (usually independent) — Can parallel theory
3. **Case justification** (if needed) — May depend on theory
4. **Findings** (if changing) — May need terminology from theory
5. **Introduction** — After theory and findings settled
6. **Discussion** — After findings settled
7. **Conclusion** — Last, after intro finalized
8. **Abstract** — After all sections finalized

### Dependency Handling

If dependencies exist:
- Complete upstream section first
- Note what changed that affects downstream
- Include changed context in downstream dispatch

**Example**: If theory cluster changed from Gap-Filler to Theory-Extension:
1. Complete theory revision agent
2. Before spawning intro agent, note: "Theory cluster is now Theory-Extension; intro should match"
3. Include revised intro when spawning conclusion agent

## Tracking Progress

After each agent completes, update `revision-map.md`:

```markdown
### Dispatch Log

| Time | Section | Agent Task | Items | Status |
|------|---------|------------|-------|--------|
| [time] | Theory | argument-builder/P5 | T-1, T-2 | Complete |
| [time] | Findings | interview-writeup/P3 | F-1 | Complete |
| [time] | Introduction | interview-bookends/P1 | I-1, I-2 | In progress |

### Item Status

| ID | Status | Notes |
|----|--------|-------|
| T-1 | [x] | Turn sharpened |
| T-2 | [x] | Word count reduced |
| F-1 | [x] | Anchor-echo pattern fixed |
| I-1 | [~] | Agent spawned |
```

## User Checkpoints

After each major section's agent completes, pause:

> **Agent Complete: [Theory Section]**
>
> Agent changes:
> - [Summary from agent output]
>
> Feedback items addressed:
> - T-1: [how]
> - T-2: [how]
>
> Next section: [Introduction]
>
> Ready to proceed?

## Handling Problems

### Agent Returns Incomplete Results

If an agent can't fully address feedback:
- Document what was addressed vs. what remains
- Flag item as `[~]` (partial) or `[!]` (needs user decision)
- Consider spawning a different agent (e.g., interview-analyst for more evidence)

### Agent Flags "NEEDS DATA RETURN"

If agent reports insufficient quotes/evidence:
1. Spawn `interview-analyst` to search transcripts
2. Update quote database
3. Re-spawn the original agent with new evidence

### Contradictory Feedback

If R1 and R2 contradict:
- Do NOT resolve yourself
- Flag as `[!]` with both options
- Ask user which direction
- Dispatch agent with user's choice

## When You're Done

After all agents complete:

Summarize:
- Sections revised (by which agent)
- Items addressed per section
- Items requiring user decision (`[!]`)
- Any NEEDS DATA RETURN flags resolved

**Example**:
> Dispatch complete. 6 agents ran:
> - Theory (argument-builder/P5): 3/3 items
> - Methods (methods-writer/P2): 2/2 items
> - Introduction (interview-bookends/P1): 2/2 items
> - Findings (interview-writeup/P3): 1/1 items (required data return first)
> - Discussion (argument-builder): 2/2 items
> - Conclusion (interview-bookends/P2): 1/1 items
>
> D-1 flagged [!] — user confirmed scope conditions.
>
> Ready for Phase 3 integration review.

Then proceed to Phase 3.
