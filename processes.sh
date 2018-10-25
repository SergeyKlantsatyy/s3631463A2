#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function current_running_processes
current_running_processes () {

  # Information context
  printf "System current processes%s\n"
  printf "To finish "

  # command to view currently running processes
  top -n 1

  # Display user menu
  ./menu.sh

}

# Execute the function
current_running_processes
