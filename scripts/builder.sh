#!/usr/bin/bash

# Determine OS
OS="$OSTYPE"

# OS Specific Operations
case "$OS" in
  solaris*)
    echo "OS:Solaris" ;;
  darwin*)
    echo "OS:OSX" ;;
  linux*)
    echo "OS:Linux" ;;
  bsd*)
    echo "OS:FreeBSD" ;;
  msys*)
    echo "OS:Windows Bash/msysGit" ;;
  cygwin*)
    echo "OS:Windows Cygwin" ;;
  *)
    echo "Unknown: $OSTYPE"
    echo "Software is not compatible with architecture"
    exit 1 ;;
esac

# Check for Homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check for CMake
if [[ ! $(command which -s cmake) == 0 ]]; then
  echo "Found CMake:"
  which cmake
else
  brew install cmake
fi

# Configure for XCode
command cmake -S . -B xbuild -GXcode

# Build XCode Project
(cd xbuild; xcodebuild build)

# Prompt to open new XCode project
echo "Open new XCode project now? (y/n)"
read choice
if [[ $choice =~ ^[Yy]$ ]]
then
  command cmake --open xbuild
fi
