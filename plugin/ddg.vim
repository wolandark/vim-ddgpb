vim9script
#  ___________________________________________
# /\                                          \
# \_| __     ___           ____  ____   ____  |
#   | \ \   / (_)_ __ ___ |  _ \|  _ \ / ___| |
#   |  \ \ / /| | '_ ` _ \| | | | | | | |  _  |
#   |   \ V / | | | | | | | |_| | |_| | |_| | |
#   |    \_/  |_|_| |_| |_|____/|____/ \____| |
#   |                                         |
#   |   ______________________________________|_
#    \_/________________________________________/
# 
# A Simple Plugin To Seach DuckDuckGo With The Word Under The cUrsor Or
# The Visual Selection
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

if exists("g:loaded_ddg")
	finish
endif

g:loaded_ddg = 1

if v:version < 900
	echo "This plugin requires Vim 9.0 or later"
	finish
endif

def GetVisualSelection(): void
	var start = getpos("'<")
	var end = getpos("'>")

	var lines = getline(start[1], end[1])

	lines[-1] = lines[-1][ : end[2] - (&selection == 'inclusive' ? 1 : 2)]
	lines[0] = lines[0][start[2] - 1 : ]

	var selection = join(lines, " ")

	var url = 'https://duckduckgo.com/?q=' .. selection

	call system('xdg-open "' .. url .. '"')
enddef

def DuckDuckGo()
	var word_under_cursor = expand('<cword>')
	var result = system('xdg-open https://duckduckgo.com/?q=' .. word_under_cursor)
enddef

command! DDG call DuckDuckGo()
nnoremap <F2> :DDG<CR>

command! Gv call GetVisualSelection()
vnoremap <silent> \s :<C-U> :Gv<CR>
defcompile
