local capabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require('luasnip')
local cmp = require('cmp')
local lspconfig = require('lspconfig')
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

-- === General Config ===
vim.opt.completeopt={'menu', 'menuone', 'noselect'}
vim.diagnostic.config({signs = false})

-- === Luasnip Setup ===
luasnip.config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})


-- === Telescope Setup === 
telescope.load_extension('fzf')
telescope.setup{
  defaults = {
    prompt_prefix = "$ ",
--    mappings = {
--      i = {
--        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
--        ['<c-a>'] = function() print("hskj") end
--      }
--    }
  },
}
--  pickers = {
--  },
--  extensions = {
--    -- }
--  }

-- === Treesitter Setup ===
require'nvim-treesitter.configs'.setup{
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "python", "lua", "latex", "bash", "javascript", "html" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  modules = {},

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {"latex"},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- list of language that will be disabled
    disable = {"latex", "vimdoc"},
--    disable = function(lang, buf)
--        local max_filesize = 100 * 1024 -- 100 KB
--        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--        if ok and stats and stats.size > max_filesize then
--            return true
--        end
--    end,

    additional_vim_regex_highlighting = false,
  },
}

-- === Lspconfig Setup === 
lspconfig.pyright.setup{
  capabilities = capabilities,
  on_attach = function()
  vim.keymap.set("n", "I", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) -- go to source code
  -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- what does this do?
  vim.keymap.set("n", "ne", vim.diagnostic.goto_next, {buffer=0}) -- moves to next error
  --vim.keymap.set("n", "le", "<cmd>Telescope diagnostics<cr>", {buffer=0})
  vim.keymap.set("n", "R", vim.lsp.buf.rename, {buffer=0})
  end
}

lspconfig.html.setup{
  capabilities = capabilities,
}

--lspconfig.ccls.setup{}

lspconfig.lua_ls.setup{
  on_attach = function()
  vim.keymap.set("n", "I", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },

      workspace = {
        --library = vim.api.nvim_get_runtime_file("", true),
        library = vim.fn.expand("~/.config"),
        ignoreDir = {
          ".git",
          "node_modules",
          "build"
        }
      },

      telemetry = {
        enable = false,
      }

    },

  }
}






--- === Cmp Setup ===
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) --luasnip users
    end,
  },
  window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
--      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({ -- Order matters
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Disable autocomplete for filetype tex
--cmp.setup.filetype("tex", {
--  sources = cmp.config.sources({
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--    {
--    { name = 'buffer' }
--  }})
--})
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline({ '/', '?' }, {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--      { name = 'buffer' }
--    }
--  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })

--}

--- === Set module functions ===
local mappings = {

}

mappings.curr_buf = function()
  local opts = require('telescope.themes').get_ivy()
  telescope_builtin.current_buffer_fuzzy_find(opts)
end

mappings.grep_code_notes = function()
  telescope_builtin.live_grep {
    cwd="~/documents/notes/code/",
    prompt_title = "Cmpsci Notes",
    preview_cutoff = 1,
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.80,
      width = 0.95,
    }
  }
end


return mappings


