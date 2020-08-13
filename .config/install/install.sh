#!/bin/bash
#######################################################
#
#		nlantau's install.sh
#		NOT COMPLETE. Do NOT use!
#
#
#
echo -e "Installing dotfiles \n"

echo "Checking your system..."

if [[ "$(uname)" == "Darwin" ]]; then

	echo -e "> Running on MacOS \n"
	echo "Checking if HomeBrew is installed..."
	
	if test ! "$( command -v brew)"; then
		
		echo -e "> Installing HomeBrew \n"
		ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
		
		brew bundle install

		# TODO
		# Install fzf

	elif test "$( command -v brew)"; then

		echo -e "> HomeBrew already installed. Skipping...\n"
	fi
	
else

	echo -e "> Install.sh only modified for MacOS. \n"
	exit

fi


# Setting ZSH as shell

echo "Checking current shell..."

if [[ $SHELL == $(which zsh) ]]; then

	SYS_SHELL="$(echo $SHELL | cut -d / -f 3 )"
	
	echo -e "> Active shell: ${SYS_SHELL}\n" 
	
elif [[ $SHELL == $(which bash) ]]; then

	echo "> Bash active..."
	echo "> Changing to ZSH..."
	chsh -s "$(whick zsh)"
	echo -e "> Default shell changed to ZSH\n"

fi


# Virtualenvs directory

[[ -d ~/.virtualenvs ]] && VIRDIR=~/.virtualenvs
[[ -d $VIRDIR ]] && folders=$(ls $VIRDIR)


echo "Checking if virtualenvs directory exists..."

if ! [[ -d $HOME/.virtualenvs ]]; then
	
	echo "> Creating virtualenvs directory..."
	mkdir -p ~/.virtualenvs
	echo -e "> Done\n"

	# TODO
	# Check venv 
	# if no venv, create venv and pip install neovim dependencies

else

	echo -e "> ${VIRDIR} already exists. Skipping...\n"
	echo "Checking existing venvs..."

	echo "> Current venvs in $VIRDIR"
	
	for dir in $folders; do
		echo "> $dir"
	done
	echo ''

fi





# TODO:
# check OS
# install brew
        # install neovim
# check python
        # install pynvim
# change defaul shell to zsh

