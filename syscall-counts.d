#!/usr/sbin/dtrace -s
/**
 * Provide a syscall as the first argument
 * to trace system-wide counts of the call
 */

# pragma D option quiet

syscall::$1:entry
{
	@[probefunc] = count();
}

tick-1sec
{
	printf("%d ", walltimestamp / (1000 * 1000 * 1000));
	printa("%@u", @);
	printf("\n");
	clear(@);
}
