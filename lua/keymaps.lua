-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Shortcuts for nvim-tree folder structure
vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", {noremap = true, silent = true })

-- Shotcut for commenting out python 

local function comment_out(opts)
    local start = math.min(opts.line1, opts.line2)
    local finish = math.max(opts.line1, opts.line2)
    vim.api.nvim_command(start .. "," .. finish .. "s:^:#:")
    vim.api.nvim_command("noh")
end

local function uncomment(opts)
    local start = math.min(opts.line1, opts.line2)
    local finish = math.max(opts.line1, opts.line2)

    vim.api.nvim_command(start .. "," .. finish .. "s:^" .. "#" .. "::")
    vim.api.nvim_command("noh")
end

vim.api.nvim_create_user_command("CommentOut", comment_out, {range = true})
vim.keymap.set("v", "<leader>co", ":CommentOut<CR>")
vim.keymap.set("n", "<leader>co", ":CommentOut<CR>")

vim.api.nvim_create_user_command("Uncomment", uncomment, { range = true })
vim.keymap.set("v", "<leader>uc", ":Uncomment<CR>")
vim.keymap.set("n", "<leader>uc", ":Uncomment<CR>")
