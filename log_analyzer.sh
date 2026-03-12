#!/bin/bash

# Muallif: Pardanazarov Sardorbek
# Vazifa: Log fayllarni tahlil qilish va hisobot yaratish

LOG_FILE=$1
REPORT_FILE="summary_report_$(date +%Y-%m-%d).txt"
ARCHIVE_DIR="./processed_logs"

# 1. Kirish faylini tekshirish
if [[ -z "$LOG_FILE" ]]; then
    echo "Xato: Log fayl yo'lini ko'rsating. Masalan: $0 sample_log.log"
    exit 1
fi

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Xato: '$LOG_FILE' topilmadi!"
    exit 1
fi

echo "Tahlil boshlanmoqda: $LOG_FILE..."

# 2. Ma'lumotlarni yig'ish
TOTAL_LINES=$(wc -l < "$LOG_FILE")
ERROR_COUNT=$(grep -iE "ERROR|Failed" "$LOG_FILE" | wc -l)

# 3. Hisobotni shakllantirish (Summary Report)
{
    echo "==============================================="
    echo "DAILY LOG ANALYSIS REPORT"
    echo "==============================================="
    echo "Sana: $(date)"
    echo "Tahlil qilingan fayl: $LOG_FILE"
    echo "Jami qayta ishlangan qatorlar: $TOTAL_LINES"
    echo "Jami xatolar soni (ERROR/Failed): $ERROR_COUNT"
    echo "-----------------------------------------------"
    
    echo "TOP 5 ENG KO'P UCHRAGAN XATOLAR:"
    # Logdan ERROR qatorlarini olamiz, xabarni ajratamiz, sanaymiz va top 5 ni chiqaramiz
    grep -i "ERROR" "$LOG_FILE" | awk -F'ERROR' '{print $2}' | sed 's/^[: ]*//' | \
    sort | uniq -c | sort -nr | head -n 5
    
    echo "-----------------------------------------------"
    echo "CRITICAL HODISALAR (Qator raqami bilan):"
    grep -n "CRITICAL" "$LOG_FILE" || echo "Kritik hodisalar topilmadi."
    echo "==============================================="
} > "$REPORT_FILE"

# 4. Natijani ekranga chiqarish
cat "$REPORT_FILE"

# 5. Optional Enhancement: Arxivlash
if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir -p "$ARCHIVE_DIR"
fi

mv "$LOG_FILE" "$ARCHIVE_DIR/"
echo -e "\n✅ Hisobot yaratildi: $REPORT_FILE"
echo "📦 Log fayl arxivlandi: $ARCHIVE_DIR/"


Mentor Tushuntirishi (Texnik tahlil):
grep -iE "ERROR|Failed": Bu yerda -i harf kattaligiga qaramaslikni, -E esa "RegEx" (muntazam ifodalar) ishlatishni bildiradi. Ya'ni ham "ERROR"ni, ham "Failed"ni qidiradi.
awk -F'ERROR' '{print $2}': Bu juda aqlli usul. Log qatorini "ERROR" so'zi bo'yicha bo'lakka bo'ladi va bizga faqat xatoning matnini (ikkinchi qismini) beradi.
sort | uniq -c | sort -nr: Bu Linuxda "Top list" yaratishning oltin formulasi:
sort: Bir xil qatorlarni yonma-yon keltiradi.
uniq -c: Bir xil qatorlarni sanab chiqadi.
sort -nr: Sonlar bo'yicha teskari tartibda (kattadan kichikka) saralaydi.
Blokli yo'naltirish { ... } > "$REPORT_FILE": Har bir qator uchun alohida >> yozib o'tirmasdan, butun bir blok natijasini bitta faylga yuboradi.

Qanday ishga tushirish kerak?
Faylni yarating: nano log_analyzer.sh
Ruxsat bering: chmod +x log_analyzer.sh
Ishga tushiring: ./log_analyzer.sh sample_log.log