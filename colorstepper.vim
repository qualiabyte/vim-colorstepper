" ColorStepper.vim
"
" Cycle easily through vim colorschemes.
"
" Original script by scott-268 (2007)
" With modifications by _sc_ (2009) and qualiabyte (2012)

function! LoadColors()
        let g:step_colors = split(globpath(&rtp,"colors/*.vim"),"\n")
endfunction

function! StepColorBy( count )
        if !exists("g:step_colors")
                call LoadColors()
        endif
        if exists("g:color_step")
                let g:color_step += a:count
                let g:color_step = g:color_step % len(g:step_colors)
        else
                let g:color_step = 0
        endif
        silent exe 'so ' . g:step_colors[g:color_step]
        echo g:step_colors[g:color_step]
endfunction

function! StepColorNext()
        call StepColorBy( 1 )
endfunction

function! StepColorPrev()
        call StepColorBy( -1 )
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

nmap <unique> <Plug>ColorstepNext :call StepColorNext()<CR> <Bar> :echo g:step_colors[g:color_step]<CR>
nmap <unique> <Plug>ColorstepPrev :call StepColorPrev()<CR> <Bar> :echo g:step_colors[g:color_step]<CR>
nmap <unique> <Plug>ColorstepReload :call LoadColors()<CR> <Bar> :echo g:step_colors[g:color_step]<CR>
