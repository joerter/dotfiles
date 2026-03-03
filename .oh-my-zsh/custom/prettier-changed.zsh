prettier_changed() {
  local root
  root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Not inside a git repo."
    return 1
  }

  local prettier="$root/node_modules/.bin/prettier"
  if [ ! -x "$prettier" ]; then
    echo "Prettier not found at $prettier"
    return 1
  fi

  (cd "$root" && \
    git diff --name-only --diff-filter=ACMRTUXB main...HEAD \
    | grep -E '\.(js|jsx|ts|tsx|css|scss|json|md|html|vue|yaml|yml)$' \
    | xargs -r "$prettier" --write)
}
alias pch='prettier_changed'
