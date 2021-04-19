" HARPOOOOOOON files
nnoremap <Leader>of     :lua require("harpoon.mark").add_file()<CR>
nnoremap <Leader>ia     :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <Leader>is     :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <Leader>id     :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <Leader>if     :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <Leader>qm     :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <Leader>oc     :lua require("harpoon.mark").clear_all()<CR>

" HARPOOOOOOON terminal
nnoremap <Leader>ta     :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <Leader>ts     :lua require("harpoon.term").gotoTerminal(2)<CR>
