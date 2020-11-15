All:
	gcc -Wall -o locktest locktest.c netsync.c
clean :
	rm -f *.o;rm -f locktest
