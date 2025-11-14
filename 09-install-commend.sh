#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Error :: please run the script with sudo or root user aceess"
exit 1
else 
    echo "Sucess :: you are running the script with sudo or root user access"
fi

dnf list installed  mysql
dnf install mysql-server -y

if [ $? -eq 0 ]
then
    echo "Mysql server installed successfully"
    else
    echo "Error :: Mysql server installation failed"
    exit 1
fi
