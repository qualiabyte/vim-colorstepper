"  ColorStepper.vim
"
"  colorstepper changes colorscheme to the "next" color
"  saves position in global variable
"  re-obtains list of schemes every time, so new colors will
"  be automatically added
"
"  extra credit will be awarded to the student who can tell
"  me why the echo of colors_name works sometimes and sometimes
"  doesn't
"
"  interestingly it now seems to have stopped working entirely
"
function! Step_color()
        let mycolors = split(globpath(&rtp,"colors/*.vim"),"\n")
        if exists("g:color_step")
                let g:color_step += 1
                if g:color_step > len(mycolors) - 1
                        let g:color_step = 0
                endif
        else
                let g:color_step = 0
        endif
        silent exe 'so ' . mycolors[g:color_step]
        echo g:colors_name "\n"
        unlet mycolors
endfunction

function! Step_color_back()
        let mycolors = split(globpath(&rtp,"colors/*.vim"),"\n")
        if exists("g:color_step")
                let g:color_step -= 1
                if g:color_step < 0
                        let g:color_step = len(mycolors) - 1
                endif
        else
                let g:color_step = 5
        endif
        silent exe 'so ' . mycolors[g:color_step]
        echo g:colors_name
        unlet mycolors
endfunction

"nmap <F6> :call Step_color()<CR> <Bar> :echo g:colors_name<CR>
"nmap <F7> :echo g:colors_name<CR>
"nmap <S-F6> :call Step_color_back()<CR> <Bar> :echo g:colors_name<CR>

