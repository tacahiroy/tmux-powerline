#!/bin/sh

export TMUX_POWERLINE_SEGMENTS_HOME="$TMUX_POWERLINE_HOME/segments"

debug_mode_enabled  () {
  [ -n "$TMUX_POWERLINE_DEBUG_MODE_ENABLED" -a "$TMUX_POWERLINE_DEBUG_MODE_ENABLED" != "false" ];
}

patched_font_in_use () {
  [ -z "$TMUX_POWERLINE_PATCHED_FONT_IN_USE" -o "$TMUX_POWERLINE_PATCHED_FONT_IN_USE" != "false" ];
}

export SHELL_PLATFORM='OTHER'

case "$OSTYPE" in
  *'linux'*   ) SHELL_PLATFORM='LINUX' ;;
  *'darwin'*  ) SHELL_PLATFORM='OSX' ;;
  *'freebsd'* ) SHELL_PLATFORM='BSD' ;;
esac

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=235
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=255

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

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD

export TMUX_POWERLINE_TEMPORARY_DIRECTORY="/tmp/tmux-powerline"

if [ ! -d "$TMUX_POWERLINE_TEMPORARY_DIRECTORY" ]; then
  mkdir "$TMUX_POWERLINE_TEMPORARY_DIRECTORY"
fi
