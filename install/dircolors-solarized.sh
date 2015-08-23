git clone https://github.com/seebi/dircolors-solarized.git ../dircolors-solarized
echo '#dircolors-solarized' >> ../.env
echo 'eval `dircolors ~/.dotfiles/dircolors-solarized/dircolors.256dark`' >> ../.env
echo 'export TERM=xterm-256color ' >> ../.env
