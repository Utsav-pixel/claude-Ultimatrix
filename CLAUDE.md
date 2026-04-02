# Claude Code – Project Configuration

This is the standard CLAUDE.md for all projects using this boilerplate.
It tells Claude Code how to behave in this workspace.

## Pre-Planning Checklist (Run These FIRST Before Any Plan)

Before asking Claude to plan or build anything, run these commands in order:

### 1. Search Past Work (avoid reinventing)
```
/claude-mem:mem-search <topic>
```
Example: `/claude-mem:mem-search medium api scheduler`

### 2. Create the Implementation Plan
```
/claude-mem:make-plan
```
Describe the feature/project. Claude will create a phased plan with file discovery.

### 3. Execute the Plan
```
/claude-mem:do
```
Run after plan is confirmed and reviewed.

### 4. Design System (for any UI work)
```
/ui-ux-pro-max
```
Then describe: product type, style, stack (react/nextjs/vue/svelte etc.)

Or run manually:
```bash
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "<product> <keywords>" --design-system -p "Project Name"
```

### 5. Explore Codebase Structure
```
/claude-mem:smart-explore
```

---

## NPM Global Install Fix

If you get `EACCES` on `npm install -g`:
```bash
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
export PATH=~/.npm-global/bin:$PATH
```

---

## Installed Skills

| Skill | Trigger | Purpose |
|-------|---------|---------|
| `ui-ux-pro-max` | Any UI/design work | 67 styles, 96 palettes, 13 stacks |
| `claude-mem:make-plan` | Planning features | Phased implementation plan |
| `claude-mem:do` | Executing plans | Runs plan via subagents |
| `claude-mem:mem-search` | "Did we do this before?" | Cross-session memory search |
| `claude-mem:smart-explore` | Codebase exploration | AST-based code search |
| `claude-mem:timeline-report` | Project history | Full development journey report |
| `claude-api` | `import anthropic` | Claude API / Anthropic SDK usage |

---

## Coding Standards

- No unnecessary abstractions — write what the task needs
- No error handling for impossible cases
- No docstrings/comments on unchanged code
- Prefer editing existing files over creating new ones
- Security first: no command injection, XSS, SQL injection
- Validate only at system boundaries (user input, external APIs)

---

## Project Stack Defaults

Set these when starting a new project (remove what doesn't apply):

```
Backend:   Go / Python / Node.js
Frontend:  React + Vite / Next.js / Vue
Database:  SQLite / PostgreSQL / MySQL
AI:        Claude API (claude-sonnet-4-6)
Styling:   Tailwind CSS + shadcn/ui
```

---

## Environment Variables

See `.env.example` for required keys. Copy to `.env` and fill in values:
```bash
cp .env.example .env
```

---

## Git Setup

```bash
git init
git add .
git commit -m "Initial commit from claude-boilerplate"
```
