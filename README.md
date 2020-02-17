        ╱ ╱ ╱ ╱ ╱ ╱ ╱ ╱ ╱
         ╱ T H E ╱ ╱ ╱ ╱ ╱ ╱
        ╱┳┳╮╭╮┳╮╱╭╮┳╭╮╱ ╱ ╱
         ┋┋┋┣┫┣┻╮┋╱┋┋┋ ╱ ╱ ╱ ╱ ╱
        ╱┛┛┛┻┗┻╱┗╰╯┻╰╯╱ ╱ ╱ ╱ ╱
         ┳┳╭┛┳┓┳┳╮╭╮┏┳┓╭╮┳┏  ╱ ╱
        ╱┋┣┻╮┣╱┋┋┋┣┫╱┋╱╰╮┋┋ ╱ ╱
         ┻┗╱┗┗┛┛┛┛┛┗╱┻╱╰╯╰┻╱ ╱
        ╱ ╱ ╱ ╱ ╱ ╱ ╱ DOTFILES ♡ ╱
         ╱ ╱ ╱ ╱ ╱ ╱ ╱ ╱ ╱ ╱
        ╱ ╱ ╱ ╱ ╱ ╱ ╱
       ╱ ╱ ╱ ╱ ╱ ╱ ╱
        ╱ ╱ ╱ ╱ ╱
       ╱ ╱ ╱              marcio.ikematsu@usp.br
        ╱

What this?
==========

A not at all one size fits all bunch of config files for my own needs.

Makefile
========

Top command will check if on MacOS or different Linux distros and install all the stuff I need to
exist, accordingly.

True color with iTerm + tmux + vim/neovim
=========================================

\*SIGH\*...

Ok, here we go:

### iTerm
Make sure iTerm terminal emulation (Preferences > Profiles > Terminal >
   Terminal Emulation) has ``xterm-256colors`` as report terminal type. You can
check that with ``echo $TERM``.
    - If it's not it, it's probably being overriden
somewhere else (``.basrc``? ``.bash_profile``?)
    - If everything goes right, iTerm should render true color (you can test it
        with the ``truecolor`` function defined in ``alias.sh`` somewhere here)


### tmux
Now to make tmux render true colors, 2 lines in your .tmux.conf take care of this:

```bash
set -g default-terminal "tmux-256color"
set -ga termina-overrides ",xterm-256color**:Tc"
```

``screen-256color`` would actually be enough for it to work, but with ``tmux-256color`` you also get tmux to render italics. And we do want italics.

To allow ``tmux-256color`` and italics, refer to two terminfo source files within tmux folder
and compile them with ``tic``

```shell
tic -x tmux-256color-italic.terminfo
tic -x tmux-256color.terminfo
```

### vim/neovim
Then on .vimrc/init.vim:

```vim
" uses 24-bit colors (highlight-guifg, highlight-guibg)
set termguicolors

"terminfo overrides foreground & background for tmux, not sure exactly how
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
```



...and that should be it!





