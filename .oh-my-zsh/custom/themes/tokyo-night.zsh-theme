# vim:ft=zsh ts=2 sw=2 sts=2
#
# 東京夜 (Tōkyō Yoru) — Tokyo Night ZSH Theme
# Minimal prompt. Neon in the dark.
#
# Requires a Nerd Font or Powerline-patched font.
#

setopt promptsubst

_tokyo_git_info() {
  local ref
  ref=$(command git symbolic-ref --short HEAD 2>/dev/null) || \
  ref=$(command git describe --exact-match --tags HEAD 2>/dev/null) || \
  ref=$(command git rev-parse --short HEAD 2>/dev/null) || return

  local dirty=""
  if [[ -n $(command git status --porcelain 2>/dev/null) ]]; then
    dirty=" %F{179}✦%f"
  fi

  echo -n " %F{141} ${ref}%f${dirty}"
}

PROMPT='
%F{60}⛩%f %F{75}%1~%f$(_tokyo_git_info)
%(?.%F{141}.%F{204})❯%f '
