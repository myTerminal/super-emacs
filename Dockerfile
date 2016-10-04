FROM myterminal/linux-dev

MAINTAINER Mohammed Ismail Ansari <team.terminal@gmail.com>

LABEL description "A docker image featuring super-emacs"
LABEL version "0.9.1"

RUN useradd dev
ENV HOME /home/dev

WORKDIR /home/dev
RUN git clone https://github.com/myTerminal/super-emacs.git
RUN mv super-emacs/.emacs.d . && rm super-emacs -rf && rm .emacs

CMD ["/bin/bash"]
