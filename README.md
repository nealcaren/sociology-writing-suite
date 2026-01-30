# Sociology Writing Suite

A complete academic writing toolkit for sociology research with 12 integrated skills covering the full research-to-publication workflow.

## Installation

### Option 1: Add to Project Settings (Recommended)

Add this plugin to your project's `.claude/settings.json`:

```json
{
  "plugins": [
    "/path/to/sociology-writing-suite"
  ]
}
```

Replace `/path/to/` with the actual path to this folder.

### Option 2: Add to User Settings

Add to your global Claude Code settings at `~/.claude/settings.json`:

```json
{
  "plugins": [
    "/path/to/sociology-writing-suite"
  ]
}
```

### Verify Installation

After adding the plugin, restart Claude Code and type `/help`. You should see all 12 skills listed:

- `/bibliography-builder`
- `/case-justification`
- `/genre-skill-builder`
- `/interview-analyst`
- `/interview-bookends`
- `/interview-writeup`
- `/lit-search`
- `/lit-synthesis`
- `/lit-writeup`
- `/methods-writer`
- `/peer-reviewer`
- `/revision-coordinator`

## Quick Start

### Invoke a Skill Directly

Type the skill name as a slash command:

```
/lit-writeup
```

Claude will load the skill and guide you through its workflow.

### Ask for Help with a Task

You can also describe what you need:

```
I need to write a theory section for my paper on social movements
```

Claude will suggest the appropriate skill (`lit-writeup`) and offer to invoke it.

### Provide Context When Invoking

You can include context with the command:

```
/interview-analyst

I have 30 interviews with activists about why they left social movements.
My theoretical interest is in disengagement processes.
```

## The 12 Skills

### Literature Review Chain

Use these three skills in sequence to go from search to written Theory section:

| Skill | What It Does | When to Use |
|-------|--------------|-------------|
| `/lit-search` | Build a literature database using OpenAlex API | Starting a new literature review |
| `/lit-synthesis` | Deep reading, theoretical mapping, debate identification | After downloading papers, before writing |
| `/lit-writeup` | Draft publication-ready Theory section | When ready to write the lit review |

**Example workflow**:
```
/lit-search
> Search for literature on "activist burnout" and "movement disengagement"

/lit-synthesis
> Analyze my Zotero collection and identify key debates

/lit-writeup
> Draft a Gap-Filler style theory section for my disengagement paper
```

### Interview Research Chain

Use these skills to go from raw interviews to written Methods, Findings, Intro, and Conclusion:

| Skill | What It Does | When to Use |
|-------|--------------|-------------|
| `/interview-analyst` | Qualitative coding and pattern identification | After completing interviews |
| `/interview-writeup` | Draft Methods and Findings sections | After coding is complete |
| `/interview-bookends` | Draft Introduction and Conclusion | After Theory and Findings are drafted |

**Example workflow**:
```
/interview-analyst
> I have transcripts from 30 interviews. Help me code them using Track B (data-first).

/interview-writeup
> Draft my Findings section using the Mechanism List archetype

/interview-bookends
> Write my introduction and conclusion as Gap-Filler style
```

### Manuscript Section Skills

| Skill | What It Does | When to Use |
|-------|--------------|-------------|
| `/methods-writer` | Write Methods sections with 3 pathway options | Drafting or revising Methods |
| `/case-justification` | Write case selection rationale | When your methods need case justification |

**Example**:
```
/methods-writer
> I interviewed 25 former activists. Help me write a Standard pathway methods section.
```

### Revision Support

| Skill | What It Does | When to Use |
|-------|--------------|-------------|
| `/revision-coordinator` | Parse reviewer feedback, route to specialized skills | After receiving reviews |
| `/peer-reviewer` | Simulate peer review before submission | Before submitting to journal |
| `/bibliography-builder` | Extract citations, match to Zotero, generate bibliography | Finalizing references |

**Example**:
```
/revision-coordinator
> Here's my R&R feedback. Help me parse it and plan revisions.

/peer-reviewer
> Simulate 3 reviewers for my complete manuscript before I submit to ASR.
```

### Meta-Skill

| Skill | What It Does | When to Use |
|-------|--------------|-------------|
| `/genre-skill-builder` | Create new writing skills from corpus analysis | Building custom skills for other genres |

## MCP Server Requirements

Two skills require the Zotero MCP server for full functionality:

### lit-synthesis and peer-reviewer

These skills use Zotero to:
- Access your library's full-text PDFs
- Build reviewer personas from relevant literature
- Match citations to your collection

**Setup**: Install and configure the Zotero MCP server. See `skills/lit-synthesis/mcp/zotero-setup.md` for instructions.

**Without Zotero MCP**: These skills will still work but with reduced functionality (no full-text access, manual citation matching).

## Common Workflows

### Writing a New Paper from Interview Data

1. **Analyze interviews**: `/interview-analyst`
2. **Write methods**: `/methods-writer`
3. **Write findings**: `/interview-writeup`
4. **Build literature review**: `/lit-search` → `/lit-synthesis` → `/lit-writeup`
5. **Write intro and conclusion**: `/interview-bookends`
6. **Pre-submission review**: `/peer-reviewer`
7. **Finalize bibliography**: `/bibliography-builder`

### Revising After Peer Review

1. **Parse and route feedback**: `/revision-coordinator`
2. **Revise specific sections**: Skills dispatched by coordinator
3. **Check coherence**: `/interview-bookends` Phase 3
4. **Validate before resubmission**: `/peer-reviewer`

### Writing Just a Theory Section

1. **Search literature**: `/lit-search`
2. **Synthesize and map**: `/lit-synthesis`
3. **Draft section**: `/lit-writeup`

## Skill Features

### Cluster-Based Writing

Several skills use "clusters" - empirically-derived styles based on analysis of 80 articles from *Social Problems* and *Social Forces*:

- **lit-writeup**: Gap-Filler, Theory-Extender, Concept-Builder, Synthesis, Problem-Driven
- **interview-bookends**: Same 5 clusters applied to intros/conclusions
- **case-justification**: Minimal, Standard, Deep Historical, Comparative, Policy-Driven
- **methods-writer**: Efficient (600-900w), Standard (900-1200w), Detailed (1200-1800w)

### Calibration Benchmarks

All skills include empirically-derived benchmarks:
- Word counts and section lengths
- Citation density (~24 per 1,000 words for Theory sections)
- Structural patterns (subsections, paragraph sequences)
- Cluster-specific norms

### Phase-Based Workflows

Each skill follows a structured workflow with explicit pause points for user review:
- **Phase 0**: Intake and assessment
- **Phases 1-N**: Drafting/analysis steps
- **Final Phase**: Revision and quality checks

## Tips

- **Start with assessment**: Let skills diagnose your contribution type before drafting
- **Provide context**: Share your research question, argument, and relevant materials
- **Use the chains**: The lit trilogy and interview chain work best in sequence
- **Trust the benchmarks**: Calibration norms come from real journal articles

## File Structure

```
sociology-writing-suite/
├── plugin.json
├── README.md
└── skills/
    ├── bibliography-builder/
    ├── case-justification/
    ├── genre-skill-builder/
    ├── interview-analyst/
    ├── interview-bookends/
    ├── interview-writeup/
    ├── lit-search/
    ├── lit-synthesis/
    ├── lit-writeup/
    ├── methods-writer/
    ├── peer-reviewer/
    └── revision-coordinator/
```

Each skill folder contains:
- `SKILL.md` - Main skill definition and overview
- `phases/` - Detailed phase guides
- `clusters/` or `pathways/` - Style-specific guidance (where applicable)
- `techniques/` - Reference guides for specific craft elements

## License

MIT

## Author

Neal Caren
