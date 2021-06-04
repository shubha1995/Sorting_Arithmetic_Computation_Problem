#!/bin/bash -x
echo $"Enter number a: "
read a
echo $"Enter number b: "
read b
echo $"Enter number c: "
read c

result1=$((a+b*c))
echo $result1
result2=$((a*b+c))
echo $result2
result3=$((c+a/b))
echo $result3
result4=$((a%b+c))
echo $result4
arithmaticOperation[result1]=$result1
arithmaticOperation[result2]=$result2
arithmaticOperation[result3]=$result3
arithmaticOperation[result4]=$result4

for((i=0; i<=${#arithmaticOperation[@]}; i++))
do
  array[i]=${arithmaticOperation[result$((i+1))]}
done
echo "${array[@]}"

function descendingOrderSort()
{
	for(( i=0; i<${#array[@]}; i ++ ))
	do
		for(( i=0; i<${#array[@]}-1; i ++ ))
		do
			if (( $(echo "${array[indexOne+1]} > ${array[indexOne]}" | bc -l ) ))
			then
				temp=${array[indexOne]}
				array[indexOne]=${array[indexOne+1]}
				array[indexOne+1]=$temp
			fi
		done
	done
	echo "To data descending order"${array[@]}
}

descendingOrderSort ${array[@]}

function ascendingOrderSort()
{
   for(( i=0; i<${#array[@]}; i ++ ))
   do
      for(( i=0; i<${#array[@]}-1; i ++ ))
      do
         if (( $(echo "${array[indexOne+1]} < ${array[indexOne]}" | bc -l ) ))
         then
            temp=${array[indexOne]}
            array[indexOne]=${array[indexOne+1]}
            array[indexOne+1]=$temp
         fi
      done
   done
   echo "To data ascending order:"${array[@]}
}

ascendingOrderSort ${array[@]}
