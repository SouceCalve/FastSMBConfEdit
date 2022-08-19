#!/bin/bash
standartpath=/etc/samba/smb.conf
#echo $1
if [ -z $1 ]
then
smbcfile=$standartpath
elif [ -f $1  ];
then
echo "Указан другой путь для конфига..."
smbcfile=$1
elif [ -d $1 ]
then
echo "Это папка, а не файл.Пробую найти smb.conf"
	s=$1/smb.conf
	if [ -s $s ]
		then 
		echo "Найдено."
		smbcfile=$s
	else 
	echo "Не найдено.Введите ещё раз."
	while [ true ]
		do
		echo "Введите путь до файла:"
		read sfw 	
		if [ -f $sfw ]
			then
			smbcfile=$sfw
			break
		else
		echo "Не найдено.Введите ещё раз"
		fi
	done
	fi
#elif [-z $1 ]
#then
#smbcfile=$standartpath
fi
echo $smbcfile
echo "Останавливаем samba..."
sudo service smbd stop
echo "Остановлено."
if [ -s $smbcfile ]
then
echo "Открываю конфиг..." 
sudo nano $smbcfile
else
echo "Файл конфига не найден.Отменяем действия..."
fi
echo "Запускаю samba..."
sudo service smbd start
echo "Готово."
