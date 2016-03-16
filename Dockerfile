FROM centos:centos7

RUN yum -y install git bash-completion tar wget hostname bsdtar golang vim \
                   cmake gcc gcc-c++ make openssl-devel python-devel python3-devel \
                   tmux rsync && \
    yum clean all

RUN useradd -u 1001 --create-home default && \
    mkdir /go && \
    chown -R default /go

USER 1001

ENV GOPATH=/go HOME=/home/default LANG=en_US.utf8 LC_ALL=en_US.utf8 TERM=xterm-256color

RUN mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN cd $HOME/.vim/bundle && \
       git clone https://github.com/scrooloose/nerdtree.git && \
       git clone https://github.com/ctrlpvim/ctrlp.vim.git && \
       git clone https://github.com/scrooloose/syntastic.git && \
       git clone https://github.com/Valloric/YouCompleteMe.git --recursive && \
       git clone https://github.com/vim-airline/vim-airline.git && \
       git clone https://github.com/altercation/vim-colors-solarized.git && \
       git clone https://github.com/terryma/vim-expand-region.git && \
       git clone https://github.com/airblade/vim-gitgutter.git && \
       git clone https://github.com/fatih/vim-go.git && \
    cd $HOME && \
       git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt


RUN cd $HOME/.vim/bundle/YouCompleteMe && ./install.py --gocode-completer

USER root
COPY vimrc $HOME/.vimrc
COPY bashrc $HOME/.bashrc
RUN chown default $HOME/.vimrc &&  \
    chown default $HOME/.bashrc
USER 1001

RUN /bin/bash -c "vim +GoInstallBinaries +quitall &> /dev/null || echo Done"

CMD /bin/bash -c "while(true); do date; sleep 30; done"

WORKDIR $HOME
