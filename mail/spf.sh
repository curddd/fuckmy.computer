dnf install pypolicyd-spf
adduser policyd-spf --user-group --no-create-home -s /bin/false

echo "add following TXT record to your DNS:"

echo "TXT  @   v=spf1 mx ~all"

echo "enter it and hit enter to test"
read

dig schizo.life txt
