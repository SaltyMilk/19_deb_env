FROM debian:buster

RUN mkdir scripts
COPY srcs/loop.sh /scripts/loop.sh

RUN apt-get update
RUN apt-get install git -y 
#Environment setup
RUN apt-get install sudo -y
RUN apt-get install man -y
RUN apt-get install nasm -y
RUN apt-get install gcc -y
RUN echo "set nu\nsyn on\nset mouse=a\nset tabstop=4">$HOME/.vimrc
RUN chmod a+wr $HOME/.vimrc
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse">>etc/apt/sourcs.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse">>etc/apt/sourcs.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse">>etc/apt/sourcs.list
RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse">>etc/apt/sourcs.list
#CLONE THE CTF (Repo must be public)
#RUN git clone https://github.com/SaltyMilk/Test_repo.git
#Tool installation
RUN apt-get install radare2 -y
RUN apt-get install gdb -y
RUN apt-get install vim -y 

CMD /scripts/loop.sh
