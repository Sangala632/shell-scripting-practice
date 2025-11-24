#1/bin/bash
# This script demonstrates logging in shell scripting
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shellscript-logs"
script_name=$(echo $0 | cut -d "." -f1)
Log_File=$LOG_FOLDER/$script_name.log"

# Create log directory 
mkdir -p $LOG_FOLDER
   echo "script started executed at :: $(date)" | tee -a $Log_File
if [ $USERID -ne 0 ]
then
    echo -e "$R error :: please run the script with root access $N" | tee -a $Log_File
    exit -1
    else
    echo -e "$G success :: you are running the script with root access $N" | tee -a $Log_File
fi

# valadat function takes input as the exit status and what commend i used to run
VALIDATE () {
    if [ if $1 -eq 0 ]
    then
        echo -e " installing $2 :: $G success $N" | tee -a $Log_File    
    else
         echo -e " installing $2 :: $R Failure $N" | tee -a $Log_File
         exit -1
    fi    
}   

    # checking the mysql is installed or not

    dnf list installed mysql &>>$Log_File
    if [ $? -ne 0 ]
    then 
        echo "mysql is not installed .... going to install mysql" | tee -a $Log_File
    dinf install mysql -y &>>$Log_File
     VALIDATE $? mysql
    else
         echo -e "Nothing to do ..$Y mysql is already installed in the system $N" | tee -a $Log_File
    fi

    # checking the nginx is installed or not
    dnf list installed nginx &>>$Log_File
    if [ $? -ne 0 ]
    then 
        echo "nginx is not installed .... going to install nginx" | tee -a $Log_File
    dinf install nginx -y &>>$Log_File
    VALIDATE $? nginx
    else
         echo -e "Nothing to do ..$Y nginx is already installed in the system $N" | tee -a $Log_File
    fi

    # checking the python3 is installed or not
    dnf list installed python3 &>>$Log_File
    if [ $? -ne 0 ]
    then 
        echo "python3 is not installed .... going to install python" | tee -a $Log_File
        dinf install python3 -y &>>$Log_File
        VALIDATE $? python
    else
            echo -e "Nothing to do ..$Y python is already installed in the system $N" | tee -a $Log_File
    fi
