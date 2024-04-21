#!/bin/bash

# Check if Git is installed

if ! command -v git &> /dev/null
then
	echo "Git is not installed. Installing Git.."
	sudo apt update && sudo apt install git -y
	if [ $? -ne 0 ]; then
		echo "Failed to install Git. Please install it manually."
		exit 1
	fi
	echo "Git has been installed successfully."
else
	echo "Git has already installed".
fi

if ! git config --global --get user.email &> /dev/null
then
	read -p "Enter your Github email: " email
	git config --global user.email "$email"
	echo "Git global email has been set to $email"
fi

if ! git config --global --get user.name &> /dev/null
then
	read -p "Enter your Github username: " username
	git config --global user.name "$username"
	echo "Git global user name has been set to $username"
fi


if ! command -v gh &> /dev/null
then
	echo "GH CLI is not installed. Installing GH CLI..."
	sudo apt install gh -y
	if [ $? -ne 0 ]; then
		echo "Failed to install GH. Please install it manually."
		exit 1
	fi
	echo "GH has been installed successfully"
else
	echo "GH CLI has already installed."
fi

