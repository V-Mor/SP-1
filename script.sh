echo "USERBLOCKER"
echo "Author: Vladimir Morozov"
echo "This program can help you block or unblock any user you specify"

user_response="y"
while [[ $user_response = "y" ]]
do
	echo "Specify username"
	read username
	id -u $username 2> /dev/null 1> /dev/null
	if [[ $? != 0 ]]
		then
		echo "Unknown user" >&2
		echo "Want to continue y/n?"
		read user_response
		if [[ $user_response = "n" ]]
			then
			exit 0
		else
			continue
		fi
	fi
	echo "Select action:"
	echo "1. Block user"
	echo "2. Unblock user"
	read action
	if [[ $action = 1 ]]
		then
		passwd -l $username 2> /dev/null 1> /dev/null
	else
		if [[ $action = 2 ]]
			then
			passwd -u $username 2> /dev/null 1> /dev/null
		else
			echo "Incorrect action number!" >$2
		fi
	fi
	echo "Want to continue y/n?"
	read user_response
	if [[ $user_response = "n" ]]
		then
		exit 0
	fi
done
