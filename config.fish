if status is-interactive
    # Commands to run in interactive sessions can go here
  if [ "$CR_PAT" != "" ]
    echo "$CR_PAT" | podman login ghcr.io -u STBoyden --password-stdin >/dev/null 2>&1 & disown

    set CR_PAT ""
  end
end
fish_add_path /home/sboyden/.spicetify
