# .bashrc could be different per project
for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".bashrc" ]] && continue
  [[ "$f" == ".cache" ]] && continue
  [[ "$f" == ".config" ]] && continue

  ln -snfv $(pwd -P)/"$f" "$HOME"/"$f"
done

ln -snfv $(pwd -P)/.config/nvim "$HOME"/.config/

source $HOME/.bashrc
