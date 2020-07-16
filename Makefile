#######################################
# 编辑这里
# 把CLASSDIR设置成cool文件的位置
# 以便让Makefile通过 ${CLASSDIR}/bin 可以找到coolc
# 下面是我的电脑上cool文件夹的位置
CLASSDIR= /home/os/Public/cool/cool
#######################################

ASSN = 1
CLASS= cs-compiler
SRC= stack.cl README.SKEL 
LSRC= Makefile

CC=gcc
CFLAGS=-g

default: source compile test

.c.o:
	${CC} ${CFLAGS} -c $<

source : lsource
	${CLASSDIR}/etc/copy-skel ${ASSN} ${SRC}

lsource:
	${CLASSDIR}/etc/link-shared ${ASSN} ${LSRC}

compile: stack

stack: stack.cl
	@echo create stack.s
	${CLASSDIR}/bin/coolc stack.cl 

test:	compile
	@echo test stack.s
	${CLASSDIR}/bin/spim -trap_file ${CLASSDIR}/lib/trap.handler -file stack.s

run:	compile
	@echo run stack.s
	${CLASSDIR}/bin/spim -trap_file ${CLASSDIR}/lib/trap.handler -file stack.s

clean :
	rm -f *.s core *~
