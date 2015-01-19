set ai                  "自動縮排"
set aw                  "自動存檔"
set hlsearch            "高亮度反白"
set backspace=2         "可隨時用倒退鍵刪除"
set number              "顯示行號"
set softtabstop=4       "Tab 4"
set shiftwidth=4        "Tab 4"     
set encoding=utf-8 

"----熱鍵----"
map      <F4>     :q!<cr>                  "跳前一分頁"
inoremap jk       <ESC>
let mapleader="," 
map <F12> :call Do_CsTag()
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>"
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

"----配色----"
colorscheme wombat256
set t_Co=256
syntax on




"--------------------"
"                    "
"       外掛         "
"                    "
"--------------------"

"----Tagbar----"
"取代Taglist,用來顯示檔案內的變數,方法,屬性,etc...
nmap <F8>         :TagbarToggle<cr>
let g:tagbar_left=1


"----NerdTree ----"
au  VimEnter * NERDTree                  "預設開啟NERDTree"
let NERDTreeWinPos="right"               "預設窗口在右邊"
map <F2>      :NERDTreeToggle<cr>        "案F2開/關 NERDTreeToggle"


"----Taglist的設置 ----"
map <F3> :silent! Tlist<CR>      "按下F3就可以呼出了
let Tlist_Ctags_Cmd='ctags'      "因為我們放在環境變量裡，所以可以直接執行
let Tlist_Use_Right_Window=0     "讓窗口顯示在右邊，0的話就是顯示在左邊
let Tlist_Show_One_File=0        "讓taglist可以同時展示多個文件的函數列表，如果想只有1個，設置為1
let Tlist_File_Fold_Auto_Close=1 "非當前文件，函數列表摺疊隱藏
let Tlist_Exit_OnlyWindow=1      "當taglist是最後一個分割窗口時，自動推出vim
let Tlist_Process_File_Always=0  "是否一直處理tags.1:處理;0:不處理。不是一直實時更新tags，因為沒有必要
let Tlist_Inc_Winwidth=0

"--------------------"
"                    "
"     自訂方法       "
"                    "
"--------------------"
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction


