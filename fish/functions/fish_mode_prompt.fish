# The fish_mode_prompt function is prepended to the prompt
function fish_mode_prompt --description "Displays the current mode"
  # Do nothing if not in vi mode
  if set -q __fish_vi_mode
    switch $fish_bind_mode
    case default
      set_color blue white
      echo '❲N❳'
    case insert
      set_color cyan white
      echo '❲I❳'
    case replace-one
      set_color red white
      echo '❲R❳'
    case visual
      set_color yellow white
      echo '❲V❳'
  end
  set_color normal
  echo -n ' '
end
end
