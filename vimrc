""" Vim settings

  "" Pre-configuration scripts

    " Upload and install plug if not installed
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

  "" Mappings

    " Unmap arrows to avoid temptation
    noremap <Up> <nop>
    noremap <Down> <nop>
    noremap <Left> <nop>
    noremap <Right> <nop>


    " Highlight last inserted text
    nnoremap gV `[v`]

    " Map <Leader> key to ,
    let mapleader = ","

    " Map <Esc> to jj(only in insert mode)
    imap jj <Esc>

    " Save session
    nnoremap <leader>s :mksession<CR>

    " Remap colon to be accessible without <Shift>
    map ; :
    " Shortcut to rapidly toggle `set list`
    nmap <leader>l :set list!<CR>

    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\ ,eol:¬

    " Remap yanking and pasting to jump to the end of text you pasted
    vnoremap <silent> y y`]
    vnoremap <silent> p p`]
    nnoremap <silent> p p`]

  "" Indentation settings

   " Default tab width
   let tabwidth=2

    " Tab is two spaces long
    execute "set tabstop=".tabwidth

    " Tab is converted to spaces
    set expandtab

    " Tab is two spaces long when indenting
    execute "set shiftwidth=".tabwidth

    " Soft tab is equal to tabstop
    execute "set softtabstop=".tabwidth

    " Indentation based on filetype
    filetype plugin indent on

  "" Appearance

    " Enable syntax processing
    syntax enable

    " Show command in bottom bar
    set showcmd

    " Show line numbers
    set number

    " Set line and column highlighting
    set cursorline
    set cursorcolumn

    set fillchars=vert:\

    " Symbol to put at the start of lines that have been wrapped
    let &showbreak='↪ '

  "" Shell
    " Set shell for Vim
    set shell=/bin/zsh

  "" Editing

    " Autosave cursor position on reopening file
    if has("autocmd")
      autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    " Prettier
    command Prt execute "! prettier --write %"

    " Delete trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//e

    " Automatically write before running commands
    set autowrite
    " Set arb to be recognized as ruby
    autocmd BufRead,BufNewFile *.arb setfiletype ruby

  "" Windows

     " Open new split panes to right and bottom, which feels more natural
     set splitbelow
     set splitright

     " Quicker window movement
     nnoremap <C-j> <C-w>j
     nnoremap <C-k> <C-w>k
     nnoremap <C-h> <C-w>h
     nnoremap <C-l> <C-w>l

     " Redraw window only when it is needed
     set lazyredraw

  "" Plugins
  if filereadable(expand("~/.vim/vimrc.bundles"))
    source ~/.vim/vimrc.bundles
  endif

  "" Workspace
    " Allow importing settings from .vimrc in the working folder
    set exrc
    " Secure global environment from .vimrc commands in the folders
    set secure
    " No swapfiles
    set noswapfile
