#!/usr/sbin/dtrace -s
/**
 * Provide a syscall as the first argument
 * to trace system-wide latency of the call
 */

# pragma D option quiet

syscall::$1:entry
{
	self->s = timestamp;
}
syscall::$1:return
/self->s/
{
	@["time in ns"] = avg(timestamp - self->s);
}

tick-1sec
{
	printf("%d ", walltimestamp / (1000 * 1000 * 1000));
	printa("%@u", @);
	printf("\n");
	clear(@);
}
