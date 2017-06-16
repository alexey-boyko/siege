#!/bin/bash


COOKIE_JAR="ab-cookie-jar"
COOKIE_NAME="sessionid"
USERNAME="test"
PASSWORD="test"
LOGIN_AS_USERNAME="test"
LOGIN_PAGE_URI="https://test.com/login"
TEST_PAGE_URI="https://test.com/stats"

echo "Logging in and storing session id."
curl -i -c $COOKIE_JAR -X POST -d "username=$USERNAME" -d "password=$PASSWORD" -d "loginAsUsername=$LOGIN_AS_USERNAME" $LOGIN_PAGE_URI
SESSION_ID=$(cat $COOKIE_JAR | grep $COOKIE_NAME | cut -f 7)

echo "Performing load test."
ab -n 100 -c 5  -C "$COOKIE_NAME=$SESSION_ID" $TEST_PAGE_URI
