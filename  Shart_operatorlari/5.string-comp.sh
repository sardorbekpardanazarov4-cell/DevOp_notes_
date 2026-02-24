#!/bin/bash

read -p "Enter username: " user

if [ "$user" = "admin" ]; then
    echo "Welcome admin!"
else
    echo "Access denied"
fi