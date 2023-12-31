BIN =  ravg avg_svc
GEN = avg_clnt.c avg_svc.c avg_xdr.c avg.h
RPCCOM = rpcgen

all: $(BIN)

ravg: ravg.o avg_clnt.o avg_xdr.o
	$(CC) -o $@ ravg.o avg_clnt.o avg_xdr.o

ravg.o: ravg.c avg.h
	$(CC) -g ravg.c -c

avg_svc: avg_proc.o avg_svc.o avg_xdr.o
	$(CC) -o $@ avg_proc.o avg_svc.o avg_xdr.o

avg_proc.o: avg_proc.c avg.h

$(GEN): avg.x
	$(RPCCOM) avg.x

clean cleanup:
	rm -f $(GEN) *.o $(BIN)




