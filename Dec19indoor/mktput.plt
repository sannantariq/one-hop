reset
set pointsize 2.0
set autoscale
set xlabel "Distance"
set ylabel "Throughput (Mbps)"
#set grid
#set logscale y
#set yrange [0.001:]
#set title "Transfer Rate"
set terminal postscript eps color enhanced 'NimbusSanL-Regu' 21
set size 0.9,0.5
set output "bluetooth-tput-indoor.eps"
plot "tput_compiled_data.comp" using 1:2:3:4 title "Average" lt 1 with errorbars, "tput_compiled_data.comp" using 1:2 notitle lt 1 with line, '' using 1:5 title "Median" lt 2 with line, '' using 1:2 smooth sbezier t 'Trend (smooth)' lt 3 with line


#set output "throughput_median.png"
#plot "throughput.dat" using 1:5:3:4 title "Median" with errorbars, "throughput.dat" using 1:5 title "Median" with line
