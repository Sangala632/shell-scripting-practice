#!/bin/bash

USERID=$(id-user)

if [ $USERID -ne 0 ]
then
    echo "Error :: please run the script with sudo or root user aceess"
    exit 1
else 
    echo "Sucess :: you are running the script with sudo or root user access"
fi

# declaring the functions for installing the multiple packegs 

VALIDATE () {
    if [ $? -eq 0 ]
    then 
        echo "sucess :: $2 installation is  sucess"
    else
        echo "Error :: $2 installation is failed"
        exit 1
    fi
}

#listing the mysql is installed or not
dnf listed installed  mysql
# checking alerady mysql is installed or not.if installed $? is 0, then
# if not installed $? is not o .expression is true
if [ $? -eq 0 ]
then 
    echo "mysql is not yet installed ....going to installing mysql"
    dnf install mysql -y # installing mysql package
    VALIDATE $? mysql # validating the mysql installation
else 
    echo "mysql is alerady installed in the system... nothing to do"
fi

# listing the nginx is installed or not
dnf list installed nginx
# checking alerady nginx is installed or not.if installed $? is 0, then
# if not installed $? is not o .expression is true
if [$? -eq 0 ]
then 
    echo "nginx is not installed..going to installing nginx"
    dnf install nginx -y # installing nginx package
    VALIDATE $? nginx # validating the nginx installation
else
    echo "nginx is alerady installed in the syatem....nothing to do"
fi

# listing the nodejs is installed or not
dnf list installed  nodejs 
# checking alerady nodejs is installed or not.if installed $? is 0, then
# if not installed $? is not o .expression is true
if [$? -eq 0 ]
then 
    echo "nodejs is not installed...going to installing nodejs"
    dnf install nodejs -y # installing nodejs package
    VALIDATE $? nodejs # validating the nodejs installation
else 
    echo "nodejs is alerady installed in the system... nothing to do"
fi