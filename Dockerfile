FROM ubuntu

RUN apt-get update && \
    apt-get -y install vim sl zsh curl git python3 python3-pip && \
    pip3 install click prompt_toolkit

COPY ./bin/* /usr/bin
COPY ./hogwarts /hogwarts
COPY ./hogsmeade /hogsmeade
COPY ./kings_cross /kings_cross
COPY ./diagon_alley /diagon_alley
COPY ./hogwarts_castle /var/hogwarts_castle

RUN useradd -ms /bin/bash harry && \
    chown -R harry /var/hogwarts_castle/front_door && \
    chown -R harry /var/hogwarts_castle/back_gate

USER harry
WORKDIR /home/harry
COPY ./harry_home /home/harry

RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN echo "alias sl=\"/usr/games/sl -F && cd /hogwarts\"" >> /home/harry/.zshrc

