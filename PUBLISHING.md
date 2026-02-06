# Publishing Updates to sociology-writing-suite

This guide covers how to publish updates to the Claude Code plugin marketplace.

## File Structure

```
sociology-writing-suite/
├── .claude-plugin/
│   └── marketplace.json             # Marketplace catalog (lists plugins + versions)
├── plugins/
│   └── sociology-writing-suite/
│       ├── plugin.json              # Plugin manifest (name, version, description)
│       └── skills/
│           └── [skill-name]/
│               ├── SKILL.md         # Skill definition
│               ├── phases/          # Phase files
│               ├── techniques/      # Technique files
│               └── clusters/        # Cluster files (if applicable)
└── README.md
```

## Where Versions Are Tracked

**Both files must have matching versions:**

| File | Purpose | Version Location |
|------|---------|------------------|
| `plugins/sociology-writing-suite/plugin.json` | Defines the plugin itself | `"version": "X.Y.Z"` at root |
| `.claude-plugin/marketplace.json` | What Claude Code displays | `plugins[0].version` field |

## Update Process

### 1. Make Your Changes

Edit skills, add new ones, fix bugs, etc.

### 2. Update Version Numbers

Decide on new version (e.g., `1.2.0` → `1.3.0`).

**Edit `plugins/sociology-writing-suite/plugin.json`:**
```json
{
  "name": "sociology-writing-suite",
  "version": "1.3.0",  // <-- UPDATE THIS
  "description": "...",
  ...
}
```

**Edit `.claude-plugin/marketplace.json`:**
```json
{
  "name": "sociology-writing-suite",
  "owner": { ... },
  "plugins": [
    {
      "name": "sociology-writing-suite",
      "source": { ... },
      "description": "...",
      "version": "1.3.0",  // <-- UPDATE THIS TOO
      ...
    }
  ]
}
```

### 3. Update Descriptions (if needed)

If you added/removed skills, update the `description` field in **both files** to reflect the current skill count and list.

### 4. Commit and Push

```bash
git add -A
git commit -m "Bump version to 1.3.0

- [describe what changed]

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
git push origin main
```

### 5. Update Local Marketplace

In Claude Code, run:
```
/plugin
```

Go to **Marketplaces** tab → select `sociology-writing-suite` → **Update**.

Or use the command:
```
/plugin marketplace update sociology-writing-suite
```

### 6. Reinstall Plugin (if needed)

If you already have it installed, you may need to uninstall and reinstall:
```
/plugin uninstall sociology-writing-suite@sociology-writing-suite
/plugin install sociology-writing-suite@sociology-writing-suite
```

Then restart Claude Code.

## Version Numbering

Follow semantic versioning:
- **Major (X.0.0)**: Breaking changes, major restructuring
- **Minor (0.X.0)**: New skills, significant feature additions
- **Patch (0.0.X)**: Bug fixes, minor tweaks, documentation updates

## Common Pitfalls

| Problem | Cause | Solution |
|---------|-------|----------|
| Version shows old number | Forgot to update `.claude-plugin/marketplace.json` | Update version in both files |
| Plugin not updating | Cached locally | Run `/plugin marketplace update`, then reinstall |
| Skills not appearing | Need restart | Restart Claude Code after installing |

## Checklist

Before pushing an update:

- [ ] Version updated in `plugins/sociology-writing-suite/plugin.json`
- [ ] Version updated in `.claude-plugin/marketplace.json`
- [ ] Description updated in both files (if skills changed)
- [ ] All new skill files are in place
- [ ] Committed and pushed to GitHub
- [ ] Tested locally with `/plugin marketplace update`
