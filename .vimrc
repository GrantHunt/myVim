" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on	  " Languge highlight
endif

  set nu	  " Line number
  filetype indent on 
  filetype plugin on
  set  autoindent
  set ic
  set hls
  set lbr  	  " Wrap text instead of being on one line

" Set windows style C/C++ Tab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set autoindent
  set cindent
  set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

" Set China luange
  let &termencoding=&encoding
  set fileencodings=utf-8,gbk,ucs-bom,cp936

" C colors delegate set method
  let g:C_UseTool_cmake = 'yes'
  let g:C_UseTool_doxygen = 'yes'


"--ctags setting--
"按下F5重新生成tag文件, 并更新 taglist

  map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
  imap <F5> <ESC> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

  set tags=tags
  set tags+=./tags  "add current directory's generated tags file
			  
"--vundle setting--
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"if &term == "xterm"
"	set t_Co = 8
"	set t_Sb = ^[[4%dm
"	set t_Sf = ^[[3%dm
"endif
