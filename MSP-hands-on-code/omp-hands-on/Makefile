# 


CC          = icc
CPP	    = icpc
CLINKER     = $(CC)
OPTFLAGS    = -O -openmp
LIBS        = -lm

CFLAGS	  = $(OPTFLAGS) 

OBJ=o
RM=rm

EXES=hello pi matmul pi_mc prod_cons linked

all: $(EXES)

hello: hello.$(OBJ) 
	$(CLINKER) $(OPTFLAGS) -o hello hello.$(OBJ) $(LIBS)

pi: pi.$(OBJ) 
	$(CLINKER) $(OPTFLAGS) -o pi pi.$(OBJ) $(LIBS)

pi_mc: pi_mc.$(OBJ) random.$(OBJ)
	$(CLINKER) $(OPTFLAGS) -o pi_mc random.$(OBJ) pi_mc.$(OBJ) $(LIBS)

matmul: matmul.$(OBJ) 
	$(CLINKER) $(OPTFLAGS) -o matmul matmul.$(OBJ) $(LIBS)

prod_cons: prod_cons.$(OBJ)
	$(CLINKER) $(OPTFLAGS) -o prod_cons prod_cons.$(OBJ) $(LIBS)

linked: linked.$(OBJ) 
	$(CLINKER) $(OPTFLAGS) -o linked linked.$(OBJ) $(LIBS)



clean:
	$(RM) $(EXES) *.$(OBJ)

.SUFFIXES:
.SUFFIXES: .c .$(OBJ)

.c.$(OBJ):
	$(CC) $(OPTFLAGS) $(CFLAGS) -c $<
