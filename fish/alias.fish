# Alias
function v --wraps nvim -d 'alias v=nvim'
  nvim $argv
end

function r --wraps trash -d 'alias r=trash'
  trash $argv
end

function bat
  env COLORTERM=truecolor bat $argv
end

function reload
  source $fish_path/config.fish
end

function work
  cd $WORKSPACE
end

# Docker
function unsetdm -d "Unset DOCKER vars"
  set -e DOCKER_MACHINE_NAME
  set -e DOCKER_CERT_PATH
  set -e DOCKER_HOST
  set -e DOCKER_TLS_VERIFY
end

function setdm -d "Set docker machine env"
  eval (docker-machine env $argv)
end

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

function kp --description "Kill processes"
  set -l __kp__pid (ps -ef | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:process]'" | awk '{print $2}')
  set -l __kp__kc $argv[1]

  if test "x$__kp__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__kp__pid | xargs kill $argv[1]
    else
      echo $__kp__pid | xargs kill -9
    end
    kp
  end
end

function ks --description "Kill http server processes"
  set -l __ks__pid (lsof -Pwni tcp | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:tcp]'" | awk '{print $2}')
  set -l __ks__kc $argv[1]

  if test "x$__ks__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__ks__pid | xargs kill $argv[1]
    else
      echo $__ks__pid | xargs kill -9
    end
    ks
  end
end

function list-docker --description "List internal ips and names for docker containers"
  docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /'
end

function node-tnl -a url -a port --description "ssh tunne for node debugger"
  if test -z "$url"
    echo "Provide a url to tunnel"
  else
    set -q port[1]; or set port "9230"
    echo "Tunneling `$url` node debugger on port $port..."
    ssh -nNT -L $port:127.0.0.1:$port $url
  end
end
