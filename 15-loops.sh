    #!/bin/bash
    USERID=$(id -u)
    R="\e[31m"
    G="\e[32m"
    Y="\e[33m"
    N="\e[0m"   

    LOG_FOLDER="/var/log/shellscript-logs"
    script_name=$(echo $0 | cut -d "." -f1)
    Log_File=$LOG_FOLDER/$script_name.log"
    PACKAGES=("mysql" "nginx" "python3" "nodejs" "httpd")
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

    for package in $@
    do
    # checking packages installed are not
        dnf list installed $package &>>Log_File
        if [ $? -ne o ]
        then 
            echo "$packAGE is not installed .. going to install $package" | tee -a $Log_File
            dnf install $package -y &>>$Log_File
            VALIDATE $? $package
        else
            echo -e "nothing to do .. $Y $package is already installed in the system $N" | tee -a $Log_File
        fi
    done
    