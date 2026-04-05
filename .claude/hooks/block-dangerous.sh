#!/usr/bin/env bash
# Claude Code PreToolUse hook — blocks dangerous bash commands
# Exit 2 = block the action and send feedback to Claude
# Exit 0 = allow

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    print(data.get('tool_input', {}).get('command', ''))
except:
    print('')
")

# Patterns that are unconditionally dangerous
DANGEROUS_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "rm -rf \$HOME"
  "rm -rf \*"
  ":(){:|:&};:"
  "dd if=/dev/zero"
  "dd if=/dev/random"
  "mkfs"
  "> /dev/sda"
  "chmod -R 777 /"
  "chown -R"
  "sudo rm -rf"
  "kill -9 -1"
  "shutdown"
  "reboot"
  "halt"
  "poweroff"
  "curl.*|.*sh"
  "wget.*|.*sh"
  "curl.*|.*bash"
  "wget.*|.*bash"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qi "$pattern"; then
    echo "BLOCKED: Dangerous command pattern detected: '$pattern'" >&2
    echo "Command was: $COMMAND" >&2
    exit 2
  fi
done

exit 0
