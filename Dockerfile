FROM archlinux:latest

RUN pacman --noconfirm -Syyuu \
    && pacman --noconfirm -S zsh git

RUN useradd -ms /bin/zsh testuser

RUN mkdir -p /home/testuser/dotfiles
COPY --chown=testuser:testuser . /home/testuser/dotfiles/i3
ENV XDG_CONFIG_HOME "/home/testuser/.config"
RUN HOME=/home/testuser zsh "/home/testuser/dotfiles/i3/install.sh" "/home/testuser/dotfiles/i3" "testuser:testuser"

USER testuser

CMD zsh
