script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

log_info() {
  echo "==> FRIGG: $@"
}

log_debug() {
  if [[ $LOG_LEVEL == 'debug' ]]; then
    $script_dir/color.sh faint
    log_info $@
    $script_dir/color.sh off
  fi
}

log_success() {
  $script_dir/color.sh green
  log_info $@
  $script_dir/color.sh off
}

log_notice() {
  $script_dir/color.sh cyan
  log_info $@
  $script_dir/color.sh off
}

log_warning() {
  $script_dir/color.sh yellow
  log_info $@
  $script_dir/color.sh off
}

log_error() {
  $script_dir/color.sh red
  log_info $@
  $script_dir/color.sh off
}
