-- set to 1 to automatically start the preview when opening a Markdown file. 0 to disable
vim.g.mkdp_auto_start = 1
-- set to 1 to automatilly close live preview when changing from markdown buffer to a non markdown buffer. 0 to disable
vim.g.mkdp_auto_close = 1
-- Set to 1 to enable refresh whenever the buffer is saved. 0 to disable
vim.mkdp_refresh_slow = 0
-- formatting display of file name

vim.g.mkdp_page_title = '「${name}」'

vim.g.mkdp_filetypes = { 'markdown' }

-- support for math region
vim.g.vim_markdown_math = 1

-- set default theme (dark or light)
vim.g.gmkdp_theme = 'dark'

--allow for latex box's
vim.g.textwidth=80
vim.opt_local.spell = true
vim.g.spelllang = "en"
vim.g.maplocalleader = ","
-- Key mappings
vim.keymap.set('n', '<LocalLeader>cc', '<Plug>MarkdownPreview', { noremap = true, silent = true })
vim.keymap.set('i', '<LocalLeader>cc', '<Esc><Plug>MarkdownPreview', { noremap = true, silent = true })
vim.keymap.set('n', '<LocalLeader>s', '<Plug>MarkdownPreviewStop', { noremap = true, silent = true })
vim.keymap.set('n', '<LocalLeader>c', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true })

-- Move to the last spelling mistake, autocorrect with first suggestion, then move back
vim.keymap.set('i', '<LocalLeader>q', '<C-G>u<Esc>[s1z=`]a<C-G>u', { noremap = true, silent = true })
vim.keymap.set('n', '<LocalLeader>q', '<C-G>u<Esc>[s1z=`]a<C-G>u', { noremap = true, silent = true }) 

--vim.api.nvim_create_autocmd('FileType', {
--  group = "MarkdownSettings",
--  pattern = 'markdown',
--  callback = function()
--    vim.api.nvim_set_hl(0, 'Normal', { fg = '#8B0000' })
--    vim.api.nvim_set_hl(0, 'Comment', { fg = '#0000FF' })
--    vim.api.nvim_set_hl(0, 'String', { fg = '#8B0000' })
--    vim.api.nvim_set_hl(0, 'Keyword', { fg = '#8B0000' })
--    vim.api.nvim_set_hl(0, 'Function', { fg = '#8B0000' })
--    vim.api.nvim_set_hl(0, 'Identifier', { fg = '#8B0000' })
--    vim.api.nvim_set_hl(0, 'Statement', { fg = '#8B0000' })
--  end
--})
