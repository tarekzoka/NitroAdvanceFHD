#!/bin/bash
######################################################################################
## Command=wget https://raw.githubusercontent.com/tarekzoka/NitroAdvanceFHD/main/installer.sh -O - | /bin/sh
###########################################
###########################################
#!/bin/sh
echo
opkg install --force-overwrite  https://github.com/tarekzoka/NitroAdvanceFHD/blob/main/enigma2-plugin_skin.NitroAdvanceFHD-V5.2_all.ipk?raw=true
wait
opkg install --force-overwrite  https://github.com/tarekzoka/NitroAdvanceFHD/blob/main/enigma2-skin-metrixconfluence-adrenalinnrw_1_0_all.ipk?raw=true
wait
exit#########################################################
#########################################################
MY_MAIN_URL="https://raw.githubusercontent.com/tarekzoka/"
MY_URL=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_FILE
MY_TMP_FILE="/tmp/"$MY_FILE

rm -f $MY_TMP_FILE > /dev/null 2>&1

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo ''
wget -T 2 $MY_URL -P "/tmp/"

if [ -f $MY_TMP_FILE ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	tar -xf $MY_TMP_FILE -C /
	MY_RESULT=$?

	rm -f $MY_TMP_FILE > /dev/null 2>&1

	echo ''
	echo ''
	if [ $MY_RESULT -eq 0 ]; then
        echo "#########################################################"
        echo "#  NitroAdvanceFHD Skin $version INSTALLED SUCCESSFULLY      #"
        echo "#                BY TAREK_TT - support on                   #"
        echo "#   .................................................      #"
        echo "#########################################################"
        echo "#           your Device will RESTART Now                #"
        echo "#########################################################"		
		if which systemctl > /dev/null 2>&1; then
			sleep 2; systemctl restart enigma2
		else
			init 4; sleep 4; init 3;
		fi
	else
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi;
	echo ''
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
# ------------------------------------------------------------------------------------------------------------
