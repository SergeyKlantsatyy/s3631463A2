#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# User menu
user_menu () {

  # Display user options
  printf "%s\nSystem Monitor v1.0%s\nSergey Klantsatyy s3631463
  %s\nChose and enter desired comand number:%s\n"
  printf "1 - View the amount of free and occupied memory%s\n"
  printf "2 - View the amount of disk space occupied and free%s\n"
  printf "3 - View the connection information of all network connections%s\n"
  printf "4 - View the amount of time the system has been running%s\n"
  printf "5 - View the number of CPU cores%s\n"
  printf "6 - View the current processes' priority%s\n"
  printf "7 - View the total number of processes for current user%s\n"
  printf "8 - View the number of open file descriptors for current user%s\n"
  printf "9 - View the max default number of file descriptors for current user%s\n"
  printf "10 - Help%s\n"
  printf "11 - Exit%s\n%s\n"

  read option

  printf "%s\n%s\n"

  if [ "$option" == "1" ];
  then
    ./memory.sh
  elif [ "$option" == "2" ];
  then
    ./diskspace.sh
  elif [ "$option" == "3" ];
  then
    ./network.sh
  elif [ "$option" == "4" ];
  then
    ./runtime.sh
  elif [ "$option" == "5" ];
  then
    ./corenumber.sh
  elif [ "$option" == "6" ];
  then
    ./processes.sh
  elif [ "$option" == "7" ];
  then
    ./processcounter.sh
  elif [ "$option" == "8" ];
  then
    ./numberdescriptors.sh
  elif [ "$option" == "9" ];
  then
    ./maxnumberdescriptors.sh
  elif [ "$option" == "10" ];
  then
    ./help.sh
  elif [ "$option" == "11" ];
  then
    printf "%s\nThank you for using System Monitor v1.0%s\n"
    exit
  else
    printf "%s\nPlease enter a valid option%s\n"
    ./menu.sh
  fi

}

# Execute the function
user_menu
