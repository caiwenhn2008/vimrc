# Install tools

- brew install fz
- $(brew --prefix)/opt/fzf/install
- brew install ripgrep

# Font setup

Install a nerdfont and configure your terminal to use it (otherwise icons will not display correctly)
On a mac you can install one via, eg:

- brew tap homebrew/cask-fonts
- brew install --cask font-victor-mono-nerd-font
- brew install --cask font-hack-nerd-font

# python support

- pip3 install autopep8
- pip3 install wheel
- python3 -m pip install --user --upgrade pynvim

# on my tmux

[on my tmux setup](https://github.com/gpakosz/.tmux)

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
