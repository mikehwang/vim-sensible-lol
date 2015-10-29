" sensible_lol.vim - Settings Michael Hwang has grown to like
" Maintainer:   Michael Hwang
" Version:      0.1.0


" Automatically change working directory to the file you are working on.
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h

" Highlight matches to search pattern
" Use <C-L> to turn off highlighting
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Stop certain movements from always going to the first character of a line
" like G, gg, d. This is the expected behavior for users who come from other
" editors.
" TODO: Not completely convinced about this one.
set nostartofline

" Instead of failing a command because of unsaved changes, raise a
" dialogue asking if you wish to save changed files.
set confirm

" Display line numbers on the left.
set number

" Do smart autoindenting when starting a new line.  Works for C-like
" programs, but can also be used for other languages.
" WARNING: Not entirely sure what the diff between this and smarttab but this
" was in my older vimrc and I liked how that worked.
set smartindent

" Indentation settings for using 4 spaces instead of tabs.
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set shiftwidth=4
set tabstop=4

" Display tabs and trailing spaces visually.
" Original version had eol:$ but thought it crowded the editor. Just saying.
set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:+
set list

" Wrap lines
set wrap
" Wrap lines at convenient points
set linebreak
set showbreak=>\

" TODO: Look into how to really use folds effectively then configure.
" Default is manual.
" set foldmethod=syntax vs indent

" No backup files, no swap files
set nobackup
set nowritebackup
set noswapfile

" 80-character strictness
" TODO: Big todo is to make this dynamic to filetype.
set textwidth=81
set colorcolumn=+1

" File extension collision! Apparently vim natively thinks .md files are something
" called Modula-2 files. .md files are always markdown in my world.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
