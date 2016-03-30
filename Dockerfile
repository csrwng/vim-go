FROM centos:centos7

RUN yum -y install git bash-completion tar wget hostname bsdtar golang vim \
                   cmake gcc gcc-c++ make openssl-devel python-devel python3-devel \
                   tmux rsync && \
    yum clean all

RUN useradd -u 1001 --create-home default && \
    mkdir /go && \
    chown -R default /go

ENV GOPATH=/go \
    HOME=/home/default \
    LANG=en_US.utf8 \
    LC_ALL=en_US.utf8 \
    TERM=xterm-256color

COPY vimrc $HOME/.vimrc
COPY bashrc $HOME/.bashrc
RUN chown default $HOME/.vimrc &&  \
    chown default $HOME/.bashrc

USER 1001
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


RUN /bin/bash -c "vim +PluginInstall +quitall &> /dev/null || echo Done" 
RUN cd $HOME/.vim/bundle/YouCompleteMe && ./install.py --gocode-completer
RUN /bin/bash -c "vim +GoInstallBinaries +quitall &> /dev/null || echo Done"
run git clone https://github.com/magicmonty/bash-git-prompt.git ${HOME}/.bash-git-prompt --depth=1

CMD /bin/bash -c "while(true); do date; sleep 30; done"

WORKDIR $HOME
