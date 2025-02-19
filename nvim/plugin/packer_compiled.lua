-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/aj/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?.lua;/home/aj/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?/init.lua;/home/aj/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?.lua;/home/aj/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/aj/.cache/nvim/packer_hererocks/2.1.1703358377/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    config = { "\27LJ\2\ná\3\0\0\b\0\27\00116\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\1\5\0009\1\6\0014\2\3\0005\3\b\0>\3\1\2=\2\a\0019\1\5\0009\1\t\0014\2\4\0009\3\n\0'\5\v\0'\6\f\0'\a\r\0B\3\4\2>\3\1\0029\3\n\0'\5\14\0'\6\15\0'\a\16\0B\3\4\2>\3\2\0029\3\n\0'\5\17\0'\6\18\0'\a\19\0B\3\4\0?\3\0\0=\2\a\0016\1\20\0009\1\21\0019\1\22\1'\3\23\0'\4\24\0'\5\25\0005\6\26\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\15:Alpha<cr>\n<c-s>\6n\20nvim_set_keymap\bapi\bvim\f:qa<cr>\14quit nvim\6q#:e ~/.config/nvim/init.lua<cr>\18neovim config\6v :ene <bar> startinsert <cr>\rnew file\6e\vbutton\19bottom_buttons\1\0\2\bval\3\0\ttype\fpadding\bval\fmru_cwd\fsection\topts\26alpha.themes.startify\nsetup\nalpha\frequire\a€€À™\4\0" },
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  molokai = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/molokai",
    url = "https://github.com/tomasr/molokai"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/vim-cmake",
    url = "https://github.com/cdelledonne/vim-cmake"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ndelay\3¸\23\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/aj/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\ná\3\0\0\b\0\27\00116\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\1\5\0009\1\6\0014\2\3\0005\3\b\0>\3\1\2=\2\a\0019\1\5\0009\1\t\0014\2\4\0009\3\n\0'\5\v\0'\6\f\0'\a\r\0B\3\4\2>\3\1\0029\3\n\0'\5\14\0'\6\15\0'\a\16\0B\3\4\2>\3\2\0029\3\n\0'\5\17\0'\6\18\0'\a\19\0B\3\4\0?\3\0\0=\2\a\0016\1\20\0009\1\21\0019\1\22\1'\3\23\0'\4\24\0'\5\25\0005\6\26\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\15:Alpha<cr>\n<c-s>\6n\20nvim_set_keymap\bapi\bvim\f:qa<cr>\14quit nvim\6q#:e ~/.config/nvim/init.lua<cr>\18neovim config\6v :ene <bar> startinsert <cr>\rnew file\6e\vbutton\19bottom_buttons\1\0\2\bval\3\0\ttype\fpadding\bval\fmru_cwd\fsection\topts\26alpha.themes.startify\nsetup\nalpha\frequire\a€€À™\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ndelay\3¸\23\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
