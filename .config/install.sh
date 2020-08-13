#!/bin/bash
#######################################################
#
#		nlantau's install.sh
#		NOT COMPLETE. Do NOT use!
#


if [[ -f ./colors.sh ]]; then
	source ./colors.sh
else
	echo "Missing colors.sh. Output will be messed up"
fi

# Start installation

echo -e "${light_green}Installing dotfiles ${default} \n"
echo -e "[${green}*${default}] Checking your system..."

# Check OS

if [[ "$(uname)" == "Darwin" ]]; then
	echo -e "> Running on MacOS \n"
	echo -e "[${green}*${default}] Checking if HomeBrew is installed..."
	
	# Check Brew
	if test ! "$( command -v brew)"; then
		echo -e "> Installing HomeBrew \n"
		ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"

	elif test "$( command -v brew)"; then
		echo -e "> HomeBrew already installed. Skipping...\n"

	fi

		# Install Brewfile
		echo -e "> Installing HomeBrew Bundle.."
		brew bundle install

else
	echo -e "> Install.sh only modified for MacOS. \n"
	exit

fi


# Setting ZSH as shell

echo -e "[${green}*${default}] Checking current shell..."

# Check current shell

if [[ $SHELL == $(which zsh) ]]; then
	SYS_SHELL="$(echo $SHELL | cut -d / -f 3 )"
	echo -e "> Active shell: ${SYS_SHELL}\n" 
	
# If current is bash, set zsh as default

elif [[ $SHELL == $(which bash) ]]; then
	echo -e "> Bash active..."
	echo -e "> Changing to ZSH..."
	chsh -s "$(command -v zsh)"
	echo -e "> Default shell changed to ZSH\n"

fi

# Virtualenvs directory

[[ -d ~/.virtualenvs ]] && VIRDIR=~/.virtualenvs
[[ -d $VIRDIR ]] && folders=$(ls $VIRDIR)

echo -e "[${green}*${default}] Checking if virtualenvs directory exists..."

if ! [[ -d $HOME/.virtualenvs ]]; then
	echo -e "> Creating virtualenvs directory..."
	mkdir -p ~/.virtualenvs
	echo -e "> Done\n"
	# Check venv 
	# if no venv, create venv and pip install neovim dependencies

else
	echo -e "> ${VIRDIR} already exists. Skipping...\n"
	echo -e "[${green}*${default}] Checking existing venvs..."
	echo -e "> Current venvs in $VIRDIR:"
	
	# Print all virtual environments

	for dir in $folders; do
		echo -e "> $dir"

	done
	echo -e ''

fi


