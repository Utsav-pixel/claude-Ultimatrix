# Claude Code Boilerplate

A ready-to-clone starter for any new project with Claude Code + Windsurf pre-configured.

## What's Included

```
claude-boilerplate/
├── .claude/
│   ├── settings.local.json       # Pre-approved bash/web permissions
│   └── skills/
│       └── ui-ux-pro-max/        # UI design intelligence skill
├── .windsurf/
│   └── skills/
│       └── ui-ux-pro-max/        # Same skill for Windsurf IDE
├── CLAUDE.md                     # Claude Code project config + pre-plan checklist
├── CLAUDE_README.md              # This file
├── .env.example                  # Environment variable template
└── .gitignore                    # Sensible defaults
```

## Quick Start for New Project

### Step 1: Copy boilerplate
```bash
cp -r claude-boilerplate /path/to/your-new-project
cd /path/to/your-new-project
```

### Step 2: Install claude-mem plugin (if not installed globally)
In Claude Code terminal:
```
/plugin marketplace add obra/superpowers-marketplace
/plugin install claude-mem@superpowers-marketplace
```

### Step 3: Install uipro-cli (for ui-ux-pro-max skill)
```bash
# If npm global dir not configured:
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
export PATH=~/.npm-global/bin:$PATH

# Install
npm install -g uipro-cli
uipro init --ai claude
```

### Step 4: Fill environment variables
```bash
cp .env.example .env
# Edit .env with actual values
```

### Step 5: Open in Claude Code and start planning
```
/claude-mem:mem-search <your project topic>
/claude-mem:make-plan
```

---

## Claude Code Plugin Status

| Plugin | Source | Status |
|--------|--------|--------|
| superpowers-marketplace | `obra/superpowers-marketplace` | ✅ Install manually |
| claude-mem | `superpowers-marketplace` | ✅ Gives persistent memory across sessions |
| uipro / ui-ux-pro-max | `npm install -g uipro-cli` | ✅ Installed in .claude/skills |

**Note:** The official `claude-plugins-official` marketplace has a schema bug — use `obra/superpowers-marketplace` instead.

---

## Available Slash Commands (after plugin install)

| Command | What it does |
|---------|-------------|
| `/claude-mem:mem-search <topic>` | Search memory from all past sessions |
| `/claude-mem:make-plan` | Create phased implementation plan |
| `/claude-mem:do` | Execute the plan via subagents |
| `/claude-mem:smart-explore` | AST-based codebase exploration |
| `/claude-mem:timeline-report` | Full project development history |
| `/ui-ux-pro-max` | Generate design system for UI work |

---

## IDE Support

| IDE | Config location | Notes |
|-----|----------------|-------|
| Claude Code (CLI) | `.claude/` | Primary |
| Windsurf | `.windsurf/` | Same skills copied |
| VS Code + Claude | `.claude/` | Works via extension |

---

## Notes

- `settings.local.json` pre-approves common commands so Claude doesn't prompt every time
- The `ui-ux-pro-max` skill data is ~1MB of curated design data (CSV files) — no internet needed
- `CLAUDE.md` is auto-loaded by Claude Code at project open
