" UI CONFIGURATION
    " Covers things like UI, colors, tabs, spaces...

    " General Settings
        " General VIM settings

        " Set default clipboard to system clipboard
        set clipboard=unnamedplus

        " Enable syntax highlighting
        syntax enable

        " Make comments italic, bc it's classy af
        highlight Comment cterm=italic

        " Highlight cursor row
        set cursorline

        " Enable and set listchars
        set list
        set listchars=tab:▸\ ,extends:❯,precedes:❮
        set showbreak=↪

        " Set line numbers
        set nu

        " Disable lag when exiting insert mode
        set timeoutlen=1000 ttimeoutlen=0

        " Set foldlevel for all files
        set foldlevelstart=0

        " Make folding be based on indentations
        set foldmethod=indent

        " Enablee UTF-8 encoding
        set encoding=utf-8

        " Set postitioning of new splits
        set splitbelow
        set splitright

        " Set relative line numbering
        set rnu

        " Give priority to local, project wire .vimrc files
        set exrc

        " Tab character is 4 spaces wide
        set tabstop=4

        " Tab key indents four spaces
        set softtabstop=4

        " Using << and >> shifts four spaces
        set shiftwidth=4

        " Text gets wrapped at column 79
        set textwidth=79

        " Tab press will produce spaces instead of tab character
        set expandtab

        " Automatically indent when pressing <CR>
        set autoindent

        " Used for line termination (not same in DOS and Unix, '\r\n' and '\n')
        set fileformat=unix

        " Turn off permanent backups
        set nobackup

        " Turn off backups while writing to file
        set nowritebackup

        " Turn off undo files
        set noundofile

        " Turn on search highlighting
        set hlsearch

        " Set something for airline
        set laststatus=2

        " Turn on filetype detection
        filetype on

        " Turn off Vi compatibility
        set nocompatible

        " Turn on plugin loading for corresponding filetypes
        filetype plugin on

        " Turn on indentation for corresponding filetypes
        filetype indent on

        function! ProperTextFolding()
            " Custom folding string generation function ///
            set fillchars="fold: "
            let line = ' ' . substitute(getline(v:foldstart), '^\s*["''/\*]*\s*\|\s*"\?\s*{{' . '{\d*\s*' . '\|["''*/]*', '', 'g') . ' '
            let lines_count = v:foldend - v:foldstart + 1
            let lines_count_text = '| ' . printf("%7s", lines_count . ' lines') . ' |'
            let foldchar = matchstr(&fillchars, 'fold:\zs.')
            let foldtextstart = strpart('+' . repeat('-', v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
            let foldtextend = lines_count_text . repeat(foldchar, 8)
            let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
            return foldtextstart . repeat('-', 79 - foldtextlength) . foldtextend
        endfunction

        " Set function for generating folding string
        set foldtext=ProperTextFolding()

    " Color Settings
        " Interface colors and highlighting

        " Add different color past column 79 to indicate line break overstepping
        let &colorcolumn=join(range(80,999),",")

        " Enable 24-bit color
        set termguicolors


" CUSTOM FUNCTIONALITY
    " autocmd commands that are not language specific
        " Remove trailing whitespace on file save
        autocmd BufWritePre * %s/\s\+$//e


" CUSTOM MAPPINGS
    " Custom mappings for general Vim functionality

    " Go into shell
    map <leader>s :sh<CR>

    " Clear search highlights
    map <leader>n :noh<CR>

    " Enclose word in quotes
    map <leader>q ciw"<C-r>""<ESC>B

    " Function for find and replace
    function! Find(arg1, arg2)
        execute '%s/' . a:arg1 . '/' . a:arg2 . '/gc'
    endfunction

    " Find and replace in current buffer
    command -nargs=* Fnd  call Find(<f-args>)

    " Reload vimrc
    map <leader>v :so ~/.vimrc<CR>

    " Map <ESC> key to jj, in insert mode
    imap jj <Esc>

    " Enable fold toggling with spacebar
    nnoremap <space> za

    " Split navigation in normal mode (disable <C-W>)
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>


" LANGUAGE SPECIFIC SETTINGS
    " Custom settings and mappings for different languages

    " LaTeX
        " LaTeX Specific Settings

        " Compile LaTeX files
        autocmd Filetype tex map <buffer> <leader>c :!pdflatex %<CR>

    " C/C++
        " C/C++ Specific Settings
        autocmd Filetype cpp,c call Set_C_options()

        function! Set_C_options()
            " A function that sets all C/C++ options
            " Shortcuts for compiling and running programs
            map <buffer> <leader>c :!make<CR>
            map <buffer> <leader>r :!clear; ./bin/main<CR>

            " Automatic braces and cursor positioning
            imap <leader>[ {<CR>}<ESC>ko

            " Set better indentation
            autocmd Filetype cpp set cindent
        endfunction

    " Assembly
        " Assembly Specific Settings
        autocmd BufRead,BufNewFile *.asm set filetype=nasm

    " Vue
        " Vue Specific Settings
        autocmd Filetype vue,html,css,javascript call Set_Vue_options()

        function! Set_Vue_options()

            " Tab character is 2 spaces wide
            set tabstop=2

            " Tab key indents 2 spaces
            set softtabstop=2

            " Using << and >> shifts four spaces
            set shiftwidth=2

        endfunction


" PLUGINS
    " Use Vundle to install different plugins

    " Required by Vundle; gets turned back on after configuration
    filetype off

    " Add Vundle.vim to runtime path, to initialize Vundle
    set rtp+=~/.vim/bundle/Vundle.vim

    call vundle#begin()

    " Let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " All plugins go below

    " Autocomplete engine
    " Plugin 'Valloric/YouCompleteMe'

    " Plugin for syntax checking
    Plugin 'scrooloose/syntastic'

    " Fuzzy search engine
    Plugin 'kien/ctrlp.vim'

    " Instal Lightline
    Plugin 'itchyny/lightline.vim'

    " Plugin  for toggling comments
    Plugin 'scrooloose/nerdcommenter'

    " Plugin for improved LaTeX
    " Plugin 'lervag/vimtex'

    " Colorscheme settings
    Plugin 'joshdick/onedark.vim'

    " Plugin for closing parentheses
    Plugin 'jiangmiao/auto-pairs'

    " Show git diff in gutter
    Plugin 'airblade/vim-gitgutter'

    " Surround text with stuff
    Plugin 'tpope/vim-surround'

    " Typescript syntax highligting
    Plugin 'leafgarland/typescript-vim'

    " Supercollider plugin
    Plugin 'supercollider/scvim'

    " Vimwiki
    Plugin 'vimwiki/vimwiki'

    " Vue.js
    Plugin 'posva/vim-vue'

    " HTML
    Plugin 'mattn/emmet-vim'

    " All of your Plugins must be added before the following line
    call vundle#end()

    " Enable filetype detection again
    filetype on


" PLUGIN CONFIGURATION
    " Configure all installed plugins

    " YouCompleteMe
        " An autocompletion engine

        " Ensures that the preview window goes away
        let g:ycm_autoclose_preview_window_after_completion=1

        " Set interpreter to python2 interpreter
        " let g:ycm_server_python_interpreter="/usr/bin/python2.7"

        " Tell YCM where the global flag file is for C languages
        " let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

        " Maps GoTo to leader + g
        map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

    " Syntastic
        " A plugin for linting different languages

        " Setting for syntastic
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        " Something probably having to do with the pop-up window
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1

        " Check file on open
        let g:syntastic_check_on_open = 1

        " Check on closing file (not sure how and why)
        let g:syntastic_check_on_wq = 0

        " Enable displaying errors from all linters at once
        let g:syntastic_aggregate_errors = 1

        " Set Python linter
        autocmd Filetype python let g:syntastic_python_checkers = ['pylint', 'flake8']

        " Shortcut for closing error window
        map <leader>w :SyntasticReset<CR>

    " NERDCommenter
            " A plugin for toggling comments

            map <leader><leader> <plug>NERDCommenterToggle
            let g:NERDCreateDefaultMappings = 0
            let g:NERDSpaceDelims = 1
            let g:NERDRemoveAltComs = 1
            let g:NERDAltDelims_c = 1

    " OneDark Theme
        " onedark theme, from Atom

        colorscheme onedark

    " Lightline
        " A fancy status line plugin

        " Set lightline colorscheme
        let g:lightline = { 'colorscheme': 'onedark'}

    " CTRL-P
        " A fuzzy file finder
        let g:ctrlp_working_path_mode = 0
        " let g:ctrlp_show_hidden = 1

        " Run in buffer mode by default
        let g:ctrlp_cmd = 'CtrlPBuffer'

    " SCvim

        " Set terminal to gnome terminal
        let g:sclangTerm = "gnome-terminal -x $SHELL -ic"

    " Vimwiki

        " Set Markdown syntax highlighting as default
        let g:vimwiki_list = [{'path': '~/vimwiki/',
                   \ 'syntax': 'markdown', 'ext': '.md'}]
