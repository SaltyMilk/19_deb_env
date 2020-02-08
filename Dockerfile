FROM debian:buster

RUN mkdir scripts
COPY srcs/loop.sh /scripts/loop.sh

#Environment setup
RUN apt-get update\
	&& apt-get install git -y\
	&&apt-get install sudo -y\
	&& apt-get install man -y\
	&& apt-get install nasm -y\
	&& apt-get install gcc -y
RUN echo "set nu\nsyn on\nset mouse=a\nset tabstop=4">$HOME/.vimrc
RUN chmod a+wr $HOME/.vimrc
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse">>etc/apt/sourcs.list;\
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse">>etc/apt/sourcs.list;\
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse">>etc/apt/sourcs.list;\
	echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse">>etc/apt/sourcs.list;
#CLONE THE CTF (Repo must be public)
#RUN git clone https://github.com/SaltyMilk/Test_repo.git
#Tool installation
RUN apt-get install radare2 -y
RUN apt-get install gdb -y
RUN apt-get install vim -y 

CMD /scripts/loop.sh
