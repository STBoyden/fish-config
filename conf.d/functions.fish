function notes
  set notes_dir "$HOME/Nextcloud/Notes"
  if test -d $notes_dir
    cd $notes_dir

    $EDITOR .
  else
    return
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
