#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function display_memory_data
display_memory_data () {

  # Variables - pass parameters to variables with conditions
  MEMORY_DATA=$(free -h -t | grep ^Mem)

  # Print variables with context
  printf "%s\t       used%s\t   free %s\n"
  printf "$MEMORY_DATA %s\n"

  # Display user menu
  ./menu.sh

}

# Execute the function
display_memory_data
