#!/bin/zsh

echo "Checking for Homebrew..."

if command -v brew; then
  echo "✅ Homebrew is already installed."
else
  echo "🚀 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH in Zsh
#   if [[ "$(uname)" == "Darwin" ]]; then
#     echo "🔧 Configuring Homebrew for macOS..."
#     echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
#     eval "$(/opt/homebrew/bin/brew shellenv)"
#   elif [[ "$(uname)" == "Linux" ]]; then
#     echo "🔧 Configuring Homebrew for Linux..."
#     echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
#     eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#   fi
# fi
