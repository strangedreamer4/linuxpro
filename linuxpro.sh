#!/bin/bash

# Function to display a cool loading effect
loading_effect() {
    echo -n "Loading"
    for _ in {1..5}; do
        echo -n "."
        sleep 0.5
    done
    echo ""
}

# Display loading effect when the script is starting
loading_effect

# Function to display command execution details
show_execution() {
    echo -e "\n[Executing] $1..."
    sleep 1
}

# Function to explain and execute a command
execute_command() {
    command=$1
    explanation=$2
    timeout=$3

    # Display the explanation
    echo -e "\n[Explanation] $explanation"

    # Display the command about to be executed
    echo -e "\n[Command] $command"

    # Show execution details
    show_execution "Executing $command"

    # Check if the command requires sudo privileges
    if [[ $command == "sudo "* ]]; then
        read -sp "Enter your sudo password: " sudo_password
        echo ""

        # Execute the command with sudo
        echo "$sudo_password" | sudo -S bash -c "$command"
    else
        eval $command
    fi

    # Pause after execution
    sleep $timeout
}

while true; do
    # Display a menu of commands to learn 
    echo -e "\nWelcome to LINUX PRO - Your Linux Learning Companion!" 
    echo -e "\nBy StRaNgEdReAmEr!"
    echo "Choose a command or tool to learn:"
    echo "1. ls - List files and directories"
    echo "2. cd - Change directory"
    echo "3. pwd - Print the current working directory"
    echo "4. mkdir - Create a new directory"
    echo "5. touch - Create an empty file"
    echo "6. cp - Copy files or directories"
    echo "7. mv - Move (rename) files or directories"
    echo "8. rm - Remove (delete) files or directories"
    echo "9. cat - Display the contents of a file"
    echo "10. nano or vim - Text editors to create and edit files"
    echo "11. echo - Print text to the terminal"
    echo "12. chmod - Change file permissions"
    echo "13. chown - Change file ownership"
    echo "14. ps - Display a list of running processes"
    echo "15. kill - Terminate processes by sending signals"
    echo "16. ifconfig or ip - Display network interface information"
    echo "17. ping - Send ICMP echo requests to a host"
    echo "18. traceroute or tracert - Trace the route to a destination"
    echo "19. wget or curl - Download files from the internet"
    echo "20. apt or apt-get - Package management commands"
    echo "21. clear - Clear the terminal screen"
    echo "22. exit - Exit LINUX PRO"
    read choice

    case $choice in
        1)
            execute_command "ls" "List files and directories in the current location." 2
            ;;
        2)
            echo -e "\nEnter a directory path to change to:"
            read dir_path
            execute_command "cd $dir_path" "Change the current directory." 2
            ;;
        3)
            execute_command "pwd" "Print the current working directory." 2
            ;;
        4)
            echo -e "\nEnter a name for the new directory:"
            read new_dir
            execute_command "mkdir $new_dir" "Create a new directory." 2
            ;;
        5)
            echo -e "\nEnter a name for the new file:"
            read new_file
            execute_command "touch $new_file" "Create an empty file." 2
            ;;
        6)
            echo -e "\nEnter the source file/directory and destination:"
            read source destination
            execute_command "cp $source $destination" "Copy files or directories." 2
            ;;
        7)
            echo -e "\nEnter the old and new names:"
            read old_name new_name
            execute_command "mv $old_name $new_name" "Move (rename) files or directories." 2
            ;;
        8)
            echo -e "\nEnter the name of the file/directory to remove:"
            read to_remove
            execute_command "rm -r $to_remove" "Remove (delete) files or directories." 2
            ;;
        9)
            echo -e "\nEnter the name of the file to display:"
            read file_to_display
            execute_command "cat $file_to_display" "Display the contents of a file." 2
            ;;
        10)
            echo -e "\nEnter the name of the file to create/edit:"
            read file_to_edit
            execute_command "nano $file_to_edit" "Use nano to create/edit files." 2
            ;;
        11)
            echo -e "\nEnter text to print:"
            read text_to_print
            execute_command "echo $text_to_print" "Print text to the terminal." 2
            ;;
        12)
            echo -e "\nEnter the name of the file and permissions:"
            read file_to_change_permissions permissions
            execute_command "chmod $permissions $file_to_change_permissions" "Change file permissions." 2
            ;;
        13)
            echo -e "\nEnter the new owner and group for the file:"
            read new_owner new_group
            execute_command "chown $new_owner:$new_group $file_to_change_ownership" "Change file ownership." 2
            ;;
        14)
            execute_command "ps aux" "Display a list of running processes." 2
            ;;
        15)
            echo -e "\nEnter the PID of the process to terminate:"
            read process_to_terminate
            execute_command "kill $process_to_terminate" "Terminate processes by sending signals." 2
            ;;
        16)
            execute_command "ifconfig" "Display network interface information." 2
            ;;
        17)
            echo -e "\nEnter a host to ping:"
            read host_to_ping
            execute_command "ping $host_to_ping" "Send ICMP echo requests to a host." 2
            ;;
        18)
            echo -e "\nEnter a destination to trace the route to:"
            read destination_to_trace
            execute_command "traceroute $destination_to_trace" "Trace the route to a destination." 2
            ;;
        19)
            echo -e "\nEnter a URL to download:"
            read url_to_download
            execute_command "wget $url_to_download" "Download files from the internet." 2
            ;;
        20)
            echo -e "\nChoose a package management command:"
            echo "1. apt update"
            echo "2. apt install"
            echo "3. apt upgrade"
            read package_choice

            case $package_choice in
                1)
                    execute_command "sudo apt update" "Update package lists." 2
                    ;;
                2)
                    echo -e "\nEnter the name of the package to install:"
                    read package_to_install
                    execute_command "sudo apt install $package_to_install" "Install a package." 2
                    ;;
                3)
                    execute_command "sudo apt upgrade" "Upgrade installed packages." 2
                    ;;
                *)
                    echo "Invalid choice. Please select a valid package management command."
                    ;;
            esac
            ;;
        21)
            clear
            ;;
        22)
            echo -e "\nExiting LINUX PRO. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
    
    # Clear the terminal screen
    clear
done
