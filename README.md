# Sociology Writing Suite

A set of skills for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) to assist with qualitative research projects involving interviews or other similarly structured textual data. Covers the full research-to-publication workflow: literature review, qualitative analysis, and academic writing.

**This project is actively under development.** Skills and workflows may change.

## Requirements

### Claude Code

This plugin requires [Claude Code](https://docs.anthropic.com/en/docs/claude-code), Anthropic's agentic coding tool. Install it first:

```bash
npm install -g @anthropic-ai/claude-code
```

### Optional: Zotero MCP Server

Two skills (`lit-synthesis` and `peer-reviewer`) work best with the Zotero MCP server for full-text PDF access:

```bash
uv tool install "git+https://github.com/54yyyu/zotero-mcp.git"
zotero-mcp setup
```

See `skills/lit-synthesis/mcp/zotero-setup.md` for configuration details. These skills still function without Zotero, but with reduced capabilities.

### Optional: Docling (for PDF conversion)

The `lit-synthesis` skill can use docling for batch PDF-to-markdown conversion:

```bash
pip install docling
```

## Installation

### Option 1: Marketplace (Recommended)

```
/install nealcaren/sociology-writing-suite
```

### Option 2: Clone and Configure Manually

```bash
git clone https://github.com/nealcaren/sociology-writing-suite.git
```

Add to your Claude Code settings (`~/.claude/settings.json` or project `.claude/settings.json`):

```json
{
  "projects": {
    "/path/to/your/project": {
      "mcpServers": {},
      "skills": [
        "/path/to/sociology-writing-suite"
      ]
    }
  }
}
```

### Verify Installation

Restart Claude Code and type `/help`. You should see these skills listed:

- `/abstract-builder`
- `/research-coordinator`
- `/bibliography-builder`
- `/case-justification`
- `/genre-skill-builder`
- `/interview-analyst`
- `/interview-bookends`
- `/interview-writeup`
- `/lit-search`
- `/lit-synthesis`
- `/argument-builder`
- `/methods-writer`
- `/peer-reviewer`
- `/revision-coordinator`
- `/writing-editor`

## Quick Start

### The Research Coordinator

Start with `/research-coordinator` for full workflow orchestration. It drives the process proactively, maintains project state, and dispatches to specialized skills as needed:

```
/research-coordinator

I'm studying how journalists cover protests. I have 30 interviews with reporters.
```

The coordinator guides you through literature search, synthesis, data analysis, and writing.

### Invoke Skills Directly

Or invoke any skill directly:

```
/argument-builder
```

Claude loads the skill and guides you through its workflow.

### Provide Context

Include context when invoking:

```
/interview-analyst

I have 30 interviews with activists about why they left social movements.
My theoretical interest is in disengagement processes.
```

## The Skills

### Literature Review Chain

Use in sequence to go from search to written Theory section:

| Skill | What It Does |
|-------|--------------|
| `/lit-search` | Build literature database using OpenAlex API |
| `/lit-synthesis` | Deep reading, theoretical mapping, debate identification |
| `/argument-builder` | Draft publication-ready Theory section |

### Interview Research Chain

Go from raw interviews to written manuscript sections:

| Skill | What It Does |
|-------|--------------|
| `/interview-analyst` | Qualitative coding and pattern identification |
| `/interview-writeup` | Draft Methods and Findings sections |
| `/interview-bookends` | Draft Introduction and Conclusion |

### Manuscript Section Skills

| Skill | What It Does |
|-------|--------------|
| `/abstract-builder` | Write publication-ready abstracts (4 archetype options) |
| `/methods-writer` | Write Methods sections (3 pathway options) |
| `/case-justification` | Write case selection rationale |

### Revision Support

| Skill | What It Does |
|-------|--------------|
| `/revision-coordinator` | Parse reviewer feedback, route to specialized skills |
| `/peer-reviewer` | Simulate peer review before submission |
| `/bibliography-builder` | Extract citations, match to Zotero, generate bibliography |
| `/writing-editor` | Edit prose to sound natural; fixes LLM patterns and academic bad habits |

### Meta-Skill

| Skill | What It Does |
|-------|--------------|
| `/genre-skill-builder` | Create new writing skills from corpus analysis |

## Common Workflows

### Writing a New Paper from Interview Data

1. `/interview-analyst` — Analyze interviews
2. `/methods-writer` — Write methods
3. `/interview-writeup` — Write findings
4. `/lit-search` → `/lit-synthesis` → `/argument-builder` — Build literature review
5. `/interview-bookends` — Write intro and conclusion
6. `/peer-reviewer` — Pre-submission review
7. `/bibliography-builder` — Finalize references

### Revising After Peer Review

1. `/revision-coordinator` — Parse and route feedback
2. Skills dispatched by coordinator for specific sections
3. `/interview-bookends` Phase 3 — Check coherence
4. `/peer-reviewer` — Validate before resubmission

## Skill Features

### Cluster-Based Writing

Several skills use empirically-derived styles based on analysis of 80 articles from *Social Problems* and *Social Forces*:

- **argument-builder**: Gap-Filler, Theory-Extender, Concept-Builder, Synthesis, Problem-Driven
- **interview-bookends**: Same 5 clusters for intros/conclusions
- **case-justification**: Minimal, Standard, Deep Historical, Comparative, Policy-Driven
- **methods-writer**: Efficient (600-900w), Standard (900-1200w), Detailed (1200-1800w)

### Calibration Benchmarks

All skills include empirically-derived benchmarks: word counts, citation density (~24 per 1,000 words for Theory sections), structural patterns, and cluster-specific norms.

### Phase-Based Workflows

Each skill follows a structured workflow with pause points for user review.

## File Structure

```
sociology-writing-suite/
├── plugin.json
├── README.md
└── skills/
    ├── abstract-builder/
    ├── bibliography-builder/
    ├── case-justification/
    ├── genre-skill-builder/
    ├── interview-analyst/
    ├── interview-bookends/
    ├── interview-writeup/
    ├── lit-search/
    ├── lit-synthesis/
    ├── argument-builder/
    ├── methods-writer/
    ├── peer-reviewer/
    ├── research-coordinator/
    ├── revision-coordinator/
    └── writing-editor/
```

Each skill folder contains:
- `SKILL.md` — Main skill definition
- `phases/` — Phase guides
- `clusters/` or `pathways/` — Style-specific guidance
- `techniques/` — Craft reference guides

## License

MIT

## Author

Neal Caren
