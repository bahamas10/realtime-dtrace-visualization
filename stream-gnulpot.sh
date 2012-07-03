#!/usr/bin/env bash
# Stream datapoints into gnuplot

len=${1:-10}

gnuplot_header='
set terminal dumb

set xdata time
set timefmt "%s"

#set format x "%s"

set title "Latency"
set xlabel "Time (Seconds)"
set ylabel "Latency (nms)"


plot "-" using ($1):($2/1000/1000) with lines
'

get_last_plots() {
	local j=
	local k=$i
	for ((j=0; j<len; j++)); do
		k=$(( (k + 1) % len ))
		if [[ -n "${x_axis[$k]}" ]]; then
			printf "%s %s\n" "${x_axis[$k]}" "${y_axis[$k]}"
		fi
	done
}

i=0
while read x y; do
	x_axis[$i]=$x
	y_axis[$i]=$y

	{ echo "$gnuplot_header"; get_last_plots; } | gnuplot

	i=$(( (i + 1) % len))
done
