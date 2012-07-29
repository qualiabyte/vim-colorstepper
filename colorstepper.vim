" ColorStepper.vim
"
" Cycle easily through vim colorschemes.
"
" Original script by scott-268 (2007)
" With modifications by _sc_ (2009) and qualiabyte (2012)

function! Load_colors()
        let g:stepcolors = split(globpath(&rtp,"colors/*.vim"),"\n")
endfunction

function! Step_color()
        if !exists("g:stepcolors")
                call Load_colors()
        endif
        let mycolors = g:stepcolors
        if exists("g:color_step")
                let g:color_step += 1
                if g:color_step > len(mycolors) - 1
                        let g:color_step = 0
                endif
        else
                let g:color_step = 0
        endif
        silent exe 'so ' . mycolors[g:color_step]
        echo g:stepcolors[g:color_step]
        unlet mycolors
endfunction

function! Step_color_back()
        if !exists("g:stepcolors")
                call Load_colors()
        endif
        let mycolors = g:stepcolors
        if exists("g:color_step")
                let g:color_step -= 1
                if g:color_step < 0
                        let g:color_step = len(mycolors) - 1
                endif
        else
                let g:color_step = 5
        endif
        silent exe 'so ' . mycolors[g:color_step]
        echo g:stepcolors[g:color_step]
        unlet mycolors
endfunction

nmap <unique> <Plug>ColorStepNext :call Step_color()<CR> <Bar> :echo g:stepcolors[g:color_step]<CR>
nmap <unique> <Plug>ColorStepBack :call Step_color_back()<CR> <Bar> :echo g:stepcolors[g:color_step]<CR>
nmap <unique> <Plug>ColorStepReload :call Load_colors()<CR> <Bar> :echo g:stepcolors[g:color_step]<CR>
