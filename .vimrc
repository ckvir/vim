"--------------------"
"     Vundle 設定    "
"--------------------"
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" 自定安裝的套件（開始）


"---- UI ----"
Plugin 'xcrooloose/nerdtree'               " 顯示目前目錄結構
Plugin 'majutsush/tagbar'                  " 顯示目前檔案函式、變數、巨集（取代 Taglist）
Plugin 'bling/vim-airline'                 " 顯示詳細下方狀態列
"Plugin 'altercation/vim-colors-solarized'  " 顯示詳細下方狀態列
"Plugin 'tomasr/molokai'              " 顯示目前游標加亮
"Plugin 'Yggdroot/indentLine'         " 顯示提示線（直的）


"---- Util ----"
Plugin 'kien/ctrlp.vim'                    " 按下 Ctrl+p 找檔案







" 自定安裝的套件（結束）
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
"--------------------"
"     套件設定       "
"--------------------"

"----NerdTree ----"
map <F2>      :NERDTreeToggle<cr>        "F2 開/關"
au  VimEnter * NERDTree                  "預設開啟NERDTree"
let NERDTreeWinPos="right"               "預設窗口在右邊"


"----Tagbar----"
au  VimEnter * Tagbar                    "預設開啟NERDTree"
nmap <F8>     :TagbarToggle<cr>          "F8 開/關"
let g:tagbar_left=1                      "預設窗口在左邊"
let g:tagbar_width=30                    "寬度 30"




"--------------------"
"     一般設定       "
"--------------------"
set ai                  "自動縮排"
set aw                  "自動存檔"
set hlsearch            "高亮度反白"
set backspace=2         "可隨時用倒退鍵刪除"
set number              "顯示行號"
set tabstop=4       
set shiftwidth=4        "Tab 4"     
set expandtab
set encoding=utf-8      "UTF8編碼"

"--------------------"
"       配色         "
"--------------------"
colorscheme Tomorrow-Night
set t_Co=256
"syntax on

"--------------------"
"       熱鍵         "
"--------------------"
map <F12> :call Do_CsTag()　"按下 F12 呼叫 Do_CsTag 方法：map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>"
imap ;; <Esc>

"--------------------"
"     自訂方法       "
"--------------------"
"此方法會建立 ctag 檔案，用來分析函式、變數等，需要在專案根目錄下執行"
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