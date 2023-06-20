function notes
  set notes_dir "$HOME/Nextcloud/Notes"
  if test -d $notes_dir
    cd $notes_dir

    $EDITOR .
  else
    return
  end
end
