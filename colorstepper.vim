" ColorStepper.vim
"
" Cycle easily through vim colorschemes.
"
" Original script by scott-268 (2007)
" With modifications by _sc_ (2009) and qualiabyte (2012)

function! Load_colors()
        let g:stepcolors = split(globpath(&rtp,"colors/*.vim"),"\n")
endfunction

function! Step_color_by( count )
        if !exists("g:stepcolors")
                call Load_colors()
        endif
        if exists("g:color_step")
                let g:color_step += a:count
                let g:color_step = g:color_step % len(g:stepcolors)
        else
                let g:color_step = 0
        endif
        silent exe 'so ' . g:stepcolors[g:color_step]
        echo g:stepcolors[g:color_step]
endfunction

function! Step_color()
        call Step_color_by( 1 )
endfunction

function! Step_color_back()
        call Step_color_by( -1 )
endfunction

if !hasmapto('<Plug>ColorstepPrev')
    nmap <unique> <F6> <Plug>ColorstepPrev
endif
if !hasmapto('<Plug>ColorstepNext')
    nmap <unique> <F7> <Plug>ColorstepNext
endif
if !hasmapto('<Plug>ColorstepReload')
    nmap <unique> <S-F7> <Plug>ColorstepReload
endif

nmap <unique> <Plug>ColorstepNext :call Step_color()<CR> <Bar> :echo g:stepcolors[g:color_step]<CR>
nmap <unique> <Plug>ColorstepPrev :call Step_color_back()<CR> <Bar> :echo g:stepcolors[g:color_step]<CR>
nmap <unique> <Plug>ColorstepReload :call Load_colors()<CR> <Bar> :echo g:stepcolors[g:color_step]<CR>
