#!/bin/bash
#######################################################
#
#		nlantau's install.sh
#		NOT COMPLETE. Do NOT use!
#
#
#
echo "> Installing dotfiles"

echo "Checking your system..."

if [[ "$(uname)" == "Darwin" ]]; then

	echo "> Running on MacOS"
	echo "Checking if HomeBrew is installed..."
	
	if test ! "$( command -v brew)"; then
		
		echo "> Installing HomeBrew"
		ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
		
		brew bundle


		# TODO
		# Install fzf
		#

	elif test "$( command -v brew)"; then

		echo "> HomeBrew already installed. Skipping..."
	fi
	
else

	echo "> Install.sh only modified for MacOS."
	exit

fi


# Setting ZSH as shell

echo "Checking current shell..."

if [[ $SHELL == $(which zsh) ]]; then

	echo -ne "> Active shell:\\n> " 
	echo $SHELL | cut -d / -f 3 
	
elif [[ $SHELL == $(which bash) ]]; then

	echo "> Bash active..."
	echo "> Changing to ZSH..."
	chsh -s "$(whick zsh)"
	echo "> Default shell changed to ZSH"

fi


# Virtualenvs directory

[[ -d ~/.virtualenvs ]] && VIRDIR=~/.virtualenvs
[[ -d $VIRDIR ]] && folders=$(ls $VIRDIR)


echo "Checking if virtualenvs directory exists..."

if ! [[ -d $HOME/.virtualenvs ]]; then
	
	echo "> Creating virtualenvs directory..."
	mkdir -p ~/.virtualenvs
	echo "> Done"

	# TODO
	# Check venv 
	# if no venv, create venv and pip install neovim dependencies

else

	echo "> ${VIRDIR} already exists. Skipping"
	echo "Checking existing venvs..."

	echo "> Current venvs in $VIRDIR"
	
	for dir in $folders; do
		echo "> $dir"
	done

fi





# TODO:
# check OS
# install brew
        # install neovim
# check python
        # install pynvim
# change defaul shell to zsh

