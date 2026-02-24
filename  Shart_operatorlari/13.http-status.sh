#!/bin/bash


http_code=$(curl -s -o /dev/null -w "%{http_code}" https://lms.itechacacademy.uz)


if [ "$http_code" -eq 200 ]; then
    echo "OK"
elif [ "$http_code" -eq 404 ]; then
    echo "Not Found"
elif [ "$http_code" -eq 500 ]; then
    echo "Server Error"
else
    echo "Unknown status: $http_code"
fi