" DistrationFree.vim  -- Toggle distraction free writing mode
"
" Author: Byron Ruth <b@devel.io>
" URL: https://github.com/bruth/vim-distraction-free
" --
" Original author: Lakshan Perera (lakshan AT web2media net) 
"
" By default, toggling of full screen mode is bound to <leader>d
" You can change it in .vimrc as follows:
" :map <leader>d :call ToggleDistractionFreeWriting()<CR>

" initVariable borrowed from NERDTree
function! s:initVariable(var, value)
  if !exists(a:var)
    exec 'let ' . a:var . ' = ' . "'" . a:value . "'"
    return 1
  endif
  return 0
endfunction

" Initialize variables
call s:initVariable("g:distractionFreeFullscreen", "off")

function! DistractionFreeWriting()
  exec "colorscheme ".g:fullscreen_colorscheme
  " added escape function to allow for multiword font names
  " (AmaruCoder)
  exec "set gfn=".escape(g:fullscreen_font,' ')

  set columns=80  				" size of the editable area
  set linespace=5 			  " spacing between lines
  set guioptions-=r 				" remove righ scrollbar
  set laststatus=0 			  " don't show status line
  set noruler 				  " don't show ruler
  set nonumber          " don't show line numbers
  set nocursorline        " don't show cursor line
  set linebreak 				  " break the lines on words

  if has("gui_macvim")
    set fuoptions=background:#eeeeeeee " bakground color
    set fullscreen 		    " go to fullscreen editing mode
  else
    set guioptions-=mT 			" remove menu
  endif

  let g:distractionFreeFullscreen = 'on'
endfunction

function! ToggleDistractionFreeWriting()
  " On, revert to previous state
  if g:distractionFreeFullscreen == 'on'
    exec "set background=".s:prev_background
    exec "set lines=".s:prev_lines
    exec "set columns=".s:prev_columns
    exec "set linespace=".s:prev_linespace
    exec "set laststatus=".s:prev_laststatus
	exec "set guioptions+=r"
 
    set linebreak!
    set noruler!
    set nonumber!
    set nocursorline!

    if has("gui_macvim")
      exec "set fuoptions=".s:prev_fuoptions
      set fullscreen!
    else
      set guioptions+=m " add menu
    endif

    let g:distractionFreeFullscreen = 'off'

    exec "colorscheme ".g:normal_colorscheme
    " added escape function to allow for multiword font names
    " (AmaruCoder)
    exec "set gfn=".escape(g:normal_font,' ')

  " Off, toggle distraction-free options
  else
    let s:prev_background = &background
    let s:prev_gfn = &gfn
    let s:prev_lines = &lines
    let s:prev_columns = &columns
    let s:prev_linespace = &linespace
    let s:prev_laststatus = &laststatus
    let s:prev_font = &gfn

    if has("gui_macvim")
      let s:prev_fuoptions = &fuoptions
    endif

    call DistractionFreeWriting()
  endif
endfunction

" Set default options
if !exists('g:normal_colorscheme')
  let g:normal_colorscheme = g:colors_name
endif

if !exists('g:fullscreen_colorscheme')
  let g:fullscreen_colorscheme = g:colors_name
endif

if !exists('g:normal_font')
  let g:normal_font=&guifont
endif

if !exists('g:fullscreen_font')
  let g:fullscreen_font = &guifont
endif

" Set shortcut
:map <leader>d :call ToggleDistractionFreeWriting()<CR>
