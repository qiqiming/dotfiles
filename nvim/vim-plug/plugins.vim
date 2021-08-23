" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Yggdroot/indentLine'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-startify'
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Plug 'altercation/vim-colors-solarized'
  Plug 'flrnprz/plastic.vim'
  " Plug 'voldikss/vim-floaterm'
  Plug 'morhetz/gruvbox'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
lua require "core"
