"  colorstepper changes colorscheme to the "next" color
"  saves position in global variable
"  re-obtains list of schemes every time, so new colors will
"  be automatically added
function! Step_color()
        let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
        if exists("g:color_step")
                let g:color_step += 1
                if g:color_step > len(mycolors) - 1
                        let g:color_step = 0
                endif
        else
                let g:color_step = 0
        endif
        exe 'so ' . mycolors[g:color_step]
        unlet mycolors
endfunction

function! Step_color_back()
        let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
        if exists("g:color_step")
                let g:color_step -= 1
                if g:color_step < 0
                        let g:color_step = len(mycolors) - 1
                endif
        else
                let g:color_step = 5
        endif
        exe 'so ' . mycolors[g:color_step]
        unlet mycolors
endfunction

nmap ,c :call Step_color()<CR> <Bar> :echo g:colors_name<CR>
nmap ,d :echo g:colors_name<CR>
nmap ,x :call Step_color_back()<CR> <Bar> :echo g:colors_name<CR>
