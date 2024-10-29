-- options for vim-slime
vim.g.slime_target = "tmux"
-- target pane is right pane
vim.g.slime_default_config = { socket_name = "default", target_pane = ":.1" }
vim.g.slime_cell_delimiter = "# %%"
vim.g.slime_bracketed_paste = 1
