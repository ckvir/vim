"*************************
"  目前所有設定熱鍵  
"                  
"  F1     : 新增分頁
"  F2     : 關閉分頁
"  F3     : 上一個分頁
"  F4     : 下一個分頁
"  F12    : 在專案跟目錄下建立 Ctags 和 Cscope 檔案（nMode）
"                  
"  w/b    : 移動一個單字
" 
"  jj     : 取代 <Esc>（iMode） 
"  rr     : 重新讀取 vimrc 設定
"  <C-n>  : 切換行數的顯示方式（nMode）
"  <S-h>  : 切換視窗（nMode）
"  <S-j>  : 切換視窗（nMode）
"  <S-k>  : 切換視窗（nMode）
"  <S-l>  : 切換視窗（nMode）
"  <S-q>  : 快速關閉 VIM，不存檔（nMode）
"  <S-f>  : 翻下一頁
"  <S-d>  : 翻上一頁
"  <Tab>l : 移到行最後（nMode）
"*************************


"*************************
"      全域設定    
"*************************
let g:user_emmet_leader_key = '<tab>'             " 加上這行才能讓 Tab 變為快捷鍵


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
Plugin 'Lokaltog/vim-easymotion'                  " 按下 Ctrl+p 找檔案




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
"map <F2>      :NERDTreeToggle<cr>                "（X）  F2 開/關
au  VimEnter * NERDTree                           " 預設開啟 NERDTree
au  BufEnter * NERDTreeMirror                     " 開啟新分頁時自動開啟 NERDTree
let NERDTreeWinPos="right"                        " 預設窗口在右邊 
let g:NERDTreeIgnore=[
\    '\.o$',
\    '\.P$',
\    '\.exe$',
\    '\.map$']                                    " 不顯示'*.o,*.P,*.map'檔案 


"---- Tagbar ----"
"nmap <F1>     :TagbarToggle<cr>                  " （X） F1 開/關
au  VimEnter * Tagbar                             " 預設開啟 Tagbar
au  BufEnter * nested :call tagbar#autoopen(0)    " 開啟新分頁時自動開啟 Tagbar
let g:tagbar_left=1                               " 預設窗口在左邊
let g:tagbar_width=30                             " 寬度 30
"let g:tagbar_show_linenumbers=1                  "（X） 顯示絕對行號
"let g:tagbar_expend=1                            "（X） 自動 GUI 視窗
set updatetime=100                                " 根據游標位置更新 tagbar 反白間隔時間，時間為毫秒


"---- Vim-easymotion ----"
let g:EasyMotion_leader_key='f'                   " 啟動熱鍵（fs：找字，fe：游標以下每行最前，fj：游標以下每個單字最後）



"---- Cscope ----"
" c: Find functions calling this function
" d: Find functions called by this function
" e: Find this egrep pattern
" f: Find this file
" g: Find this definition
" i: Find files #including this file
" s: Find this C symbol
" t: Find this text string
"----------------"
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F5>   :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F6>   <C-]>





"*************************
"        一般設定       
"*************************
set ic                                            " 搜尋忽略大小寫
set history=300                                   " 存放最大指令數
set cursorline                                    " 記住游標所在列
set ruler                                         " 記住游標所在座標
set hlsearch                                      " 搜尋到的文字反白
set backspace=2                                   " Insert Mode 可用倒退鍵刪除
set encoding=utf-8                                " UTF8編碼
set fenc=utf-8                                    " UTF8編碼
set ai                                            " 自動縮排
set aw                                            " 自動存檔
set nu                                            " 顯示行號
set mouse=nv                                      " 讓滑鼠可以拉動視窗

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
nnoremap <F12> :call CreateDB()<CR>　             " 按下 F12 呼叫 create_cscope_and_ctags()
nnoremap <C-n> :call NumberToggle()<CR>           " 切換行數的顯示方式
nnoremap <S-q> :wqa<CR>                           " 快速關閉 VIM，不存檔
nnoremap rr    :so $MYVIMRC<CR>                   " 重新讀取 vimrc 設定
nnoremap <Tab>l <ESC>$<right>                     " 移到行最後，如果要移完並插入模式改成 <esc>$i<right>
nnoremap <S-f>  <C-f>                             " 翻下一頁
nnoremap <S-d>  <C-b>                             " 翻上一頁



"---- 切換視窗 ----"
nnoremap <S-h> <C-w>h 
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-l> <C-w>l

imap jj <Esc>                                     
":nohl                                            "（X）消搜尋反白


"---- 分頁 ----"
"<leader> 代表 '\'
map <leader>fp :echo expand('%:p')<CR>            " \fp（fullPath） : 顯示完整路徑
map <F1> :tabnew<CR>                              " F3  : 新增一個分頁
map <F2> :tabclose<CR>                            " F4  : 關閉一個分頁
noremap <F3> gT                                   " F5  : 上一個分頁
noremap <F4> gt                                   " F6  : 下一個分頁

"*************************
"        自訂方法       
"*************************
" 建立 ctag 和 cscope 檔案，用來分析函式、變數等，在專案根目錄下執行
if !exists("*CreateDB")
    function CreateDB()
        echohl WarningMsg | echom 'Execute Create Database!' | echohl None
        call inputsave()
        let buildnow = input('Would you want to build an new DB?(y/N)')
        if toupper(buildnow) == 'Y'
            silent !echo 'Execute Cscope and Ctags now,Please Wait...'
            silent !find ./ -name '*.aidl' -o -name '*.cc' -o -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.py' > 'cscope.files'
            silent !cscope -Rbq -i 'cscope.files'
            silent !ctags -R --exclude=.svn --exclude=.git --c++-kinds=+p --fields=+iaS --extra=+q .
        endif
    endfunction
endif

" 改變行數顯示方式
if !exists("*NumberToggle")
    function NumberToggle()
        if(&relativenumber == 1)
            set rnu!
        else
            set rnu
        endif
    endfunction
endif