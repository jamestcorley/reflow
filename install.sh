#!/bin/sh

# Detect the OS.
OS=$(uname -s)

# Determine installation directory based on OS.
if [ "$OS" = "Linux" ]; then
    echo "Found operating system Linux."
    if [ -d "/usr/local/bin" ]; then
        INSTALL_DIR="/usr/local/bin"
        echo "Found installation path $INSTALL_DIR."
    elif [ -d "/usr/bin" ]; then
        INSTALL_DIR="/usr/bin"
        echo "Found installation path $INSTALL_DIR."
    else
	echo "Did not find installation path /usr/local/bin or /usr/bin."
	echo "You may be able to resolve by updating PATH."
        echo "Add one of the following to your /etc/profile, ~/.bashrc, or ~/.zshrc file."
	echo '  export PATH=$PATH:/usr/bin/local'
	echo '  export PATH=$PATH:/usr/bin'
	echo "Also ensure the directories that make up the installation path exist."
	exit 1
    fi
elif [ "$OS" = "Darwin" ]; then
    INSTALL_DIR="/usr/local/bin"
    echo "Found operating system macOS."
    echo "Found installation path $INSTALL_DIR."
else
    echo "Found unsupported OS."
    echo "Only Linux and macOS are supported."
    exit 1
fi

# Determine running with root priviliges.
if [ "$(id -u)" -eq 0 ]; then
    echo "Found privileges set correctly to root."
else
    echo "This script requires root privileges to install."
    echo "You can resolve by running as root or with sudo."
    exit 1
fi

# Determine if Zsh or Bash is available.
if command -v zsh > /dev/null 2>&1; then
    SHELL_TO_USE="zsh"
    echo "Found interpreter Zsh."
elif command -v bash > /dev/null 2>&1; then
    SHELL_TO_USE="bash"
    echo "Found interpreter Bash."
else
    echo "Did not find interpreter Zsh or Bash."
    echo "You can resolve by installing one or the other."
    exit 1
fi

# Determine if base64 is available.
if command -v base64 > /dev/null 2>&1; then
    echo "Found dependency base64."
else
    echo "Did not find dependency base64."
    echo "You can resolve by installing the dependency."
fi

# Determine if the reflow file exists before modifying it.
if [ ! -f reflow ]; then
    echo "Did not find reflow in the current directory."
    echo "You can resolve by adding the file."
    exit 1
fi

# Update the shebang line in reflow based on the interpreter.
if [ "$SHELL_TO_USE" = "zsh" ]; then
    sed -i '1s|^.*$|#!/usr/bin/zsh|' reflow
fi

# Make the script executable.
chmod +x reflow

# Move the script to the appropriate directory.
cp reflow "$INSTALL_DIR/reflow"

# Confirm the installation.
echo ""
echo "Completed installation."
echo ""
echo "You can now use reflow."
echo "Try running 'cat /etc/hosts | reflow' and check your clipboard."
echo ""
echo "Having trouble? Make sure your terminal emulator supports OSC 52."
echo "Documentation is at 'https://github.com/jamestcorley/reflow'."
