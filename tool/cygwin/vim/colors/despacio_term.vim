"   ________  _______   ________  ________  ________  ________  ___  ________
"  |\   ___ \|\  ___ \ |\   ____\|\   __  \|\   __  \|\   ____\|\  \|\   __  \
"  \ \  \_|\ \ \   __/|\ \  \___|\ \  \|\  \ \  \|\  \ \  \___|\ \  \ \  \|\  \
"   \ \  \ \\ \ \  \_|/_\ \_____  \ \   ____\ \   __  \ \  \    \ \  \ \  \\\  \
"    \ \  \_\\ \ \  \_|\ \|____|\  \ \  \___|\ \  \ \  \ \  \____\ \  \ \  \\\  \
"     \ \_______\ \_______\____\_\  \ \__\    \ \__\ \__\ \_______\ \__\ \_______\
"      \|_______|\|_______|\_________\|__|     \|__|\|__|\|_______|\|__|\|_______|
"                         \|_________|

" A Terminal Vim colorscheme
" Author:       Alessandro Yorba
" Script URL:   https://github.com/AlessandroYorba/Despacio
" License:      MIT

"================================================================================
" COLOR PALETTE:
"================================================================================

"White:
"================================================================================
"Cloud          254      #e4e4e4      http://www.colorhexa.com/e4e4e4

"Black:
"================================================================================
"Abyss          16       #000000      http://www.colorhexa.com/000000
"Pitch          232      #080808      http://www.colorhexa.com/080808
"Midnight       233      #121212      http://www.colorhexa.com/121212
"Twilight       234      #1c1c1c      http://www.colorhexa.com/1c1c1c

"Gray:
"================================================================================
"Stars          188      #dfdfdf      http://www.colorhexa.com/dfdfdf
"Sunset         235      #262626      http://www.colorhexa.com/262626
"Day            236      #303030      http://www.colorhexa.com/303030
"Shade          237      #3a3a3a      http://www.colorhexa.com/3a3a3a
"Pebble         239      #4e4e4e      http://www.colorhexa.com/4e4e4e
"Graphite       240      #585858      http://www.colorhexa.com/585858
"Fog            241      #626262      http://www.colorhexa.com/626262
"Ash            243      #767676      http://www.colorhexa.com/767676
"Dust           244      #808080      http://www.colorhexa.com/808080
"Stone          245      #8a8a8a      http://www.colorhexa.com/8a8a8a

"Red:
"================================================================================
"Firecracker    131      #af5f5f      http://www.colorhexa.com/af5f5f
"Scarlet        160      #d70000      http://www.colorhexa.com/d70000
"Rose           167      #d75f5f      http://www.colorhexa.com/d75f5f
"Cherry         196      #ff0000      http://www.colorhexa.com/ff0000

"Green:
"================================================================================
"Marsh          108      #87af87      http://www.colorhexa.com/87af87
"Fern           65       #5f875f      http://www.colorhexa.com/5f875f

"Yellow:
"================================================================================
"Dune           187      #dfdfaf      http://www.colorhexa.com/dfdfaf
"Flats          144      #afaf87      http://www.colorhexa.com/afaf87
"Linen          222      #ffdf87      http://www.colorhexa.com/ffdf87
"Sand           223      #ffdfaf      http://www.colorhexa.com/ffdfaf
"Firefly        230      #ffffdf      http://www.colorhexa.com/ffffdf

"Cyan:
"================================================================================
"Lilac          60       #5f5f87      http://www.colorhexa.com/5f5f87
"Lake           66       #5f8787      http://www.colorhexa.com/5f8787
"Oasis          109      #87afaf      http://www.colorhexa.com/87afaf
"Robin          111      #87afff      http://www.colorhexa.com/87afff

"Blue:
"================================================================================
"Heather        103      #8787af      http://www.colorhexa.com/8787af

"Purple:
"================================================================================
"Lavender       146      #afafd7      http://www.colorhexa.com/afafd7

"Orange:
"================================================================================
"Bluebells      130     #af5f00       http://www.colorhexa.com/af5f00
"Oak            137     #af875f       http://www.colorhexa.com/af875f
"Cider          166     #d75f00       http://www.colorhexa.com/d75f00
"Mallow         179     #dfaf5f       http://www.colorhexa.com/dfaf5f
"Cream          180     #dfaf87       http://www.colorhexa.com/dfaf87
"Honeystrand    208     #ff8700       http://www.colorhexa.com/ff8700
"Pomegranate    209     #ff875f       http://www.colorhexa.com/ff875f
"Yam            215     #ffaf5f       http://www.colorhexa.com/ffaf5f
"Sorbet         216     #ffaf87       http://www.colorhexa.com/ffaf87


set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

"================================================================================
" SET DEFAULT PARAMETERS:
"================================================================================

let g:colors_name="despacio_term"

if !exists("g:despacio_Sunset")
    let g:despacio_Sunset = 0
endif

if !exists("g:despacio_Twilight")
    let g:despacio_Twilight = 0
endif

if !exists("g:despacio_Midnight")
    let g:despacio_Midnight = 0
endif

if !exists("g:despacio_Pitch")
    let g:despacio_Pitch = 0
endif

if !exists("g:despacio_Clear_Skies")
    let g:despacio_Clear_Skies = 0
endif

if !exists("g:despacio_Campfire")
    let g:despacio_Campfire = 0
endif

"================================================================================
" COMMON SETTINGS:
"================================================================================

" File Navigation:
highlight Directory guifg=#ffaf87 guibg=NONE gui=NONE ctermfg=216 cterm=NONE
highlight Search guifg=#ffffdf guibg=#af5f00 gui=NONE ctermfg=230 ctermbg=130 cterm=NONE

" Prompt Status:
highlight Title guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 cterm=NONE
highlight ModeMsg guifg=#ffffdf guibg=NONE gui=NONE ctermfg=230 cterm=NONE
highlight MoreMsg guifg=#af875f guibg=NONE gui=NONE ctermfg=137 cterm=NONE
highlight Question guifg=#af875f guibg=NONE gui=NONE ctermfg=137 cterm=NONE

" Number Column:
highlight Folded guifg=#dfdfaf guibg=NONE gui=NONE ctermfg=187 cterm=NONE
highlight FoldColumn guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 cterm=NONE
highlight SignColumn guifg=#87af87 guibg=NONE gui=NONE ctermfg=108 cterm=NONE

" Completion Menu:
highlight PmenuSel guifg=#ffffdf guibg=#5f8787 gui=NONE ctermfg=230 ctermbg=66 cterm=NONE
highlight WildMenu guifg=#ffffdf guibg=#5f8787 gui=NONE ctermfg=230 ctermbg=66 cterm=NONE

" Visual Aid:
highlight NonText guifg=#4e4e4e guibg=NONE gui=NONE ctermfg=239 cterm=NONE
highlight SpecialKey guifg=#5f8787 guibg=NONE gui=NONE ctermfg=66 cterm=NONE
highlight Underlined guifg=#5f8787 guibg=NONE gui=NONE ctermfg=66 cterm=NONE
highlight WarningMsg guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 cterm=NONE
highlight MatchParen guifg=#ffffdf guibg=#5f8787 gui=NONE ctermfg=230 ctermbg=66 cterm=NONE
highlight Visual guifg=#ffffdf guibg=#5f8787 gui=NONE ctermfg=230 ctermbg=66 cterm=NONE
highlight Todo guifg=#ff875f guibg=NONE gui=reverse ctermfg=209 cterm=reverse
highlight Error guifg=#d75f5f guibg=#121212 gui=reverse ctermfg=167 ctermbg=233 cterm=reverse
highlight ErrorMsg guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 cterm=NONE

" Variable Types:
highlight Constant guifg=#d75f00 guibg=NONE gui=NONE ctermfg=166 cterm=NONE
highlight String guifg=#ffffdf guibg=NONE gui=NONE ctermfg=230 cterm=NONE
highlight Identifier guifg=#ffdfaf guibg=NONE gui=NONE ctermfg=223 cterm=NONE
highlight Function guifg=#ffdfaf guibg=NONE gui=NONE ctermfg=223 cterm=NONE
highlight StorageClass guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 cterm=NONE

" Language Constructs
highlight Label guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 cterm=NONE
highlight Statement guifg=#af875f guibg=NONE gui=NONE ctermfg=137 cterm=NONE
highlight Operator guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 cterm=NONE
highlight Special guifg=#ffaf87 guibg=NONE gui=NONE ctermfg=216 cterm=NONE

" C Like:
highlight PreProc guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 cterm=NONE
highlight Type guifg=#ffdfaf guibg=NONE gui=NONE ctermfg=223 cterm=NONE

" HTML:
hi htmlStatement             guifg=#ffdfaf             guibg=NONE              gui=NONE
hi htmlItalic                guifg=#ff875f             guibg=NONE              gui=NONE
hi htmlArg                   guifg=#d75f00             guibg=NONE              gui=NONE

"FIXME:
" Diff:
highlight DiffAdd guifg=#1c1c1c guibg=#ffdfaf gui=NONE ctermfg=234 ctermbg=223 cterm=NONE
highlight DiffChange guifg=#1c1c1c guibg=#af875f gui=NONE ctermfg=234 ctermbg=137 cterm=NONE
highlight DiffText guifg=#1c1c1c guibg=#dfaf87 gui=NONE ctermfg=234 ctermbg=180 cterm=NONE
highlight DiffDelete guifg=#dfdfaf guibg=#af5f5f gui=NONE ctermfg=187 ctermbg=131 cterm=NONE

" Spelling:
highlight SpellBad guifg=#d75f5f guibg=NONE gui=undercurl ctermfg=167 cterm=undercurl
highlight SpellLocal guifg=#5f875f guibg=NONE gui=undercurl ctermfg=65 cterm=undercurl
highlight SpellCap guifg=#87afff guibg=NONE gui=undercurl ctermfg=111 cterm=undercurl
highlight SpellRare guifg=#ff8700 guibg=NONE gui=undercurl ctermfg=208 cterm=undercurl

"================================================================================
" DAY:
"================================================================================
if 1
    " Editor Settings:
highlight Normal guifg=#e4e4e4 guibg=#303030 gui=NONE ctermfg=254 ctermbg=236 cterm=NONE
highlight LineNr guifg=#8a8a8a guibg=#121212 gui=NONE ctermfg=245 ctermbg=233 cterm=NONE
highlight CursorLineNr guifg=#dfdfaf guibg=#121212 gui=NONE ctermfg=187 ctermbg=233 cterm=NONE
highlight CursorLine guifg=NONE guibg=#262626 gui=NONE ctermbg=235 cterm=NONE
highlight CursorColumn guifg=NONE guibg=#262626 gui=NONE ctermbg=235 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#3a3a3a gui=NONE ctermbg=237 cterm=NONE

    " WindowTab Delimiters:
highlight StatusLine guifg=#dfdfaf guibg=#121212 gui=NONE ctermfg=187 ctermbg=233 cterm=NONE
highlight StatusLineNC guifg=#8a8a8a guibg=#121212 gui=NONE ctermfg=245 ctermbg=233 cterm=NONE
highlight VertSplit guifg=#8a8a8a guibg=#121212 gui=NONE ctermfg=245 ctermbg=233 cterm=NONE
highlight TabLine guifg=#8a8a8a guibg=#121212 gui=NONE ctermfg=245 ctermbg=233 cterm=NONE
highlight TabLineSel guifg=#dfdfaf guibg=#121212 gui=NONE ctermfg=187 ctermbg=233 cterm=NONE
highlight TabLineFill guifg=NONE guibg=#121212 gui=NONE ctermbg=233 cterm=NONE

    " Language Constructs:
highlight Comment guifg=#8a8a8a guibg=NONE gui=NONE ctermfg=245 cterm=NONE

    " Completion Menu:
highlight Pmenu guifg=#dfdfaf guibg=#121212 gui=NONE ctermfg=187 ctermbg=233 cterm=NONE
highlight PmenuSbar guifg=#121212 guibg=#121212 gui=NONE ctermfg=233 ctermbg=233 cterm=NONE
highlight PmenuThumb guifg=#121212 guibg=#121212 gui=NONE ctermfg=233 ctermbg=233 cterm=NONE
end

"================================================================================
" SUNSET:
"================================================================================
if g:despacio_Sunset
    " Editor Settings:
highlight Normal guifg=#dfdfdf guibg=#262626 gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
highlight LineNr guifg=#808080 guibg=#080808 gui=NONE ctermfg=244 ctermbg=232 cterm=NONE
highlight CursorLineNr guifg=#dfdfaf guibg=#080808 gui=NONE ctermfg=187 ctermbg=232 cterm=NONE
highlight CursorLine guifg=NONE guibg=#1c1c1c gui=NONE ctermbg=234 cterm=NONE
highlight CursorColumn guifg=NONE guibg=#1c1c1c gui=NONE ctermbg=234 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#303030 gui=NONE ctermbg=236 cterm=NONE

    " WindowTab Delimiters:
highlight StatusLine guifg=#dfdfaf guibg=#080808 gui=NONE ctermfg=187 ctermbg=232 cterm=NONE
highlight StatusLineNC guifg=#808080 guibg=#080808 gui=NONE ctermfg=244 ctermbg=232 cterm=NONE
highlight VertSplit guifg=#808080 guibg=#080808 gui=NONE ctermfg=244 ctermbg=232 cterm=NONE
highlight TabLine guifg=#808080 guibg=#080808 gui=NONE ctermfg=244 ctermbg=232 cterm=NONE
highlight TabLineSel guifg=#dfdfaf guibg=#080808 gui=NONE ctermfg=187 ctermbg=232 cterm=NONE
highlight TabLineFill guifg=NONE guibg=#080808 gui=NONE ctermbg=232 cterm=NONE

    " Language Constructs:
highlight Comment guifg=#808080 guibg=NONE gui=NONE ctermfg=244 cterm=NONE

    " Completion Menu:
highlight Pmenu guifg=#dfdfaf guibg=#080808 gui=NONE ctermfg=187 ctermbg=232 cterm=NONE
highlight PmenuSbar guifg=#080808 guibg=#080808 gui=NONE ctermfg=232 ctermbg=232 cterm=NONE
highlight PmenuThumb guifg=#080808 guibg=#080808 gui=NONE ctermfg=232 ctermbg=232 cterm=NONE
end

"================================================================================
" TWILIGHT:
"================================================================================
if g:despacio_Twilight
    " Editor Settings:
highlight Normal guifg=#dfdfdf guibg=#1c1c1c gui=NONE ctermfg=254 ctermbg=234 cterm=NONE
highlight LineNr guifg=#808080 guibg=#000000 gui=NONE ctermfg=244 ctermbg=16 cterm=NONE
highlight CursorLineNr guifg=#dfdfaf guibg=#000000 gui=NONE ctermfg=187 ctermbg=16 cterm=NONE
highlight CursorLine guifg=NONE guibg=#121212 gui=NONE ctermbg=233 cterm=NONE
highlight CursorColumn guifg=NONE guibg=#121212 gui=NONE ctermbg=233 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#262626 gui=NONE ctermbg=235 cterm=NONE

    " WindowTab Delimiters:
highlight StatusLine guifg=#dfdfaf guibg=#000000 gui=NONE ctermfg=187 ctermbg=16 cterm=NONE
highlight StatusLineNC guifg=#808080 guibg=#000000 gui=NONE ctermfg=244 ctermbg=16 cterm=NONE
highlight VertSplit guifg=#808080 guibg=#000000 gui=NONE ctermfg=244 ctermbg=16 cterm=NONE
highlight TabLine guifg=#808080 guibg=#000000 gui=NONE ctermfg=244 ctermbg=16 cterm=NONE
highlight TabLineSel guifg=#dfdfaf guibg=#000000 gui=NONE ctermfg=187 ctermbg=16 cterm=NONE
highlight TabLineFill guifg=NONE guibg=#000000 gui=NONE ctermbg=16 cterm=NONE

    " Language Constructs:
highlight Comment guifg=#808080 guibg=NONE gui=NONE ctermfg=244 cterm=NONE

    " Completion Menu:
highlight Pmenu guifg=#dfdfaf guibg=#000000 gui=NONE ctermfg=187 ctermbg=16 cterm=NONE
highlight PmenuSbar guifg=#000000 guibg=#000000 gui=NONE ctermfg=16 ctermbg=16 cterm=NONE
highlight PmenuThumb guifg=#000000 guibg=#000000 gui=NONE ctermfg=16 ctermbg=16 cterm=NONE
end

"================================================================================
" MIDNIGHT:
"================================================================================
if g:despacio_Midnight
    " Editor Settings:
highlight Normal guifg=#dfdfdf guibg=#121212 gui=NONE ctermfg=254 ctermbg=233 cterm=NONE
highlight LineNr guifg=#808080 guibg=#303030 gui=NONE ctermfg=244 ctermbg=236 cterm=NONE
highlight CursorLineNr guifg=#dfdfaf guibg=#303030 gui=NONE ctermfg=187 ctermbg=236 cterm=NONE
highlight CursorLine guifg=NONE guibg=#1c1c1c gui=NONE ctermbg=234 cterm=NONE
highlight CursorColumn guifg=NONE guibg=#1c1c1c gui=NONE ctermbg=234 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#080808 gui=NONE ctermbg=232 cterm=NONE

    " WindowTab Delimiters:
highlight StatusLine guifg=#dfdfaf guibg=#303030 gui=NONE ctermfg=187 ctermbg=236 cterm=NONE
highlight StatusLineNC guifg=#808080 guibg=#303030 gui=NONE ctermfg=244 ctermbg=236 cterm=NONE
highlight VertSplit guifg=#808080 guibg=#303030 gui=NONE ctermfg=244 ctermbg=236 cterm=NONE
highlight TabLine guifg=#808080 guibg=#303030 gui=NONE ctermfg=244 ctermbg=236 cterm=NONE
highlight TabLineSel guifg=#dfdfaf guibg=#303030 gui=NONE ctermfg=187 ctermbg=236 cterm=NONE
highlight TabLineFill guifg=NONE guibg=#303030 gui=NONE ctermbg=236 cterm=NONE

    " Language Constructs:
highlight Comment guifg=#808080 guibg=NONE gui=NONE ctermfg=244 cterm=NONE

    " Completion Menu:
highlight Pmenu guifg=#dfdfaf guibg=#303030 gui=NONE ctermfg=187 ctermbg=236 cterm=NONE
highlight PmenuSbar guifg=#303030 guibg=#303030 gui=NONE ctermfg=236 ctermbg=236 cterm=NONE
highlight PmenuThumb guifg=#303030 guibg=#303030 gui=NONE ctermfg=236 ctermbg=236 cterm=NONE
end

"================================================================================
" PITCH:
"================================================================================
if g:despacio_Pitch
    " Editor Settings:
highlight Normal guifg=#dfdfdf guibg=#080808 gui=NONE ctermfg=254 ctermbg=232 cterm=NONE
highlight LineNr guifg=#808080 guibg=#262626 gui=NONE ctermfg=244 ctermbg=235 cterm=NONE
highlight CursorLineNr guifg=#dfdfaf guibg=#262626 gui=NONE ctermfg=187 ctermbg=235 cterm=NONE
highlight CursorLine guifg=NONE guibg=#121212 gui=NONE ctermbg=233 cterm=NONE
highlight CursorColumn guifg=NONE guibg=#121212 gui=NONE ctermbg=233 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#000000 gui=NONE ctermbg=16 cterm=NONE

    " WindowTab Delimiters:
highlight StatusLine guifg=#dfdfaf guibg=#262626 gui=NONE ctermfg=187 ctermbg=235 cterm=NONE
highlight StatusLineNC guifg=#808080 guibg=#262626 gui=NONE ctermfg=244 ctermbg=235 cterm=NONE
highlight VertSplit guifg=#808080 guibg=#262626 gui=NONE ctermfg=244 ctermbg=235 cterm=NONE
highlight TabLine guifg=#808080 guibg=#262626 gui=NONE ctermfg=244 ctermbg=235 cterm=NONE
highlight TabLineSel guifg=#dfdfaf guibg=#262626 gui=NONE ctermfg=187 ctermbg=235 cterm=NONE
highlight TabLineFill guifg=NONE guibg=#262626 gui=NONE ctermbg=235 cterm=NONE

    " Language Constructs:
highlight Comment guifg=#808080 guibg=NONE gui=NONE ctermfg=244 cterm=NONE

    " Completion Menu:
highlight Pmenu guifg=#dfdfaf guibg=#262626 gui=NONE ctermfg=187 ctermbg=235 cterm=NONE
highlight PmenuSbar guifg=#262626 guibg=#262626 gui=NONE ctermfg=235 ctermbg=235 cterm=NONE
highlight PmenuThumb guifg=#262626 guibg=#262626 gui=NONE ctermfg=235 ctermbg=235 cterm=NONE
end

if g:despacio_Clear_Skies
    " Editor Settings:
highlight CursorLine guifg=NONE guibg=NONE gui=NONE cterm=NONE
highlight CursorColumn guifg=NONE guibg=NONE gui=NONE cterm=NONE
end

"================================================================================
" CAMPFIRE:
"================================================================================
if g:despacio_Campfire
    let despacio_Hour = strftime("%H")

    "Day: 7am - 5pm
    if 7 <= despacio_Hour && despacio_Hour < 17
        let g:despacio_Sunset = 0
        let g:despacio_Twilight = 0
        let g:despacio_Midnight = 0
        let g:despacio_Pitch = 0

    "Sunset: 5pm - 7pm
    elseif 17 <= despacio_Hour && despacio_Hour < 19
        let g:despacio_Sunset = 1
        let g:despacio_Twilight = 0
        let g:despacio_Midnight = 0
        let g:despacio_Pitch = 0

    "Twilight: 7pm - 9pm
    elseif 19 <= despacio_Hour && despacio_Hour < 21
        let g:despacio_Sunset = 0
        let g:despacio_Twilight = 1
        let g:despacio_Midnight = 0
        let g:despacio_Pitch = 0

    "Midnight: 9pm - 12am
    elseif 21 <= despacio_Hour && despacio_Hour < 24
        let g:despacio_Sunset = 0
        let g:despacio_Twilight = 0
        let g:despacio_Midnight = 1
        let g:despacio_Pitch = 0

    "Pitch: 12am - 7am
    else
        let g:despacio_Sunset = 0
        let g:despacio_Twilight = 0
        let g:despacio_Midnight = 0
        let g:despacio_Pitch = 1

    endif
end
