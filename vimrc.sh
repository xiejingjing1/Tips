
autocmd BufNewFile *.py,*.sh exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
        #如果文件类型为.sh文件 在/etc/vim/vimrc 文件中用 "注释
        if &filetype == 'sh'
                call setline(1,"\#########################################################################")
                call append(line("."), "\# File Name: ".expand("%"))
                call append(line(".")+1, "\# Author: ")
                call append(line(".")+2, "\# mail: ")
                call append(line(".")+3, "\# Created Time: ".strftime("%c"))
                call append(line(".")+4, "\#######################################################")
                call append(line(".")+5, "\#!/bin/bash")
                call append(line(".")+6, "")
        elseif &filetype == 'python'
                call setline(1, "#!/usr/bin/python")
                call append(line("."), "# -*- coding:utf-8 -*-")
		call append(line(".")+1, "\#######################################################")
                call append(line(".")+2, "\#> File Name: ".expand("%"))
                call append(line(".")+3, "\#> Author: Box")
                call append(line(".")+4, "\#> Mail: Box99999@163.com ")
                call append(line(".")+5, "\#> Created Time: ".strftime("%c"))
		call append(line(".")+6, "\#######################################################")

        else
                call setline(1, "/*************************************************************************")
                call append(line("."), "        > File Name: ".expand("%"))
                call append(line(".")+1, "      > Author: ")
                call append(line(".")+2, "      > Mail: ")
                call append(line(".")+3, "      > Created Time: ".strftime("%c"))
                call append(line(".")+4, "/**********************************************************************")
                call append(line(".")+5, "")
        endif
                #新建文件后，自动定位到文件末尾
        autocmd BufNewFile * normal G
endfunc


