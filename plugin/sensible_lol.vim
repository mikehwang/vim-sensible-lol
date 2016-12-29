" sensible_lol.vim - Settings Michael Hwang has grown to like
" Maintainer:   Michael Hwang
" Version:      0.2.0


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

" Auto commands--------------------

" File extension collision! Apparently vim natively thinks .md files are something
" called Modula-2 files. .md files are always markdown in my world.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" 80-character strictness
function! s:ToggleOnReinforceEightyChars()
    set textwidth=81
    set colorcolumn=+1
endfunction

function! s:ToggleOffReinforceEightyChars()
    set textwidth=0
    set colorcolumn=
endfunction

" Order of execution of these statements matter where the more specific command
" gets overridden with the more generic one.  This is not ideal; however, this is
" a vim thing and is the approach recommended in :help autocommand-pattern.
autocmd BufNewFile,BufReadPost *.* call s:ToggleOffReinforceEightyChars()
autocmd BufNewFile,BufReadPost *.py call s:ToggleOnReinforceEightyChars()
autocmd BufNewFile,BufReadPost *.vim call s:ToggleOnReinforceEightyChars()
autocmd BufNewFile,BufReadPost *.sh call s:ToggleOnReinforceEightyChars()
autocmd BufNewFile,BufReadPost *.clj call s:ToggleOnReinforceEightyChars()
autocmd BufNewFile,BufReadPost *.cljs call s:ToggleOnReinforceEightyChars()

" List vs linebreak
" Apparently in vim linebreak gets turned off when list is turned on. I think
" this is a todo item for them. This issue is a priority 7 item on their todos -
" help todo.
" See here http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
"
" This is coupled to the reinforcement-of-80-chars because I only really
" care about whitespaces when I'm programming but keep it separated for now to
" keep it clean.

function! s:ToggleOnLinebreak()
    set nolist
    set linebreak
endfunction

function! s:ToggleOffLinebreak()
    set list
endfunction

autocmd BufNewFile,BufReadPost *.* call s:ToggleOnLinebreak()
autocmd BufNewFile,BufReadPost *.py call s:ToggleOffLinebreak()
autocmd BufNewFile,BufReadPost *.vim call s:ToggleOffLinebreak()
autocmd BufNewFile,BufReadPost *.sh call s:ToggleOffLinebreak()
autocmd BufNewFile,BufReadPost *.clj call s:ToggleOffLinebreak()
autocmd BufNewFile,BufReadPost *.cljs call s:ToggleOffLinebreak()

" Clojure related
" For plugin, luochen1990/rainbow.
" NOTE: Tried out kien/rainbow_parentheses.vim but the functionality wouldn't work
" when new files were opened or created. Tried toggling with BufNewFile and
" BufReadPost but that would toggle only the file that had rainbox parantheses on
let g:rainbow_active = 1
