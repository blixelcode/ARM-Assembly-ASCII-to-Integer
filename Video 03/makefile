main: main.o
	ld main.o print.o atoi.o -o main
	rm *.o
main.o: main.s
	as -g main.s   -o main.o
	as -g print.s  -o print.o
	as -g atoi.s   -o atoi.o
clean:
	rm *.o main
