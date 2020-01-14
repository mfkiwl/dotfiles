" auto-generate ctags file
Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_project_root = [
        \'docker-compose.yml',
        \'Makefile',
        \'pyproject.toml',
        \'.python-version',
        \'README',
        \'README.md'
        \'requirements.txt',
        \'setup.py',
    \]

Plug 'neomake/neomake'
    let g:neomake_open_list = 2
    " This should work, but it doesn't: call neomake#configure#automake('w')
    autocmd! BufWritePost * Neomake
    noremap <Leader>e :Neomake<CR>
    let g:neomake_python_enabled_makers = ['pylama', 'mypy']

    " E510 - line too long
    " W605 - invalid escape sequence
    let g:neomake_python_pylama_maker = { 'args': ['--ignore=E501,W605'],  }

Plug 'sheerun/vim-polyglot'
    " TODO: Remove plugins duplicated by polyglot:
    " https://github.com/sheerun/vim-polyglot#language-packs
    let g:polyglot_disabled = ['python']
    let g:terraform_fmt_on_save = 1

Plug 'tpope/vim-commentary'

Plug 'airblade/vim-gitgutter'
    " let g:gitgutter_highlight_lines = 1
    let g:gitgutter_map_keys = 0
    nnoremap ]c :GitGutterNextHunk<CR>
    nnoremap [c :GitGutterPrevHunk<CR>

Plug 'jpalardy/vim-slime'
    let g:slime_target = "tmux"
    let g:slime_python_ipython = 1
    nmap <C-c><C-l> <Plug>SlimeLineSend
    nmap <C-c><C-m> <Plug>SlimeMotionSend
    function! Slime_ipython_toggle()
        if !exists('g:slime_python_ipython') || g:slime_python_ipython == 0
            let g:slime_python_ipython = 1
        else
            unlet g:slime_python_ipython
        endif
    endfunction
    nmap <C-c><C-i> :silent! call Slime_ipython_toggle()<CR>

" make vim understand ANSI escape sequences
Plug 'vim-scripts/AnsiEsc.vim'
    " fix for cecutil plugin (used by AnsiEsc.vim) mapping to <Leader>rwp and
    " <Leader>swp that break my own leader mappings
    function! Unmap_cecutil()
      unmap <Leader>rwp
      unmap <Leader>swp
    endfunction
    autocmd BufEnter * silent! call Unmap_cecutil()

Plug 'tpope/vim-fugitive'
