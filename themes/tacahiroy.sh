# tacahiroy Theme

if patched_font_in_use; then
  TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="⮂"
  TMUX_POWERLINE_SEPARATOR_LEFT_THIN="⮃"
  TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="⮀"
  TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="⮁"
else
  TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
  TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
  TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
  TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'252'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
  TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
  "tmux_session_info 26 255" \
    # "hostname 33 0" \
    # "ifstat 30 255" \
    # "ifstat_sys 30 255" \
    # "lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
    # "wan_ip 24 255" \
    # "vcs_branch 29 88" \
    # "vcs_compare 60 255" \
    # "vcs_staged 64 255" \
    # "vcs_modified 9 255" \
    # "vcs_others 245 0" \
)
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
  TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
    # "wan_ip 24 255" \
    "ruby 1 15" \
    "lan_ip 28 15" \
    "web_proxy 15 0" \
    # "battery 122 0" \
    # "weather 137 255" \
    "time 214 0 ${TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}" \
    # "pwd 89 211" \
    # "mailcount 9 255" \
    # "now_playing 234 37" \
    # "cpu 240 136" \
    # "load 237 167" \
    # "tmux_mem_cpu_load 234 136" \
    # "xkb_layout 125 117" \
    # "date_day 235 136" \
    # "date 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
    # "utc_time 230 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
)
fi

