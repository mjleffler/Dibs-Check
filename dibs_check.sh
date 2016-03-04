#!/bin/bash

# Get date for URL
DATE=$(date +%Y-%m-%d)

# URL to check - edit to your library's Evanced address and correct room number at end
URL=http://yourlibrary.evanced.info/dibsapi/reservations/$DATE/7

# Temp files
INPUT=~/dibs_input.tmp
TEMP=~/check_dibs.tmp

# Email address to be notified
EMAIL=send@to.me

# Get the page, remove opening line and diff feedback on that
wget -q -O $INPUT "$URL"

# Replace commas with new lines | remove brackets, braces, and double quotes | add new line to end
tr ',' '\n' < $INPUT | tr -d '"[]{}' | sed -i -e '$a\' $TEMP

#Check for diffrences between new and old pages
MODIFIED=$(diff ${TEMP} ${TEMP}.1)

# Check if the modified variable exists and is more than 0 characters
if [[ ! -z "$MODIFIED" && ${#MODIFIED} -gt 0 ]]; then
    # Email new registrations
    echo "$MODIFIED" | ssmtp ${EMAIL}
    # Copy current API pull to second file to compare next time
    cp ${TEMP} ${TEMP}.1
fi
