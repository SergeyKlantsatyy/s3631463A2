#!/usr/bin/env bash

# Sergey Klantsatyy - s3631463

# User menu
starting_point () {

  # Starting Directory
  # Clear the screen
  clear
  printf "###################################################################"
  printf "%s\nCustomised FIND command v1.0%s\nSergey Klantsatyy s3631463%s\n"
  printf "###################################################################"
  # Prompt User to enter Directory
  printf "%s\nEnter directory, where the search should start?%s\n"
  printf "%s\nYour value is: "
  # Take input from User
  read STARTING_DIRECTORY

  clear
  # Move to Object and Value function
  flag
}

# Function to get from User search Object and its Value
flag () {
  # Prompt User to choose desired option
  printf "###################################################################"
  printf "%s\nEnter the flag you want to apply, followed by attribute.%s\n"
  printf "%s\n1 - File was accessed n days ago.%s\n"
  printf "%s\n2 - File was modified n days ago.%s\n"
  printf "%s\n3 - File is n blocks big.%s\n"
  printf "%s\n4 - Specifies file type.%s\n"
  printf "%s\n5 - Specifies file system type.%s\n"
  printf "%s\n6 - The file name is.%s\n"
  printf "%s\n7 - The file's owner is. %s\n"
  printf "%s\n8 - The file's group owner is. %s\n"
  printf "%s\n9 - The file's access mode is.%s\n"
  printf "%s\nYour value is: "
  # Get User's input
  read FLAG
  # Assign FIND command Object type according to User's choice
  if [ "$FLAG" == "1" ];
    then FLAG_OPTION="-atime"
  elif [ "$FLAG" == "2" ];
    then FLAG_OPTION="-mtime"
  elif [ "$FLAG" == "3" ];
    then FLAG_OPTION="-size"
  elif [ "$FLAG" == "4" ];
    then FLAG_OPTION="-type"
  elif [ "$FLAG" == "5" ];
    then FLAG_OPTION="-fstype"
  elif [ "$FLAG" == "6" ];
    then FLAG_OPTION="-name"
  elif [ "$FLAG" == "7" ];
    then FLAG_OPTION="-user"
  elif [ "$FLAG" == "8" ];
    then FLAG_OPTION="-group"
  elif [ "$FLAG" == "9" ];
    then FLAG_OPTION="-perm"
  else
    printf "%s\nPlease enter correct option from the list%s\n"
fi

  clear
  # Move to Attribute function
  attribute
}

# Search Object's Attribute function
attribute () {

  # According to User's choice, function assign relevant Attribute the chosen Object

  # The file was last accessed more than n days ago
  if [ "$FLAG_OPTION" == "-atime" ];
  then
    printf "###################################################################"
    printf "%s\nYou chose $FLAG_OPTION flag. Enter how many days.%s\n"
    # Prompt User to enter desired value for chosen Object
    printf "%s\nYour value is: "
    # Get the value
    read ATTRIBUTE
    # Check if the value is integer, if not, re-run the function
    if [ "$ATTRIBUTE" -eq $ATTRIBUTE 2> /dev/null ];
    then
      # Check if the value is positive, if not, re-run the function
      if ! [ "$ATTRIBUTE" -gt "0" ];
      then
        printf "%s\nPlease enter positive numbers only%s\n"
        attribute
      else
        clear
        # Move to Depth value function
        depth
      fi
    else
      printf "%s\nPlease enter integer numbers only%s\n"
      attribute
    fi

  # The file was last modified more than n days ago
  elif [ "$FLAG_OPTION" == "-mtime" ];
  then
    printf "###################################################################"
    printf "%s\nYou chose $FLAG_OPTION flag. Enter how many days.%s\n"
    # Prompt User to enter desired value for chosen Object
    printf "%s\nYour value is: "
    # Get the value
    read ATTRIBUTE
    # Check if the value is integer, if not, re-run the function
    if [ "$ATTRIBUTE" -eq $ATTRIBUTE 2> /dev/null ];
    then
      # Check if the value is positive, if not, re-run the function
      if ! [ "$ATTRIBUTE" -gt "0" ];
      then
        printf "%s\nPlease enter positive numbers only%s\n"
        attribute
      else
        clear
        # Move to Depth value function
        depth
      fi
    else
      printf "%s\nPlease enter integer numbers only%s\n"
      attribute
    fi

  # The file of certain size
  elif [ "$FLAG_OPTION" == "-size" ];
  then
    printf "###################################################################"
    printf "%s\nYou chose $FLAG_OPTION flag. Enter the block size.%s\n"
    # Prompt User to enter desired value for chosen Object
    printf "%s\nYour value is: "
    # Get the value
    read ATTRIBUTE
    # Check if the value is integer, if not, re-run the function
    if [ "$ATTRIBUTE" -eq $ATTRIBUTE 2> /dev/null ];
    then
      # Check if the value is positive, if not, re-run the function
      if ! [ "$ATTRIBUTE" -gt "0" ];
      then
        printf "%s\nPlease enter positive numbers only%s\n"
        attribute
      else
        clear
        # Move to Depth value function
        depth
      fi
    else
      printf "%s\nPlease enter integer numbers only%s\n"
      attribute
    fi

  # File of specific type Plain text or Directory
  elif [ "$FLAG_OPTION" == "-type" ];
  then
    printf "###################################################################"
    printf "%s\nYou chose $FLAG_OPTION flag. Specify file type.%s\n"
    printf "%s\n1 - Plain text.%s\n"
    printf "%s\n2 - Directory%s\n"
    # Prompt User to enter desired Option
    printf "%s\nYour value is: "
    # Get the value
    read OPTION
    # Assign Attribute value according to User's choice
    # Make sure User's input is correct
    if [ "$OPTION" == "1" ];
      then ATTRIBUTE="f"
      clear
      depth
    elif [ "$OPTION" == "2" ];
      then ATTRIBUTE="d"
      clear
      # Move to Depth value function
      depth
    else
      printf "%s\nPlease enter correct option from the list%s\n"
      attribute
    fi

  # File System of certain type
  elif [ "$FLAG_OPTION" == "-fstype" ];
  then
    printf "###################################################################"
    printf "%s\nYou chose $FLAG_OPTION flag. Specify file system type.%s\n"
    printf "%s\n1 - ext2"
    printf "%s\n2 - ext3"
    printf "%s\n3 - proc"
    printf "%s\n4 - sysfs"
    printf "%s\n5 - ufs"
    printf "%s\n6 - 4.2"
    printf "%s\n7 - 4.3"
    printf "%s\n8 - nfs"
    printf "%s\n9 - tmp"
    printf "%s\n10 - mfs"
    printf "%s\n11 - S51K"
    printf "%s\n12 - S52K%s\n"
    # Prompt User to enter desired Option
    printf "%s\nYour value is: "
    # Get the value
    read OPTION
    # Assign Attribute value according to User's choice
    # Make sure User's input is correct
    if [ "$OPTION" == "1" ];
      then ATTRIBUTE="ext2"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "2" ];
      then ATTRIBUTE="ext3"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "3" ];
      then ATTRIBUTE="proc"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "4" ];
      then ATTRIBUTE="sysfs"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "5" ];
      then ATTRIBUTE="ufs"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "6" ];
      then ATTRIBUTE="4.2"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "7" ];
      then ATTRIBUTE="4.3"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "8" ];
      then ATTRIBUTE="nfs"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "9" ];
      then ATTRIBUTE="tmp"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "10" ];
      then ATTRIBUTE="mfs"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "11" ];
      then ATTRIBUTE="S51K"
      clear
      # Move to Depth value function
      depth
    elif [ "$OPTION" == "12" ];
      then ATTRIBUTE="S52K"
      clear
      # Move to Depth value function
      depth
    else
      printf "%s\nPlease enter correct option from the list%s\n"
      attribute
    fi

  # Object with certain name
  elif [ "$FLAG_OPTION" == "-name" ];
  then
    printf "%s\nYou chose $FLAG_OPTION flag. Enter filename.%s\n"
    # Prompt User to enter desired value
    printf "%s\nYour value is: "
    # Get the value
    read ATTRIBUTE
    clear
    # Move to Depth value function
    depth

  # Object of certain Ownership
  elif [ "$FLAG_OPTION" == "-user" ];
  then
    printf "%s\nYou chose $FLAG_OPTION flag. Enter file's owner.%s\n"
    # Prompt User to enter desired value
    printf "%s\nYour value is: "
    # Get the value
    read ATTRIBUTE
    clear
    # Move to Depth value function
    depth

  # File's Group of certain Ownership
  elif [ "$FLAG_OPTION" == "-group" ];
  then
    printf "%s\nYou chose $FLAG_OPTION flag. Enter file's group owner.%s\n"
    # Prompt User to enter desired value
    printf "%s\nYour value is: "
    # Get the value
    read ATTRIBUTE
    clear
    # Move to Depth value function
    depth

  # Object of certain Permission mode
  elif [ "$FLAG_OPTION" == "-perm" ];
  then
    printf "###################################################################"
    printf "%s\nYou chose $FLAG_OPTION flag. Enter file's access mode.%s\n"
    # Prompt User to enter desired value
    printf "%s\nYour value is: "
    # Get the value
    read ATTRIBUTE
    # Check if the value is integer, if not, re-run the function
    if [ "$ATTRIBUTE" -eq $ATTRIBUTE 2> /dev/null ];
    then
      # Check if the value is positive, if not, re-run the function
      if ! [ "$ATTRIBUTE" -gt "0" ];
      then
        printf "%s\nPlease enter positive numbers only%s\n"
        attribute
      else
        clear
        # Move to Depth value function
        depth
      fi
    else
      printf "%s\nPlease enter integer numbers only%s\n"
      attribute
    fi

  fi
}

# Depth Option
depth () {
  printf "###################################################################"
  printf "%s\nEnter the Max depth for desired search.%s\n"
  # Prompt User to enter desired value
  printf "%s\nYour value is: "
  # Get the value
  read DEPTH
  # Check if the value is integer, if not, re-run the function
  if [ "$DEPTH" -eq $DEPTH 2> /dev/null ];
  then
    # Check if the value is positive, if not, re-run the function
    if ! [ "$DEPTH" -gt "0" ];
    then
      printf "%s\nPlease enter positive numbers only%s\n"
      depth
    else
      clear
      # Move to Symbolic Links value function
      symbolic_links
    fi
  else
    printf "%s\nPlease enter integer numbers only%s\n"
    depth
  fi
}

# Symbolic Links
symbolic_links () {
  printf "###################################################################"
  printf "%s\nEnter an option for symbolic links following.%s\n"
  printf "%s\nP - Never%s\n"
  printf "%s\nL - Always%s\n"
  printf "%s\nH - Do not, except while processing the command line arguments%s\n%s\n"
  # Prompt User to enter desired value
  printf "%s\nYour value is: "
  # Get the value
  read SYMBOLIC_LINKS
  # Assign Attribute value according to User's choice
  # Make sure User's input is correct
  if [ "$SYMBOLIC_LINKS" == "P" ];
    then SYMBOLIC_LINKS_OPTION="-P"
  elif [ "$SYMBOLIC_LINKS" == "p" ];
    then SYMBOLIC_LINKS_OPTION="-P"
  elif [ "$SYMBOLIC_LINKS" == "L" ];
    then SYMBOLIC_LINKS_OPTION="-L"
  elif [ "$SYMBOLIC_LINKS" == "l" ];
    then SYMBOLIC_LINKS_OPTION="-L"
  elif [ "$SYMBOLIC_LINKS" == "H" ];
    then SYMBOLIC_LINKS_OPTION="-H"
  elif [ "$SYMBOLIC_LINKS" == "h" ];
    then SYMBOLIC_LINKS_OPTION="-H"
  else
    printf "%s\nPlease enter correct option from the list%s\n"
    symbolic_links
  fi

  clear
  # Move to Action function
  action
}

# Action function
action () {
  printf "###################################################################"
  printf "%s\nEnter an action you would like to perform.%s\n"
  printf "%s\nD - Delete.%s\n"
  printf "%s\nP - Print.%s\n"
  printf "%s\nF - Print full.%s\n%s\n"
  # Prompt User to enter desired value
  printf "%s\nYour value is: "
  # Get the value
  read ACTION
  # Assign Attribute value according to User's choice
  # Make sure User's input is correct
  if [ "$ACTION" == "D" ];
    then ACTION_OPTION="-delete"
  elif [ "$ACTION" == "d" ];
    then ACTION_OPTION="-delete"
  elif [ "$ACTION" == "P" ];
    then ACTION_OPTION="-print"
  elif [ "$ACTION" == "p" ];
    then ACTION_OPTION="-print"
  elif [ "$ACTION" == "F" ];
    then ACTION_OPTION="-print0"
  elif [ "$ACTION" == "f" ];
    then ACTION_OPTION="-print0"
  else
    printf "%s\nPlease enter correct option from the list%s\n"
    action
  fi

  clear
  # Move to Find Command function
  find_command
}

# Find Command function
find_command () {
  printf "###################################################################"
  printf "%s\nYour search: %s\n%s\n"
  # FIND Command execution line
  find "$SYMBOLIC_LINKS_OPTION" "/$STARTING_DIRECTORY" -maxdepth $DEPTH "$FLAG_OPTION" "$ATTRIBUTE" "$ACTION_OPTION"
  # Title
  printf "%s\n%s\n###################################################################"
  printf "%s\nThank you for using Customised FIND command v1.0%s\n"
  printf "###################################################################%s\n"
  # End Script
  ./menu.sh
}

# Execute the function
starting_point
