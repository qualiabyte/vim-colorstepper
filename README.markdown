# vim-colorstepper

Cycle easily through vim color schemes.

## Install

Add colorstepper to your vim directory:

    $ mkdir -p ~/.vim/bundle \
        && cd ~/.vim/bundle \
        && git clone https://github.com/qualiabyte/vim-colorstepper colorstepper

Non-pathogen users should add this to your .vimrc:

    " ColorStepper
    source ~/.vim/bundle/colorstepper/colorstepper.vim

## Setup

You may optionally modify your .vimrc to customize colorstepper's default keymaps:

    " ColorStepper Keys
    nmap <F6> <Plug>ColorstepPrev
    nmap <F7> <Plug>ColorstepNext
    nmap <S-F7> <Plug>ColorstepReload

## Usage

Ok! After reloading vim, you should now be able to:

- Cycle to next color with `F7`
- Cycle to prev color with `F6`
- Reload available colors with `Shift+F7`

## Get more colors!

Simply add vim colorschemes to `~/.vim/colors/<theme>.vim`.

Or with pathogen, add to `~/.vim/bundle/<bundle-name>/colors/<theme>.vim`.

## Colorscheme Packs

May we suggest...

+ [flazz][flazz] / [vim-colorschemes][vim_colorschemes] "one colorscheme pack to rule them all!"

[vim_colorschemes]: https://github.com/flazz/vim-colorschemes
[flazz]:            https://github.com/flazz

## Credits

2007 - Original script by [scott-268][scott] with help from [Bill McCarthy][mccarthy] on the [vim-users list][vim_users].

2012 - Modified by [qualiabyte][qualiabyte].

## History

See Threads:

+ ["Cycle easily through custom schemes" (Apr 2009)][cycle_easily]
+ ["Scripted echo won't echo" (Sep 2007)][original]

[scott]:        http://vim.1045645.n5.nabble.com/template/NamlServlet.jtp?macro=user_nodes&user=28353
[mccarthy]:     http://vim.1045645.n5.nabble.com/template/NamlServlet.jtp?macro=user_nodes&user=28375
[qualiabyte]:   http://github.com/qualiabyte
[vim_users]:    http://www.vim.org/maillist.php
[cycle_easily]: https://groups.google.com/d/topic/vim_use/XtoYTNmu3ec/discussion
[original]:     http://vim.1045645.n5.nabble.com/scripted-echo-won-t-echo-tc1165596.html
