# Skill Dispatch Templates

This guide provides templates for invoking each sub-skill from the research coordinator.

## General Dispatch Pattern

When invoking any sub-skill, provide:

1. **Skill location** - Path to the skill's SKILL.md
2. **Phase specification** - Which phase to execute
3. **Project context** - RQ, argument, current state
4. **Required inputs** - Prior outputs needed for this phase
5. **Output expectations** - Where to save results

## Dispatch Templates by Skill

---

### lit-search

#### LS.0: Scope Definition

```
Task: LS.0 Scope Definition
subagent_type: general-purpose
model: sonnet
prompt: |
  Load the lit-search skill (read ../lit-search/SKILL.md).
  Execute Phase 0: Scope Definition.

  PROJECT CONTEXT:
  - Research question: [PRIMARY_RQ]
  - Secondary questions: [SECONDARY_RQS]
  - Initial argument direction: [INITIAL_ARGUMENT]

  USER HAS PROVIDED:
  - Topic description: [TOPIC]
  - Key concepts to search: [CONCEPTS]
  - Known key papers: [PAPERS if any]
  - Date range preference: [DATES]
  - Disciplinary focus: [DISCIPLINES]

  PHASE GOAL:
  Define search strategy and inclusion criteria.

  OUTPUT:
  - Save scope document to: literature/scope.md
  - Include: search terms, queries, inclusion/exclusion criteria
  - Return summary for state update
```

#### LS.1-6: Subsequent Phases

Similar pattern, but include prior outputs:

```
Task: LS.2 Screening
subagent_type: general-purpose
model: sonnet
prompt: |
  Load the lit-search skill.
  Execute Phase 2: Screening.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]

  PRIOR OUTPUTS:
  - Scope document: literature/scope.md
  - Initial corpus: literature/corpus-v1.json
  - Total papers to screen: [N]

  PHASE GOAL:
  Filter corpus to relevant papers with LLM assistance.

  OUTPUT:
  - Save screened corpus to: literature/screened.json
  - Save decision log to: literature/screening-log.md
  - Return counts: included, excluded, borderline
```

---

### lit-synthesis

#### LY.0: Corpus Audit

```
Task: LY.0 Corpus Audit
subagent_type: general-purpose
model: sonnet
prompt: |
  Load the lit-synthesis skill (read ../lit-synthesis/SKILL.md).
  Execute Phase 0: Corpus Audit.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]

  PRIOR OUTPUTS:
  - Literature database: literature/database.json (or Zotero collection)
  - Corpus size: [N] papers

  USER HAS:
  - Zotero MCP configured: [yes/no]
  - PDFs acquired: [N of M]

  PHASE GOAL:
  Assess corpus coverage and prioritize reading.

  OUTPUT:
  - Save audit to: literature/corpus-audit.md
  - Include: statistics, gaps, reading priorities
  - Return summary for state update
```

#### LY.2: Theoretical Mapping

```
Task: LY.2 Theoretical Mapping
subagent_type: general-purpose
model: opus
prompt: |
  Load the lit-synthesis skill.
  Execute Phase 2: Theoretical Mapping.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]

  PRIOR OUTPUTS:
  - Corpus audit: literature/corpus-audit.md
  - Reading notes: literature/reading-notes/

  PHASE GOAL:
  Identify intellectual traditions and lineages.

  PROCESS:
  - Identify theoretical frameworks across papers
  - Map citation relationships
  - Note foundational texts and descendants
  - Identify camps or schools of thought
  - Document key concepts and usage

  OUTPUT:
  - Save to: literature/theoretical-map.md
  - Format: structured map with traditions, key theorists, concepts
  - Return summary for state update
```

---

### argument-builder

#### LW.0: Cluster Assessment

```
Task: LW.0 Cluster Assessment
subagent_type: general-purpose
model: sonnet
prompt: |
  Load the argument-builder skill (read ../argument-builder/SKILL.md).
  Also read the cluster profiles in clusters/ directory.
  Execute Phase 0: Assessment.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]
  - Contribution type (if known): [TYPE]

  PRIOR OUTPUTS (from lit-synthesis):
  - Theoretical map: literature/theoretical-map.md
  - Debate map: literature/debate-map.md
  - Field synthesis: literature/field-synthesis.md

  PHASE GOAL:
  Identify contribution type and select appropriate cluster.

  CLUSTERS TO CONSIDER:
  - Gap-Filler (27.5%): Identifies what's missing
  - Theory-Extender (22.5%): Applies named framework
  - Concept-Builder (15%): Introduces new terminology
  - Synthesis Integrator (18.8%): Connects literatures
  - Problem-Driven (16.3%): Resolves debate

  OUTPUT:
  - Save cluster memo to: writing/theory-section/cluster-memo.md
  - Include: selected cluster, rationale, positioning strategy
  - Return cluster selection for state update
```

#### LW.3: Drafting

```
Task: LW.3 Theory Section Drafting
subagent_type: general-purpose
model: opus
prompt: |
  Load the argument-builder skill.
  Read the phase guides: phases/phase3-drafting.md
  Read techniques: techniques/sentence-toolbox.md, techniques/citation-patterns.md
  Execute Phase 3: Drafting.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]

  PRIOR OUTPUTS:
  - Cluster memo: writing/theory-section/cluster-memo.md
  - Architecture: writing/theory-section/architecture.md
  - Paragraph map: writing/theory-section/paragraph-map.md
  - Theoretical map: literature/theoretical-map.md
  - Debate map: literature/debate-map.md

  SELECTED CLUSTER: [CLUSTER]
  TARGET WORD COUNT: [1,145-1,744]

  PHASE GOAL:
  Write complete theory section following cluster conventions.

  PROCESS:
  - Draft each paragraph following assigned function
  - Use appropriate opening sentence types
  - Integrate citations using cluster-appropriate patterns
  - Build toward the turn
  - Track all citations for bibliography

  OUTPUT:
  - Save draft to: writing/theory-section/theory-section-draft.md
  - Save citation tracking to: writing/theory-section/citations-tracking.json
  - Return word count, citation count for state update
```

---

### interview-analyst

#### IA.1: Immersion

```
Task: IA.1 Immersion & Familiarization
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-analyst skill (read ../interview-analyst/SKILL.md).
  Read phase guide: phases/phase1-immersion.md
  Execute Phase 1: Immersion.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument (current): [ARGUMENT]
  - Analysis track: [A (theory-informed) or B (data-first)]

  INPUTS:
  - Transcripts directory: interviews/
  - Number of interviews: [N]

  IF TRACK A:
  - Theory synthesis: analysis/phase0-theory/theory-synthesis.md
  - Sensitizing questions: [LIST]

  IF TRACK B:
  Use general sensitizing questions from SKILL.md.

  PHASE GOAL:
  Develop deep familiarity with data; generate initial observations.

  PROCESS:
  - Read every transcript carefully
  - Create a memo for each interview
  - Note surprises, patterns, questions
  - Flag contradictions and tensions
  - Begin identifying potential groupings

  OUTPUT:
  - Save memos to: analysis/phase1-memos/
  - Save phase report to: analysis/phase1-memos/phase1-report.md
  - Return summary: interviews read, emerging patterns
```

#### IA.2: Systematic Coding

```
Task: IA.2 Systematic Coding
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-analyst skill.
  Read phase guide: phases/phase2-coding.md
  Execute Phase 2: Systematic Coding.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]

  PRIOR OUTPUTS:
  - Phase 1 memos: analysis/phase1-memos/
  - Phase 1 report: analysis/phase1-memos/phase1-report.md
  - Emerging patterns from Phase 1: [LIST]

  PHASE GOAL:
  Transform raw data into organized, analyzable categories.

  PROCESS:
  - Develop preliminary codes from RQ, interview guide, Phase 1
  - Apply codes to transcripts
  - Create subcategories within general codes
  - Track variation within codes
  - Build codebook with definitions and examples

  OUTPUT:
  - Save codebook to: analysis/codebook/codebook.md
  - Save coded excerpts to: analysis/codebook/coded-excerpts/
  - Save phase report to: analysis/phase2-reports/phase2-report.md
  - Return summary: code count, subcode count
```

#### IA.5: Synthesis

```
Task: IA.5 Synthesis
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-analyst skill.
  Read phase guide: phases/phase5-synthesis.md
  Execute Phase 5: Synthesis.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]
  - Core findings: [LIST]

  PRIOR OUTPUTS:
  - Codebook: analysis/codebook/
  - Interpretation: analysis/phase3-interpretation/
  - Quality memo: analysis/phase4-quality/quality-memo.md

  PHASE GOAL:
  Create participant profiles and quote database for writing.

  PROCESS:
  - Create profile for each participant
  - Build quote database organized by finding
  - Flag luminous exemplars
  - Identify anchor and echo candidates
  - Note prevalence for each pattern

  OUTPUT:
  - Save profiles to: analysis/participant-profiles/
  - Save quote database to: analysis/quote-database.md
  - Return summary: profile count, quote count, findings count
```

---

### interview-writeup

#### IW.2: Findings Section

```
Task: IW.2 Findings Section Drafting
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-writeup skill (read ../interview-writeup/SKILL.md).
  Read technique guides:
  - techniques/macro-structure.md
  - techniques/prose-craft.md
  - techniques/rubric.md
  Execute Phase 2: Findings Section.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]
  - Core findings (3-4): [LIST]

  PRIOR OUTPUTS:
  - Intake memo: writing/findings-section/intake-memo.md
  - Quote database: analysis/quote-database.md
  - Participant profiles: analysis/participant-profiles/

  ARCHETYPE SELECTED: [mechanism-list | comparative | process]

  PHASE GOAL:
  Structure findings as argument-driven narrative.

  CORE PRINCIPLES:
  - Argument, not display: claims precede quotes
  - Anchor and echo: deep on one case, then prevalence
  - Variation is data: exceptions are valuable
  - Mechanism naming: clarify HOW processes work

  PROCESS:
  - Write Roadmap introduction
  - Draft each subsection using 8-step rubric
  - Use Anchor-Echo pattern for evidence
  - Craft theoretical headings that name mechanisms

  OUTPUT:
  - Save to: writing/findings-section/findings-section.md
  - Return summary: word count, subsection count, quotes used
```

---

### methods-writer

#### MW.0: Pathway Assessment

```
Task: MW.0 Methods Pathway Assessment
subagent_type: general-purpose
model: sonnet
prompt: |
  Load the methods-writer skill (read ../methods-writer/SKILL.md).
  Read pathway profiles in pathways/ directory.
  Execute Phase 0: Assessment.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Population studied: [POPULATION]
  - Sample size: [N]
  - Study design: [DESIGN]

  STUDY CHARACTERISTICS:
  - Is population vulnerable/marginalized? [yes/no]
  - Is design complex (multi-site, longitudinal, mixed)? [yes/no]
  - Are there space constraints? [yes/no]
  - Access challenges? [describe]

  PHASE GOAL:
  Select appropriate pathway (Efficient, Standard, Detailed).

  DECISION TREE:
  - Vulnerable population → DETAILED
  - Complex design → DETAILED
  - Simple design + space constraints → EFFICIENT
  - Otherwise → STANDARD (default)

  OUTPUT:
  - Save pathway memo to: writing/methods-section/pathway-memo.md
  - Return pathway selection and word target
```

---

### case-justification

#### CJ.0: Cluster Assessment

```
Task: CJ.0 Case Cluster Assessment
subagent_type: general-purpose
model: sonnet
prompt: |
  Load the case-justification skill (read ../case-justification/SKILL.md).
  Read cluster profiles in clusters/ directory.
  Execute Phase 0: Assessment.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Case/site: [CASE_DESCRIPTION]
  - Relationship to theory: [illustrates | tests | generates]

  CASE CHARACTERISTICS:
  - Is this comparative (multiple sites)? [yes/no]
  - Is historical context crucial? [yes/no]
  - Is policy context driving the study? [yes/no]
  - How much contextualization is needed? [minimal | moderate | extensive]

  PHASE GOAL:
  Select appropriate cluster for case justification.

  CLUSTERS:
  - Standard Context (34%): 700-1,000 words
  - Comparative (22%): 1,000-1,500 words, multiple sites
  - Minimal Context (16%): 300-500 words
  - Deep Historical (16%): 1,500-2,500 words
  - Policy-Driven (13%): 650-900 words, policy focus

  OUTPUT:
  - Save cluster memo to: writing/case-section/cluster-memo.md
  - Return cluster selection and word target
```

---

### interview-bookends

#### IB.1: Introduction Drafting

```
Task: IB.1 Introduction Drafting
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-bookends skill (read ../interview-bookends/SKILL.md).
  Read phase guide: phases/phase1-introduction.md
  Read techniques: techniques/opening-moves.md
  Read cluster profile: clusters/[CLUSTER].md
  Execute Phase 1: Introduction Drafting.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]
  - Contribution type: [CLUSTER]

  REQUIRED INPUTS:
  - Theory section: writing/theory-section/theory-section.md
  - Findings section: writing/findings-section/findings-section.md
  - Intake memo: writing/bookends/intake-memo.md

  TARGET: ~761 words, 6 paragraphs (median)

  OPENING MOVES (choose one):
  - Phenomenon-led (74%): Open with empirical phenomenon
  - Stakes-led: Open with significance
  - Case-led: Open with specific case
  - Theory-led (30% for theory-extension): Open with framework
  - Question-led (1%): Open with question (rare)

  PHASE GOAL:
  Write introduction that opens the circuit effectively.

  PROCESS:
  - Choose opening move type
  - Establish stakes and context
  - Identify the gap/puzzle
  - Preview data and argument
  - Craft roadmap (optional)

  OUTPUT:
  - Save to: writing/bookends/introduction.md
  - Return summary: word count, opening type
```

#### IB.3: Coherence Check

```
Task: IB.3 Coherence Check
subagent_type: general-purpose
model: opus
prompt: |
  Load the interview-bookends skill.
  Read phase guide: phases/phase3-coherence.md
  Read techniques: techniques/coherence-types.md, techniques/callbacks.md
  Execute Phase 3: Coherence Check.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]

  INPUTS:
  - Introduction: writing/bookends/introduction.md
  - Conclusion: writing/bookends/conclusion.md
  - Theory section: writing/theory-section/theory-section.md
  - Findings section: writing/findings-section/findings-section.md

  PHASE GOAL:
  Ensure introduction and conclusion work together.

  COHERENCE TYPES:
  - Parallel (66%): Promises match delivery
  - Escalators (20%): Delivery exceeds promises (acceptable)
  - Bookends: Symmetric framing
  - Deflators (6%): Delivery falls short (problematic)

  CHECKS:
  - Vocabulary echoes (key terms in both)
  - Promise-delivery alignment
  - Callback present and effective
  - Ambition calibrated across sections

  OUTPUT:
  - Save memo to: writing/bookends/coherence-memo.md
  - Return summary: coherence type, issues found, fixes made
```

---

### revision-coordinator

#### RC.0: Intake & Feedback Mapping

```
Task: RC.0 Revision Intake & Feedback Mapping
subagent_type: general-purpose
model: sonnet
prompt: |
  Load the revision-coordinator skill (read ../revision-coordinator/SKILL.md).
  Execute Phase 0: Intake & Feedback Mapping.

  PROJECT CONTEXT:
  - Research question: [RQ]
  - Main argument: [ARGUMENT]

  INPUTS:
  - Manuscript: writing/manuscript.md
  - Feedback: revision/feedback.md
  - Feedback source: [reviewer | editor | colleague | self]

  PHASE GOAL:
  Parse feedback into actionable items and map to sections.

  PROCESS:
  - Read full manuscript
  - Read feedback carefully
  - Parse into discrete items
  - Categorize by type (structural, substantive, methodological, stylistic, coherence)
  - Map to sections
  - Identify which skills are relevant
  - Create revision task list

  OUTPUT:
  - Save revision map to: revision/revision-map.md
  - Return summary: item count, sections affected
```

---

## Model Recommendations by Phase

| Phase Type | Recommended Model | Rationale |
|------------|-------------------|-----------|
| Assessment/Intake | Sonnet | Quick decisions, lower cost |
| Search/Screening | Sonnet | Mechanical tasks |
| Deep Reading | Opus | Requires understanding |
| Coding | Opus | Analytical judgment |
| Interpretation | Opus | Theoretical integration |
| Drafting | Opus | Narrative craft |
| Revision | Opus | Editorial judgment |
| Coherence Checks | Opus | Cross-section synthesis |
