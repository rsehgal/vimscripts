autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=red
syntax on
set showcmd
nnoremap mu : normal! yypVr=<cr>
nnoremap l= : normal! yypd$i<Tab><Tab>std::cout << "======================================" << std::endl;<Esc><cr>
nnoremap l* : normal! yypd$i<Tab><Tab>std::cout << "**************************************" << std::endl;<Esc><cr>
nnoremap l@ : normal! yypd$i<Tab><Tab>std::cout << "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" << std::endl;<Esc><cr>
nnoremap l! : normal! yypd$i<Tab><Tab>std::cout << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" << std::endl;<Esc><cr>
nnoremap l- : normal! yypd$i<Tab><Tab>std::cout << "--------------------------------------" << std::endl;<Esc><cr>
nnoremap l# : normal! yypd$i<Tab><Tab>std::cout << "######################################" << std::endl;<Esc><cr>
nnoremap l. : normal! yypd$i<Tab><Tab>std::cout << "......................................" << std::endl;<Esc><cr>
nnoremap l+ : normal! yypd$i<Tab><Tab>std::cout << "++++++++++++++++++++++++++++++++++++++" << std::endl;<Esc><cr>
nnoremap l$ : normal! yypd$i<Tab><Tab>std::cout << "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" << std::endl;<Esc><cr>
nnoremap l^ : normal! yypd$i<Tab><Tab>std::cout << "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" << std::endl;<Esc><cr>
nnoremap l% : normal! yypd$i<Tab><Tab>std::cout << "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" << std::endl;<Esc><cr>
nnoremap com : normal! `ai/*<Esc>`bi*/<cr>
nnoremap ucom : normal! `a<Del><Del>`b<Del><Del><cr>
inoremap jh <Esc>
nnoremap w :w<cr> 
nnoremap wq :wq<cr> 
nnoremap jhwq <Esc>:wq<cr> 
nnoremap jhq <Esc>:q!<cr>
nnoremap ; : normal! $A;<cr> 
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap "      ""<Left>
inoremap /*	/**/<Left><Left>
vnoremap bc <Esc>`>a*/<Esc>`<i/*<Esc>
nnoremap bc <Esc>^i/*<Esc>$i*/<Esc>
nnoremap c^  <Esc>^i//<Esc>
vnoremap cc <Esc>`>^xx<Esc>`<^xx<Esc>

function FormatBuffer()
  ""if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
  if !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()

