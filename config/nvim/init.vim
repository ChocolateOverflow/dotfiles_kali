" <F1>
" 	(coc) Show definition
" <F2>; <space>c*
" 	coc stuff
" <F3>
"		Beaufity/Autoformat
" <F4>
" 	Tagbar
" <F5>
"		Run/Compile
"
" <leader>g 	<space>g
"		git commands
"
" markdown renders at localhost:4444



""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""

filetype on
filetype plugin on
syntax on

set autoindent
set breakindent
set cpoptions+=y
set cursorcolumn
set cursorline
set encoding=utf-8
set foldmethod=indent
set foldminlines=1
set hidden
set history=100
set inccommand=nosplit
set incsearch
set noexpandtab
set nofoldenable
set nohlsearch
set path+=**
set rnu nu
set ruler
set scrolloff=10
set shiftround
set shiftwidth=2
set showcmd
set smartcase
set smarttab
set splitbelow splitright
set tabstop=2
set title
set visualbell
set wildmenu
set wildmode=longest,list,full
set wrap

autocmd BufRead,BufNewFile *.ino,*.pde set filetype=arduino



""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

call plug#begin('$HOME/.config/nvim/plugged')
	" General GUI
	Plug 'vim-airline/vim-airline'
	Plug 'w0rp/ale'
	Plug 'joshdick/onedark.vim'
	Plug 'chrisbra/colorizer'
	" Motion
	Plug 'andymass/vim-matchup'
	Plug 'unblevable/quick-scope'
	" Searching
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	" Tags
	Plug 'majutsushi/tagbar'
	" Automation
	Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	" Languages
	Plug 'sheerun/vim-polyglot'
	" Lint
	Plug 'scrooloose/syntastic'
	" Formatting
	Plug 'godlygeek/tabular'
	Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'h'] }
	Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }
	" Autocomplete & Snippets
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" git
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	" Building
	Plug 'tpope/vim-dispatch'
	" C/C++
	Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp', 'h', 'arduino', 'ino', 'pde']}
	" Arduino
	Plug 'sudar/vim-arduino-syntax', {'for': ['arduino', 'ino', 'pde']}
	" Python
	Plug 'davidhalter/jedi-vim', {'for': 'python'}
	Plug 'davidhalter/jedi', {'for': 'python'}
	Plug 'alfredodeza/pytest.vim', {'for': 'python'}
	" HTML/Javascript/PHP
	Plug 'alvan/vim-closetag', {'for': ['html', 'js']}
	" Markdown
	Plug 'mzlogin/vim-markdown-toc', {'for': 'markdown'}
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	" Utilities
	Plug 'pechorin/any-jump.vim'
call plug#end()

" coc extensions
let g:coc_global_extensions = [
	\ 'coc-actions',
	\ 'coc-clangd',
	\ 'coc-diagnostic',
	\ 'coc-git',
	\ 'coc-json',
	\ 'coc-highlight',
	\ 'coc-html',
	\ 'coc-markdownlint',
	\ 'coc-marketplace',
	\ 'coc-markmap',
	\ 'coc-pairs',
	\ 'coc-prettier',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-yank'
	\ ]


""""""""""""""""""""""""""""""""""""""""
" Themes and Background
""""""""""""""""""""""""""""""""""""""""

" Background
colorscheme onedark

" vim-airline
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_exclude_preview = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1



""""""""""""""""""""""""""""""""""""""""
" Basic autocmd
""""""""""""""""""""""""""""""""""""""""

" Disable auto-commenting on new-line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete trailing white spaces on save
autocmd BufWritePre * %s/\s\+$//e

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex



""""""""""""""""""""""""""""""""""""""""
" C/C++
""""""""""""""""""""""""""""""""""""""""

" vim-cpp-enhanced-highlight
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_class_scope_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_member_variable_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_class_decl_highlight = 1
autocmd BufNewFile,BufRead *.c,*.cpp,*.h let g:cpp_concepts_highlight = 1

" Dispatch
autocmd BufNewFile,BufRead *.c,*.cpp map <F5> :Make<cr>

" vim-clang-format
autocmd BufNewFile,BufRead *.h,*.c,*.cpp map <F3> :ClangFormat<cr>
" https://clang.llvm.org/docs/ClangFormatStyleOptions.html
let g:clang_format#style_options = {
				\ "BasedOnStyle": "Google",
				\ }
let g:clang_format#auto_format = 0
let g:clang_format#auto_format_on_insert_leave = 0



""""""""""""""""""""""""""""""""""""""""
" Arduino
""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile *.ino,*.pde nnoremap <F5> :!arduino-cli compile -u<cr>


""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""

" Syntastic with mypy
autocmd BufRead,BufNewFile *.py let g:syntastic_python_checkers=['mypy']

""" jedi-vim
autocmd BufNewFile,BufRead *.py let g:jedi#popup_on_dot = 0

" Indent Python in the Google way.
" https://github.com/google/styleguide/blob/gh-pages/google_python_style.vim
setlocal indentexpr=GetGooglePythonIndent(v:lnum)
let s:maxoff = 50 " maximum number of lines to look backwards.
function GetGooglePythonIndent(lnum)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif
  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)
endfunction
let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

""" Format with yapf
autocmd FileType python nnoremap <F3> :Black<cr>


""""""""""""""""""""""""""""""""""""""""
" HTML/Javascript
""""""""""""""""""""""""""""""""""""""""

""" json
autocmd FileType json syntax match Comment +\/\/.\+$+

""" Format
autocmd FileType html,javascript nnoremap <F5> :Prettier<cr>

" Host files
autocmd FileType html noremap <F5> :!python2 -m SimpleHTTPServer<cr>



""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""

" Spell check
autocmd BufRead,BufNewFile *.md set spell spelllang=en_us

" Highlight code inside Markdown
let g:markdown_fenced_languages = ['bash', 'javascript', 'c', 'cpp', 'html', 'python', 'sh']

""" vim-markdown-toc
let g:vmt_auto_update_on_save = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '\TOC'
let g:vmt_cycle_list_item_markers = 1

""" markdown-preview.nvim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = 'localhost'
let g:mkdp_port = 4444
let g:mkdp_browser = 'firefox'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }
let g:mkdp_page_title = '「${name}」'
autocmd BufNewFile,BufRead *.md nmap <F5> <Plug>MarkdownPreviewToggle



""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""

""" coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
		let col = col('.') - 1
		 return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"
else
		imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
endif

" Use `[e` and `]e` to navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <space>gd <Plug>(coc-definition)
nmap <space>gy <Plug>(coc-type-definition)
nmap <space>gi <Plug>(coc-implementation)
nmap <space>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <F1> :call <SID>show_documentation()<cr>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <F2>a  <Plug>(coc-codeaction-selected)
nmap <F2>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <F2>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select) " This breaks <c-i>
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <F2>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <F2>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <F2>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <F2>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <F2>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <F2>j  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <F2>k  :<C-u>CocPrev<cr>
" Resume latest coc list.
nnoremap <F2>p  :<C-u>CocListResume<cr>

""" coc-actions

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<cr>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<cr>g@

""" coc-markmap
command! -range=% Markmap CocCommand markmap.create <line1> <line2>

""" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

""" coc-snippets
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-space> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-expand-jump)

""" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

""" Misc
nnoremap <space>cs :CocSearch <C-r>=expand("<cword>")<cr><cr>



""""""""""""""""""""""""""""""""""""""""
" any-jump
""""""""""""""""""""""""""""""""""""""""

let g:any_jump_disable_default_keybindings = 1
let g:any_jump_list_numbers = 1
let g:any_jump_references_enabled = 1
let g:any_jump_grouping_enabled = 1
let g:any_jump_search_prefered_engine = 'rg'
nnoremap <space><space> :AnyJump<cr>
nnoremap <space><backspace> :AnyJumpLastResults<CR>



""""""""""""""""""""""""""""""""""""""""
" quick-scope
""""""""""""""""""""""""""""""""""""""""

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline



""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""

nnoremap <F4> :TagbarToggle<cr>



""""""""""""""""""""""""""""""""""""""""
" Tabular
""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>t= :Tabularize /=<cr>
nnoremap <leader>t: :Tabularize /:\zs<cr>
nnoremap <leader>t< :Tabularize /<<cr>
nnoremap <leader>t<< :Tabularize /<<<cr>
nnoremap <leader>t> :Tabularize /><cr>
nnoremap <leader>t>> :Tabularize />><cr>



""""""""""""""""""""""""""""""""""""""""
" git
""""""""""""""""""""""""""""""""""""""""

""" gitgutter
nnoremap <space>gu :GitGutterUndoHunk<cr>
nnoremap <space>gs :GitGutterStageHunk<cr>

noremap <leader>gf :GFiles<cr>
noremap <leader>gs :G<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gp :Gpush<cr>

""""" coc-git

" navigate chunks of current buffer
nmap gk <Plug>(coc-git-prevchunk)
nmap gj <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)



""""""""""""""""""""""""""""""""""""""""
" Files
""""""""""""""""""""""""""""""""""""""""

"""


""""""""""""""""""""""""""""""""""""""""
" Custom Commands and Key Bindings
""""""""""""""""""""""""""""""""""""""""

" Reload init.vim
command! -nargs=0 Reload :source $MYVIMRC

" I accidentlly type Wq a lot
command! -nargs=0 Wq :wq

" Y yanks to end of line
noremap Y y$

" ctrl-S now saves file
nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>a
vnoremap <C-s> <Esc>:w<cr>

" Reload init.vim
autocmd BufNewFile,BufRead init.vim noremap <F5> :source ~/.config/nvim/init.vim<cr>

" Moving between multiple files/windows
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l
noremap <A-S-h> <C-w>H
noremap <A-S-j> <C-w>J
noremap <A-S-k> <C-w>K
noremap <A-S-l> <C-w>L
noremap <A-C-h> <C-w><
noremap <A-C-j> <C-w>-
noremap <A-C-k> <C-w>+
noremap <A-C-l> <C-w>>
noremap <A-n> :next<cr>
inoremap <A-n> <Esc>:next<cr>
noremap <A-b> :previous<cr>
inoremap <A-b> <Esc>:previous<cr>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" ctrl-q to quit
nnoremap <A-q> :q<cr>
inoremap <A-q> <Esc>:q<cr>
vnoremap <A-q> <Esc>:q<cr>
nnoremap <A-s-q> :qa<cr>

" <C-y> yanks to system clipboard
nnoremap <C-y> "+yy
vnoremap <C-y> "+y

" <++> as a placeholder
nnoremap <C-space> /<++><cr>ca<

" Move between errors
"nnoremap ]e :lnext<cr>
"nnoremap [e :lprevious<cr>

" :terminal
tnoremap <C-space> <c-\><c-n>
