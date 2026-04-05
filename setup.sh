#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# claude-Ultimatrix v2 — One-command setup
# Activates all superpowers: design system, hooks, token reduction
# Self-deletes on full success. Kept if any step fails.
# ─────────────────────────────────────────────────────────────────────────────

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

print_step() { echo -e "\n${CYAN}▶ $1${NC}"; }
print_ok()   { echo -e "  ${GREEN}✓ $1${NC}"; }
print_warn() { echo -e "  ${YELLOW}⚠ $1${NC}"; }
print_err()  { echo -e "  ${RED}✗ $1${NC}"; }

SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)/$(basename "$0")"

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════╗"
echo -e "║       claude-Ultimatrix v2  Setup          ║"
echo -e "╚════════════════════════════════════════════╝${NC}"
echo ""

# ── 1. Check prerequisites ────────────────────────────────────────────────────
print_step "Checking prerequisites"

command -v git     >/dev/null 2>&1 && print_ok "git found"     || { print_err "git not found — install git first"; exit 1; }
command -v node    >/dev/null 2>&1 && print_ok "node found"    || print_warn "node not found — skip npm steps or install Node.js"
command -v python3 >/dev/null 2>&1 && print_ok "python3 found" || print_warn "python3 not found — some skills may not work"

# ── 2. Fix npm global permissions (common macOS issue) ────────────────────────
if command -v npm >/dev/null 2>&1; then
  print_step "Configuring npm global prefix"
  mkdir -p "$HOME/.npm-global"
  npm config set prefix "$HOME/.npm-global"
  SHELL_RC="$HOME/.zshrc"
  [[ "$SHELL" == *"bash"* ]] && SHELL_RC="$HOME/.bashrc"
  if ! grep -q 'npm-global' "$SHELL_RC" 2>/dev/null; then
    echo 'export PATH=~/.npm-global/bin:$PATH' >> "$SHELL_RC"
    print_ok "Added ~/.npm-global/bin to PATH in $SHELL_RC"
  else
    print_ok "npm-global already in PATH"
  fi
  export PATH=~/.npm-global/bin:$PATH
fi

# ── 3. Install UI design intelligence (uipro-cli) ────────────────────────────
if command -v npm >/dev/null 2>&1; then
  print_step "Installing ui-ux-pro-max (offline design system)"
  if command -v uipro >/dev/null 2>&1; then
    print_ok "uipro-cli already installed — run 'npm install -g uipro-cli' to update"
  else
    npm install -g uipro-cli 2>&1 | tail -1
    uipro init --ai claude 2>/dev/null || true
    print_ok "uipro-cli installed"
  fi
fi

# ── 4. Set up code-review-graph (token reduction) ────────────────────────────
# https://github.com/tirth8205/code-review-graph
# Builds a structural graph of your codebase → 6.8× fewer tokens on reviews,
# up to 49× fewer tokens on daily coding tasks. Requires Python 3.10+.
print_step "Setting up code-review-graph (6.8× fewer tokens on code reviews)"
if command -v python3 >/dev/null 2>&1 && command -v pip3 >/dev/null 2>&1; then
  PYVER=$(python3 -c "import sys; print(sys.version_info >= (3,10))" 2>/dev/null)
  if [ "$PYVER" != "True" ]; then
    print_warn "code-review-graph requires Python 3.10+ — skipping (upgrade Python to enable)"
  elif pip3 show code-review-graph >/dev/null 2>&1; then
    print_ok "code-review-graph already installed"
    print_warn "Run 'code-review-graph build' to rebuild the graph for this project"
  else
    pip3 install code-review-graph --quiet && \
      code-review-graph install && \
      code-review-graph build && \
      print_ok "code-review-graph installed and graph built (auto-configured with Claude Code)" || \
      print_warn "code-review-graph install failed — see https://github.com/tirth8205/code-review-graph"
  fi
else
  print_warn "pip3 not found — install code-review-graph manually: pip install code-review-graph"
fi

# ── 5. Make hooks executable ──────────────────────────────────────────────────
print_step "Activating safety hooks"
if [ -d ".claude/hooks" ]; then
  chmod +x .claude/hooks/*.sh
  print_ok "block-dangerous.sh activated"
  print_ok "block-secret-push.sh activated"
else
  print_err ".claude/hooks not found — are you in the project root?"
  exit 1
fi

# ── 6. Copy .env.example → .env if not present ───────────────────────────────
print_step "Environment file"
if [ -f ".env.example" ] && [ ! -f ".env" ]; then
  cp .env.example .env
  print_ok ".env created from .env.example — fill in your API keys"
elif [ -f ".env" ]; then
  print_ok ".env already exists"
else
  print_warn "No .env.example found — create .env manually"
fi

# ── 7. Remove boilerplate-only files not needed in your project ──────────────
print_step "Cleaning up boilerplate files"
[ -f "LICENSE" ] && rm LICENSE && print_ok "LICENSE removed (add your own if needed)"

# ── All steps passed — print next steps then self-delete ─────────────────────
echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════════════╗"
echo -e "║   Setup complete! Now run these inside Claude Code terminal:   ║"
echo -e "╚════════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${CYAN}1. Install persistent memory plugin:${NC}"
echo -e "     /plugin marketplace add obra/superpowers-marketplace"
echo -e "     /plugin install claude-mem@superpowers-marketplace"
echo ""
echo -e "  ${CYAN}2. Your workflow from now on:${NC}"
echo -e "     /claude-mem:mem-search <topic>   # search past work"
echo -e "     /ui-ux-pro-max                   # design system (UI projects)"
echo -e "     /claude-mem:make-plan            # phase the work"
echo -e "     /claude-mem:do                   # execute via subagents"
echo ""
echo -e "  ${CYAN}3. Specialized agents (paste into Claude Code):${NC}"
echo -e "     agents/bug-catcher.md            # hunt bugs systematically"
echo -e "     agents/security-scanner.md       # OWASP security audit"
echo -e "     agents/performance-auditor.md    # find bottlenecks"
echo -e "     agents/design-reviewer.md        # UI/UX quality review"
echo ""
echo -e "  ${CYAN}4. Rules (auto-loaded into context):${NC}"
echo -e "     rules/billing.md                 # payment safety rules"
echo -e "     rules/database.md                # query + migration rules"
echo -e "     rules/component.md               # UI component standards"
echo ""
echo -e "${GREEN}  You're in Ultimate Form. Ship something great.${NC}"
echo ""

rm -- "$SCRIPT_PATH"
echo -e "${GREEN}  ✓ setup.sh removed (job done).${NC}"
echo ""
