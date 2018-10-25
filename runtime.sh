#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function display_system_runtime
display_system_runtime () {

  # Information context
  printf "System runtime information:%s\n"

  # command to view the total system runtime
  uptime

  # Display user menu
  ./menu.sh

}

# Execute the function
display_system_runtime
