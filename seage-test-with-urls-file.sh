#!/bin/bash

echo "hello to seage becnhmark tool"
echo "enter credentials or hardcore it in file and comment readsection"

#read section#######
read  -p "login: " USERNAME      
read -s -p "Password: " PASSWORD
#


COOKIE_JAR="ab-cookie-jar"
COOKIE_NAME="sessionid"
#USERNAME=""
#PASSWORD=""
LOGIN_AS_USERNAME="test"
LOGIN_PAGE_URI="https://test.com/login"

echo "Logging in and storing session id."
curl -i -c $COOKIE_JAR -X POST -d "username=$USERNAME" -d "password=$PASSWORD" -d "loginAsUsername=$LOGIN_AS_USERNAME" $LOGIN_PAGE_URI
SESSION_ID=$(cat $COOKIE_JAR | grep $COOKIE_NAME | cut -f 7)

echo "Performing load test."
docker run --rm -v `pwd`/urls.txt:/urls.txt -t lopezs/siege --file=urls.txt -H  "Cookie: $COOKIE_NAME=$SESSION_ID" -c5 -r2  --content-type="applicatio
n/json"

