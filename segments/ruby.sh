# Description : Prints Ruby version. Currenty, this supports rbenv only
# Author      : Takahiro Yoshihara <tacahiroy@gmail.com>
# Date        : 3rd August 2015
# License     : Modified BSD License

run_segment() {
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
