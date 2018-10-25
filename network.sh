#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function display_network_connections
display_network_connections () {

  # Information description
  printf "Available network connections:%s\n"

  # command to list all network connections
  ifconfig

  # Display user menu
  ./menu.sh

}

# Execute the function
display_network_connections
