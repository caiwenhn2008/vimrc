# theme

Item theme: https://raw.githubusercontent.com/herrbischoff/iterm2-gruvbox/master/gruvbox.itermcolors

#vim basics
https://coolshell.cn/articles/5426.html
https://coolshell.cn/articles/11312.html

# Install tools

- brew install fz
- $(brew --prefix)/opt/fzf/install
- brew install ripgrep
- brew install ctags
- brew install the_silver_searcher

# ctags usage

- alias ctags="`brew --prefix`/bin/ctags"
- ctags -R --exclude=.git --exclude=log

# Font setup

Install a nerdfont and configure your terminal to use it (otherwise icons will not display correctly)
On a mac you can install one via, eg:

- brew tap homebrew/cask-fonts
- brew install --cask font-victor-mono-nerd-font
- brew install --cask font-hack-nerd-font

# coc manual install

CocList extensions
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
cd ~/.vim/bundle/coc.nvim
yarn install
yarn build

# coc extensions

CocInstall coc-json coc-tsserver coc-vimlsp coc-prettier coc-markdownlint coc-actions coc-yaml coc-xml coc-snippets coc-pyright coc-json coc-java

# python support

- pip3 install ipdb
- pip3 install pdbpp
- pip3 install autopep8
- pip3 install wheel
- python3 -m pip install --user --upgrade pynvim

# python workflow

https://github.com/fannheyward/coc-pyright

- create venv in project: python3 -m venv .venv
- source .venv/bin/activate
- install modules with pip and work with Pyright
- deactivate

# on my tmux

[on my tmux setup](https://github.com/gpakosz/.tmux)

https://github.com/gpakosz/.tmux

Restore
https://zhuanlan.zhihu.com/p/259640277

Plugins

prefix + Ctrl-s - save; prefix + Ctrl-r - restore. https://github.com/tmux-plugins/tmux-resurrect

set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

restore vim/neovim session

set -g @resurrect-strategy-vim 'session'
set -g @resurrect-strategy-nvim 'session'
set -g @continuum-save-interval '5'
set -g @continuum-restore 'on'
set -g @resurrect-capture-pane-contents 'on'

Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)

run '~/.tmux/plugins/tpm/tpm'

# git keymap

G fetch
G switch feature/swz\*\*

G checkout branch
G checkout [commit ID]~1 -- path/to/file

G merge b

nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

#debug

- https://github.com/mfussenegger/nvim-dap-python
- Neovim Plugin: nvim-dap

# k8s yaml support

https://github.com/redhat-developer/yaml-language-server
Vim Kubernetes YAML Support
