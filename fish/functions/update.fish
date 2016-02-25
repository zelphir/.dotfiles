function update
  if count $argv > /dev/null
    switch $argv[1]
      case brew
        update-brew
      case vim
        update-vim
      case docker-machine
        update-docker-machine
      case all
        update-brew
        update-vim
        update-docker-machine
      case '*'
        echo 'update what?'
        echo please select from [vim, brew, docker-machine, all]
    end
 end

function update-brew
  if type brew
    echo updating brew
    brew update
    brew upgrade --all
    #brew reinstall neovim --HEAD
    #brew reinstall fish --HEAD
    brew cleanup
  end
end

function update-vim
  if type vim
    echo updating vim
    brew reinstall neovim --HEAD
    nvim +PlugUpdate
  end
end

function update-docker-machine
  if type docker-machine
    echo updating docker-machine
    docker-machine upgrade
  end
end

complete -x -c update -d 'update' -a 'brew vim motion apt-get brew all'
