#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function number_processes_per_user
number_processes_per_user () {

  # Assign variables - current user
  USER_NAME=$(whoami)

  # Information context
  printf "Number of processes for user $USER_NAME is:%s\n"

  # command to view number of processes per current user
  pgrep -cu $USER_NAME

  # Display user menu
  ./menu.sh

}

# Execute the function
number_processes_per_user
