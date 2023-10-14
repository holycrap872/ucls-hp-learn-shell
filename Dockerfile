FROM ubuntu

# COPY . /magic

RUN apt-get update && \
    apt-get -y install vim sl zsh curl git

COPY ./hogwarts /hogwarts
COPY ./hogsmeade /hogsmeade
COPY ./kings_cross /kings_cross
COPY ./diagon_alley /diagon_alley

RUN echo "/hogwarts /home/harry1/floo_network/hogwarts1 none bind" >> /etc/fstab

RUN useradd -ms /bin/bash harry
USER harry
WORKDIR /home/harry
COPY ./harry_home /home/harry

RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN echo "alias sl=\"/usr/games/sl -F && cd /home/harry1/floo_network/hogwarts\"" >> /home/harry/.zshrc

# REMOVE ME vvvv
WORKDIR /home/harry1
ENV PYTHONPATH /magic/src
