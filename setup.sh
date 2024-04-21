#!/bin/bash

# Function to check if Docker is already installed
is_docker_installed() {
	which docker &>/dev/null
	return $?
}

install_docker() {
	echo "Installing Docker"
	sudo apt update
	sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	echo \
		"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
		$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
		sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	echo "Create docker group"
	sudo groupadd docker
	echo "Adding user to the Docker group..."
	sudo usermod -aG docker $USER
	echo "You may need to log out and log back in to finalize permissions."
	sudo systemctl start docker
	sudo systemctl enable docker
	echo "Docker installed successfully."
}

# Main script logic
if is_docker_installed; then
	echo "Docker is already installed."
else
	install_docker
fi
