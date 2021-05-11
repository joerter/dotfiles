" Eval and use clojure.repl namespace for docs
nnoremap <leader>cEd :Eval (use 'clojure.repl)<cr>

" Run Tests
nnoremap <leader>cRT :RunTests 

" *********************** biff *******************
"
" Refresh biff.core
nnoremap <leader>cbE :Eval (biff.core/refresh)<cr>

" Connect repl
nnoremap <leader>cbCP :Connect 7890<cr><cr>:Piggieback :app<cr>

" Connect clojurv repl
nnoremap <leader>cbC :Connect 7888<cr><cr>


