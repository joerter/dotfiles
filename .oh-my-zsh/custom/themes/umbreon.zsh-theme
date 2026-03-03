# vim:ft=zsh ts=2 sw=2 sts=2
#
# Umbreon — Dark-type ZSH Theme
# Black fur, glowing rings, red eyes.
#
# Requires a Nerd Font or Powerline-patched font.
#
# Palette:
#   220 — gold/yellow (glowing rings)
#   178 — amber (dirty marker)
#   160 — red (error / eyes)
#   236 — dark gray (muted accents)

setopt promptsubst

_umbreon_git_info() {
  local ref
  ref=$(command git symbolic-ref --short HEAD 2>/dev/null) || \
  ref=$(command git describe --exact-match --tags HEAD 2>/dev/null) || \
  ref=$(command git rev-parse --short HEAD 2>/dev/null) || return

  local dirty=""
  if [[ -n $(command git status --porcelain 2>/dev/null) ]]; then
    dirty=" %F{178}●%f"
  fi

  echo -n " %F{236}⟫%f %F{220} ${ref}%f${dirty}"
}

PROMPT='
%F{220}◉%f %F{248}%1~%f$(_umbreon_git_info)
%(?.%F{220}.%F{160})❯%f '
