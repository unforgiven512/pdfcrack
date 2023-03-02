#
# Makefile
#


CSTD := gnu11
CXXSTD := gnu++14

OPTLVL := 3
DBGLVL := 1


DEFINES := -D_FILE_OFFSET_BITS=64
DEFINES += -D_LARGEFILE64_SOURCE


CFLAGS := -std=$(CSTD) -O$(OPTLVL) -g$(DBGLVL)
CFLAGS += $(DEFINES)
CFLAGS += -Wall -Wextra


OBJS = main.o \
		sha256.o \
		rc4.o \
		md5.o \
		pdfcrack.o \
		pdfparser.o \
		passwords.o \
		common.o \
		benchmark.o

OBJS_PDFREADER = pdfparser.o \
		pdfreader.o \
		common.o


all: pdfcrack


pdfcrack: $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $(OBJS)


pdfreader: $(OBJS_PDFREADER)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $(OBJS_PDFREADER)


clean:
	rm -f pdfcrack pdfreader testreader *.o


%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -c -o $@ $+
