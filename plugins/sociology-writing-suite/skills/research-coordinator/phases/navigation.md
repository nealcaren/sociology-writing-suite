# Navigation Protocols

This guide explains how to move between phases in the research workflow.

## Core Navigation Principles

### 1. Any Entry Point Is Valid

You can start the workflow at any phase if you have the necessary inputs. Common entry patterns:

| Entry Point | Prerequisites | Use When |
|-------------|---------------|----------|
| LS.0 (Scope) | None | Fresh start, no prior work |
| LY.0 (Corpus Audit) | Papers in Zotero | Have literature, need synthesis |
| IA.1 (Immersion) | Transcripts | Have data, ready to analyze |
| LW.0 (Theory Cluster) | Literature notes | Have lit knowledge, ready to write |
| IW.0 (Findings Intake) | Quote database | Have analysis, ready to write |
| IB.0 (Bookends Intake) | Theory + Findings sections | Have body, need framing |
| RC.0 (Revision Intake) | Manuscript + feedback | Have draft, need revision |

### 2. Forward Movement Is Default

After completing a phase, the coordinator suggests the next logical phase:

```
LS.0 → LS.1 → LS.2 → LS.3 → LS.4 → LS.5 → LS.6 → LY.0 → ...
```

However, you can always:
- Skip phases (with documented rationale)
- Jump to a different domain
- Return to earlier phases

### 3. Backward Movement Is Tracked

Going back is normal and expected. Every return is logged in the iteration history with:
- Origin phase
- Destination phase
- Reason for return
- Outcome (filled in upon completion)

This creates a record of how research actually proceeds—valuable for methods sections and future projects.

## Navigation Commands

### `/goto [PHASE]`

Jump directly to any phase.

**Syntax**: `/goto LS.3` or `/goto IA.2`

**Behavior**:
1. Coordinator checks if prerequisites are met
2. If prerequisites unmet, warns and asks for confirmation
3. If jumping backward, logs iteration and marks downstream as potentially stale
4. If jumping forward, checks for skipped phases
5. Invokes the target skill at the specified phase

**Examples**:
```
/goto IA.1          # Jump to Immersion phase
/goto LW.3          # Jump to Theory Drafting
/goto RC.0          # Jump to Revision Intake
```

### `/next`

Proceed to the next logical phase.

**Behavior**:
1. Coordinator determines next phase based on:
   - Current workflow position
   - Completed phases
   - Common workflow patterns
2. Presents suggestion with rationale
3. User confirms or specifies alternative

**Example**:
```
You: /next

Coordinator: You've completed IA.3 (Interpretation).
Suggested next: IA.4 (Quality Checkpoint)
This will evaluate your analysis against established quality indicators.

Alternatives:
- /goto IA.5 to skip quality check and proceed to synthesis
- /goto LY.4 if findings connect to debates not yet mapped
- /goto IW.0 if ready to start writing findings

Proceed with IA.4? (y/n)
```

### `/back [PHASE]`

Return to an earlier phase (logs iteration).

**Syntax**: `/back IA.2` or just `/back` (returns to previous phase)

**Behavior**:
1. Prompts for reason (required for iteration log)
2. Logs the iteration in project-state.md
3. Marks downstream phases as potentially stale
4. Invokes the target phase

**Example**:
```
You: /back IA.2

Coordinator: Returning to IA.2 (Systematic Coding).

Please provide a reason for this iteration (for the log):
> Writing findings revealed need for additional coding on institutional barriers

Logging iteration:
- From: IW.2 (Findings Writing)
- To: IA.2 (Systematic Coding)
- Reason: "Writing findings revealed need for additional coding on institutional barriers"

Marking as potentially stale:
- IA.3 (Interpretation)
- IA.4 (Quality Checkpoint)
- IA.5 (Synthesis)
- IW.2 (Findings Writing)

Proceeding to IA.2...
```

### `/skip [PHASE]`

Mark a phase as skipped (with rationale).

**Syntax**: `/skip LS.3`

**Behavior**:
1. Prompts for rationale (required)
2. Marks phase as `skipped` in project-state.md
3. Records rationale in decisions log
4. Proceeds to next phase

**Example**:
```
You: /skip LS.3

Coordinator: Skipping LS.3 (Snowballing).

Please provide rationale (required):
> Topic is highly focused with clear boundaries; initial search captured the core literature

Recording decision:
- Phase: LS.3
- Decision: Skip snowballing
- Rationale: "Topic is highly focused with clear boundaries; initial search captured the core literature"

Proceeding to LS.4 (Full Text Acquisition)...
```

## Status Commands

### `/status`

Show current project state summary.

**Output**:
```
PROJECT STATUS: "Understanding Digital Activism"
Last updated: 2025-01-30T14:30:00

CURRENT POSITION: IA.3 (Interpretation & Explanation)
  Started: 2025-01-28
  Status: in_progress

COMPLETED PHASES (8):
  [✓] LS.0-LS.6 (Literature Search)
  [✓] LY.0-LY.4 (Literature Synthesis)
  [✓] IA.1-IA.2 (Immersion, Coding)

PENDING (12 phases remain)

STALE OUTPUTS (1):
  ⚠ literature/debate-map.md may need update (upstream changed)

RECENT ITERATIONS (1):
  2025-01-27: LY.3 → LY.4 (needed additional debate mapping)
```

### `/phases`

Show all phases with detailed status.

**Output**:
```
LITERATURE DOMAIN
─────────────────
lit-search:
  [✓] LS.0  Scope Definition           completed 2025-01-10
  [✓] LS.1  Initial Search             completed 2025-01-11
  [✓] LS.2  Screening                  completed 2025-01-12
  [—] LS.3  Snowballing                skipped (rationale logged)
  [✓] LS.4  Full Text Acquisition      completed 2025-01-14
  [✓] LS.5  Annotation                 completed 2025-01-16
  [✓] LS.6  Synthesis                  completed 2025-01-17

lit-synthesis:
  [✓] LY.0  Corpus Audit               completed 2025-01-18
  [✓] LY.1  Deep Reading               completed 2025-01-20
  [✓] LY.2  Theoretical Mapping        completed 2025-01-22
  [✓] LY.3  Thematic Clustering        completed 2025-01-24
  [!] LY.4  Debate Mapping             stale (re-review needed)
  [ ] LY.5  Field Synthesis            not_started

argument-builder:
  [ ] LW.0  Cluster Assessment         not_started
  ...

DATA ANALYSIS DOMAIN
────────────────────
interview-analyst:
  [—] IA.0  Theory Synthesis           skipped (Track B)
  [✓] IA.1  Immersion                  completed 2025-01-25
  [✓] IA.2  Systematic Coding          completed 2025-01-27
  [▶] IA.3  Interpretation             in_progress (started 2025-01-28)
  ...
```

### `/dependencies`

Show dependency graph with stale warnings.

**Output**:
```
DEPENDENCY GRAPH
════════════════

LY.2 (Theoretical Mapping)
  └──► LW.0-LW.5 (Theory Section)
  └──► IA.0 (Theory Synthesis, if Track A)
  └──► IB.0-IB.3 (Bookends)

LY.4 (Debate Mapping) ⚠ CHANGED 2025-01-29
  └──► LW.3-LW.5 (Theory Drafting)
       └── writing/theory-section.md NOT YET WRITTEN

IA.2 (Coding)
  └──► IA.3-IA.5 (Analysis)
  └──► IW.2 (Findings)

IA.5 (Quote Database)
  └──► IW.2 (Findings)

STALE OUTPUT WARNINGS
─────────────────────
⚠ literature/debate-map.md
  Changed: 2025-01-29
  May affect: LW.3-LW.5 (not yet started - no action needed)
```

### `/history`

Show iteration log.

**Output**:
```
ITERATION HISTORY
═════════════════

1. 2025-01-27
   From: LY.3 (Thematic Clustering)
   To:   LY.4 (Debate Mapping)
   Reason: "Clustering revealed competing explanations that needed explicit debate mapping"
   Outcome: "Identified 3 key debates: structure vs agency, resource vs identity, online vs hybrid"

2. 2025-01-29
   From: IA.3 (Interpretation)
   To:   LY.4 (Debate Mapping)
   Reason: "Findings connect to Bourdieu/cultural capital debate not in initial map"
   Outcome: pending

TOTAL ITERATIONS: 2
DOMAINS CROSSED: 1 (Analysis → Literature)
```

### `/outputs`

List all key outputs and their locations.

**Output**:
```
KEY OUTPUTS
═══════════

LITERATURE
  [✓] literature/database.json         2025-01-17  (245 papers)
  [✓] literature/theoretical-map.md    2025-01-22
  [✓] literature/thematic-clusters.md  2025-01-24
  [!] literature/debate-map.md         2025-01-29  ⚠ recently updated
  [ ] literature/field-synthesis.md    not yet created

ANALYSIS
  [✓] analysis/codebook/               2025-01-27  (47 codes)
  [▶] analysis/phase3-interpretation/  in progress
  [ ] analysis/participant-profiles/   not yet created
  [ ] analysis/quote-database.md       not yet created

WRITING
  [ ] writing/theory-section/          not yet created
  [ ] writing/methods-section/         not yet created
  [ ] writing/findings-section/        not yet created
  [ ] writing/bookends/                not yet created
  [ ] writing/manuscript.md            not yet created
```

## Common Navigation Patterns

### Pattern 1: Discovery During Writing

You're writing findings and discover you need more analysis.

```
Current: IW.2 (Findings Writing)
Discovery: "I need quotes about institutional barriers, but didn't code for that"

/back IA.2

Reason: "Writing findings revealed need for additional coding on institutional barriers"

[Complete additional coding]

/goto IA.3   # Reinterpret with new codes
[Update interpretation]

/goto IA.5   # Update quote database
[Add new quotes]

/goto IW.2   # Return to findings writing
[Continue with enriched material]
```

### Pattern 2: Literature Gap

Your findings connect to literature you didn't cover.

```
Current: IW.2 (Findings Writing)
Discovery: "These patterns relate to Bourdieu's cultural capital, but I didn't review that lit"

Option A: Quick addition
/back LY.4           # Add to debate map
[Add the missing theoretical connection]
/goto IW.2           # Return to writing

Option B: Deep addition
/back LS.0           # New literature search
[Search for cultural capital literature]
/next through LS.*   # Build out the new literature
/goto LY.2           # Update theoretical map
/goto LY.4           # Update debate map
/goto LW.0           # May need to update theory section
/goto IW.2           # Return to findings
```

### Pattern 3: Argument Evolution

Your main argument changes based on what you're learning.

```
Current: IA.3 (Interpretation)
Realization: "This isn't about resistance like I thought—it's about pragmatic accommodation"

First: Update the argument
/update-argument
New argument: "Participants engage in pragmatic accommodation rather than resistance..."

Coordinator marks as potentially stale:
- LW.0-LW.5 (if started)
- IB.0-IB.3 (if started)

Then: Review affected phases
[The coordinator will prompt you to review stale outputs when you reach them]
```

### Pattern 4: Parallel Domain Work

You want to work on literature and analysis simultaneously.

```
Current: IA.2 (Coding)
Want: Also continue literature synthesis

Option: Explicit parallel tracking
/goto LY.3           # Jump to thematic clustering
[Work on literature]
/goto IA.2           # Return to coding
[Work on analysis]
/goto LY.4           # Back to literature
[Continue synthesis]

The coordinator tracks both positions and reminds you of context when switching.
```

## Prerequisite Checking

When jumping to a phase, the coordinator checks prerequisites:

### Hard Prerequisites (block progress)

| Phase | Hard Prerequisites |
|-------|-------------------|
| LS.2 | LS.1 output exists |
| LS.5 | Full texts acquired |
| LY.1 | Papers in Zotero |
| IA.2 | Transcripts exist |
| IW.2 | Quote database exists |
| IB.1 | Theory section exists |
| IB.2 | Theory + Findings exist |
| RC.0 | Manuscript + feedback exist |

If hard prerequisites are unmet:
```
Cannot proceed to IW.2 (Findings Section).

Missing prerequisite: Quote database (IA.5 output)

Options:
1. /goto IA.5 to create quote database first
2. /goto IA.1 to start analysis from beginning
3. Provide existing quote database location
```

### Soft Prerequisites (warn but allow)

| Phase | Soft Prerequisites |
|-------|-------------------|
| LW.0 | LY.5 (field synthesis) |
| IA.3 | LY.2 (theoretical map, for Track A) |
| IB.0 | Methods section |

If soft prerequisites are unmet:
```
Proceeding to LW.0 (Theory Cluster Assessment).

Note: LY.5 (Field Synthesis) not completed.
You can write the theory section without it, but the field synthesis
often makes cluster selection easier.

Continue anyway? (y/n)
```

## Handling Stale Outputs

When you reach a phase with stale outputs:

```
You've reached LW.3 (Theory Drafting).

⚠ WARNING: Potentially stale upstream outputs detected:

1. literature/debate-map.md
   Changed: 2025-01-29 (after your last work on theory section)
   Reason: Added Bourdieu/cultural capital debate

Options:
a) Review changes and continue (if changes don't affect theory section)
b) Return to LW.1 (Architecture) to incorporate new debates
c) Proceed with current plan (I'll mark this as acknowledged)

Your choice:
```

After reviewing:
```
User: a

Coordinator: Please briefly describe why the changes don't require updates:
> The cultural capital debate is relevant to findings, not theory section framing

Recording resolution:
- Output: literature/debate-map.md
- Resolution: "Changes relevant to findings, not theory section framing"
- Stale flag: cleared

Proceeding with LW.3...
```
