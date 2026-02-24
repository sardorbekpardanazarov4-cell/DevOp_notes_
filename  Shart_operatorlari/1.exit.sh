#!/bin/bash

status="Test qiymati"
echo "Natija: $status"
if [ -f /etc/passwd ]; then
    echo "Fayl mavjud!"
else
    echo "Fayl topilmadi :("
fi 