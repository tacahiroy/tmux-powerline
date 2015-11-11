# Description : Prints Ruby version. Currenty, this supports rbenv only
# Author      : Takahiro Yoshihara <tacahiroy@gmail.com>
# Date        : 12th Nov 2015
# License     : Modified BSD License

source "${TMUX_POWERLINE_DIR_LIB}/tmux_adapter.sh"

run_segment() {
  tmux_cwd=$(tmux list-pane -F '#{pane_active}:#{pane_current_path}' | grep '^1:' | sed 's/^1://')
  cd ${tmux_cwd}

  if rbenv -v 2>&1 > /dev/null; then
    # 2.3.0-dev (set by /home/foo/.rbenv/version)
    ruby_ver=$(rbenv version | sed 's/ (set by .*)//')
  elif [ -x ruby ]; then
    # ruby 2.3.0dev (2015-06-01 trunk 50708) [x86_64-darwin14]
    ruby_ver=$(ruby -v | sed 's/^ruby //' | sed 's/ ([0-9].*)//')
  else
    ruby_ver=''
  fi

  if [ -n "${ruby_ver}" ]; then
    echo "rb:${ruby_ver}"
  fi
	return 0
}
