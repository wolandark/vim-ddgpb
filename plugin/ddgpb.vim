vim9script
#  _______________________________________________________
# /\                                                      \
# \_| __     ___           ____  ____   ____ ____  ____   |
#   | \ \   / (_)_ __ ___ |  _ \|  _ \ / ___|  _ \| __ )  |
#   |  \ \ / /| | '_ ` _ \| | | | | | | |  _| |_) |  _ \  |
#   |   \ V / | | | | | | | |_| | |_| | |_| |  __/| |_) | |
#   |    \_/  |_|_| |_| |_|____/|____/ \____|_|   |____/  |
#   |                                                     |
#   |   __________________________________________________|_
#    \_/____________________________________________________/
#
# A Simple Plugin To Seach DuckDuckGo OR Send Visual Selection To Paste Bin
#
# Copyright © 2024 wolandark
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

if exists("g:loaded_ddgpb")
	finish
endif

g:loaded_ddgpb = 1

if v:version < 900
	echo "This plugin requires Vim 9.0 or later"
	finish
endif

# PasteBin 
def PasteBin(): void
	PassVisualSelection()
    var cmd = 'curl -s -F "file=@-" 0x0.st'
    var result = system(cmd, g:selection)
    var url = substitute(result, '\n', '', 'g')
	redir @+ 
	echom url
	redir END
	echom "Uploaded to: " .. url "And copied to @+"
enddef

# Search DuckDuckGo
def PassVisualSelection(): void
	var start = getpos("'<")
	var end = getpos("'>")
	var lines = getline(start[1], end[1])
	lines[-1] = lines[-1][ : end[2] - (&selection == 'inclusive' ? 1 : 2)]
	lines[0] = lines[0][start[2] - 1 : ]
	g:selection = join(lines, "\n")
enddef

def SearchDuckDuckGoVisually()
	PassVisualSelection()
	 var url = 'https://duckduckgo.com/?q=' .. g:selection
	 call system('xdg-open "' .. url .. '"')
enddef

def SearchDuckDuckGo()
	var word_under_cursor = expand('<cword>')
	var result = system('xdg-open https://duckduckgo.com/?q=' .. word_under_cursor)
enddef

# Commands
command! -range DDGV call SearchDuckDuckGoVisually()
command! DDG call SearchDuckDuckGo()
command! -range Binint call PasteBin()

# Mappings
vnoremap \s :DDGV<CR>
vnoremap \p :Binint<CR>
nnoremap <F2> :DDG<CR>

defcompile

