# Project State Template

This is the complete schema for `project-state.md`. Create this file in your project root when starting a new project.

---

```yaml
# =============================================================================
# PROJECT STATE
# =============================================================================
# This file tracks the complete state of a qualitative research project.
# It is managed by the research-coordinator skill.
# Last updated: [TIMESTAMP]
# =============================================================================

# -----------------------------------------------------------------------------
# PROJECT IDENTITY
# -----------------------------------------------------------------------------
project:
  name: "Your Project Name"
  created: YYYY-MM-DD
  last_updated: YYYY-MM-DDTHH:MM:SS
  working_directory: "/path/to/project"

# -----------------------------------------------------------------------------
# RESEARCH FOCUS
# -----------------------------------------------------------------------------
research:
  # Primary research question (required)
  primary_question: |
    What is your main research question?
    Be specific about the phenomenon, population, and puzzle.

  # Secondary questions (optional)
  secondary_questions:
    - "Secondary question 1"
    - "Secondary question 2"

  # Main argument (evolves throughout the project)
  main_argument: |
    Current state of your main argument.
    This should be updated as your understanding deepens.
    Track how it changes in the iteration log.

  # Argument history (append-only log of how argument evolved)
  argument_history:
    - date: YYYY-MM-DD
      version: "Initial version"
      argument: "First formulation of the argument"

    - date: YYYY-MM-DD
      version: "Post-analysis v1"
      argument: "Revised after initial coding revealed X"

  # Contribution type (from argument-builder clusters)
  contribution_type: null  # gap-filler | theory-extender | concept-builder | synthesis | problem-driven

# -----------------------------------------------------------------------------
# PHASE STATUS
# -----------------------------------------------------------------------------
# Status values:
#   not_started - Never begun
#   in_progress - Currently active
#   completed   - Finished
#   stale       - Completed but upstream changes may invalidate
#   blocked     - Cannot proceed; prerequisite missing
#   skipped     - Intentionally bypassed (with rationale)
# -----------------------------------------------------------------------------

phases:
  # ===========================================================================
  # LITERATURE DOMAIN
  # ===========================================================================

  # ---------------------------------------------------------------------------
  # lit-search: Build systematic literature database
  # ---------------------------------------------------------------------------
  LS.0:
    name: "Scope Definition"
    skill: "lit-search"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null

  LS.1:
    name: "Initial Search"
    skill: "lit-search"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null
    # Metadata specific to this phase
    metadata:
      queries_run: []
      total_results: null
      deduplicated_count: null

  LS.2:
    name: "Screening"
    skill: "lit-search"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null
    metadata:
      included: null
      excluded: null
      borderline: null

  LS.3:
    name: "Snowballing"
    skill: "lit-search"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null
    metadata:
      backward_additions: null
      forward_additions: null

  LS.4:
    name: "Full Text Acquisition"
    skill: "lit-search"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null
    metadata:
      total_needed: null
      acquired: null
      missing: null

  LS.5:
    name: "Annotation"
    skill: "lit-search"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null
    metadata:
      papers_annotated: null

  LS.6:
    name: "Synthesis"
    skill: "lit-search"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null

  # ---------------------------------------------------------------------------
  # lit-synthesis: Deep reading and theoretical mapping
  # ---------------------------------------------------------------------------
  LY.0:
    name: "Corpus Audit"
    skill: "lit-synthesis"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null
    metadata:
      corpus_size: null
      reading_priorities: []

  LY.1:
    name: "Deep Reading"
    skill: "lit-synthesis"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null
    metadata:
      papers_read_deeply: null

  LY.2:
    name: "Theoretical Mapping"
    skill: "lit-synthesis"
    status: not_started
    started: null
    completed: null
    output: "literature/theoretical-map.md"
    notes: null
    metadata:
      traditions_identified: []
      key_theorists: []

  LY.3:
    name: "Thematic Clustering"
    skill: "lit-synthesis"
    status: not_started
    started: null
    completed: null
    output: "literature/thematic-clusters.md"
    notes: null
    metadata:
      clusters_identified: []

  LY.4:
    name: "Debate Mapping"
    skill: "lit-synthesis"
    status: not_started
    started: null
    completed: null
    output: "literature/debate-map.md"
    notes: null
    metadata:
      debates_identified: []

  LY.5:
    name: "Field Synthesis"
    skill: "lit-synthesis"
    status: not_started
    started: null
    completed: null
    output: "literature/field-synthesis.md"
    notes: null

  # ---------------------------------------------------------------------------
  # argument-builder: Draft theory/literature section
  # ---------------------------------------------------------------------------
  LW.0:
    name: "Cluster Assessment"
    skill: "argument-builder"
    status: not_started
    started: null
    completed: null
    output: "writing/theory-section/cluster-memo.md"
    notes: null
    metadata:
      cluster_selected: null  # gap-filler | theory-extender | concept-builder | synthesis | problem-driven

  LW.1:
    name: "Architecture"
    skill: "argument-builder"
    status: not_started
    started: null
    completed: null
    output: "writing/theory-section/architecture.md"
    notes: null
    metadata:
      arc_type: null  # funnel | building-blocks | dialogue | problem-response
      subsections_planned: null

  LW.2:
    name: "Paragraph Planning"
    skill: "argument-builder"
    status: not_started
    started: null
    completed: null
    output: "writing/theory-section/paragraph-map.md"
    notes: null

  LW.3:
    name: "Drafting"
    skill: "argument-builder"
    status: not_started
    started: null
    completed: null
    output: "writing/theory-section/theory-section-draft.md"
    notes: null
    metadata:
      word_count: null
      citation_count: null

  LW.4:
    name: "Turn Crafting"
    skill: "argument-builder"
    status: not_started
    started: null
    completed: null
    output: null  # Embedded in theory section
    notes: null
    metadata:
      turn_location: null  # paragraph number or subsection

  LW.5:
    name: "Revision"
    skill: "argument-builder"
    status: not_started
    started: null
    completed: null
    output: "writing/theory-section/theory-section.md"
    notes: null
    metadata:
      final_word_count: null
      citations_per_1000: null

  # ===========================================================================
  # DATA ANALYSIS DOMAIN
  # ===========================================================================

  # ---------------------------------------------------------------------------
  # interview-analyst: Analyze interview data
  # ---------------------------------------------------------------------------
  IA.0:
    name: "Theory Synthesis (Track A)"
    skill: "interview-analyst"
    status: not_started  # or "skipped" for Track B
    started: null
    completed: null
    output: "analysis/phase0-theory/theory-synthesis.md"
    notes: null
    metadata:
      track: null  # A (theory-informed) | B (data-first)
      sensitizing_questions: []

  IA.1:
    name: "Immersion & Familiarization"
    skill: "interview-analyst"
    status: not_started
    started: null
    completed: null
    output: "analysis/phase1-memos/"
    notes: null
    metadata:
      interviews_read: null
      total_interviews: null

  IA.2:
    name: "Systematic Coding"
    skill: "interview-analyst"
    status: not_started
    started: null
    completed: null
    output: "analysis/codebook/"
    notes: null
    metadata:
      code_count: null
      subcode_count: null

  IA.3:
    name: "Interpretation & Explanation"
    skill: "interview-analyst"
    status: not_started
    started: null
    completed: null
    output: "analysis/phase3-interpretation/"
    notes: null
    metadata:
      patterns_identified: []
      explanatory_propositions: []

  IA.4:
    name: "Quality Checkpoint"
    skill: "interview-analyst"
    status: not_started
    started: null
    completed: null
    output: "analysis/phase4-quality/quality-memo.md"
    notes: null
    metadata:
      cognitive_empathy: null  # strong | adequate | needs_work
      heterogeneity: null
      palpability: null
      follow_up: null
      self_awareness: null

  IA.5:
    name: "Synthesis"
    skill: "interview-analyst"
    status: not_started
    started: null
    completed: null
    output: "analysis/quote-database.md"
    notes: null
    metadata:
      participant_profiles_count: null
      quotes_in_database: null
      findings_count: null

  # ===========================================================================
  # WRITING DOMAIN
  # ===========================================================================

  # ---------------------------------------------------------------------------
  # methods-writer: Draft methods section
  # ---------------------------------------------------------------------------
  MW.0:
    name: "Pathway Assessment"
    skill: "methods-writer"
    status: not_started
    started: null
    completed: null
    output: "writing/methods-section/pathway-memo.md"
    notes: null
    metadata:
      pathway_selected: null  # efficient | standard | detailed

  MW.1:
    name: "Drafting"
    skill: "methods-writer"
    status: not_started
    started: null
    completed: null
    output: "writing/methods-section/methods-draft.md"
    notes: null
    metadata:
      word_count: null
      has_table: null

  MW.2:
    name: "Revision"
    skill: "methods-writer"
    status: not_started
    started: null
    completed: null
    output: "writing/methods-section/methods-section.md"
    notes: null
    metadata:
      final_word_count: null

  # ---------------------------------------------------------------------------
  # case-justification: Draft case/setting section
  # ---------------------------------------------------------------------------
  CJ.0:
    name: "Cluster Assessment"
    skill: "case-justification"
    status: not_started
    started: null
    completed: null
    output: "writing/case-section/cluster-memo.md"
    notes: null
    metadata:
      cluster_selected: null  # standard | comparative | minimal | deep-historical | policy-driven

  CJ.1:
    name: "Drafting"
    skill: "case-justification"
    status: not_started
    started: null
    completed: null
    output: "writing/case-section/case-draft.md"
    notes: null

  CJ.2:
    name: "Revision"
    skill: "case-justification"
    status: not_started
    started: null
    completed: null
    output: "writing/case-section/case-section.md"
    notes: null
    metadata:
      final_word_count: null

  # ---------------------------------------------------------------------------
  # interview-writeup: Draft methods and findings
  # ---------------------------------------------------------------------------
  IW.0:
    name: "Intake & Scope"
    skill: "interview-writeup"
    status: not_started
    started: null
    completed: null
    output: "writing/findings-section/intake-memo.md"
    notes: null
    metadata:
      scope: null  # methods-only | findings-only | both
      archetype: null  # mechanism-list | comparative | process

  IW.1:
    name: "Methods Section"
    skill: "interview-writeup"
    status: not_started
    started: null
    completed: null
    output: null  # May use methods-writer instead
    notes: null

  IW.2:
    name: "Findings Section"
    skill: "interview-writeup"
    status: not_started
    started: null
    completed: null
    output: "writing/findings-section/findings-section.md"
    notes: null
    metadata:
      word_count: null
      subsection_count: null
      quotes_used: null

  IW.3:
    name: "Revision"
    skill: "interview-writeup"
    status: not_started
    started: null
    completed: null
    output: "writing/findings-section/findings-revised.md"
    notes: null

  # ---------------------------------------------------------------------------
  # interview-bookends: Draft introduction and conclusion
  # ---------------------------------------------------------------------------
  IB.0:
    name: "Intake & Assessment"
    skill: "interview-bookends"
    status: not_started
    started: null
    completed: null
    output: "writing/bookends/intake-memo.md"
    notes: null
    metadata:
      cluster_confirmed: null
      scope: null  # intro-only | conclusion-only | both

  IB.1:
    name: "Introduction Drafting"
    skill: "interview-bookends"
    status: not_started
    started: null
    completed: null
    output: "writing/bookends/introduction.md"
    notes: null
    metadata:
      opening_type: null  # phenomenon | stakes | case | theory | question
      word_count: null

  IB.2:
    name: "Conclusion Drafting"
    skill: "interview-bookends"
    status: not_started
    started: null
    completed: null
    output: "writing/bookends/conclusion.md"
    notes: null
    metadata:
      word_count: null
      has_callback: null

  IB.3:
    name: "Coherence Check"
    skill: "interview-bookends"
    status: not_started
    started: null
    completed: null
    output: "writing/bookends/coherence-memo.md"
    notes: null
    metadata:
      coherence_type: null  # parallel | escalators | bookends

  # ===========================================================================
  # REVISION DOMAIN
  # ===========================================================================

  # ---------------------------------------------------------------------------
  # revision-coordinator: Handle manuscript revision
  # ---------------------------------------------------------------------------
  RC.0:
    name: "Intake & Feedback Mapping"
    skill: "revision-coordinator"
    status: not_started
    started: null
    completed: null
    output: "revision/revision-map.md"
    notes: null
    metadata:
      feedback_source: null  # reviewer | editor | colleague | self
      feedback_items_count: null

  RC.1:
    name: "Diagnostic Assessment"
    skill: "revision-coordinator"
    status: not_started
    started: null
    completed: null
    output: "revision/diagnostics/"
    notes: null

  RC.2:
    name: "Skill Dispatch"
    skill: "revision-coordinator"
    status: not_started
    started: null
    completed: null
    output: "revision/section-revisions/"
    notes: null
    metadata:
      sections_revised: []

  RC.3:
    name: "Integration Review"
    skill: "revision-coordinator"
    status: not_started
    started: null
    completed: null
    output: null
    notes: null
    metadata:
      coherence_issues_found: null

  RC.4:
    name: "Verification"
    skill: "revision-coordinator"
    status: not_started
    started: null
    completed: null
    output: "revision/revision-summary.md"
    notes: null
    metadata:
      items_addressed: null
      items_deferred: null

# -----------------------------------------------------------------------------
# KEY OUTPUTS
# -----------------------------------------------------------------------------
# Central registry of important outputs and their current locations
# -----------------------------------------------------------------------------

outputs:
  # Literature outputs
  literature_database: null
  theoretical_map: null
  debate_map: null
  field_synthesis: null

  # Analysis outputs
  codebook: null
  participant_profiles: null
  quote_database: null

  # Writing outputs
  theory_section: null
  methods_section: null
  case_section: null
  findings_section: null
  introduction: null
  conclusion: null

  # Assembled manuscript
  full_manuscript: null

# -----------------------------------------------------------------------------
# ITERATION LOG
# -----------------------------------------------------------------------------
# Append-only log of returns to earlier phases
# This is valuable data about how research actually proceeds
# -----------------------------------------------------------------------------

iterations: []
# Example entries:
#   - date: 2025-01-25
#     from_phase: IW.2
#     from_name: "Findings Writing"
#     to_phase: IA.3
#     to_name: "Interpretation"
#     reason: "Writing findings revealed need for additional coding on theme X"
#     outcome: "Added 3 new subcodes, reinterpreted 12 quotes"
#
#   - date: 2025-01-28
#     from_phase: IW.2
#     from_name: "Findings Writing"
#     to_phase: LY.4
#     to_name: "Debate Mapping"
#     reason: "Findings connect to debate not covered in initial lit review"
#     outcome: "Added Bourdieu/cultural capital debate to theoretical map"

# -----------------------------------------------------------------------------
# DEPENDENCY WARNINGS
# -----------------------------------------------------------------------------
# Outputs that may be stale due to upstream changes
# -----------------------------------------------------------------------------

stale_outputs: []
# Example entries:
#   - output: "writing/theory-section.md"
#     output_completed: 2025-01-20
#     upstream_changed: "literature/theoretical-map.md"
#     upstream_changed_date: 2025-01-25
#     reason: "theoretical-map.md updated after theory section was written"
#     action_needed: "Re-run LW.3-LW.5 or verify no changes needed"
#     resolved: false
#     resolution_date: null
#     resolution_notes: null

# -----------------------------------------------------------------------------
# DECISION LOG
# -----------------------------------------------------------------------------
# Major decisions and their rationale (for your future self)
# -----------------------------------------------------------------------------

decisions: []
# Example entries:
#   - date: 2025-01-15
#     decision: "Use Track B (data-first) for analysis"
#     rationale: "Exploratory study in understudied domain; want patterns to emerge before engaging theory"
#     phase: IA.0
#
#   - date: 2025-01-22
#     decision: "Selected Gap-Filler cluster for theory section"
#     rationale: "Primary contribution is empirical insight about understudied population; not extending named theory"
#     phase: LW.0

# -----------------------------------------------------------------------------
# NOTES
# -----------------------------------------------------------------------------
# Free-form notes, reminders, and observations
# -----------------------------------------------------------------------------

notes: |
  Add any ongoing notes, reminders, or observations here.
  This is a scratchpad that persists across sessions.
```

---

## Usage Notes

### Creating a New Project

1. Copy this template to your project root as `project-state.md`
2. Fill in the `project` section (name, created date)
3. Fill in the `research` section (questions, initial argument)
4. Leave all phases as `not_started`
5. The coordinator will update phases as you work

### Updating Phase Status

When completing a phase:
```yaml
LS.2:
  name: "Screening"
  skill: "lit-search"
  status: completed          # Changed from not_started
  started: 2025-01-17        # When you began
  completed: 2025-01-17      # When you finished
  output: "literature/screened.json"  # Where the output lives
  notes: "Screened 245 papers; 67 included, 12 borderline"
  metadata:
    included: 67
    excluded: 166
    borderline: 12
```

### Recording an Iteration

When you return to an earlier phase:
```yaml
iterations:
  - date: 2025-01-25
    from_phase: IW.2
    from_name: "Findings Writing"
    to_phase: IA.3
    to_name: "Interpretation"
    reason: "Writing findings revealed need for additional coding on theme X"
    outcome: null  # Fill in when complete
```

### Marking Outputs as Stale

When upstream changes might affect downstream work:
```yaml
stale_outputs:
  - output: "writing/theory-section.md"
    output_completed: 2025-01-20
    upstream_changed: "literature/theoretical-map.md"
    upstream_changed_date: 2025-01-25
    reason: "theoretical-map.md updated after theory section was written"
    action_needed: "Re-run LW.3-LW.5 or verify no changes needed"
    resolved: false
```

### Clearing a Stale Warning

After reviewing and determining no update is needed:
```yaml
stale_outputs:
  - output: "writing/theory-section.md"
    # ... other fields ...
    resolved: true
    resolution_date: 2025-01-26
    resolution_notes: "Reviewed changes to theoretical map; additions don't affect theory section argument"
```
