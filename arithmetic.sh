#!/bin/bash -x

read -p "Enter 1st number : " a
read -p "Enter 2nd number : " b
read -p "Enter 3rd number : " c

echo "inputs : $a; $b; $c "

first=$((a + b * c))
second=$((a * b + c))
third=$((c + a / b))
fourth=$((a % b + c))

declare -A result
result[1]=$first
result[2]=$second
result[3]=$third
result[4]=$fourth

echo "computation result : ${result[@]}"

for((i=0; i<=${#result[@]}; i++))
do
	array[i]=${result[$((i+1))]}
done

echo "Array elemnts : ${array[@]}"

for(( i=0; i<${#array[@]}; i++ ))
do
	for(( j=0; j<${#array[@]}-1; j++ ))
	do
		if [[ ${array[j+1]} -gt ${array[j]} ]]
		then
			temp=${array[j]}
			array[j]=${array[j+1]}
			array[j+1]=$temp
		fi
	done
done

echo "Sorted Array Decending - " ${array[@]}

for(( i=0; i<${#array[@]}; i++ ))
do
        for(( j=0; j<${#array[@]}-1; j++ ))
        do
                if [[ ${array[j+1]} -lt ${array[j]} ]]
                then
                        temp=${array[j]}
                        array[j]=${array[j+1]}
                        array[j+1]=$temp
                fi
        done
done

echo "Sorted Array Ascending - " ${array[@]}