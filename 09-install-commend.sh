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

if [ $? -ne 0 ]
then
    echo "Mysql is not installed... going to  install"
    dnf install mysql -y
if [ $? -eq 0 ]
then
    echo "installing the mysql server is sucess"
    else
    echo "Error :: Mysql server installation failed"
    exit 1
fi
else 
    echo "my sql is alerady installed in the syatem.. nothing to do
fi