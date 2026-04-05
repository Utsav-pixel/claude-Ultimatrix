<div align="center">

# 🟢 claude-Ultimatrix

### _The Ultimate Form of Claude Code_

**Clone. Run `setup.sh`. Ship from minute one.**

[![Stars](https://img.shields.io/github/stars/Utsav-pixel/claude-Ultimatrix?style=for-the-badge&color=green)](https://github.com/Utsav-pixel/claude-Ultimatrix/stargazers)
[![Forks](https://img.shields.io/github/forks/Utsav-pixel/claude-Ultimatrix?style=for-the-badge&color=blue)](https://github.com/Utsav-pixel/claude-Ultimatrix/network)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.0-green?style=for-the-badge)]()

</div>

---

## 🦸 What Is This?

Claude Code is powerful. But vanilla Claude Code is like **Ben 10 with a basic alien** — capable, but nowhere near full potential.

This boilerplate is the **Omnitrix dialed to Ultimate** — persistent memory, design intelligence, phased execution, safety hooks, specialized AI agents, and token-efficient code review. All pre-loaded. All ready before you write line one.

> **Plain Claude Code** → Heatblast _(useful, but limited)_
> **Claude Code + Ultimatrix** → Ultimate Heatblast _(the same, but unstoppable)_

---

## ⚡ Quick Start

```bash
git clone https://github.com/Utsav-pixel/claude-Ultimatrix my-project
cd my-project
bash setup.sh
```

That's it. `setup.sh` handles everything: npm permissions, design system, code-review-graph, and hooks. Then follow the printed instructions for the two Claude Code plugin commands.

---

## 🔋 Powers Unlocked

| Power | Command / File | What It Does |
|-------|----------------|--------------|
| 🧠 **Persistent Memory** | `/claude-mem:mem-search` | Remembers decisions across every session |
| 📋 **Phased Planning** | `/claude-mem:make-plan` | Structured, phased implementation plan |
| 🤖 **Subagent Execution** | `/claude-mem:do` | Executes phases via parallel subagents |
| 🔍 **AST Exploration** | `/claude-mem:smart-explore` | Understands code without reading every file |
| 🎨 **Design Intelligence** | `/ui-ux-pro-max` | 67 styles · 96 palettes · 57 fonts · 13 stacks |
| 📜 **Project Timeline** | `/claude-mem:timeline-report` | Full development history narrative |
| ✅ **Pre-Approved Perms** | `settings.local.json` | No permission prompts for common commands |
| 📐 **Smart Standards** | `CLAUDE.md` | Claude knows your coding rules before you speak |
| 🛡️ **Safety Hooks** | `.claude/hooks/` | Blocks dangerous commands & secret leaks |
| 📏 **Domain Rules** | `rules/` | Billing · Database · Component standards |
| 🤖 **AI Agents** | `agents/` | Bug Catcher · Security Scanner · Perf Auditor · Design Reviewer |
| 📊 **Token Reduction** | `code-review-graph` | 6.8× fewer tokens on reviews via blast-radius analysis |

---

## 📁 What's Inside

```
🟢 claude-Ultimatrix/
├── 🚀 setup.sh                          # One-command setup (run this first)
│
├── 📂 .claude/
│   ├── ⚙️  settings.local.json          # Pre-approved permissions + hook config
│   ├── 📂 hooks/
│   │   ├── 🛡️  block-dangerous.sh       # Blocks rm -rf /, dd, curl|sh, etc.
│   │   └── 🔐 block-secret-push.sh     # Blocks commits containing secrets
│   ├── 📂 rules/
│   │   ├── 💳 billing.md                    # Payment safety rules for Claude
│   │   ├── 🗄️  database.md                  # Query + migration rules for Claude
│   │   └── 🧩 component.md                  # UI component standards for Claude
│   ├── 📂 agents/
│   │   ├── 🐛 bug-catcher.md               # Systematic bug hunting prompt
│   │   ├── 🔒 security-scanner.md          # OWASP security audit prompt
│   │   ├── ⚡ performance-auditor.md        # Bottleneck detection prompt
│   │   └── 🎨 design-reviewer.md           # UI/UX quality review prompt
│   └── 📂 skills/
│       └── 🎨 ui-ux-pro-max/            # Offline design intelligence (~1MB)
│
├── 📂 .windsurf/
│   └── 🎨 skills/ui-ux-pro-max/        # Same skill for Windsurf IDE
│
├── 📄 CLAUDE.md                         # Auto-loaded by Claude Code on open
└── 📄 .gitignore                        # Sensible defaults
```

---

## 🚀 Full Setup Guide

### 1️⃣ Clone + Run Setup

```bash
git clone https://github.com/Utsav-pixel/claude-Ultimatrix my-project
cd my-project
bash setup.sh
```

`setup.sh` automatically:
- Fixes npm global permissions (common macOS issue)
- Installs `uipro-cli` (offline design system)
- Installs `code-review-graph` (6.8× token reduction) and builds the initial graph
- Makes safety hooks executable
- Copies `.env.example` → `.env` if it exists

### 2️⃣ Activate Memory (inside Claude Code terminal)

```
/plugin marketplace add obra/superpowers-marketplace
/plugin install claude-mem@superpowers-marketplace
```

> ⚠️ Use `obra/superpowers-marketplace` — the official marketplace has a schema bug.

### 3️⃣ Build Your Project

```bash
# In Claude Code terminal:
/claude-mem:mem-search <topic>       # 🔍 Search past work first
/ui-ux-pro-max                       # 🎨 Design system (UI projects only)
/claude-mem:make-plan                # 📋 Phase the work
/claude-mem:do                       # 🤖 Execute via subagents
```

---

## 🛡️ Safety Hooks

Two hooks run automatically before every bash command Claude executes:

| Hook | What It Blocks |
|------|----------------|
| `block-dangerous.sh` | `rm -rf /`, `dd if=/dev/zero`, `curl \| sh`, `shutdown`, `kill -9 -1`, and more |
| `block-secret-push.sh` | AWS keys, OpenAI/Anthropic API keys, GitHub tokens, private keys, `.env` files in commits |

Hooks are configured in `.claude/settings.local.json` and run on every `PreToolUse` event for Bash.

---

## 📏 Rules (Domain-Specific Claude Instructions)

The `rules/` folder contains markdown files Claude reads before touching certain code:

| File | Purpose |
|------|---------|
| `rules/billing.md` | How to safely write payment/subscription code |
| `rules/database.md` | Query safety, migration patterns, N+1 prevention |
| `rules/component.md` | Component structure, accessibility, performance |

Reference them in your conversation: _"Follow rules/billing.md and add a subscription upgrade flow."_

---

## 🤖 Specialized Agents

The `agents/` folder contains ready-to-paste expert agent prompts:

| Agent | What It Does |
|-------|-------------|
| `agents/bug-catcher.md` | Systematically hunts P0–P3 bugs across the codebase |
| `agents/security-scanner.md` | OWASP Top 10 audit with CVE severity ratings |
| `agents/performance-auditor.md` | Finds N+1s, memory leaks, blocking I/O, render issues |
| `agents/design-reviewer.md` | WCAG 2.1, 8pt grid, design token consistency review |

**How to use:** Open the agent file, copy the "Agent Prompt" section, paste into Claude Code.

---

## 📊 Token Reduction with code-review-graph

[code-review-graph](https://github.com/tirth8205/code-review-graph) builds a structural map of your codebase using Tree-sitter, so Claude understands what's affected by a change without reading every file.

**Results:** 6.8× fewer tokens on code reviews · up to 49× fewer tokens on daily tasks

```bash
# After setup.sh installs it:
code-review-graph build           # (re)build the graph
/code-review-graph:review-delta   # review only what changed
/code-review-graph:review-pr      # review a full PR efficiently
```

The graph updates incrementally on file saves and git commits (< 2 seconds for large projects).

---

## 🎨 UI Stack Support

| Stack | Status |
|-------|--------|
| ⚛️ React | ✅ Full |
| ▲ Next.js | ✅ Full |
| 💚 Vue / Nuxt | ✅ Full |
| 🔥 Svelte | ✅ Full |
| 🌊 Tailwind + shadcn/ui | ✅ Full |
| 🍎 SwiftUI | ✅ Full |
| 💙 Flutter | ✅ Full |
| 📱 React Native | ✅ Full |
| 🤖 Jetpack Compose | ✅ Full |
| 🚀 Astro | ✅ Full |

---

## 🔌 Plugin & Tool Status

| Tool | Install | Purpose |
|------|---------|---------|
| `claude-mem` | via `/plugin install` in Claude Code | Persistent memory across sessions |
| `ui-ux-pro-max` | auto via `setup.sh` | Offline design intelligence |
| `code-review-graph` | auto via `setup.sh` | 6.8× token reduction on reviews |

---

## 🛠️ IDE Support

| IDE | Config | Status |
|-----|--------|--------|
| 🟢 Claude Code CLI | `.claude/` | ✅ Primary — full support |
| 🌊 Windsurf | `.windsurf/` | ✅ Skills pre-copied |
| 💻 VS Code + Claude ext | `.claude/` | ✅ Works via extension |

---

## 🤝 Contributing

> Every PR should make Claude meaningfully more capable for the next developer who clones this.

1. 🍴 Fork the repo
2. 🌿 `git checkout -b feature/your-idea`
3. ✂️ Keep it minimal — boilerplate, not a framework
4. 📝 Open a PR: what you added · why it belongs · how to test it
5. **Always update `CLAUDE.md` + `README.md` to reflect your addition**

**🎯 Open slots in the Ultimatrix:**

| Slot | Feature | Difficulty |
|------|---------|------------|
| 🔄 | GitHub Actions for auto-commit summaries | Easy |
| 💾 | `claude-mem` auto-snapshot on session end | Medium |
| 🐳 | Docker Compose templates per stack | Easy |
| 🎨 | More UI stacks (Angular, SvelteKit) | Medium |
| 🔌 | MCP server auto-configuration | Medium |
| 🗄️ | DB schema generation from `CLAUDE.md` | Hard |
| 📦 | Obsidian vault sync for memory | Hard |

---

## ⭐ Show Support

If this saved you even 30 minutes on your next project — **give it a star.**

---

<div align="center">

**Built with 🟢 Claude Code · Powered by the community**

[⭐ Star this repo](https://github.com/Utsav-pixel/claude-Ultimatrix) · [📝 Read the blog](https://medium.com/@utsav.moradiya3) · [🐛 Open an issue](https://github.com/Utsav-pixel/claude-Ultimatrix/issues)

</div>
