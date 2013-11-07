# Distraction Free Mode for Vim

## Install

**Vundle**

Add this line to your .vimrc file:

```
Bundle 'bruth/vim-distraction-free' 
```

**Pathogen**

```
mkdir -p ~/.vim/bundle
git clone git://github.com/bruth/vim-distraction-free.git ~/.vim/bundle/vim-distraction-free
```

**Manually**

Download and copy `plugin/DistractionFree.vim` to `~/.vim/plugin`.

## Options

- `g:fullscreen_colorscheme` - colorscheme to use in fullscreen mode
- `g:fullscreen_font` - font to use in fullscreen mode 

_Options default to the current settings of the session._

## Usage

Default binding is set to `<leader>d` to toggle between normal and distraction-free mode.
