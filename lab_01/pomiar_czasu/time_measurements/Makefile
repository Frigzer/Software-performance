SHELL = /bin/sh

# C compiler
# kompilator C
#CCOMP = gcc
CCOMP = icc

# linker
# konsolidator
#LINKER = gcc
LINKER = icc

# options:
# opcje:

# version for debugging
# wersja do debugowania
# OPT = -g -DDEBUG

# optimized version
# wersja zoptymalizowana do mierzenia czasu
#OPT = -O3
OPT = -O3 -no-multibyte-chars

# filename
# plik ktory ma byc kompilowany
NAME = time_test_new

# location for header files
# katalog z plikami naglowkowymi
INC = -I../utd_time_unix

# locations for libraries and options for linking libraries
# katalogi bibliotek i opcje dołączania bibliotek
LIB = -L../utd_time_unix -lm

# dependencies and commands 
# zaleznosci i komendy
$(NAME): $(NAME).o ../utd_time_unix/uts_time.o
	$(LINKER) $(OPT) $(NAME).o ../utd_time_unix/uts_time.o -o $(NAME) $(LIB)

$(NAME).o: $(NAME).c ../utd_time_unix/uth_time.h
	$(CCOMP) -c $(OPT) $(NAME).c $(INC)

../utd_time_unix/uts_time.o: ../utd_time_unix/uts_time.c ../utd_time_unix/uth_time.h
	$(CCOMP) -c $(OPT)  ../utd_time_unix/uts_time.c -o ../utd_time_unix/uts_time.o $(INC)

clean:
	rm -f *.o time_test_backup time_test_old time_test_new
