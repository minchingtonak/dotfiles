call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'drewtempelmeyer/palenight.vim'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

call plug#end()

"Enable true colors
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set number
set laststatus=2
set noshowmode
set background=dark
colorscheme palenight
" Lightline config for palenight
let g:lightline = {
	\ 'colorscheme': 'palenight',
	\ 'palenight_terminal_italics': 1,
	\ }
" Italics for my favorite color scheme
"let g:palenight_terminal_italics=1
map ; :
noremap ;; ;
map <C-O> :NERDTreeToggle<CR>
inoremap {<CR> {<CR><BS>}<Esc>ko
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" vimplug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycmconf.py'
