# Dibs-Check
A shell script to email you when a Evanced D!BS Room Reservation is made.

The library I work for started using Evanced's D!BS, but we were troubled that there was no notification when a reservation was made. This script uses the D!BS API, documented here http://kb.evanced.info/article.php?id=480 , to fetch the a specific room's reservations for the current day and then email them when a new on is added.

I largely used the code from Liz Quilty at http://lizquilty.com/2015/02/24/shell-script-to-email-when-web-page-has-updateschanged/

Chose to use ssmtp with Gmail to send the email. Followed http://www.howtogeek.com/51819/how-to-setup-email-alerts-on-linux-using-gmail/ to set it up.

Before initial run you'll need to make the check_dibs.tmp.1 file.

<code>$ touch check_dibs.tmp.1</code>
