#!/bin/sh

if [ "$1" == "--help" ]; then
    # Display usage information
    echo "Usage: ./build_from_git.sh GIT_URL APPLICATION_NAME INSTALL_DIRECTORY (Optional TIME_TO_SLEEP)"
    echo "Automatically builds and installs an application from a git repository."
    echo "  GIT_URL:            URL of the git repository."
    echo "  APPLICATION_NAME:   Name of the application."
    echo "  INSTALL_DIRECTORY:  Location of desired install location"
    echo "  TIME_TO_SLEEP:      How long the script should wait before it starts buiilding the project"
    echo "  "
    echo "  TODO: Create logic to remove TIME_TO_SLEEP var"
    exit 0
fi

# Check if required arguments are provided
if [ "$#" -lt 3 ]; then
    echo "Error: Invalid number of arguments. Use --help for usage information."
    exit 1
fi

# Handle optional arugment 'TIME_TO_SLEEP'
if [ "$#" -eq 4 ]; then
    wait=$4
else
    wait=5
fi



cd $3           # Change directory to desired path
echo 'Cloning repository...'
git clone $1    # Clone the repository

sleep 5         # Wait a few moments for the download to complete
cd $2
echo 'Building...'
mkdir build     # Build
cd build

echo 'Compiling 1/2...'
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_KCM=on -DBUILD_PLASMOID=on # Compile
sleep $wait
echo 'Compiling 2/2...'
make -j             # Compile
sleep $wait

echo 'Installing...'
sudo make install   # Install
echo 'Complete!'
