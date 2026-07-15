vim.cmd.colorscheme('industry')

-- General Settings
vim.opt.hlsearch = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent= true
vim.opt.cindent = true
vim.opt.spell.spelllang = "en_us"
vim.api.nvim_set_hl(0, "ExtraWhitespace", {bg = "#ff0000"})
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.keymap.set('n', '<Space>', 'za', { desc = 'Toggle fold' })
vim.keymap.set('t', '<C-Space>', '<C-\\><C-n>') -- Map exit terminal to Ctrl + Space

-- Netrw Settings
vim.g.netrw_buffsettings = 'noma nomod nu nowrap ro nobl'  -- Keeps hybrid lines on
vim.g.netrw_listsystle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 15

-- Maps :Vex to Crtl-N
vim.keymap.set('n', '<C-N>', ':Vex<CR>')

-- Close Netrw after opening a file
vim.g.netrw_fastbrowse = 0
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'netrw',
    callback = function()
        vim.opt_local.bufhidden = 'wipe'
    end,
})

local close_netrw_group = vim.api.nvim_create_augroup('CloseOnOpen', {clear = true})

vim.api.nvim_create_autocmd('BufWinEnter', {
    group = close_netrw_group,
    callback = function()
        local current_ft = vim.bo.filetype
        if current_ft ~= 'netrw' then
            local bufs = vim.api.nvim_list_bufs()
            for _, bufn in ipairs(bufs) do
                if vim.api.nvim_buf_is_loaded(bufn) and vim.bo[bufn].filetype == 'netrw' then
                    vim.api.nvim_buf_delete(bufn, {})
                    return
                end
            end
        end
    end,
})

-- Tabline
function _G.MyTabLine()
  local s = ""
  for i = 1, vim.fn.tabpagenr("$") do
    if i == vim.fn.tabpagenr() then
      s = s .. "%#TabLineSel#"
    else
      s = s .. "%#TabLine#"
    end
    local buflist = vim.fn.tabpagebuflist(i)
    local winnr = vim.fn.tabpagewinnr(i)
    local bufname = vim.fn.bufname(buflist[winnr])
    local filename = vim.fn.fnamemodify(bufname, ":t")
    if filename == "" then
      filename = "[No Name]"
    end
    s = s .. " " .. i .. ":" .. filename .. " "
  end

  s = s .. "%#TabLineFill#%T"
  return s
end

vim.opt.tabline = "%!v:lua.MyTabLine()"
vim.opt.showtabline = 2

-- Whitespace highlighting and Auto remove
vim.cmd([[match ExtraWhitespace /\s\+$/]])
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = '#ff0000' })

local trim_group = vim.api.nvim_create_augroup('TrimTrailingWhitespace', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = trim_group,
  pattern = '*',
  callback = function()
    local view = vim.fn.winsaveview()
    local search = vim.fn.getreg('/')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(view)
    vim.fn.setreg('/', search)
  end,
})

-- C++ LSP
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'c', 'cpp'},
  callback = function()
    vim.lsp.start({
      name = 'clangd',
      cmd = {'clangd', '--compile-commands-dir=build'},
      root_dir = vim.fs.dirname(vim.fs.find({'build',  '.git'}, { upward = true })[1]),
    })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }

    -- Jump to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- Show hover documentation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- Show available code actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    -- Rename symbol
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end,
})

-- Open all project diagnostics in the quickfix window
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostic quickfix list' })
-- Show diagnostic under the cursor in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- Jump to next/previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

-- Toggle comments
local function toggle_line_comment(bufnr, line_idx, comment_prefix, match_prefix)
  local line_text = vim.api.nvim_buf_get_lines(bufnr, line_idx, line_idx + 1, false)[1]
  if not line_text then return end
  if line_text:sub(1, #match_prefix) == match_prefix then
    local stripped = line_text:sub(#match_prefix + 1)
    if stripped:sub(1, 1) == " " then
      stripped = stripped:sub(2)
    end
    vim.api.nvim_buf_set_lines(bufnr, line_idx, line_idx + 1, false, { stripped })
  else
    vim.api.nvim_buf_set_lines(bufnr, line_idx, line_idx + 1, false, { comment_prefix .. line_text })
  end
end

local function comment_at_start()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  local comment_prefix = ""
  if ft == "c" or ft == "cpp" then
    comment_prefix = "// "
  else
    local commentstring = vim.bo[bufnr].commentstring
    if commentstring == "" then
      print("No commentstring defined for this filetype.")
      return
    end
    comment_prefix = commentstring:gsub("%%s", "")
  end

  local match_prefix = comment_prefix:gsub("%s+$", "")
  local mode = vim.api.nvim_get_mode().mode

  if mode:match("[vV]") then
    vim.cmd([[execute "normal! \<ESC>"]])
    local start_line = vim.api.nvim_buf_get_mark(bufnr, "<")[1]
    local end_line = vim.api.nvim_buf_get_mark(bufnr, ">")[1]
    for i = start_line - 1, end_line - 1 do
      toggle_line_comment(bufnr, i, comment_prefix, match_prefix)
    end
    vim.cmd("normal! gv")
  else
    local current_line_idx = vim.api.nvim_win_get_cursor(0)[1] - 1
    toggle_line_comment(bufnr, current_line_idx, comment_prefix, match_prefix)
  end
end

-- Keymap to Ctrl + /
vim.keymap.set({'n', 'x'}, '<C-_>', comment_at_start, { desc = 'Toggle comment at start of line' })

