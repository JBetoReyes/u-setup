#!/bin/bash

# Check if vim is installed
if ! command -v vim &> /dev/null
then
	echo "Vim is not installed. Installing Vim..."
	sudo apt update && sudo apt install vim -y
	if [ $? -ne 0 ]; then
		echo "Failed to install Vim. Please install it manually"
		exit 1
	fi

	echo "Vim has been installed successfully."
else
	echo "Vim is already installed."
fi
