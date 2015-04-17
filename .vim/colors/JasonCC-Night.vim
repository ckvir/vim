" JasonCC Night ��� Tomorrow Night-http://chriskempson.com


" ���C��]�w
"/****************************************************************************************                                                                 
" @ foreground                                    �G ��
" @ background                                    �G �L��
" @ selection                                     �G ��
" @ line                                          �G �L��
" @ comment                                       �G ��
" @ aqua                                          �G ����
" @ blue                                          �G ����
" @ purple                                        �G �L��
" ***************************************************************************************/
let s:foreground  = "c5c8c6"
let s:background  = "1d1f21"
let s:selection   = "373b41"
let s:line        = "282a2e"
let s:comment     = "969896"
let s:red         = "cc6666"
let s:orange      = "de935f"
let s:yellow      = "f0c674"
let s:green       = "b5bd68"
let s:aqua        = "8abeb7"
let s:blue        = "81a2be"
let s:purple      = "b294bb"
let s:window      = "4d5057"

" JasonCC �ۭq�C��
let s:jcomment    = "367FC9"
let s:jstatement  = "FF0000"
let s:jstrbg      = "FFD787"
let s:jstrfg      = "000000"
let s:jspecfg     = "911423"
let s:jpreprocfg  = "5ADFAF"
let s:jtypefg     = "81C7EB"
let s:jincludefg  = "008200"
let s:jstorclassfg= "C280C2"
let s:jfuncfg     = "87AFD7"
let s:jblack      = "000000"




" Console 256 �C��
if !has("gui_running")
  let s:background  = "303030"
  let s:window      = "5e5e5e"
  let s:line        = "3a3a3a"
  let s:selection   = "585858"
end


" �C�⭫�s�Ұ�
hi clear
syntax reset
let g:colors_name = "JasonCC-Night"



if has("gui_running") || &t_Co == 88 || &t_Co == 256

  " grey_number ��k�u�b�� Script ���ġ]<SID>�^
  fun <SID>grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " �^�ǹ�ڪ��Ƕ� Level
  fun <SID>grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " Returns the palette index for the given grey index
  fun <SID>grey_colour(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " Returns an approximate colour index for the given colour level
  fun <SID>rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
      if a:x < 75
        return 0
      else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " Returns the actual colour level for the given colour index
  fun <SID>rgb_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 139
      elseif a:n == 2
        return 205
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 55 + (a:n * 40)
      endif
    endif
  endfun

  " Returns the palette index for the given R/G/B colour indices
  fun <SID>rgb_colour(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " Returns the palette index to approximate the given R/G/B colour levels
  fun <SID>colour(r, g, b)
    " Get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " Get the closest colour
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " There are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " Use the grey
        return <SID>grey_colour(l:gx)
      else
        " Use the colour
        return <SID>rgb_colour(l:x, l:y, l:z)
      endif
    else
      " Only one possibility
      return <SID>rgb_colour(l:x, l:y, l:z)
    endif
  endfun

  " �^�� 'rrggbb' hex �r��
  fun <SID>rgb(rgb)
    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

    return <SID>colour(l:r, l:g, l:b)
  endfun

  " ��k X �A�]�w���G
  fun <SID>X(group, fg, bg, attr)
  
    if a:fg != ""
      exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
    endif
    
    if a:bg != ""
      exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
    endif
    
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
    
  endfun

"/****************************************************************************************   
"�i Vim Highlighting �j                                                                
" @ Normal                                        �G �@��Ҧ�
" @ LineNr                                        �G ���
" @ NonText                                       �G �S��r���ϰ�
" @ SpecialKey                                    �G ��ܩw�q�ѼƦ�m
" @ Search                                        �G �j�M���G
" @ TabLine                                       �G
" @ TabLineFill                                   �G
" @ StatusLine                                    �G
" @ StatusLineNC                                  �G
" @ VertSplit                                     �G ���ε����u
" @ Visual                                        �G ������A
" @ Directory                                     �G �ؿ�
" @ ModeMsg                                       �G �̩��U�����A�C
" @ MoreMsg                                       �G
" @ Question                                      �G
" @ WarningMsg                                    �G
" @ MatchParen                                    �G ��Цb�A���W
" @ Folded                                        �G
" @ FoldColumn                                    �G
" @ CursorLine                                    �G ��ЩҦb�C���I��
" @ CursorColumn                                  �G
" @ PMenu                                         �G
" @ PMenuSel                                      �G
" @ SignColumn                                    �G
" ***************************************************************************************/  
  call <SID>X("Normal"        , s:foreground  , s:background  , "")
  call <SID>X("LineNr"        , s:selection   , ""            , "")
  call <SID>X("NonText"       , s:selection   , ""            , "")
  call <SID>X("SpecialKey"    , s:selection   , ""            , "")
  call <SID>X("Search"        , s:background  , s:yellow      , "")
  call <SID>X("TabLine"       , s:window      , s:foreground  , "reverse")
  call <SID>X("TabLineFill"   , s:window      , s:foreground  , "reverse")
  call <SID>X("StatusLine"    , s:window      , s:yellow      , "reverse")
  call <SID>X("StatusLineNC"  , s:window      , s:foreground  , "reverse")
  call <SID>X("VertSplit"     , s:window      , s:window      , "none")
  call <SID>X("Visual"        , ""            , s:selection   , "") 
  call <SID>X("Directory"     , s:blue        , ""            , "")
  call <SID>X("ModeMsg"       , s:green       , ""            , "")
  call <SID>X("MoreMsg"       , s:green       , ""            , "")
  call <SID>X("Question"      , s:green       , ""            , "")
  call <SID>X("WarningMsg"    , s:red         , ""            , "")
  call <SID>X("MatchParen"    , ""            , s:selection   , "") 
  call <SID>X("Folded"        , s:comment     , s:background  , "")
  call <SID>X("FoldColumn"    , ""            , s:background  , "")
  if version >= 700
    call <SID>X("CursorLine"  , ""            , ""            , "none")
    call <SID>X("CursorColumn", ""            , s:line        , "none")
    call <SID>X("PMenu"       , s:foreground  , s:selection   , "none")
    call <SID>X("PMenuSel"    , s:foreground  , s:selection   , "reverse")
    call <SID>X("SignColumn"  , ""            , s:background  , "none")
  end 
  if version >= 703
    call <SID>X("ColorColumn" , ""            , s:line        , "none")
  end 
  

"/****************************************************************************************   
"�i �з� Highlighting �j                                                                
" @ Comment                                       �G ����
" @ Todo                                          �G 
" @ Title                                         �G 
" @ Identifier                                    �G 
" @ Statement                                     �G return
" @ Conditional                                   �G if                     �]X�^
" @ Repeat                                        �G for , while            �]X�^
" @ Structure                                     �G struce,enum
" @ Function                                      �G struce,enum            �]X�^
" @ Constant                                      �G string,null
" @ Keyword                                       �G null
" @ String                                        �G string
" @ Special                                       �G %d,\n
" @ PreProc                                       �G #if #endif
" @ Operator                                      �G 
" @ Type                                          �G int                    �]X�^
" @ Define                                        �G 
" @ Include                                       �G include
" @ Ignore                                        �G 
" @ PmenuSel                                      �G Pop Window�]�襤�^ 
" @ TabLineSel                                    �G Tab �����襤�C��
" ***************************************************************************************/    
  call <SID>X("Comment"     , s:comment     , ""          , "")
  call <SID>X("Todo"        , s:comment     , s:background, "")
  call <SID>X("Title"       , s:comment     , ""          , "")
  call <SID>X("Identifier"  , s:red         , ""          , "none")
  call <SID>X("Statement"   , s:red         , ""          , "")
  "call <SID>X("Conditional"  , s:red         , ""          , "")
  "call <SID>X("Repeat"     , s:red         , ""          , "")
  call <SID>X("Structure"   , s:purple      , ""          , "")
  "call <SID>X("Function"   , s:blue        , ""          , "")
  call <SID>X("Constant"    , s:orange      , ""          , "")
  call <SID>X("Keyword"     , s:orange      , ""          , "")
  call <SID>X("String"      , s:jstrbg      , ""    			, "")
  call <SID>X("Special"     , s:jstrbg      , ""    			, "bold")
  call <SID>X("PreProc"     , s:jpreprocfg  , ""          , "")
  call <SID>X("Operator"    , s:aqua        , ""          , "none")
  "call <SID>X("Type"       , s:jtypefg     , ""          , "none")
  call <SID>X("Define"      , s:purple      , ""          , "none")
  call <SID>X("Include"     , s:jincludefg  , ""          , "")
  call <SID>X("Ignore"      , "666666"      , ""          , "")
	call <SID>X("PmenuSel" 		, s:jblack      , s:red      	,"none")
	call <SID>X("TabLineSel" 	, s:jblack      , s:blue      ,"none")
	
	
"/****************************************************************************************   
"�i C Highlighting �j                                                                
" @ cType                                         �G int
" @ cStorageClass                                 �G extern
" @ cConditional                                  �G if
" @ cRepeat                                 �@�@�@�G for , while
" ***************************************************************************************/    
  call <SID>X("cType"         , s:yellow        , ""  , "none")
  call <SID>X("cStorageClass" , s:jstorclassfg  , ""  , "")
  call <SID>X("cConditional"  , s:red           , ""  , "")
  call <SID>X("cRepeat"       , s:red           , ""  , "")
  
  
"/****************************************************************************************   
"�i �ݭn�t�X Syntax c.vim �j                                                                
" @ cAnsiFunction                                 �G ���� Ansi C ���зǤ�k
" @ cAnsiName                                 �@�@�G �޿�B��l
" @ cUserFunction                                 �G �ϥΪ̤�k
" @ cAnsiOperator                                 �G �Ÿ��]. , + , = , *�^
" @ Pointer                                       �G                        �]X�^
" @ Marco                                         �G                        �]X�^
" @ Error                                         �G                        �]X�^
" ***************************************************************************************/    
  call <SID>X("cAnsiFunction" ,"87afd7"   ,""   ,"none")
  call <SID>X("cAnsiName"     ,"87afd7"   ,""   ,"none")
  call <SID>X("cUserFunction" ,"87afd7"   ,""   ,"none")
  call <SID>X("cAnsiOperator" ,"008200"   ,""   ,"none")
  call <SID>X("cAnsiBoolean"  ,s:purple   ,""   ,"none")
  call <SID>X("cAnsiPointer"  ,"41B55C"   ,""   ,"none")
  "call <SID>X("Pointer"        , "008200"      , ""          , "")
  "call <SID>X("Marco"          , "FF0000"      , ""          , "")
  "call <SID>X("Error"          , "000000"      , ""          , "") 


"/****************************************************************************************   
"�i �~�� Highlighting �j                                                                
" @ NERDTreeCWD
" ***************************************************************************************/  
  call <SID>X("NERDTreeCWD" ,"969896"   ,""   ,"bold")
  
  
"/****************************************************************************************   
"�i �~�� CCTree �j                                                                
" @ CCTree
" ***************************************************************************************/    
	call <SID>X("CCTreeHiSymbol" 	,"yellow"   ,"darkblue"   ,"bold")
	call <SID>X("CCTreeHiMarkers" ,"yellow"   ,"darkblue"   ,"bold")


"/****************************************************************************************   
"�i �R�� Function �j                                                                
" ***************************************************************************************/   
  delf <SID>X
  delf <SID>rgb
  delf <SID>colour
  delf <SID>rgb_colour
  delf <SID>rgb_level
  delf <SID>rgb_number
  delf <SID>grey_colour
  delf <SID>grey_level
  delf <SID>grey_number
endif
set background=dark


"/****************************************************************************************   
"�i ���ϥ� �j                                                                
" ***************************************************************************************/ 
if 0
  " Diff Highlighting
  call <SID>X("diffAdd", "", "4c4e39", "")
  call <SID>X("diffDelete", s:background, s:red, "")
  call <SID>X("diffChange", "", "2B5B77", "")
  call <SID>X("diffText", s:line, s:blue, "")
  " Git
  call <SID>X("diffAdded", s:green, "", "")
  call <SID>X("diffRemoved", s:red, "", "")
  call <SID>X("gitcommitSummary", "", "", "bold")
endif
  
  
  


