  export COURSE_ID="DevOpsTheHardWay"

  echo "Hello $USER"
  echo "$COURSE_ID"

  if [ -f "$HOME/.token" ]; then
      token_permissions=$(stat -c '%a' "$HOME/.token")

      if [ "$token_permissions" != "600" ]; then
          echo "Warning: .token file has too open permissions"
      fi
  fi

  umask 007
  export PATH="$PATH:$HOME/usercommands"
  echo "The current date is: $(date -u '+%Y-%m-%dT%H:%M:%S+00:00')"
  alias ltxt='ls -- *.txt'
  mkdir -p "$HOME/tmp"
  find "$HOME/tmp" -mindepth 1 -delete
  port_pids=$(lsof -t -i :8080)

  if [ -n "$port_pids" ]; then
      kill $port_pids
  fi
