#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function max_number_descriptors_per_process
max_number_descriptors_per_process () {

  # Assign variables - current user
  USER_NAME=$(whoami)

  # Information context
  printf "Max number of descriptors for process is:%s\n"

  # command to view number of processes per current user
  ulimit -Hn

  # Display user menu
  ./menu.sh

}

# Execute the function
max_number_descriptors_per_process
