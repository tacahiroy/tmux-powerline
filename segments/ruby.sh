# Description : Prints Ruby version. Currenty, this supports rbenv only
# Author      : Takahiro Yoshihara <tacahiroy@gmail.com>
# Date        : 3rd August 2015
# License     : Modified BSD License

run_segment() {
  # 2.3.0-dev (set by /home/foo/.rbenv/version)
  ruby_ver=$(rbenv version | sed 's/ (set by .*)//')

	echo "rb:${ruby_ver}"
	return 0
}
