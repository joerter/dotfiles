# Minimal tmux-powerline setup managed from this dotfiles repo.

export TMUX_POWERLINE_STATUS_LEFT_LENGTH=60
export TMUX_POWERLINE_STATUS_RIGHT_LENGTH=80

TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
	"tmux_session_info 148 234"
	"vcs_branch 29 88"
)

TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
	"pwd 89 211"
	"load 237 167"
	"time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
)
