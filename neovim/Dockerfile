FROM alpine:latest
LABEL maintainer "Jeff Shen <jeff@jshen.org>"

RUN apk update
RUN apk add sudo bash git neovim nodejs npm curl
SHELL ["/bin/bash", "-c"]

RUN adduser \
    --disabled-password \
    --system \
    js \
    && echo "js ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/js \
    && chmod 0440 /etc/sudoers.d/js
RUN passwd -d js
USER js
WORKDIR /home/js
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN curl https://raw.githubusercontent.com/al-jshen/dotfiles/master/.vimrc --output $HOME/.vimrc
RUN curl https://raw.githubusercontent.com/al-jshen/dotfiles/master/.config/nvim/init.vim --create-dirs --output $HOME/.config/nvim/init.vim
RUN curl https://raw.githubusercontent.com/al-jshen/dotfiles/master/.vim/colors/one.vim --create-dirs --output $HOME/.vim/colors/one.vim
RUN nvim +"g/numirias/s/^/\"/" +wq! $HOME/.vimrc
RUN nvim +PlugInstall +qall!
RUN curl https://gist.githubusercontent.com/al-jshen/b286fc7f8ad227de7b4c65bd43b55a2b/raw/5b46f2f8bcc3fba25dbd20f7bb5e5491620e427b/install_coc_extensions.sh --output install_coc_extensions.sh \
        && chmod +x install_coc_extensions.sh
