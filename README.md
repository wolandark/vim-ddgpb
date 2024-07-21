# vim-ddgpb
This plugin with it's horrible name does two things:
- Search DuckDuckGo from Vim (in system GUI browser or in a tmux pane using w3m)
  - With word under the cursor
  - with visual selection
- Submit the visual selection to 0x0.st pastebin 

# Dependency
This plugin doesn't depend on anything other than the `xdg-open`, `curl` and Vim9 or newer. <br>

However, if you want to use a terminal browser for your search, you should also get tmux and w3m browser. Naturally you must be in a tmux session for those functions to work.

This plugin is written in vim9script and therefore requires Vim 9.0+. <br> You can check wether your Vim has vim9script support with  `echo has('vim9script')`. <br>
If Vim returns `1`, then you have what this plugin needs.

# Install vim-ddgpb
use your favorite plugin manager, <br> or:
```
git clone https://github.com/wolandark/vim-ddgpb.git ~/.vim/pack/plugins/start/vim-ddgpb
```

or for on-demand loading of the plugin:

```
git clone https://github.com/wolandark/vim-ddgpb.git ~/.vim/pack/plugins/opt/vim-ddgpb
```
for on-deman loading do:

`:packadd vim-ddgpb` 

# Usage
Put your cursor on a word and press the `F3` key to search duckduckgo for the word under the cursor. 

Put your cursor on a word and press the `F4` key to search duckduckgo for the word under the cursor in a tmux pane using w3m terminal browser. 

Select visually and press `<F7>` to search duckduckgo for the content of the visual selection.

Select visually and press `<F8>` to search duckduckgo for the content of the visual selection in a tmux pane using w3m terminal browser.

Select visually and press `<F12>` to submit the content of the visual selection to 0x0.st pastebin service.

# DDG Demo
![output-ddg-2](https://github.com/wolandark/vim-ddg/assets/107309764/03e05a9b-4475-4c18-b9b0-d9cb48ecf354)

# PB Demo
![Peek 2024-06-24 01-51](https://github.com/wolandark/vim-ddgpb/assets/107309764/45c579ea-ac12-4c65-b6cf-dc09c59b70c9)

Here I'm using tmux-fzf-url plugin in tmux to access the url and open it in the browser directly. <br>

However vim-ddgpb copies the url to the plus register by default. So you can paste it anywhere.

you can always get the link from `:messages` too <br>

For example:  <br>

`:redir @a | 1messages | redir END`

to send the last msg to the `a` register.

# Enjoy
