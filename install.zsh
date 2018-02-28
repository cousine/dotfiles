#!/usr/bin/env zsh

local dotpath dotfiles choice testrun installdir=$HOME

read "testrun?Would you like to perform a test run? (y/n) "
if [[ $1 = 'test' || "$testrun" =~ ^[yY]$ ]]; then
  installdir=$HOME/dotfiles_test

  if [[ ! -d "$installdir" ]]; then
    mkdir $installdir
  fi
  echo "Adjusted install dir to $installdir, you can proceed safely."
fi

echo "This will symlink all dotfiles in this directory to your home dir"
read "choice?Are you sure you want to continue? (y/n) "

case "$choice" in
  y|Y)
    dotpath=$0:a:h
    dotfiles=(.*)

    for file in $dotfiles; do
      if [[ "$file" =~ ^.gitignore$ || "$file" =~ ^.git$ ]]; then
        continue
      fi

      echo "Linking $file in $installdir..."
      ln -s $dotpath/$file $installdir/$file
    done

    echo "Done!"
    echo "Be sure to set your ZSH_CUSTOM variable in ~/.zshrc to the path for '$dotpath/ohmyzsh_customs'"
    echo "Also update the powerline paths at the bottom of ~/.tmux.conf to '$dotpath/tmux-powerline'"
    ;;
  *)
    ;;
esac
