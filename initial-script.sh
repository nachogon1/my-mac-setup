#!/bin/zsh

echo "Installing Xcode Tools"

xcode-select --install

echo "Checking for Homebrew..."

if command -v brew; then
  echo "✅ Homebrew is already installed."
else
  echo "🚀 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH in Zsh
  if [[ "$(uname)" == "Darwin" ]]; then
    echo >> /Users/a846987/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ "$(uname)" == "Linux" ]]; then
    echo "🔧 Configuring Homebrew for Linux..."
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi

source /Users/$(whoami)/.zprofile

echo "Creating Project folder"
mkdir -p ~/Projects

# We need to configure python here, because we need python to install ansible
echo "Installing Python"
## We install virtualenvwrapper. Pyenv was failing from scratch and will not be used.
## However, pyenv could be an improvement since it is OS agnostic.
## We could install ansible quicker?
brew install python@3.12
brew install virtualenvwrapper
echo '# Virtualenvwrapper setup' >> ~/.zshrc
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.zshrc
echo 'export PROJECT_HOME=$HOME/Projects' >> ~/.zshrc
echo 'export VIRTUALENVWRAPPER_PYTHON=$(which python3)' >> ~/.zshrc
## Change /opt/hombrew to /opt/local on intel macos
echo 'source /opt/homebrew/bin/virtualenvwrapper.sh' >> ~/.zshrc
source ~/.zshrc

# Create my default my-env project.
## python3.12 should regularly be updated
mkvirtualenv -p python3.12 -a ~/Projects my-env
mkvirtualenv -p python3.12 -a ~/Projects ansible-env

# We don't need alias. Alias are automatically set and used by the env.
# Alias are set by virtualenvwrapper.
# echo 'alias python="/opt/homebrew/bin/python3"' >> ~/.zshrc
# echo 'alias pip="/opt/homebrew/bin/pip3"' >> ~/.zshrc
# source ~/.zshrc


workon ansible-dev
pip install --upgrade pip
pip install ansible

