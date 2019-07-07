FROM python:3.6.8
USER root
RUN apt-get update && apt --fix-broken -qy install
RUN apt-get -qy install build-essential autoconf pkg-config software-properties-common git
RUN cd /opt \
&& git clone https://github.com/universal-ctags/ctags.git \
&& cd ctags \
&& ./autogen.sh \
&& ./configure \
&& make \
&& make install

RUN apt-get install -qy silversearcher-ag curl aspell aspell-en
RUN pip install pynvim python-language-server pylint pylint-django pyls-black pyls-isort
RUN cd /opt && curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
&& chmod u+x nvim.appimage \
&& ./nvim.appimage --appimage-extract \
&& ln -s /opt/squashfs-root/usr/bin/nvim /bin/nvim

RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && mkdir -p /root/.config/nvim
COPY config /mnt/vim-config
RUN ln -s /mnt/vim-config/init.vim /root/.config/nvim/init.vim \
	&& ln -s /mnt/vim-config/config /root/.config/nvim/config \
	&& ln -s /mnt/vim-config/config/spell /root/.config/nvim/spell \
	&& nvim --headless +PlugInstall +qa
RUN touch $HOME/.pgpass
