#!/#!/usr/bin/env sh
# POSIX compliant, both bash & zsh compatible

#cd "$(dirname "${BASH_SOURCE}")";
# cd into directory of script
if [ -n "${BASH_SOURCE}" ]; then
  # Bash
  cd "$(dirname "${BASH_SOURCE[0]}")" || exit
elif [ -n "${ZSH_VERSION}" ]; then
  # Zsh
  cd "$(dirname "${(%):-%N}")" || exit
else
  echo "Unsupported shell"
  exit 1
fi


git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
