function notes
  set notes_dir "$HOME/Nextcloud/Notes"
  if test -d $notes_dir
    cd $notes_dir

    $EDITOR .
  else
    return
  end
end

function config
  set what $argv[1]
  set config_dir "$HOME/.config"

  switch $what
  case wezterm terminal
    if test -d "$config_dir/wezterm"
      cd "$config_dir/wezterm"
      nvim .
    else
      echo "Wezterm config directory not found. Ignoring..."
    end
  case nvim neovim
    if test -d "$config_dir/nvim/lua/user"
      cd "$config_dir/nvim/lua/user"
      nvim .
    else
      echo "Neovim config directory not found. Ignoring..."
    end
  case starship prompt
    if test -f "$config_dir/starship.toml"
      cd "$config_dir"
      nvim starship.toml
    else
      echo "Starship configuration file not found. Ignoring..."
    end
  case fish shell
    if test -d "$config_dir/fish"
      cd "$config_dir/fish"
      nvim .
    end
  case '*'
    echo "Please enter a valid config option."
    echo "Valid options are: wezterm, terminal, nvim, neovim, starship, prompt, fish, shell"
  end
end

function neorg
  set workspace $argv[1]

  switch $workspace
  case University university uni Uni
    echo "Opening university neorg workspace..."
    sleep .4s
    nvim -c "Neorg workspace university" -c "cd %:p:h"
  case Default default personal Personal '*'
    echo "Opening personal neorg workspace..."
    sleep .4s
    nvim -c "Neorg workspace personal" -c "cd %:p:h"
  end
end
