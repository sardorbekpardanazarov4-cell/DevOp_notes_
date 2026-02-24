#!/bin/bash

read -p "Username kiriting: " user


if [ -z "$user" ]; then
    echo "Hech narsa kiritmadingiz :("
    exit 1
fi

echo "Qidirilmoqda: $user ..."

grep -q "^$user:" /etc/passwd

if [ $? -eq 0 ]; then
    echo "User topildi ✓"
    echo "Ma'lumot: $(grep "^$user:" /etc/passwd)"
else
    echo "User topilmadi ✗"
fi