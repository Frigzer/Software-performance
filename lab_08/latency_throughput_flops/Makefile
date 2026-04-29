SHELL = /bin/sh

# C compiler
# kompilator C
CCOMP = icc -diag-disable=10441
# CCOMP = gcc
#CCOMP = icx

# linker
# konsolidator
LINKER = $(CCOMP)

# options:
# opcje:

# version for debugging
# wersja do debugowania
# OPT = -g -DDEBUG

# optimized version for time measurements
# wersja zoptymalizowana do mierzenia czasu
#OPT = -O3 -mavx2 -march=core-avx2
OPT = -O3 -march=core-avx2 
# OPT = -O3

# PAPI
#PAPI_HOME = /home/krzysztof/Pobrane/papi-6.0.0/src_gcc
#PAPI_HOME = /home/krzysztof/PAPI/papi_6.0.0/src/
PAPI_HOME = /home/students_wo/common_files/papi-6.0.0/src

# location for header files
# katalog z plikami naglowkowymi
#INC = -I../utd_time_unix
INC = -I../utd_time_unix -I../utd_papi_driver -I$(PAPI_HOME)

# locations for libraries and options for linking libraries
# katalogi bibliotek i opcje dołączania bibliotek
#LIB = -L../utd_time_unix -lm -lpthread
LIB = -L../utd_papi_driver -lpapi_driver -L$(PAPI_HOME) $(PAPI_HOME)/libpapi.a -L../utd_time_unix  -lutl_time -lm -lpthread

# dependencies and commands 
# zaleznosci i komendy

############################ WITHOUT PAPI #########################################
all: latency_throughput_scalar_flops latency_throughput_vector_flops latency_throughput_multithreaded_vector_flops

latency_throughput_scalar_flops: latency_throughput_scalar_flops.o
	$(LINKER) $(OPT) latency_throughput_scalar_flops.o -o latency_throughput_scalar_flops $(LIB)

latency_throughput_scalar_flops.o: latency_throughput_scalar_flops.c 
	$(CCOMP) -c $(OPT) latency_throughput_scalar_flops.c $(INC) 

latency_throughput_vector_flops: latency_throughput_vector_flops.o
	$(LINKER) $(OPT) latency_throughput_vector_flops.o -o latency_throughput_vector_flops $(LIB)

latency_throughput_vector_flops.o: latency_throughput_vector_flops.c
	$(CCOMP) -c $(OPT) latency_throughput_vector_flops.c $(INC) 

latency_throughput_multithreaded_vector_flops: latency_throughput_multithreaded_vector_flops.o
	$(LINKER) $(OPT) latency_throughput_multithreaded_vector_flops.o -o latency_throughput_multithreaded_vector_flops $(LIB)

latency_throughput_multithreaded_vector_flops.o: latency_throughput_multithreaded_vector_flops.c
	$(CCOMP) -c $(OPT) latency_throughput_multithreaded_vector_flops.c $(INC)

##################################### WITH PAPI ###############################
papi: latency_throughput_scalar_flops_papi latency_throughput_vector_flops_papi 

latency_throughput_scalar_flops_papi: latency_throughput_scalar_flops_papi.o papi_set_user_events.o
	$(LINKER) $(OPT) latency_throughput_scalar_flops_papi.o papi_set_user_events.o -o latency_throughput_scalar_flops_papi $(LIB)

latency_throughput_scalar_flops_papi.o: latency_throughput_scalar_flops.c 
	$(CCOMP) -c $(OPT) latency_throughput_scalar_flops.c $(INC) -DPAPI_TEST -o latency_throughput_scalar_flops_papi.o

latency_throughput_vector_flops_papi: latency_throughput_vector_flops_papi.o papi_set_user_events.o
	$(LINKER) $(OPT) latency_throughput_vector_flops_papi.o papi_set_user_events.o -o latency_throughput_vector_flops_papi $(LIB)

latency_throughput_vector_flops_papi.o: latency_throughput_vector_flops.c
	$(CCOMP) -c $(OPT) latency_throughput_vector_flops.c $(INC) -DPAPI_TEST -o latency_throughput_vector_flops_papi.o

papi_set_user_events.o: papi_set_user_events.c ../utd_papi_driver/papi_driver.h
	$(CCOMP) -c $(OPT) papi_set_user_events.c  $(INC)


######################### LIBRARIES ################################
lib: recreate_time_lib recreate_papi_lib

recreate_papi_lib:
	rm -f ../utd_papi_driver/*.o ../utd_papi_driver/*.a
	$(CCOMP) -c $(OPT) ../utd_papi_driver/papi_driver.c -o ../utd_papi_driver/papi_driver.o $(INC)
	ar -rs ../utd_papi_driver/libpapi_driver.a ../utd_papi_driver/papi_driver.o

recreate_time_lib:
	rm -f ../utd_time_unix/*.o ../utd_time_unix/*.a
	$(CCOMP) -c $(OPT) ../utd_time_unix/uts_time.c -o ../utd_time_unix/uts_time.o $(INC)
	ar -rs ../utd_time_unix/libutl_time.a ../utd_time_unix/uts_time.o


########################## CLEANING ##############################33
clean:
	rm -f *.o *~ *_flops *_papi

deep_clean:
	rm -f  *.o *~ *_flops *_papi ../utd_time_unix/*.o ../utd_time_unix/*.a ../utd_papi_driver/*.o ../utd_papi_driver/*.a 

