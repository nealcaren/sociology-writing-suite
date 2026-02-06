# Phase 6: Methods Section Drafting

You are executing Phase 6 of a pragmatic qualitative analysis. Your goal is to **dispatch to methods-writer** to draft a publication-ready Methods section while all study details are fresh in context.

## Why This Phase Exists

After completing qualitative analysis (Phases 1-5), you have everything needed to write a strong Methods section:

- **Sample size and demographics** (from Phase 2 participant profiles)
- **Recruitment approach** (from Phase 1 interview memos)
- **Coding process** (from Phase 2 codebook)
- **Analysis approach** (from Phase 3 interpretation)
- **Saturation/quality evidence** (from Phase 4 quality check)

Rather than drafting methods yourself, **dispatch to the methods-writer skill**—it has pathway knowledge, calibration targets, and templates that produce publication-ready sections.

## Inputs

Before dispatching, gather from prior phases:

### From Phase 1 (Immersion)
- Interview duration range
- Interview format (semi-structured, in-depth, etc.)
- Interview mode (in-person, phone, video)
- Recruitment channels
- Access/gatekeeper information
- Any field notes about the interview process

### From Phase 2 (Coding)
- Sample size (N)
- Participant demographics (aggregate)
- Coding approach description
- Codebook summary

### From Phase 3 (Interpretation)
- Analysis approach (thematic, grounded theory, etc.)
- How patterns were identified
- How explanations were developed

### From Phase 4 (Quality Check)
- Saturation evidence (when did new themes stop emerging?)
- Quality measures taken
- Positionality considerations
- Any member checking or triangulation

## Your Task: Dispatch to methods-writer

**You do NOT write the methods section yourself. You dispatch to methods-writer.**

### Step 1: Assess Pathway Triggers

Determine which pathway the methods-writer should use:

| Trigger | Pathway |
|---------|---------|
| Vulnerable/marginalized population | **Detailed** (2000-3000 words) |
| Novel or unusual methods | **Detailed** |
| Severe space constraints | **Efficient** (600-900 words) |
| Standard qualitative study | **Standard** (1200-1500 words) |

### Step 2: Compile Study Details

Create a study details summary for the dispatch:

```markdown
## Study Details for Methods-Writer

### Sample
- N: [number from participant profiles]
- Population: [description]
- Selection criteria: [from recruitment notes]
- Exclusions: [if any]

### Recruitment
- Channels: [how participants were found]
- Access: [gatekeeper/organizational access if applicable]
- Timeline: [dates of data collection]
- Response/participation notes: [if available]

### Interviews
- Format: [semi-structured / in-depth / life history]
- Mode: [in-person / phone / video / mixed]
- Duration: [range, e.g., 45-90 minutes, average 60]
- Language: [if relevant]
- Recording/transcription: [approach]

### Analysis
- Approach: [thematic analysis, grounded theory, etc.]
- Coding: [process description from codebook]
- Software: [if used]
- Team: [solo / team coding / reliability measures]

### Quality/Saturation
- Saturation evidence: [when did new themes stop emerging?]
- Quality measures: [member checks, peer debriefing, etc.]
- Positionality: [relevant researcher characteristics and their influence]

### Pathway Triggers
- Vulnerable population: [Yes/No]
- Novel methods: [Yes/No]
- Space constraints: [Yes/No]
- Recommended pathway: [Efficient / Standard / Detailed]
```

### Step 3: Dispatch to methods-writer

Use the Task tool to spawn the methods-writer agent:

```
Task: Draft Methods Section
subagent_type: general-purpose
model: opus
prompt: |
  Load the methods-writer skill:
  - Read: ../methods-writer/SKILL.md
  - Read: ../methods-writer/phases/phase0-assessment.md
  - Read: ../methods-writer/phases/phase1-drafting.md
  - Read: ../methods-writer/pathways/[pathway-name].md

  TASK: Draft a Methods section for this interview study.

  STUDY DETAILS:
  [paste the compiled study details from Step 2]

  PATHWAY: [Efficient / Standard / Detailed]

  Run Phase 0 (confirm pathway) then Phase 1 (drafting).

  Ensure the section includes:
  - Case selection logic
  - Recruitment transparency
  - Sample size justification (using appropriate strategy)
  - Interview protocol details
  - Analysis approach
  - Positionality (if triggered)

  OUTPUT:
  - Save pathway memo to: analysis/phase6-methods/pathway-memo.md
  - Save methods section to: analysis/phase6-methods/methods-section.md
  - Return: pathway used, word count, components included
```

## Output Files

After methods-writer completes, you should have:

```
analysis/phase6-methods/
├── pathway-memo.md        # Pathway assessment and rationale
└── methods-section.md     # Publication-ready Methods section
```

## Verification

After receiving the methods section, verify:

1. **Accuracy**: Do the details match what's in your analysis files?
2. **Completeness**: Are all required components present for the pathway?
3. **Calibration**: Is word count within pathway targets?
4. **Consistency**: Does the methods description match how you actually analyzed the data?

Flag any discrepancies for user review.

## When You're Done

Return a summary to the user:

1. Confirmation that methods-writer completed
2. Pathway selected and rationale
3. Word count and components included
4. Any items that need user verification (e.g., exact dates, IRB details)
5. Location of output files

**This completes the interview-analyst workflow.** The user now has:
- Quote database ready for interview-writeup (from Phase 5)
- Methods section ready for the manuscript (from Phase 6)
