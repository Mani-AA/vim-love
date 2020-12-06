# VIM LOVE

## CtrlP Hotkeys

Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.

Press <c-f> and <c-b> to cycle between modes.
Press <c-d> to switch to filename only search instead of full path.
Press <c-r> to switch to regexp mode.
Use <c-j>, <c-k> or the arrow keys to navigate the result list.
Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
Use <c-y> to create a new file and its parent directories.
Use <c-z> to mark/unmark multiple files and <c-o> to open them.

Submit ? in CtrlP for more mapping help.

## CHEATSHEET

### Find & replace accross multiple files :

```
:args! `grep -l[i][R] '{search-str}' {target-dir}`
:argdo %s/{search-str}/{replacement}/g[i][c] | update

OR

Ack! -R[i] "{search-src}" {dir}
cdo %s/<search term>/<replace term>/cg | w
cdo %s/<search term>/<replace term>/c | w
```

### Re-indent file

```
gg=G
```

### Get a list of user-defined commands :

```
:command
```

## INSTALLATION

### Install Ctags :

```
brew update
brew install ctags
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

### Install Code-Completion Engine :

```
cd ~/.vim/bundle/YouCompleteMe
./install.py
```

### Install/Upgrade VIM (Mac) :

```
brew install vim --override-system-vi

OR

brew upgrade vim
vim --version
```

## Install Powerline Status Bar dependencies :

**Install powerline fonts**
```
$ git clone https://github.com/powerline/fonts.git
$ cd fonts
$ ./install.sh
```
