autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "left"
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1

