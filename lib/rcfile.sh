# Read user rc file.

process_settings() {
	__read_rcfile

	if [ -z "$TMUX_POWERLINE_DEBUG_MODE_ENABLED" ]; then
		export TMUX_POWERLINE_DEBUG_MODE_ENABLED="${TMUX_POWERLINE_DEBUG_MODE_ENABLED_DEFAULT}"
	fi

	if [ -z "$TMUX_POWERLINE_PATCHED_FONT_IN_USE" ]; then
		export TMUX_POWERLINE_PATCHED_FONT_IN_USE="${TMUX_POWERLINE_PATCHED_FONT_IN_USE_DEFAULT}"
	fi

	if [ -z "$TMUX_POWERLINE_THEME" ]; then
		export TMUX_POWERLINE_THEME="${TMUX_POWERLINE_DEFAULT}"
	fi
	source "${TMUX_POWERLINE_DIR_THEMES}/${TMUX_POWERLINE_THEME}.sh"

}

generate_default_rc() {
	read -d '' rccontents  << EORC
# Default configuration file for tmux-powerline.
# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }

# General {
	export TMUX_POWERLINE_DEBUG_MODE_ENABLED="${TMUX_POWERLINE_DEBUG_MODE_ENABLED_DEFAULT}"
	export TMUX_POWERLINE_PATCHED_FONT_IN_USE="${TMUX_POWERLINE_PATCHED_FONT_IN_USE_DEFAULT}"
	export TMUX_POWERLINE_THEME="${TMUX_POWERLINE_THEME_DEFAULT}"
# }
EORC

	# TODO process all segments and call their default_conf function.
	echo "$rccontents" > "$TMUX_POWERLINE_RCFILE_DEFAULT"
	echo "Default configuration file generated to: ${TMUX_POWERLINE_RCFILE_DEFAULT}"
	echo "Copy/move it to \"${TMUX_POWERLINE_RCFILE}\" and make your changes."
}

__read_rcfile() {
	if [  -f "$TMUX_POWERLINE_RCFILE" ]; then
		source "$TMUX_POWERLINE_RCFILE"
	fi
}
