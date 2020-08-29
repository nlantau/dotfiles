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

echo -e "${red}Installing dotfiles ${default} \n"
echo -e "[${green}*${default}] Checking your system..."

# Check OS

if [[ "$(uname)" == "Darwin" ]]; then
  echo -e "${underline}> Running on MacOS ${reset}\n"
  
  echo -e "[${green}*${default}] Checking if HomeBrew is installed..."
  
  # Check Brew
  if test ! "$( command -v brew)"; then
    echo -e "${underline}> Installing HomeBrew \n${reset}"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"

  elif test "$( command -v brew)"; then
    echo -e "${underline}> HomeBrew already installed. Skipping...\n${reset}"
  fi

  # Install Brewfile
  echo -e "${underline}> Installing HomeBrew Bundle..\n${reset}"
  #brew bundle install

elif [[ "$(uname)" == "Linux" ]]; then
  echo -e "${underline}> Running Linux  \n${reset}"
  
  echo -e "[${green}*${default}] Updating & Upgrading..."
  sudo apt update
  sudo apt -y upgrade
  
  echo -e "[${green}*${default}] Installing Python3..."
  sudo apt install -y python3-pip
  
  echo -e "[${green}*${default}] Installing Build-Essentials..."
  sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
  
  echo -e "[${green}*${default}] Installing Python3 venv..."
  sudo apt install -y python3-venv
  
  # Venv directory
  if ! [[ -d $HOME/.virtualenvs ]]; then
    echo -e "[${green}*${default}] Creating directory for virtual environments..."
    mkdir $HOME/.virtualenvs
    cd $HOME/.virtualenvs
    python3 -m venv base_env
  fi 
  
  if [[ -f ./requirements.txt ]]; then
    source $HOME/.virtualenvs/base_env/bin/active
    pip3 install -r requirements.txt
  fi
fi


# Setting ZSH as shell

echo -e "[${green}*${default}] Checking current shell..."

# Check current shell

if [[ $SHELL == $(which zsh) ]]; then
  SYS_SHELL="$(echo $SHELL | cut -d / -f 3 )"
  echo -e "${underline}> Active shell: ${SYS_SHELL}\n${reset}" 
	
# If current is bash, set zsh as default

elif [[ $SHELL == $(which bash) ]]; then
  echo -e "${underline}> Bash active...${reset}"
  echo -e "> Changing to ZSH..."
  chsh -s "$(command -v zsh)"
  echo -e "${underline}> Default shell changed to ZSH\n${reset}"

fi

# Virtualenvs directory

[[ -d ~/.virtualenvs ]] && VIRDIR=~/.virtualenvs
[[ -d $VIRDIR ]] && folders=$(ls $VIRDIR)

echo -e "[${green}*${default}] Checking if virtualenvs directory exists..."

if ! [[ -d $HOME/.virtualenvs ]]; then
  echo -e "${underline}> Creating virtualenvs directory...${reset}"
  mkdir -p ~/.virtualenvs
  echo -e "> Done\n"
  # Check venv 
  # if no venv, create venv and pip install neovim dependencies

else
  echo -e "${underline}> ${VIRDIR} already exists. Skipping...\n${reset}"
  echo -e "[${green}*${default}] Checking existing venvs..."
  echo -e "> Current venvs in $VIRDIR:"
  
  # Print all virtual environments
  
  for dir in $folders; do
    echo -e "> $dir"
  
  done
  echo -e ''

fi


