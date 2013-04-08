#!/bin/bash

/Users/michael/graph/get_listeners.pl > /Users/michael/graph/temp.txt
	#accesses my icecast admin page and puts some useful metrics in temp.txt
date +\%s > /Users/michael/graph/unpaired.txt
grep "Current Listeners" /Users/michael/graph/temp.txt | sed 's/[^0-9]//g' >> /Users/michael/graph/unpaired.txt
	#first line of unpaired.txt is time, second line is number of listeners
sed '$!N;s/\n/ /' /Users/michael/graph/unpaired.txt >> /Users/michael/graph/data.dat
	#combine the two lines and append it to the data file
rm /Users/michael/graph/unpaired.txt
	#tidy up
A=$(($(date +\%s) - 86400))
awk -v a="$A" '$1 >= a{print $1,$2}' /Users/michael/graph/data.dat > /Users/michael/graph/data2.dat
	#get variable of 24 hours ago; only copy lines from last 24 hours to new file
/opt/local/bin/gnuplot < /Users/michael/graph/demo.plt
	#make plot from data in new file
