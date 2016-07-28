playbook_name="$1"
playbook_file="${playbook_name}.yml"

#check args
if [ $# -ne 1 ]
then
	echo "Usage: run_playbook.sh profile_name"
	exit 1
fi

ansible-playbook -i "localhost," -c local $playbook_file 
