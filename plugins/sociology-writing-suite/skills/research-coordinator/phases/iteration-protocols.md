# Iteration Protocols

This guide explains how to handle the iterative, non-linear nature of research.

## The Philosophy of Iteration

From Gerson & Damaske's *The Science and Art of Interviewing*:

> "Developing conceptual categories is an interactive and iterative process that involves moving back and forth between the interview transcripts and an evolving list of substantive and theoretical categories. It requires you to work both deductively and inductively, shifting back and forth between assigning codes to segments of transcripts and developing codes to apply to them, repeating the process for as long as it takes to frame an argument and gain confidence in its validity."

**Iteration is not failure. Iteration is method.**

## Common Iteration Patterns

### Pattern 1: Writing Reveals Analytic Gaps

**Scenario**: While writing findings, you realize you need additional coding or a different interpretive frame.

**Symptoms**:
- Can't find quotes to support a claim
- Existing quotes don't quite fit the argument
- Discover a pattern you didn't code for
- Realize your interpretation is shallow

**Protocol**:

```
CURRENT: IW.2 (Findings Writing)
DESTINATION: IA.2 (Coding) or IA.3 (Interpretation)

Step 1: Document what's missing
  "I'm trying to write about institutional barriers, but I didn't code for this.
   The quotes I have focus on individual strategies."

Step 2: Return to analysis
  /back IA.2
  Reason: "Writing findings revealed need for additional coding on institutional barriers"

Step 3: Complete the additional analysis
  - Add new codes (institutional barriers, structural constraints)
  - Recode relevant passages
  - Update interpretation with new patterns

Step 4: Update quote database
  /goto IA.5
  - Add new quotes organized by the new codes
  - Identify anchors and echoes for new themes

Step 5: Return to writing
  /goto IW.2
  - Continue with enriched material
  - Note in iteration log: what was added, how it changed the findings
```

**Duration**: Typically 1-3 sessions

---

### Pattern 2: Findings Connect to Unfamiliar Literature

**Scenario**: Your data reveals patterns that connect to theoretical traditions you didn't cover in your initial lit review.

**Symptoms**:
- Participants use concepts from an unfamiliar literature
- Patterns match a debate you've heard of but didn't research
- Reviewers later suggest you engage with X literature
- You realize your contribution fits a different cluster

**Protocol**:

```
CURRENT: IW.2 (Findings Writing) or IA.3 (Interpretation)
DESTINATION: LY.4 (Debate Mapping) or LS.0 (New Search)

Step 1: Assess the gap
  Is this:
  a) A quick addition to existing synthesis? → Go to LY.4
  b) A significant new literature to incorporate? → Go to LS.0

Step 2a: Quick addition (LY.4)
  /back LY.4
  Reason: "Findings connect to [debate X] not in initial lit review"

  - Add the new theoretical connection to debate map
  - Note key sources to cite
  - Return to previous work

Step 2b: Significant addition (LS.0)
  /back LS.0
  Reason: "Need to incorporate [literature Y] - patterns connect to this tradition"

  - Conduct targeted literature search
  - Screen and annotate relevant papers
  - Update theoretical map (LY.2)
  - Update debate map (LY.4)
  - Potentially update field synthesis (LY.5)

Step 3: Update theory section (if drafted)
  /goto LW.0
  - Reassess cluster fit
  - Update architecture if needed
  - Revise or redraft theory section

Step 4: Return to analysis/writing
  - Reinterpret with new theoretical lens
  - Integrate new literature into findings framing
```

**Duration**: Quick addition: 1 session. Significant addition: 3-7 sessions.

---

### Pattern 3: Argument Evolution

**Scenario**: Your main argument changes as you learn from the data and literature.

**Symptoms**:
- Original RQ no longer captures what you found
- Contribution is different than initially conceived
- The "turn" doesn't work because the gap has shifted
- You've discovered something more interesting than planned

**Protocol**:

```
CURRENT: Any phase
DESTINATION: Argument update + downstream review

Step 1: Articulate the new argument
  /update-argument

  Old: "Participants resist institutional pressures through X"
  New: "Participants engage in pragmatic accommodation rather than resistance,
        negotiating constraints through Y"

Step 2: Review argument history
  The coordinator adds to argument_history:
  - date: [today]
  - version: "Post-[phase] revision"
  - argument: "[new formulation]"

Step 3: Assess cascade effects
  Coordinator marks potentially stale:
  - Theory section (LW.0-5) - the turn may need revision
  - Findings framing (IW.2) - may need reframing
  - Bookends (IB.0-3) - promises and delivery affected

Step 4: Decide on scope of revision
  Options:
  a) Full revision of all affected outputs
  b) Targeted revision of most critical outputs
  c) Continue current work; revise later

Step 5: Document decision
  Add to decisions log:
  - decision: "Revised main argument from resistance to accommodation frame"
  - rationale: "Data shows participants aren't resisting; they're pragmatically adapting"
  - phase: [current phase]
  - cascade_action: [chosen option]
```

**Duration**: Variable—can be quick (reframe) or extensive (reconceptualization)

---

### Pattern 4: Quality Checkpoint Failures

**Scenario**: IA.4 (Quality Checkpoint) reveals gaps that require returning to earlier analysis phases.

**Symptoms**:
- Cognitive empathy weak for some participant groups
- Heterogeneity underrepresented
- Evidence not palpable enough
- Key follow-up questions weren't asked

**Protocol**:

```
CURRENT: IA.4 (Quality Checkpoint)
DESTINATION: IA.1 (Immersion) or IA.2 (Coding)

Step 1: Identify specific gaps
  Quality memo shows:
  - "Cognitive empathy weak for older participants"
  - "Didn't capture heterogeneity in working-class responses"

Step 2: Return to appropriate phase
  If gap is about understanding:
    /back IA.1
    Reason: "Quality check showed weak cognitive empathy for [group]"
    - Reread transcripts with focused attention
    - Write deeper memos for underrepresented perspectives

  If gap is about coding:
    /back IA.2
    Reason: "Quality check showed missing heterogeneity in [area]"
    - Add codes to capture variation
    - Recode with attention to minority patterns

Step 3: Redo interpretation
  /goto IA.3
  - Incorporate new understanding
  - Ensure heterogeneity appears in analysis

Step 4: Re-run quality checkpoint
  /goto IA.4
  - Verify gaps are addressed
  - Document improvement
```

**Duration**: 1-3 sessions

---

### Pattern 5: Revision Feedback Loop

**Scenario**: Reviewer/editor feedback requires returning to earlier phases.

**Symptoms**:
- Reviewer requests additional evidence
- Editor questions interpretation
- Feedback suggests alternative explanation
- Requested expansion requires new analysis

**Protocol**:

```
CURRENT: RC.2 (Skill Dispatch) or later
DESTINATION: Varies by feedback type

Feedback Type A: "Need more evidence for claim X"
  /back IA.5
  - Search quote database for additional support
  - If insufficient, return to IA.2 for additional coding
  - Update findings with new evidence

Feedback Type B: "Consider alternative explanation Y"
  /back IA.3
  - Revisit interpretation
  - Explicitly address alternative
  - Either incorporate or refute with evidence

Feedback Type C: "Engage with literature Z"
  /back LY.4 or LS.0
  - Add new theoretical engagement
  - Update theory section
  - May need to update findings framing

Feedback Type D: "Strengthen methods justification"
  /back MW.1
  - Add requested detail
  - Potentially change pathway
  - Revise methods section

Step: After addressing, return to revision
  /goto RC.2
  - Continue with remaining feedback
  - Log what was addressed and how
```

**Duration**: Variable by feedback scope

---

### Pattern 6: Parallel Domain Work

**Scenario**: You want to work on multiple domains simultaneously (e.g., literature and analysis).

**Symptoms**:
- Waiting for full text PDFs; want to start coding
- Analysis is mentally tiring; want to switch to writing
- Ideas for theory section come while coding

**Protocol**:

```
APPROACH A: Explicit switching
  Track position in each domain:

  Literature: Currently at LY.3
  Analysis: Currently at IA.2

  Work on one, then switch:
  /goto LY.3  # Work on clustering
  [Complete session]
  /goto IA.2  # Switch to coding
  [Complete session]

  Coordinator maintains context for each domain.

APPROACH B: Interleaved within session
  For each switch, briefly document:

  Switching from LY.3 to IA.2
  LY.3 status: "Drafted 3 of 5 cluster descriptions; need to finish theory traditions"

  [Work on IA.2]

  Switching from IA.2 to LY.3
  IA.2 status: "Coded 12 of 25 interviews; focused on resistance codes today"

  Coordinator logs switches and maintains state.

IMPORTANT: Don't lose track. At session end, document:
  - Current position in each domain
  - Next action needed for each
  - Any cross-domain insights
```

**Duration**: Ongoing

---

## Logging Iterations

### What to Log

Every iteration record contains:

```yaml
- date: 2025-01-25
  from_phase: IW.2
  from_name: "Findings Writing"
  to_phase: IA.3
  to_name: "Interpretation"
  reason: "Writing findings revealed need for additional coding on institutional barriers"
  outcome: null  # Filled in when complete
```

When the iteration is complete, add outcome:

```yaml
  outcome: "Added 3 new subcodes (institutional constraints, resource barriers, policy gaps).
            Recoded 18 passages. Updated interpretation with structural focus.
            Quote database now has 12 new quotes organized by barrier type."
```

### Why Logging Matters

1. **For your methods section**: Demonstrates rigorous, iterative process
2. **For your future self**: Explains why things changed
3. **For learning**: Reveals your actual research process
4. **For replication**: Others can understand your analytical journey

### Iteration Summary Statistics

The coordinator can generate:

```
ITERATION SUMMARY
═════════════════

Total iterations: 7

By destination domain:
  Literature: 2
  Analysis: 4
  Writing: 1

Most common pattern:
  Writing → Analysis (3 occurrences)
  "Writing reveals analytic gaps"

Cross-domain iterations: 5
  Analysis → Literature: 2
  Writing → Analysis: 2
  Writing → Literature: 1

Average outcome length: 47 words
Outcomes documented: 6 of 7 (86%)
```

## Iteration Best Practices

### 1. Embrace It

Iteration isn't a sign of poor planning—it's how good research works. The best studies iterate.

### 2. Document Thoroughly

Future you will thank present you. Record:
- Why you're going back
- What you found/changed
- How it affected your thinking

### 3. Complete the Loop

Don't leave iterations hanging. Return to where you were and integrate what you learned.

### 4. Know When to Stop

Diminishing returns apply. Ask:
- Is this iteration adding to quality or just delaying completion?
- Am I perfectionist-iterating or discovery-iterating?

### 5. Use Iteration Insights

Your iteration log is data about your research process. Use it:
- In methods sections ("Through iterative analysis...")
- In appendices (for transparency)
- For future project planning

## Iteration vs. Scope Creep

### Healthy Iteration

- Improves depth of understanding
- Strengthens existing argument
- Fills genuine gaps
- Increases coherence

### Scope Creep

- Adds new research questions
- Expands population of interest
- Incorporates tangential literature
- Indefinitely delays completion

### The Test

Ask: "Does this iteration serve my research questions, or am I avoiding completion?"

If avoidance:
- Set a deadline
- Document what's "good enough"
- Save expansions for future projects
- Proceed to completion
