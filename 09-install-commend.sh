#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Error :: please run the script with sudo or root user aceess"
exit 1
else 
echo "Sucess :: you are running the script with sudo or root user access"

dnf install mysql-server -y
fi
