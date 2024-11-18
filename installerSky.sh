#!/bin/sh
#########################################################
# version= 1.0
# description= AL_AYAM_FHD V1.0\n Presenting the new skin by TeamNitro\n Ready to Download... Lets Fun !!!
#########################################################

initializeANSI()
{
  esc=""

  redf="${esc}[31m";     greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   
  cyanf="${esc}[36m";    purplef="${esc}[35m"   
  
  redfbright="${esc}[91m";     greenfbright="${esc}[92m"
  yellowfbright="${esc}[93m"   bluefbright="${esc}[94m";   
  cyanfbright="${esc}[96m";    purplefbright="${esc}[95m"   
                      
  boldon="${esc}[1m";    
  reset="${esc}[0m"
}

initializeANSI

cat << EOF 

${boldon}${redfbright}■■■■■■■■ ${boldon}${greenfbright}  ■■■■■■■■ ${boldon}${yellowfbright}        ■  ${boldon}${bluefbright}      ■■■        ■■■ ${boldon}${redfbright}  ■■■■      ■■ ${boldon}${greenfbright}  ■■■■ ${boldon}${yellowfbright}  ■■■■■■■■ ${boldon}${bluefbright}  ■■■■■■ ${boldon}${purplefbright}      ■■■■ ${reset}
${boldon}${redfbright}■  ■■  ■ ${boldon}${greenfbright}   ■■      ${boldon}${yellowfbright}       ■■■ ${boldon}${bluefbright}         ■■    ■■    ${boldon}${redfbright}     ■■     ■■ ${boldon}${greenfbright}   ■■  ${boldon}${yellowfbright}  ■  ■■  ■ ${boldon}${bluefbright}   ■■   ■■ ${boldon}${purplefbright}  ■■    ■■ ${reset}
${boldon}${redfbright}   ■■    ${boldon}${greenfbright}   ■■      ${boldon}${yellowfbright}      ■■■■■${boldon}${bluefbright}       ■■  ■■■■  ■■  ${boldon}${redfbright}   ■■ ■■    ■■ ${boldon}${greenfbright}   ■■  ${boldon}${yellowfbright}     ■■    ${boldon}${bluefbright}   ■■    ■■ ${boldon}${purplefbright} ■■    ■■ ${reset}
${boldon}${redfbright}   ■■    ${greenf}   ■■■■■■ ${yellowf}      ■(   )■   ${bluef}   ■■   ■■   ■■ ${redf}    ■■  ■■   ■■ ${greenf}   ■■ ${yellowf}      ■■ ${bluef}      ■■   ■■ ${purplef}  ■■    ■■ ${reset}
${boldon}${redfbright}   ■■    ${greenf}   ■■     ${yellowf}     ■■■■ ■■■■  ${bluef}   ■■        ■■ ${redf}    ■■   ■■  ■■ ${greenf}   ■■ ${yellowf}      ■■ ${bluef}      ■■ ■■   ${purplef}  ■■    ■■ ${reset}
${boldon}${redfbright}   ■■    ${greenf}   ■■     ${yellowf}    ■■       ■■ ${bluef}   ■■        ■■ ${redf}    ■■    ■■    ${greenf}   ■■ ${yellowf}      ■■ ${bluef}      ■■   ■■ ${purplef}  ■■    ■■ ${reset}
${boldon}${redfbright}  ■■■■   ${greenf}  ■■■■■■■■${yellowf}   ■■         ■■${bluef}   ■■        ■■ ${redf}    ■■     ■■■■ ${greenf}  ■■■■${yellowf}     ■■■■${bluef}     ■■■■   ■■${purplef}    ■■■■ ${reset}

${boldon}${yellowfbright}				    TeamNitro ControlCenter ${reset}

EOF

#########################################################
MY_FILE="skyScript.tar.gz"
MY_TMP_FILE="/var/volatile/tmp/$MY_FILE"
#########################################################

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo ''


wget -O /var/volatile/tmp/skyScript.tar.gz --no-check-certificate "https://github.com/biko-73/TeamNitro/raw/main/script/skyScript.tar.gz"

if [ -f $MY_TMP_FILE ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	tar -xzvf $MY_TMP_FILE -C /

	rm -f $MY_TMP_FILE > /dev/null 2>&1

	echo ''

	python /usr/lib/enigma2/python/Plugins/Extensions/TeamNitro/slyk/scraper.py

	echo 1 > /proc/sys/vm/drop_caches
	echo 2 > /proc/sys/vm/drop_caches
	echo 3 > /proc/sys/vm/drop_caches

	if test -f /usr/lib/enigma2/python/Plugins/Extensions/TeamNitro/slyk/image_awk_scrape.json; then
		python /usr/lib/enigma2/python/Plugins/Extensions/TeamNitro/slyk/TeamNitro.py
	fi
	MY_RESULT=$?

	if [ $MY_RESULT -eq 0 ]; then
        echo "########################################################################"
        echo "#              skyTeamNitro Script-1 Exectute Successfully             #"
		echo "#                      BY TeamNitro - support on                       #"
        echo "#              https://www.tunisia-sat.com/forums/forums               #"
        echo "########################################################################"
		if which systemctl > /dev/null 2>&1; then
			sleep 2; systemctl restart enigma2
		else
			init 4
			sleep 4 > /dev/null 2>&1
			init 3
		fi
	else
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi;
	 echo '**************************************************'
	 echo '**                   FINISHED                   **'
	 echo '**************************************************'
	 echo ''
	 exit 0

else
	 echo ''
	 echo "Download failed !"
	 exit 1
fi
# ----------------------------------------------------------------------------------------------------------

