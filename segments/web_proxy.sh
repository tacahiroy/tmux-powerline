# Prints HTTP proxy configuration. This supports OS X only atm
# Author: Tacahiroy <tacahiroy@gmail.com>

run_segment() {
  nic=AX88179
  if shell_is_osx ; then
    proxy=$(networksetup -getwebproxy ${nic})
    if echo ${proxy} | head -n 1 | grep 'No' 2>&1 >/dev/null; then
      return 0
    fi
    server=$(echo ${proxy} | grep -o 'Server: .\+' | sed 's/Server:[ ]*//' | grep -o '^\S\+')
    port=$(echo ${proxy} | grep -o 'Port: .\+' | sed 's/Port:[ ]*//' | grep -o '^\d\+')
  fi

  if [ -n "${server}" -a -n "${port}" ]; then
    echo "[P]:${server}:${port}"
    return 0
  fi
}
