# Dependency Tracking

This guide explains how the research coordinator tracks dependencies between phases and manages stale outputs.

## Why Dependencies Matter

Research outputs build on each other. When you change something upstream, downstream work may need updating:

- Change your theoretical map → Theory section may need revision
- Revise your coding structure → Interpretation and findings may need updates
- Update your main argument → Introduction and conclusion may need alignment

The coordinator tracks these dependencies so you don't lose coherence.

## The Dependency Graph

### Complete Dependency Map

```
LITERATURE DOMAIN
═════════════════

LS.0 (Scope)
  │
  ▼
LS.1 (Search) ──────────────────────────────────────────────────┐
  │                                                              │
  ▼                                                              │
LS.2 (Screening)                                                 │
  │                                                              │
  ▼                                                              │
LS.3 (Snowballing)                                               │
  │                                                              │
  ▼                                                              │
LS.4 (Full Text)                                                 │
  │                                                              │
  ▼                                                              │
LS.5 (Annotation)                                                │
  │                                                              │
  ▼                                                              │
LS.6 (Synthesis) ─────────────────┐                              │
                                  │                              │
                                  ▼                              │
                            LY.0 (Audit)                         │
                                  │                              │
                                  ▼                              │
                            LY.1 (Reading)                       │
                                  │                              │
                                  ▼                              │
                            LY.2 (Theoretical Map) ─────────────┬┼───────────────┐
                                  │                             ││               │
                                  ▼                             ││               │
                            LY.3 (Clustering)                   ││               │
                                  │                             ││               │
                                  ▼                             ││               │
                            LY.4 (Debates) ─────────────────────┼┼─────┐         │
                                  │                             ││     │         │
                                  ▼                             ││     │         │
                            LY.5 (Synthesis)                    ││     │         │
                                  │                             ││     │         │
                                  └───────────┐                 ││     │         │
                                              │                 ││     │         │
                                              ▼                 ▼▼     ▼         │
                                        LW.0 (Cluster) ◄────────┴┴─────┘         │
                                              │                                  │
                                              ▼                                  │
                                        LW.1 (Architecture)                      │
                                              │                                  │
                                              ▼                                  │
                                        LW.2 (Planning)                          │
                                              │                                  │
                                              ▼                                  │
                                        LW.3 (Drafting) ◄────────────────────────┘
                                              │                      (debates inform turn)
                                              ▼
                                        LW.4 (Turn) ◄──────────────────┐
                                              │                        │
                                              ▼                        │
                                        LW.5 (Revision)                │
                                              │                        │
                                              │                        │
DATA ANALYSIS DOMAIN                          │                        │
════════════════════                          │                        │
                                              │                        │
IA.0 (Theory - Track A) ◄─────────────────────┼────────────────────────┤
  │                                           │      (theoretical map   │
  ▼                                           │       informs analysis) │
IA.1 (Immersion) ◄────────────────────────────┤                        │
  │                  (may refer to lit)       │                        │
  ▼                                           │                        │
IA.2 (Coding)                                 │                        │
  │                                           │                        │
  ▼                                           │                        │
IA.3 (Interpretation) ◄───────────────────────┤                        │
  │                    (lit informs interp)   │                        │
  ▼                                           │                        │
IA.4 (Quality)                                │                        │
  │                                           │                        │
  ▼                                           │                        │
IA.5 (Synthesis) ─────────────────────────────┼───────────┐            │
  │                                           │           │            │
  │ (quote database)                          │           │            │
  │                                           │           │            │
WRITING DOMAIN                                │           │            │
══════════════                                │           │            │
                                              │           │            │
MW.0 (Methods Pathway) ◄──────────────────────┤           │            │
  │                                           │           │            │
  ▼                                           │           │            │
MW.1 (Methods Draft)                          │           │            │
  │                                           │           │            │
  ▼                                           │           │            │
MW.2 (Methods Revision)                       │           │            │
                                              │           │            │
CJ.0 (Case Cluster) ◄─────────────────────────┤           │            │
  │                                           │           │            │
  ▼                                           │           │            │
CJ.1 (Case Draft)                             │           │            │
  │                                           │           │            │
  ▼                                           │           │            │
CJ.2 (Case Revision)                          │           │            │
                                              │           │            │
IW.0 (Findings Intake) ◄──────────────────────┼───────────┘            │
  │                                           │                        │
  ▼                                           │                        │
IW.1 (Methods via IW)                         │                        │
  │                                           │                        │
  ▼                                           │                        │
IW.2 (Findings) ◄─────────────────────────────┤                        │
  │              (lit informs interpretation) │                        │
  ▼                                           │                        │
IW.3 (Findings Revision)                      │                        │
  │                                           │                        │
  │                                           │                        │
  ▼                                           ▼                        │
IB.0 (Bookends Intake) ◄──────────────────────┴────────────────────────┘
  │                       (needs theory + findings)
  ▼
IB.1 (Introduction) ◄──────────────────────────┐
  │                                            │
  ▼                                            │
IB.2 (Conclusion)                              │
  │                                            │
  ▼                                            │
IB.3 (Coherence) ◄─────────────────────────────┘
                   (intro ↔ conclusion alignment)
```

## Dependency Rules

### Rule 1: Changes Propagate Downstream

When an output changes, all dependent outputs become potentially stale.

**Example**: Updating `theoretical-map.md` (LY.2 output)

Affected downstream:
- LW.0-LW.5 (Theory section)
- IA.0 (if Track A)
- IB.0-IB.3 (Bookends)

### Rule 2: Severity Varies by Distance

Closer dependencies are more likely to require updates.

| Distance | Likelihood of Required Update |
|----------|------------------------------|
| Direct (1 step) | High - almost always review |
| Indirect (2 steps) | Medium - review if significant |
| Distant (3+ steps) | Low - spot check only |

### Rule 3: Some Changes Are More Significant

Not all changes require downstream updates. Assess significance:

| Change Type | Significance | Action |
|-------------|--------------|--------|
| Typo fix | Trivial | No downstream review |
| Added detail | Minor | Quick spot check |
| New finding/theme | Moderate | Review directly dependent |
| Structural reorganization | Major | Review all downstream |
| Argument revision | Critical | Review everything |

## Tracking Stale Outputs

### When Outputs Become Stale

An output is marked stale when:

1. **Upstream completion**: A prerequisite phase is (re)completed after this output was created
2. **Manual marking**: You explicitly mark it as needing review
3. **Argument change**: The main argument is updated

### Stale Output Record

Each stale output record contains:

```yaml
- output: "writing/theory-section.md"        # What's stale
  output_completed: 2025-01-20               # When it was written
  upstream_changed: "literature/debate-map.md"  # What triggered staleness
  upstream_changed_date: 2025-01-25          # When upstream changed
  reason: "debate-map.md updated after theory section was written"
  action_needed: "Re-run LW.3-LW.5 or verify no changes needed"
  resolved: false                            # Has this been addressed?
  resolution_date: null                      # When it was resolved
  resolution_notes: null                     # How it was resolved
```

### Resolving Stale Outputs

Three ways to resolve:

**1. No Update Needed**
```yaml
resolved: true
resolution_date: 2025-01-26
resolution_notes: "Reviewed changes; additions don't affect theory section"
```

**2. Updated the Output**
```yaml
resolved: true
resolution_date: 2025-01-26
resolution_notes: "Re-ran LW.3-LW.5 to incorporate new debates"
```

**3. Deferred**
```yaml
resolved: false
resolution_notes: "Will address in next revision cycle; documenting for now"
```

## Specific Dependency Relationships

### Literature → Analysis

| Lit Output | Analysis Phases Affected | Nature of Dependency |
|------------|-------------------------|---------------------|
| Theoretical map (LY.2) | IA.0, IA.3 | Informs sensitizing questions and interpretation |
| Debate map (LY.4) | IA.3, IA.5 | Helps position findings in relation to debates |
| Field synthesis (LY.5) | IA.3 | Provides context for interpretation |

**When to review**: If theoretical map changes significantly, review whether your interpretation needs adjustment.

### Literature → Theory Writing

| Lit Output | Writing Phases Affected | Nature of Dependency |
|------------|------------------------|---------------------|
| Theoretical map (LY.2) | LW.0, LW.1 | Determines cluster and architecture |
| Thematic clusters (LY.3) | LW.1, LW.2 | Informs subsection organization |
| Debate map (LY.4) | LW.3, LW.4 | Essential for crafting the turn |
| Field synthesis (LY.5) | LW.3 | Provides content for drafting |

**When to review**: Any change to debate map should trigger theory section review.

### Analysis → Findings Writing

| Analysis Output | Writing Phases Affected | Nature of Dependency |
|-----------------|------------------------|---------------------|
| Codebook (IA.2) | IW.2 | Organizes evidence presentation |
| Interpretation (IA.3) | IW.2 | Provides analytical claims |
| Quote database (IA.5) | IW.2 | Source material for findings |

**When to review**: If quote database changes, findings may need new/different quotes.

### Writing → Bookends

| Writing Output | Bookends Phases Affected | Nature of Dependency |
|----------------|-------------------------|---------------------|
| Theory section (LW.5) | IB.0, IB.1, IB.2 | Intro promises theory delivers; conclusion restates |
| Findings section (IW.3) | IB.0, IB.2 | Conclusion summarizes and projects from findings |

**When to review**: If main contribution/argument changes in theory section, bookends need realignment.

### Cross-Section Coherence

| Element | Must Align With | Check |
|---------|-----------------|-------|
| Intro RQ | Theory turn, Findings structure | Same questions addressed? |
| Intro promises | Conclusion delivery | Promises kept? |
| Theory concepts | Findings language | Terms match? |
| Findings claims | Conclusion summary | Accurate summary? |

## Automated Dependency Tracking

The coordinator automatically:

### On Phase Completion

1. Records completion timestamp
2. Records output location
3. Checks downstream phases for potential staleness
4. Marks any completed downstream as potentially stale
5. Logs warning in project-state.md

### On Returning to Earlier Phase

1. Logs iteration with reason
2. Identifies all downstream phases
3. Marks completed downstream as potentially stale
4. Lists stale outputs for user review

### On Session Start

1. Checks for unresolved stale outputs
2. Presents warning summary
3. Suggests review actions

## Manual Dependency Commands

### `/mark-stale [OUTPUT]`

Manually mark an output as needing review.

```
/mark-stale writing/findings-section.md

Reason for marking stale:
> Realized the anchor case in section 2 doesn't represent the pattern well

Marked as stale:
- writing/findings-section.md
- Reason: "Realized the anchor case in section 2 doesn't represent the pattern well"
- Action needed: Review and potentially revise section 2 anchor
```

### `/check-deps [OUTPUT]`

Show what depends on a specific output.

```
/check-deps analysis/quote-database.md

DEPENDENCIES FOR: analysis/quote-database.md
════════════════════════════════════════════

DIRECTLY DEPENDS ON THIS:
  • IW.2 (Findings Section) - uses quotes from database
  • IB.2 (Conclusion) - may reference specific examples

INDIRECTLY DEPENDS ON THIS:
  • IW.3 (Findings Revision)
  • IB.3 (Coherence Check)

If you change quote-database.md, these outputs may need review.
```

### `/clear-stale [OUTPUT]`

Mark a stale output as reviewed (no update needed).

```
/clear-stale writing/theory-section.md

Reason for clearing (required):
> Reviewed debate map changes; new Bourdieu section doesn't affect my theory section framing

Cleared stale flag for: writing/theory-section.md
Resolution recorded in project-state.md
```

## Best Practices

### 1. Review Stale Outputs Promptly

Don't let stale outputs accumulate. Address them when they appear or explicitly defer.

### 2. Document Your Reasoning

When clearing stale flags, explain why no update was needed. This helps your future self.

### 3. Embrace Iteration

Going back isn't failure—it's how research works. The iteration log is valuable data about your process.

### 4. Check Dependencies Before Major Changes

Before significantly revising an upstream output, use `/check-deps` to understand what might be affected.

### 5. Use Meaningful Commit Points

Complete a phase fully before moving on. Partial completion makes dependency tracking unreliable.
