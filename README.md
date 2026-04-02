<div align="center">

# 🟢 claude-Ultimatrix

### _The Ultimate Form of Claude Code_

**Clone once. Never configure again. Ship from minute one.**

[![Stars](https://img.shields.io/github/stars/Utsav-pixel/claude-Ultimatrix?style=for-the-badge&color=green)](https://github.com/Utsav-pixel/claude-Ultimatrix/stargazers)
[![Forks](https://img.shields.io/github/forks/Utsav-pixel/claude-Ultimatrix?style=for-the-badge&color=blue)](https://github.com/Utsav-pixel/claude-Ultimatrix/network)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)

</div>

---

## 🦸 What Is This?

Claude Code is powerful. But vanilla Claude Code is like **Ben 10 with a basic alien** — capable, but nowhere near full potential.

This boilerplate is the **Omnitrix dialed to Ultimate** — persistent memory, design intelligence, phased execution, and pre-approved permissions. All pre-loaded. All ready before you write line one.

> **Plain Claude Code** → Heatblast _(useful, but limited)_
> **Claude Code + Ultimatrix** → Ultimate Heatblast _(the same, but unstoppable)_

---

## ⚡ Powers Unlocked

| 🔋 Power | Command | What It Does |
|----------|---------|--------------|
| 🧠 **Persistent Memory** | `/claude-mem:mem-search` | Remembers decisions across every session — no more reinventing |
| 📋 **Phased Planning** | `/claude-mem:make-plan` | Creates a structured, phased implementation plan |
| 🤖 **Subagent Execution** | `/claude-mem:do` | Executes each plan phase via parallel subagents |
| 🔍 **AST Exploration** | `/claude-mem:smart-explore` | Understands code structure without reading every file |
| 🎨 **Design Intelligence** | `/ui-ux-pro-max` | 67 styles · 96 palettes · 57 fonts · 13 stacks — fully offline |
| 📜 **Project Timeline** | `/claude-mem:timeline-report` | Full development history narrative |
| ✅ **Pre-Approved Perms** | `settings.local.json` | No more permission prompts for common commands |
| 📐 **Smart Standards** | `CLAUDE.md` | Claude knows your coding rules before you say a word |

---

## 📁 What's Inside

```
🟢 ultimatrix/
├── 📂 .claude/
│   ├── ⚙️  settings.local.json        # Pre-approved bash/web permissions
│   └── 📂 skills/
│       └── 🎨 ui-ux-pro-max/          # UI design intelligence (offline, ~1MB)
│           ├── 📊 data/
│           │   ├── colors.csv         # 96 curated palettes
│           │   ├── typography.csv     # 57 font pairings
│           │   ├── styles.csv         # 67 visual styles
│           │   ├── icons.csv
│           │   ├── charts.csv         # 25 chart types
│           │   └── stacks/            # react · nextjs · vue · svelte
│           │                          # flutter · swiftui · shadcn · astro...
│           └── 🐍 scripts/
│               ├── core.py
│               ├── design_system.py
│               └── search.py
├── 📂 .windsurf/
│   └── 🎨 skills/ui-ux-pro-max/       # Same skill for Windsurf IDE
├── 📄 CLAUDE.md                        # Auto-loaded by Claude Code on open
└── 📄 .gitignore                       # Sensible defaults
```

---

## 🚀 Quick Start

### 1️⃣ Clone the Ultimatrix

```bash
git clone https://github.com/Utsav-pixel/claude-Ultimatrix my-project
cd my-project
```

### 2️⃣ Activate the Memory Core (`claude-mem`)

Inside Claude Code terminal:

```
/plugin marketplace add obra/superpowers-marketplace
/plugin install claude-mem@superpowers-marketplace
```

> ⚠️ Use `obra/superpowers-marketplace` — the official marketplace has a schema bug.

### 3️⃣ Load the Design Matrix (`ui-ux-pro-max`)

```bash
# Fix npm global permissions if needed
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
export PATH=~/.npm-global/bin:$PATH

# Install
npm install -g uipro-cli
uipro init --ai claude
```

### 4️⃣ Start Building — The Right Way

```bash
# In Claude Code terminal:

/claude-mem:mem-search <your topic>      # 🔍 Check past work first
/ui-ux-pro-max                           # 🎨 Get design system (if UI)
/claude-mem:make-plan                    # 📋 Create phased plan
/claude-mem:do                           # 🤖 Execute via subagents
```

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

## 🔌 Plugin Status

| Plugin | Source | Purpose |
|--------|--------|---------|
| `superpowers-marketplace` | `obra/superpowers-marketplace` | Plugin registry |
| `claude-mem` | via superpowers | Persistent memory across sessions |
| `ui-ux-pro-max` | `npm install -g uipro-cli` | Offline design intelligence |

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

**How to contribute:**

1. 🍴 Fork the repo
2. 🌿 `git checkout -b feature/your-idea`
3. ✂️ Keep it minimal — boilerplate, not a framework
4. 📝 Open a PR: what you added · why it belongs · how to test it
5. **🔴 Always update `CLAUDE.md` + `README.md` to reflect your addition**

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
It helps other developers find it and tells me which alien to add next.

---

<div align="center">

**Built with 🟢 Claude Code · Powered by the community**

[⭐ Star this repo](https://github.com/Utsav-pixel/claude-Ultimatrix) · [📝 Read the blog](https://medium.com/@Utsav-pixel) · [🐛 Open an issue](https://github.com/Utsav-pixel/claude-Ultimatrix/issues)

</div>
