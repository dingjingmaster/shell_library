#!/bin/bash

# $1: mail_from
# $2: mail_to 
# $3: subject 
# $4: msgBody

function fileAppend {
	echo "$2">>$1;
}
date=`date +%F`
from="$1"					# 发送自
toEmail="$2" 					# 发送到
subject="$3" 					# 标题
msgBody="$4"					# 要发送的信息体
msgDate="$5" 					# 日期
temp="/tmp/sendmail.tmp"

fileAppend "From: ${from}" > ${temp}
fileAppend "To: ${toEmail}" >> ${temp}
fileAppend "Subject: ${subject}" >> ${temp}
fileAppend "Content-Type: text/html; charset=utf-8; format=flowed" >> ${temp}
fileAppend "Content-Transfer-Encoding: 7bit" >> ${temp}
fileAppend "Content-Disposition: inline" >> ${temp}
fileAppend "" >> ${temp}
fileAppend "${msgBody}" >> ${temp}
fileAppend "" >> ${temp}
fileAppend "${msgDate}" >> ${temp}
fileAppend "" >> ${temp}

${temp} | sendmail -t;
rm -fr ${temp}



