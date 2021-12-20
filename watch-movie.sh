#!/bin/bash
#Created on 2021-12-13
#By Papagalul

MOVIESFOLDER="/home/user/Videos/Movies"
TVSHOWSFOLDER="/home/user/Videos/TvShows"
TUTORIALSFOLDER="/home/user/Videos/Tutorials"



echo 
echo "m. Movies "
echo "s. Tvshows"
echo "t. Tutorials "
echo "e. Exit "
echo
read -p "what do you want to see? " CHOISE1
case "$CHOISE1" in
	m)
clear
echo
echo "You chosed movies."
echo "Enjoy"
echo


array=( $( ls "$MOVIESFOLDER" ) )
select folder in ${array[@]} ; do
cd $MOVIESFOLDER
vlc --recursive none $folder ;
clear
read -p "Do you want to delete it? (Y/n)   " ANSWER1
while [[ -z $ANSWER1 ]]
do
ANSWER1=y
done
if [ $ANSWER1 = y ]
then
rm -r $folder
else
echo "OK, I will keep it."
fi
done
	;;

	s)
clear
echo
echo "Have a good time!"
echo

array=( $( ls $TVSHOWSFOLDER ) )
select SHOW in ${array[@]} ; do
cd $TVSHOWSFOLDER/$SHOW



for i in 1 2 3
do
episod=( $( ls | grep -e ".avi" -e ".mkv" -e ".mp4" | head -1 ) )
echo "Episod -  $episod"
vlc $episod ;

clear
read -p "Do you want to delete it? (Y/n)   " ANSWER5
while [[ -z $ANSWER5 ]]
do
ANSWER5=y
done
if [ $ANSWER5 = y ]
then
rm $episod
else
read -p "Do you want to EXIT ? (Y/n)   " ANSWER4
while [[ -z $ANSWER4 ]]
do
ANSWER4=y
done
if [ $ANSWER4 = y ]
then
exit 0
else
echo "OK, choose another. Press ENTER"
break
fi


break
fi

read -p "Want one more? (Y/n)   " ANSWER6
while [[ -z $ANSWER6 ]]
do
ANSWER6=y
done
if [ $ANSWER6 = y ]
then
echo "Enjoy your movie "
else

read -p "Do you want to exit ? (Y/n)   " ANSWER4
while [[ -z $ANSWER4 ]]
do
ANSWER4=y
done
if [ $ANSWER4 = y ]
then
exit 0
else
echo "OK, choose another one. Hit enter "
break
fi

break
fi



done


done

	;;

	t)



clear
array=( $( ls $TUTORIALSFOLDER ) )
select TUTORIALSNAME in ${array[@]} ; do
cd $TUTORIALSFOLDER/$TUTORIALSNAME
break
done
clear
SUBCHAPTERSNAMES=( $( ls $TUTORIALSFOLDER/$TUTORIALSNAME ) )
select SUBCHAPTER in ${SUBCHAPTERSNAMES[@]} ; do
cd $SUBCHAPTER
clear
echo "Folder is: $PWD "
break
done
echo "Files list:"
ls | sort -n | head -5
echo
echo "What do you want to do? "
echo "1. Watch one by one."
echo "2. Watch all. "
echo "3. Delele first movie."
echo "4. Move first movie in SELECTED folder "
echo "5. Choose another course"
echo "p. Exit. "
read ANSWER3

	case $ANSWER3 in
1)
for tutorial in $( ls | grep -e ".avi" -e ".mkv" -e ".mp4" | sort -n ) ; do

vlc $tutorial ;


clear
echo "DELETE the file = Y (ENTER)"  
echo "Move file in folder SELECTED = b"
echo "EXIT = any key"
read ANSWER2
while [[ -z $ANSWER2 ]]
do
ANSWER2=y
done
if [ $ANSWER2 = y ]
then
rm $tutorial
elif [ $ANSWER2 = b ]
then
mkdir $TUTORIALSFOLDER/$TUTORIALSNAME/SELECTED 2> /dev/null
mv $tutorial $TUTORIALSFOLDER/$TUTORIALSNAME/SELECTED
else
exit
fi
done

;;

2)
vlc $( ls | grep -e ".avi" -e ".mkv" -e ".mp4" | sort -n )
;;

3)
first=`ls | sort -n | head -1`
rm "$first"
bash $0
;;

4)
first=`ls | sort -n | head -1`
mkdir $TUTORIALSFOLDER/$TUTORIALSNAME/SELECTED 2> /dev/null
mv "$first" $TUTORIALSFOLDER/$TUTORIALSNAME/SELECTED
bash $0
;;

5)
bash $0
;;

p)
exit
;;
	esac

	;;

	e)
echo "Bye, bye!"
exit
	;;

esac


