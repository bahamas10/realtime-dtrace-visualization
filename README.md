Realtime DTrace Analysis
========================

A collection of scripts used for realtime DTrace visualizations and analysis

Examples
--------

### Syscall Latency Visualization

Visualize syscall latency using gnuplot.  An example of this can be seen here
http://www.youtube.com/watch?v=PnvszdcUgJc

    $ sudo ./syscall-latency.d 'read*' | ./stream-gnulpot.sh

					 Latency

	20 ++------+-------+------+-------+-------+-------+------+-------+------++
	+       +       +      +       + "-" using ($1):($2/1000/1000)+****** +
	18 ++                                             *                     ++
	16 ++                                            * *                    ++
	|                                             * *                     |
	14 ++                                           *   *                   ++
	|                                            *   *                    |
	12 ++                                          *     *                  ++
	10 ++                                         *      *                  ++
	|                      **                  *       *                  |
	8 ++                    *  **               *        *                 ++
	|                    *     *             *          *                 |
	6 ++                 **       *            *          *                ++
	|                 *          **         *            *                |
	4 ++               *                      *            *               ++
	2 *****************              *********              ********    *****
	+       +       +      +       +       +       +      +       ****    +
	0 ++------+-------+------+-------+-------+-------+------+-------+------++
	11:03   11:04   11:05  11:06   11:07   11:08   11:09  11:10   11:11   11:12
				 Time (Seconds)


License
-------

BSD 3 Clause.  See LICENSE for details.
