#!/bin/bash 
declare -A Dice
for(( count=1;count<=6;count++ ))
do
	Dice["Face"$count]=0
done
loopStop=0
while [ $loopStop -ne 1 ]
do
   randomNumber=$(( RANDOM%6 + 1 ))
   ((Dice["Face"$randomNumber]++))
   if [ ${Dice["Face"$randomNumber]} -eq 10 ]
   then
      (( loopStop++ ))
   fi
done
maximum=${Dice[Face1]}
minimum=${Dice[Face1]}
faceMax=1
faceMin=1
for (( count=1;count<=6;count++ ))
do
   if [ $maximum -lt ${Dice["Face"$count]} ]
   then

      maximum=${Dice["Face"$count]}
      faceMax=$count
   elif [ $minimum -gt ${Dice["Face"$count]} ]
   then
      minimum=${Dice["Face"$count]}
      faceMin=$count
   fi

done

echo "MAXIMUM OCCURRENCE Face$faceMax $maximum times"
echo "MINIMUM OCCURRENCE Face$faceMin $minimum times"

