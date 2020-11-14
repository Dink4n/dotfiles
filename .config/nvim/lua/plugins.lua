local is_packer = pcall(vim.cmd, [[ packadd packer.nvim ]])

if not is_packer then

    if vim.fn.input("Download Packer? [Y/n]") ~= "y" then
        return 
    end

    local directory = string.format(
        "%s/site/pack/packer/opt/",
        vim.fn.stdpath("data")
    )

    vim.fn.mkdir(directory, "p")

    local output = vim.fn.system(string.format(
        "git clone https://github.com/wbthomason/packer.nvim %s",
        directory .. "packer.nvim"
    ))

    print(" ")
    print(output)
    print("Downloading Packer.nvim")

    return 
end

vim.cmd [[ packadd packer.nvim ]]

return require("packer").startup(function()
    local local_use = function(name)
        use { vim.fn.expand("~/Dev/my-plugins/") .. name }
    end

    -- Local stuff
    -- local_use 'harpoon-fork'

    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

    -- Lsp stuff --
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'tjdevries/nlua.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    -- Debugger --
    use 'puremourning/vimspector'
    use 'szw/vim-maximizer'

    -- TPOPE --
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make' } }

    -- Utilities --
    use 'mhinz/vim-startify'
    use 'jiangmiao/auto-pairs'
    use 'unblevable/quick-scope'
    use 'mbbill/undotree'
    use { 'jremmen/vim-ripgrep', cmd = 'Rg', opt = true }

    -- Fuzzy Finder --
    use {
        'nvim-lua/telescope.nvim',
        requires = {{ 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' }}
    }

    -- Fire Nvim --
    use {
        'glacambre/firenvim',
        run = function()
            vim.fn["firenvim#install"](0)
        end
    }

    -- ThePrimeagen
    use "ThePrimeagen/harpoon"

    -- Colorschemes --
    use 'gruvbox-community/gruvbox'
    use 'tomasr/molokai'
    use 'patstockwell/vim-monokai-tasty'
    use 'arcticicestudio/nord-vim'
end)
