#!/bin/bash

TOKEN="8447708268:AAE3fnbAdAlIlficHVANA7pCdUrzGVUkNYc"
CHAT_ID="8383448395"

send_message() {
 TEXT=$1

 curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
   -d chat_id="$CHAT_ID" \
   -d text="$TEXT"
}

send_message "Server ishga tushdi"
