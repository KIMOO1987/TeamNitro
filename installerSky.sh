#!/bin/sh
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

