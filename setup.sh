ln -s ~/.vim/.global_ignore ~/.global_ignore
git config --global core.excludesfile $HOME/.global_ignore

# Setup ctags
which ctags
brew install ctags
#alias ctags=“`brew —prefix`/bin/ctags”
#alias ctags >> ~/.bashrc
ln -s ~/.vim/.ctags ~/.ctags

# Setup git completion
cp /usr/local/git/contrib/completion/git-completion.bash /usr/local/etc/bash_completion.d/

ln -s ~/.vim/.tmux.conf ~/tmux/.tmux.conf

# Required for better JSON editing in vim.
npm install jsonlint -g

