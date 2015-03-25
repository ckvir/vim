"***************************************
" 目前所有設定熱鍵 
" <L>               : Leader Key = ','
"
"  --------------自訂熱鍵---------------
"  F1               : 找被誰呼叫
"  F2               : 找定義                
"  F3               : 找此函式中呼叫的函式
"  F5               : 新增分頁
"  F6               : 關閉分頁
"  F7               : 上一個分頁
"  F8               : 下一個分頁
"  F9               : 編譯執行 
"  F12              : 在專案跟目錄下建立 Ctags 和 Cscope 檔案（nMode）
"  jj               : 取代 <Esc>（iMode） 
"  rr               : 重新讀取 vimrc 設定
"  <L>n             : 切換行數的顯示方式（nMode）
"  <L>0             : 移到行最後（nMode）
"  <L>mm            : 看書籤
"  <L>rr            : 看暫存器
"  <L>g             : 看搜尋結果（要先用 Cscope 's'搜尋才有用）
"  <L>f             : 找下一個搜尋結果
"  <L>d             : 找上一個搜尋結果
"  <Tab>h           : 切換視窗（nMode）
"  <Tab>j           : 切換視窗（nMode）
"  <Tab>k           : 切換視窗（nMode）
"  <Tab>l           : 切換視窗（nMode）
"  <Tab>5           : Junp 括號
"  <S-q>            : 快速關閉 VIM，不存檔（nMode）
"  <S-f>            : 翻下一頁
"  <S-d>            : 翻上一頁
"
"  --------------預設熱鍵---------------
"  i/a/o            : 插入前/後/下一行
"  [[/]]            : 函式開頭/下一個函式開頭
"  cw               : 刪除一單字
"  cc               : 刪除一行（並進入插入模式）
"  dw               : 刪除單字（也會刪除單字後面空白）
"  de               : 刪除單字（不會刪除單字後面空白）
"  dd               : 刪除一行（下行會往上移）
"  D                : 刪除游標後（等於 d$）
"  x                : 刪除一字元
"  r/R              : 取代一字/取代到按 Esc
"  ~                : 轉換大小寫
"  p/P              : 貼上游標之後/之前
"  .                : 重複動作
"  J                : 兩行合併
"  H/M/L            : 移動到螢幕的上/中/下
"  w/b              : 移動一個單字開頭
"  e/E              : 移動一個單字結尾
"  "ayy             : 複製到 a reg 
"  "ap              : 貼上   a reg 
"  :reg             : 看 reg 
"  */#              : 搜尋游標所在單字 
"  g*/g#            : 搜尋游標所在單字，部分符合
"  mx               : 標記書籤
"  `x/'x            : 回到書籤
"  :marks           : 觀看書籤
"  :ver             : 觀看設定
"  :!cmd            : 執行 cmd 指令
"  :set tags=mytag  : 設定 tag 位置
"
"  ----------------Map------------------
"  vmap             : 反白膜式
"  nmap             : 一般模式
"  imap             : 插入模式
"  omap             : 操作模式
"  cmap             : 命令模式
"  map              : 一般/反白
"  map!             : 插入/命令
"***************************************

"***************************************
"              全域設定    
"***************************************
"let g:user_emmet_leader_key = '<tab>'                            "（X）加上這行才能讓 Tab 變為快捷鍵
let mapleader = ','

"***************************************
"              Vundle 設定    
"***************************************
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" 自定安裝的套件（開始）

"【 UI 】"
Plugin 'xcrooloose/nerdtree'                                     " 顯示目前目錄結構
Plugin 'jistr/vim-nerdtree-tabs'                                 " 加強 Nerdtree（要先安裝 Nerdtree）
Plugin 'majutsush/tagbar'                                        " 顯示目前檔案函式、變數、巨集（取代 Taglist）
Plugin 'bling/vim-airline'                                       " 顯示詳細下方狀態列
"Plugin 'tomasr/molokai'                                         "（X）顯示目前游標加亮
"Plugin 'Yggdroot/indentLine'                                     " 顯示提示線（直的）
"Plugin 'Shougo/unite.vim'                                        " 查找檔案



"【 Util 】"
"Plugin 'kien/ctrlp.vim'                                          " 按下 Ctrl+p 找檔案
"Plugin 'Lokaltog/vim-easymotion'                                 " 快速移動
"Plugin 'jlanzarotta/bufexplorer'                                 " 管理 Buff



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


"***************************************
"              套件設定       
"***************************************
"【 NerdTree 】"
" o  : 開關資料夾（和 Enter 一樣）
" p/P: 到上層目錄/到根目錄
" K/J: 同層目錄最上/下
" m  : 顯示 MENU（a:新增檔案）
"--------------------------------------"
"map <F2>      :NERDTreeToggle<CR>                               "（X）F2 開/關
"au  VimEnter * NERDTree                                         "（X）預設開啟 NERDTree
"au  BufEnter * NERDTreeMirror                                   "（X）開啟新分頁時自動開啟 NERDTree
let NERDTreeWinPos="right"                                       " 預設窗口在右邊 
let g:NERDTreeIgnore=[
\    '\.a$',
\    '\.bz2$',
\    '\.exe$',
\    '\.files$',
\    '\.gz$',
\    '\.ko$',
\    '\.map$',
\    '\.out$',
\    '\.o$',
\    '\.P$',
\    '\.patch$',
\    '\.xz$']                                                   " 不顯示檔案 

"【 NerdTree-Tab】"
" 強化 NerdTree，需要先安裝 NerdTree
"--------------------------------------"
au  VimEnter * NERDTreeTabsToggle                                " 預設開啟 NerdTree-Tab
let g:nerdtree_tabs_open_on_console_startup=1                    " 開啟新分頁時自動開啟 NerdTree-Tab


"【 Tagbar 】"
"nmap <F1>     :TagbarToggle<CR>                                 "（X）F1 開/關
au  VimEnter * Tagbar                                            " 預設開啟 Tagbar
au  BufEnter * nested :call tagbar#autoopen(0)                   " 開啟新分頁時自動開啟 Tagbar
let g:tagbar_left=1                                              " 預設窗口在左邊
let g:tagbar_width=30                                            " 寬度 30
"let g:tagbar_show_linenumbers=1                                 "（X）顯示絕對行號
"let g:tagbar_expend=1                                           "（X）自動 GUI 視窗
set updatetime=100                                               " 根據游標位置更新 tagbar 反白間隔時間，時間為毫秒

"【 Vim-easymotion 】"
let g:EasyMotion_leader_key='f'                                  " 啟動熱鍵（fs：找字，fe：游標以下每行最前，fj：游標以下每個單字最後）


"【 Cscope 】"
" c: 查找呼叫此函式
" g: 查找定義此函式/變數
" d: 查找此函式有呼叫的函式
" s: 查找所有定義和呼叫（等於 c+g）
" e: 查找此字串以 egrep 搜尋（命令列較適合）
" f: 查找並開檔（命令列較適合）
" i: 查找列出 include 此檔的檔案（命令列較適合）
" t: 查找所有此字串出現的地方，包含註解（命令列較適合）
"--------------------------------------"
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <F1>        :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F2>        :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F3>        :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>1   :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>2   :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>3   :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>4   :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>5   :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>6   :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>7   :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>8   :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f   :cn<CR>                                         " 找下一個搜尋結果
nmap <leader>d   :cp<CR>                                         " 找上一個搜尋結果
nmap <leader>g   :botright copen 15<CR>                          " 打開搜尋結果
nmap <Tab>t <C-o>

"【 Bufexplorer 】"
" nmap <silent> <F9>   :BufExplorer<CR>                            " 開啟 BufExplorer

"【 Unite 】"
" 搜尋檔案時要先進入 Insert Mode
" 找到檔案後在進入 Normal Mode 選檔案
"--------------------------------------"
nmap <leader>b       :Unite file buffer<CR>
nmap <leader>f       :Unite -start-insert file_rec<CR>


"***************************************
"              一般設定       
"***************************************
set ic                                                           " 搜尋忽略大小寫
set history=300                                                  " 存放最大指令數
set cursorline                                                   " 記住游標所在列
set ruler                                                        " 記住游標所在座標
set hlsearch                                                     " 搜尋到的文字反白
set backspace=2                                                  " Insert Mode 可用倒退鍵刪除
set encoding=utf-8                                               " UTF8 編碼
set fenc=utf-8                                                   " UTF8 編碼
set ai                                                           " 自動縮排
set aw                                                           " 自動存檔
set nu                                                           " 顯示行號
set mouse=nv                                                     " 讓滑鼠可以拉動視窗
"set bk                                                          " （X）更改檔案會備份 
set incsearch                                                    " 邊輸入關鍵字邊搜尋
set scrolloff=3                                                  " 保持上下三行


"【 說明 】"
" Space 代替 Tab       "
" Tab 寬度/縮排 4 空格 "
"----------------------"
set tabstop=4   
set cindent shiftwidth=4
set autoindent shiftwidth=4
set expandtab
"----------------------"
"set foldmethod=indent                                           "（X）預設不折疊
"set foldlevelstart=99                                           "（X）
"set autoread                                                    "（X）其他程式修改檔案時會自動重新讀取"

"***************************************
"              配色         
"***************************************
colorscheme Tomorrow-Night                                       " 選擇樣式　　　
set t_Co=256                                                     " 開啟顏色
syntax on                                                        " 語法上色

"***************************************
"              熱鍵         
"***************************************       　                           
nmap <F12>               :call CreateDB()<CR>　                  " 建立 ctags
nmap <silent> rr         :so $MYVIMRC<CR>                        " 重新讀取 vimrc                                  
nmap <silent> <leader>n  :call NumberToggle()<CR>                " 切換行數的顯示方式
nmap <leader>0           <ESC>$<right>                           " 移到行最後
nmap <leader>fp          :echo expand('%:p')<CR>                 " 顯示完整路徑
nmap <leader>mm          :marks<CR>
nmap <leader>rr          :reg<CR>
nmap <S-f>               <C-f>                                   " 翻下一頁
nmap <S-d>               <C-b>                                   " 翻上一頁
nmap <silent> <S-q>      :wqa<CR>                                " 關閉 VIM，不存檔
nmap <Tab>5              %
imap jj                  <Esc>
nmap <F9>                :w<CR> :!gcc % -o %< && ./%< <CR>       " 編譯執行

"【 切換視窗 】"
nmap <Tab>h <C-w>h
nmap <Tab>j <C-w>j
nmap <Tab>k <C-w>k
nmap <Tab>l <C-w>l

"【 分頁 】"
nmap <F5> :tabnew<CR>
nmap <F6> :tabclose<CR>
nmap <F7> gT
nmap <F8> gt

"***************************************
"              自訂方法       
"***************************************
"--------------------------------------"
" 建立 ctag ,cscope 檔案，用來分析函式
" 變數等，在專案根目錄下執行
"--------------------------------------"
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

"--------------------------------------"
" 改變行數顯示方式
"--------------------------------------"
if !exists("*NumberToggle")
    function NumberToggle()
        if(&relativenumber == 1)
            set rnu!
        else
            set rnu
        endif
    endfunction
endif

"--------------------------------------"
" 只有游標在 QuickFix 視窗中才可使用
"--------------------------------------"
augroup MyQFCommand
au!
au FileType qf nmap <buffer> <CR> <CR><C-W>j                     " 選擇檔案後還是停留在 QF
au FileType qf nmap <silent> qq   :q<CR><C-W>l                   " 按下 qq 關閉 QF 游標回到主視窗
augroup END

"--------------------------------------"
" 自動搜尋 Cscope DB
" 不需要在 Cscope 目錄下開啟 Vim
"--------------------------------------"
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()


