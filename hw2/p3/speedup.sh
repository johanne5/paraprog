#!/bin/bash


#specifiera olika mängd trådar och olika storlekar som skall testas i listorna nedan, samt namnet på programmet
#programmet måste ta storlek som första parameter, antalet trådar som andra parameter och göra en enda utskrift
#där exekveringstiden för den paralleliserade delen av programmet skrivs ut

workers=(2 4 8 16)
sizes=(4000 8000 16000 32000)
programName=palindrome


clear

echo "THREADS	| SIZE 		| SPEEDUP"
echo "-------------------------------------------------"

declare -a stats
stats_index=0
seqTime=0

for w in ${workers[@]}
do
	for s in ${sizes[@]}
	do
		for i in {0..4}
		do
			stats[i]=$(./$programName $s 1 speedup)
		done
			stats=($(for a in "${stats[@]}"; do echo "$a"; done | sort -n))
			seqTime=${stats[2]}
		for i in {0..4}
		do
			stats[i]=$(./$programName $s $w speedup)
			((stats_index++))
		done
		stats=($(for a in "${stats[@]}"; do echo "$a"; done | sort -n))
		speedup=$(bc -l <<< "$seqTime / ${stats[2]}")
		printf "%s 	| %s    	| %s \n" "$w" "$s" "$speedup"
	done
done