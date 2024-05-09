#!/bin/bash

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error occurred while executing: $1"
    fi
}

# Install picamera[array]
pip install picamera[array]
check_command "pip install picamera[array]"

# Update package lists
sudo apt-get update
check_command "sudo apt-get update"

# Upgrade installed packages
sudo apt-get upgrade
check_command "sudo apt-get upgrade"

# Install required packages
sudo apt install cmake build-essential pkg-config git
check_command "sudo apt install cmake build-essential pkg-config git"

sudo apt install libjpeg-dev libtiff-dev libjasper-dev libpng-dev libwebp-dev libopenexr-dev
check_command "sudo apt install libjpeg-dev libtiff-dev libjasper-dev libpng-dev libwebp-dev libopenexr-dev"

sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libdc1394-22-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
check_command "sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libdc1394-22-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev"

sudo apt install libgtk-3-dev libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5
check_command "sudo apt install libgtk-3-dev libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5"

sudo apt install libatlas-base-dev liblapacke-dev gfortran
check_command "sudo apt install libatlas-base-dev liblapacke-dev gfortran"

sudo apt install libhdf5-dev libhdf5-103
check_command "sudo apt install libhdf5-dev libhdf5-103"

sudo apt install python3-dev python3-pip python3-numpy
check_command "sudo apt install python3-dev python3-pip python3-numpy"
