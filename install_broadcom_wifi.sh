#!/bin/bash

tput setaf 2; echo "Instalare driver retea broadcom..."

echo "Diskurile disponibile sunt:"

tput sgr0;

lsblk

tput setaf 1; echo "ALEGE PARTITIA PE CARE SE GASESC DRIVERELE: (ex: sdb1)"

tput sgr0;

read CHOICE

tput setaf 1; echo "ESTI SIGUR CA E BINE??? AI ALES \"$CHOICE\""

echo "yes(y)/no(n)"

tput sgr0;

read confirm

if ( [[ "$confirm" = 'y' ]] || [[ "$confirm" = 'Y' ]] ); then 

	tput setaf 2; echo "Incep instalarea de pe $CHOICE"; tput sgr0;

	MOUNTPOINT=$(mount | grep dev/$CHOICE | cut -d' ' -f 3);

	mkdir ~/broadcom;

	cp $MOUNTPOINT/pool/main/d/dkms/dkms_*.deb ~/broadcom/;
	cp $MOUNTPOINT/pool/restricted/b/bcmwl/bcmwl-kernel-source_*.deb ~/broadcom/;

	sudo dpkg -i ~/broadcom/*.deb;

	tput setaf 2; echo "Fac curatenie..."; tput sgr0;

	rm -rf ~/broadcom;

	tput setaf 2; echo "Am terminat"; tput sgr0;

elif ( [[ "$confirm" = 'n' ]] || [[ "$confirm" = 'N' ]] ); then

	tput setaf 2;echo "Iesire fara modificari..."; tput sgr0;

else

	tput setaf 2;echo "Iesire fara modificari..."; tput sgr0;

fi

