#!/bin/bash
standartpath=/etc/samba/smb.conf
sorig=$1
if [ -f $sorig  ];
then
echo "Указан другой путь для конфига..."
smbcfile=$1
elif [ -d $sorig ]
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
else
smbcfile=$standartpath
fi
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
