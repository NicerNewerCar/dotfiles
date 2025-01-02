colorscheme industry

" Turn on hybrid line numbers
set number relativenubers
set nu rnu

" Netrw settings
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'  " Keep line numbers on
let g:netrw_listsystle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_atlv = 1
let g:netrw_winsize = 15

" Max :Vex to Ctrl-N
map <C-N> :Vex<CR>

" If netrw is the only buffer open quit
aug netrw_close
  au!
  au WinEnter * if if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
aug END

" Close netrw after opening file
let g:netrw_fastbrowse = 0
autocmd FileType netrw setl bufhidden=wipe

function! CloseNetrw() abort
  for bufn in range(1, bufnr('$'))
    if bufexists(bufn) && getbufvar(bufn, '&filetype') ==# 'netrw'
      silent! execute 'bwipeout ' . bufn
      if getline(2) =~# '^" Netrw '
        silent! bwipeout
      endif
      return
    endif
  endfor
endfunction

augroup closeOnOpen
  autocmd!
  autocmd BufWinEnter * if getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|call CloseNetrw()|endif
aug END

" Set bottom ruler
set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P

set showcmd
set showmode

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

set nohlsearch

set spell spelllang=en_us

" Display tab index, filename, and modified status on tab
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let wn = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebufferlist(i)
      let winnr = tabpagewinr(i)

      let s .= '%' . i . 'T'
      let s .= (i==t ? '%1*' : '%2*')
      let s .= ' '

      let wn = tabpagewinnr(i,'$')

      let s .= '%#TabNum#'
      let s .= i
      let s .= (i==t ? '%#TabLineSel#' : '%#TabLine#')

      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      let bufmod = getbufvar(bufnr, '&modified')

      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitudte(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif

      if file == ''
        let file = '[No Name]'
      endif

      if bufmod
        let file .= ' +'
      endif

      let s .= ' ' . file . ' '
      let i = i + 1
    endwhile

    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction

  set stal=2
  set tabline=%!MyTabLine()
  set showtabline=1
  highlight link TabNum Special
endif
