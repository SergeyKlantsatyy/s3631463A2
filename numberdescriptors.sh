#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function number_opened_descriptors_per_user
number_opened_descriptors_per_user () {

  # Assign variables - current user
  USER_NAME=$(whoami)

  # Information context
  printf "Number of opened descriptors for user $USER_NAME is:%s\n"

  # command to view number of processes per current user
  ls -la /proc/$$/fd | grep -cu $USER_NAME

  # Display user menu
  ./menu.sh

}

# Execute the function
number_opened_descriptors_per_user
