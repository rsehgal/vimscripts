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
nnoremap f% : normal! yypd$i<Tab><Tab>for(unsigned int i = 0 ; i < 10 ; i++){}<Esc>==<cr>
nnoremap f^ : call Get_C_ForLoop()<cr>
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
nnoremap /  <Esc>^i//<Esc>
vnoremap cc <Esc>`>^xx<Esc>`<^xx<Esc>
vnoremap ; :call Get_visual_selection()<cr>

function! Get_C_ForLoop()
  "A function to automatically generated the a for loop using provided inputs
  let variable = input('Loop variable : ')
  let upperlimit = input('upper limit : ')
  execute "normal! yypd$i\<Tab>\<Tab>for(unsigned int ".variable." = 0 ; ".variable." < ".upperlimit." ; ".variable."++){}\<Esc>=="

endfunction

function! Get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  let selection = join(lines,'\n')
  let change = input('Change the selection with: ')
  execute ":%s/".selection."/".change."/gc"
endfunction
