#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function display_disk_space_data
display_disk_space_data(){

  # Variables - pass parameters to variables with conditions
  DISK_SIZE=$(df --output=size -h /root)
  DISK_USED=$(df --output=used -h /root)

  # Print variables with context
  echo "Full disk$DISK_SIZE"
  echo "Disk space$DISK_USED"

  # Display user menu
  ./menu.sh

}

# Execute the function
display_disk_space_data
