reset
set pointsize 2.0
set autoscale
set xlabel "Distance"
set ylabel "Rssi"
set grid
#set title "RSSI"
#set terminal png enhanced size 1280,1280
set terminal postscript eps color enhanced 'NimbusSanL-Regu' 14
set size 0.6,0.5
set output "bluetooth-rssi_average.eps"
plot "rssi_compiled_data.comp" using 1:2:3:4 title "Average" with errorbars, "rssi_compiled_data.comp" using 1:2 title "Average" with line

set output "rssi_median.eps"
plot "rssi_compiled_data.comp" using 1:5:3:4 title "Median" with errorbars, "rssi_compiled_data.comp" using 1:5 title "Median" with line
