#!/bin/bash

echo "Fayl tizimi tadqiqotchisi va belgilar sanagichiga xush kelibsiz!"
echo "Dasturni to'xtatish uchun shunchaki 'Enter' tugmasini bosing (bo'sh qator qoldiring)."
echo "--------------------------------------------------"

while true; do
    
    
    echo -e "\n[ Joriy katalogdagi fayllar va ularning hajmi ]"

    ls -lh | awk 'NR>1 {print "- Nomi: " $9 "\t| Hajmi: " $5}'
    
    echo "--------------------------------------------------"

    read -p "Biror matn kiriting (yoki chiqish uchun 'Enter'ni bosing): " input

    if [[ -z "$input" ]]; then
        echo "Bo'sh qator kiritildi. Dastur to'xtatilmoqda. Xayr!"
        break 
    fi
    char_count=$(echo -n "$input" | wc -m)
    
    echo "Natija: Kiritilgan matndagi belgilar soni -> $char_count ta."
    
done