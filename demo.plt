set title "Listeners over 24 hours"
set xdata time
set timefmt "%s"
set xtics 3600
set format x "%H:%M:%S"
set xlabel "Time"
set ylabel "Listeners"
set term png
set output "data.png"
plot "graph/data2.dat" using 1:2
