#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# Function profiler
profiler () {

  clear
  printf "###################################################################"
  printf "%s\nProfiler v1.0%s\nSergey Klantsatyy s3631463%s\n"
  printf "###################################################################"
  # Prompt User to enter Filename
  printf "%s\nEnter desired program name.%s\n"
  printf "If you are prompted to enter the name again,%s\n"
  printf "previously entered name was not valid.%s\n"
  printf "%s\nYour value is: "
  # Get value
  read PROGRAM_NAME
  # Add search values to array using entered filename
  array_name=(`ps axco command,pid | grep $PROGRAM_NAME`)
  if [ ${#array_name[@]} -eq 0 ];
  then
    profiler
  else
    # Move to get_value function
    get_value
  fi
}

# Function get_value
get_value () {
  # Prompt User to enter desired filename
  printf "%s\nHere is your choice. Enter associated number.%s\n%s\n"
  # Print list of found programs in customised manner
  for (( i=j=0; i<${#array_name[@]}; i=i+2, j++))
  do
    printf "$j - ${array_name[$i]} "
    printf "${array_name[$i+1]}%s\n"
  done

  printf "%s\nYour value is: "
  # Get value
  read OPTION

  # Make sure the correct option is chosen
  if [ $OPTION -gt ${#array_name[@]} ];
  then
    clear
    printf "%s\nEnter number from the list%s\n"
    # Move to get_value function - re-run
    get_value
  else
    # Move to option_valid function
    option_valid
  fi
}

# Function option_valid
option_valid () {
  # Check if the value is integer
  if [ "$OPTION" -eq $OPTION 2> /dev/null ];
  then
    # Check if the value is positive or 0, if not, re-run the function
    if ! [ "$OPTION" -gt "-1" ];
    then
      clear
      printf "%s\nPlease enter positive numbers or 0 only%s\n"
      # Move to get_value function
      get_value
    else
      clear
      # Move to monitor function
      monitor
    fi
  else
    clear
    printf "%s\nPlease enter integer numbers only%s\n"
    # Move to get_value function to re-run
    get_value
  fi
}

# Function monitor
monitor () {
  # Assign program's name and PID to variables
  PROGRAM_NAME_FINAL="${array_name[$OPTION*2]}"
  PROGRAM_PID_FINAL="${array_name[($OPTION*2)+1]}"

  printf "###################################################################"
  # Prompt User to enter desired monitoring option
  printf "%s\nWhat would you like to monitor?%s\n"
  printf "%s\n1 - Memory%s\n"
  printf "%s\n2 - CPU utilization%s\n"
  printf "%s\nYour value is: "
  # Get value
  read MONITOR_OPTION

  # Display memory usage
  if [ "$MONITOR_OPTION" == "1" ];
  then
    clear
    # Add search values to array
    monitor_memory=(`top -bn1 -p $PROGRAM_PID_FINAL`)
    printf "Memory usage of $PROGRAM_NAME_FINAL with PID:$PROGRAM_PID_FINAL is ${monitor_memory[79]} percent%s\n%s\n"
    ./menu.sh
  # Display CPU usage
  elif [ "$MONITOR_OPTION" == "2" ];
  then
    clear
    # Add search values to array
    monitor_cpu=(`top -bn1 -p $PROGRAM_PID_FINAL`)
    printf "Memory usage of $PROGRAM_NAME_FINAL with PID:$PROGRAM_PID_FINAL is ${monitor_cpu[78]} percent%s\n%s\n"
    ./menu.sh
  else
    # Check if correct option is chosen
    clear
    printf "%s\nEnter associated number from the list%s\n"
    # Move to monitor function to re-run
    monitor
  fi
}

# Execute the function
profiler
