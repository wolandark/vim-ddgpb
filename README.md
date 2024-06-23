# vim-ddg
Search DuckDuckGo from Vim

# Dependency
This plugin doesn't depend on anything other than the `xdg-open` command and Vim9 or newer. <br>

This plugin is written in vim9script and therefore requires Vim 9.0+. <br> You can check wether your Vim has vim9script support with  `echo has('vim9script')`. <br>
If Vim returns `1`, then you have what this plugin needs.

# Install vim-ddg
use your favorite plugin manager, <br> or:
```
git clone https://github.com/wolandark/vim-ddg.git ~/.vim/pack/plugins/start/vim-ddg
```

or for on-demand loading of the plugin:

```
git clone https://github.com/wolandark/vim-ddg.git ~/.vim/pack/plugins/opt/vim-ddg
```
for on-deman loading do:

`:packadd vim-ddg` 

# Usage
Put your cursor on a word and press the `F2` key to search duckduckgo for the word under the cursor. 

Select visually and press `\s` (that is not `<Leader>s`) to search duckduckgo for the content of the visual selection.

![output-ddg-2](https://github.com/wolandark/vim-ddg/assets/107309764/03e05a9b-4475-4c18-b9b0-d9cb48ecf354)
