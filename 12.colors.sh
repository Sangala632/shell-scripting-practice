#!/bin/bash
# This script demonstrates the use of colors in shell scripting
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R error :: please run the script with root access $N"
    exit -1
    else
    echo -e "$G success :: you are running the script with root access $N"
fi
    # valadat function takes input as the exit status and what commend i used to run
    VALIDATE () {
        if [ if $1 -eq 0 ]
        then
            echo -e " installing $2 :: $G success $N"
        else
            echo -e " installing $2 :: $R Failure $N"
            exit -1
        fi    
    }   

    # checking the mysql is installed or not
        dnf list installed mysql
        if [ $? -ne 0 ]
        then 
            echo "mysql is not installed .... going to install mysql"
            dinf install mysql -y
            VALIDATE $? mysql
        else
            echo -e "Nothing to do ..$Y mysql is already installed in the system $N"
        fi
    # checking the nginx is installed or not
        dnf list installed nginx
        if [ $? -ne 0 ]
        then 
            echo "nginx is not installed .... going to install nginx"
            dinf install nginx -y
            VALIDATE $? nginx
        else
            echo -e "Nothing to do ..$Y nginx is already installed in the system $N"
        fi
        # checking the python3 is installed or not
        dnf list installed python3
        if [ $? -ne 0 ]
        then 
            echo "python3 is not installed .... going to install python"
            dinf install python3 -y
            VALIDATE $? python
        else
            echo -e "Nothing to do ..$Y python is already installed in the system $N"
        fi