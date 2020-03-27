# dotfiles
Grant's dotfiles

If, by some chance, you aren't me, then welcome. Feel free to grab anything that might be helpful to you.
I doubt there's anything particularly clever here; I'm more likely to choose simple rather than clever.

Notes heavily cribbed from  Aron Griffis (https://github.com/agriffis)
======================================================================

Installing in a new homedir
---------------------------

Clone from github, then use [GNU stow](https://www.gnu.org/software/stow/) to
install these into a new home directory.

    git clone --recursive git@github.com:g2boojum/dotfiles.git dotfiles
    cd dotfiles
    stow -S */

Stow folding hack
-----------------

Just one more detail:
[tree folding](https://www.gnu.org/software/stow/manual/stow.html#Installing-Packages).
Stow does this awesome thing where it uses as few symlinks as possible, by
symlinking to a dir rather than to individual files. However occasionally there
are situations where I'd like to control the level at which this is done.

For example I want `.vim/swap` to be a proper directory on my home filesystem,
so `.vim` shouldn't be a symlink into `.dotfiles`. To make that work, there are
two files in this tree:

    vim/.vim/swap/.stow-unfold-hack
    vim-/.vim/swap/.stow-unfold-hack-

Since these are separate top-level packages (`vim` and `vim-`) which install
files into the same directory (`.vim/swap`), stow will create the actual dir on
the filesystem with individual symlinks for the two files.
