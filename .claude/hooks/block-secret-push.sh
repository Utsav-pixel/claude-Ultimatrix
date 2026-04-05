#!/usr/bin/env bash
# Claude Code PreToolUse hook — blocks git push/commit with secrets
# Scans staged files for common secret patterns before push/commit
# Exit 2 = block | Exit 0 = allow

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    print(data.get('tool_input', {}).get('command', ''))
except:
    print('')
")

# Only run on git push or git commit commands
if ! echo "$COMMAND" | grep -qE "git (push|commit)"; then
  exit 0
fi

# Secret patterns to scan for
SECRET_PATTERNS=(
  "AKIA[0-9A-Z]{16}"                    # AWS Access Key
  "sk-[a-zA-Z0-9]{32,}"                 # OpenAI / Anthropic API key
  "ghp_[a-zA-Z0-9]{36}"                 # GitHub Personal Access Token
  "gho_[a-zA-Z0-9]{36}"                 # GitHub OAuth
  "ghs_[a-zA-Z0-9]{36}"                 # GitHub App token
  "xoxb-[0-9]{11}-[0-9]{11}-[a-zA-Z0-9]{24}"  # Slack bot token
  "-----BEGIN (RSA|EC|DSA|OPENSSH) PRIVATE KEY-----"  # Private keys
  "password\s*=\s*['\"][^'\"]{8,}"      # Hardcoded passwords
  "secret\s*=\s*['\"][^'\"]{8,}"        # Hardcoded secrets
  "api_key\s*=\s*['\"][^'\"]{8,}"       # API keys in code
  "ANTHROPIC_API_KEY\s*=\s*[a-zA-Z0-9-_]{20,}" # Anthropic key
)

# Get staged diff
STAGED=$(git diff --cached 2>/dev/null)
if [ -z "$STAGED" ]; then
  exit 0
fi

for pattern in "${SECRET_PATTERNS[@]}"; do
  if echo "$STAGED" | grep -qE "^\+" | grep -qE "$pattern" 2>/dev/null; then
    echo "BLOCKED: Potential secret detected matching pattern: $pattern" >&2
    echo "Run 'git diff --cached' to review staged changes." >&2
    echo "Use .env files (already in .gitignore) to store secrets." >&2
    exit 2
  fi
done

# Also check if .env files are being staged
if echo "$STAGED" | grep -q "^diff --git a/.env"; then
  echo "BLOCKED: Attempting to commit a .env file." >&2
  echo ".env files contain secrets and are gitignored for a reason." >&2
  exit 2
fi

exit 0
