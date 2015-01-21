"*************************
"  目前所有設定熱鍵  
"                  
"  F1  : Tagbar   開關
"  F2  : NERDTree 開關
"  F3  : 新增分頁
"  F4  : 關閉分頁
"  F5  : 上一個分頁
"  F6  : 下一個分頁
"  F12 : 在專案跟目錄下建立 Ctags 檔案
"*************************


"*************************
"      Vundle 設定    
"*************************
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" 自定安裝的套件（開始）


"---- UI ----"
Plugin 'xcrooloose/nerdtree'                      " 顯示目前目錄結構
Plugin 'majutsush/tagbar'                         " 顯示目前檔案函式、變數、巨集（取代 Taglist）
Plugin 'bling/vim-airline'                        " 顯示詳細下方狀態列
"Plugin 'altercation/vim-colors-solarized'        "（X）顯示詳細下方狀態列
"Plugin 'tomasr/molokai'                          "（X）顯示目前游標加亮
"Plugin 'Yggdroot/indentLine'                     "（X）顯示提示線（直的）

"---- Util ----"
Plugin 'kien/ctrlp.vim'                           " 按下 Ctrl+p 找檔案



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


"*************************
"        套件設定       
"*************************

"---- NerdTree ----"
map <F2>      :NERDTreeToggle<cr>                 " F2 開/關
au  VimEnter * NERDTree                           " 預設開啟 NERDTree
au  BufEnter * NERDTreeMirror                     " 開啟新分頁時自動開啟 NERDTree
let NERDTreeWinPos="right"                        " 預設窗口在右邊 


"---- Tagbar ----"
nmap <F1>     :TagbarToggle<cr>                   " F1 開/關"
au  VimEnter * Tagbar                             " 預設開啟 Tagbar
au  BufEnter * nested :call tagbar#autoopen(0)    " 開啟新分頁時自動開啟 Tagbar
let g:tagbar_left=1                               " 預設窗口在左邊
let g:tagbar_width=30                             " 寬度 30
"let g:tagbar_show_linenumbers=1                  "（X） 顯示絕對行號
"let g:tagbar_expend=1                            "（X） 自動 GUI 視窗
set updatetime=100                                " 根據游標位置更新 tagbar 反白間隔時間，時間為毫秒


"*************************
"        一般設定       
"*************************
set ic                                            " 搜尋忽略大小寫
set history=1000                                  " 存放最大指令數
set cursorline                                    " 記住游標所在列
set ruler                                         " 記住游標所在座標
set hlsearch                                      " 搜尋到的文字反白
set backspace=2                                   " Insert Mode 可用倒退鍵刪除
set encoding=utf-8                                " UTF8編碼
set fenc=utf-8                                    " UTF8編碼
set ai                                            " 自動縮排
set aw                                            " 自動存檔
set number                                        " 顯示行號
set mouse=nv                                      

"----------------------"
" Space 代替 Tab       "
" Tab 寬度/縮排 4 空格 "
"----------------------"
set tabstop=4   
set cindent shiftwidth=4
set autoindent shiftwidth=4
set expandtab
"----------------------"
"set foldmethod=indent                            "（X）預設不折疊
"set foldlevelstart=99                            "（X）
"set autoread                                     "（X）其他程式修改檔案時會自動重新讀取"

"*************************
"          配色         
"*************************
colorscheme Tomorrow-Night                        " 選擇樣式　　　
set t_Co=256                                      " 開啟顏色
syntax on                                         " 語法上色

"*************************
"          熱鍵         
"*************************
"map <F12> :call Do_CsTag()　 "按下 F12 呼叫 Do_CsTag 方法：map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>"
map <F12> :call Do_Cscope()　"按下 F12 呼叫 Do_CsTag 方法：map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>"
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
imap ;; <Esc>
":nohl                                            "（X）消搜尋反白


"---- 分頁 ----"
"<leader> 代表 '\'
map <leader>tn :tabnew<CR>                        " \tn : 新增一個分頁" 
map <leader>tc :tabclose<CR>                      " \tc : 關閉一個分頁" 
map <leader>fp :echo expand('%:p')<CR>            " \fp（fullPath） : 顯示完整路徑" 
map <F3> :tabnew<CR>                              " F3  : 新增一個分頁" 
map <F4> :tabclose<CR>                            " F4  : 關閉一個分頁" 
noremap <F5> gT                                   " F5  : 上一個分頁" 
noremap <F6> gt                                   " F6  : 下一個分頁" 

"*************************
"        自訂方法       
"*************************
"此方法會建立 ctag 檔案，用來分析函式、變數等，需要在專案根目錄下執行"
function Do_Cscope()
        echohl WarningMsg | echom 'Execute Create Database!' | echohl None
        call inputsave()
        let buildnow = input('Would you want to build an new DB?(y/N)')
        if toupper(buildnow) == 'Y'
            silent !echo 'Execute Cscope and Ctags now,Please...'
            silent !find ./ -name '*.aidl' -o -name '*.cc' -o -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.py' > 'cscope.files'
            silent !cscope -Rbq -i 'cscope.files'
            silent !ctags -R --exclude=.svn --exclude=.git --c++-kinds=+p --fields=+iaS --extra=+q .    
            echohl Title | echom 'Build new Database success' | echohl None
        endif
endfunction


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