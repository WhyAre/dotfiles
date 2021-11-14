set background=dark
let s:colorscheme = 'edge'
let s:lightline_theme = 'edge'

let g:material_theme_style = 'default'
let g:edge_enable_italic = 0
let g:edge_disable_italic_comment = 1

" Rotating colorscheme C: Honestly I thought its a simple feature... 
" but who knows: https://github.com/altercation/solarized/issues/102#issuecomment-18109651. Fucking big issue bodoh
function SetColors()
    execute 'silent! colorscheme ' . s:colorscheme

    if exists('g:plugs["lightline.vim"]')
        let g:lightline = {
            \ 'colorscheme': s:lightline_theme
            \}
        call lightline#init()
        call lightline#colorscheme()
        call lightline#update()
    endif
endfunction

function! EdgeHighlights() abort
    " Setting NonText to guifg=#6b6e75 makes the listchars more visible
    " hi! NonText guifg=#a61616

    " Here are what the highlight groups refer to
    " - NonText: eol (which I sometimes disable)
    " - SpecialKey: keys inserted using i_ctrl-v
    " - Whitespace: mainly trailing whitespace
    highlight NonText guifg=#6b6e75
    highlight! SpecialKey guifg=#ffdad1
    highlight! Whitespace guifg=#ffdad1

endfunction

function! GenericHighlights() abort
    highlight ColorColumn guibg=#a61616

    " Only for edge highlights, but I think it's looks notbad
    " hi! NonText guifg=#6b6e75
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme edge call EdgeHighlights()
    autocmd ColorScheme * call GenericHighlights()
augroup END

call SetColors()
