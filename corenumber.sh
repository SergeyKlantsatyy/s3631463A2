#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function display_number_cpu
display_number_cpu () {

  # Information context
  printf "Current number of CPU cores on the system:%s\n"

  # command to view the total CPU available
  grep -c ^processor /proc/cpuinfo

  # Display user menu
  ./menu.sh

}

# Execute the function
display_number_cpu
