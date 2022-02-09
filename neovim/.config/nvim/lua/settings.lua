local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.autowrite = true      -- write before a make
opt.backspace = '2'       -- allow backspacing over everything in insert mode
opt.backupcopy = 'yes'    -- best for inotify
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.hidden = true         -- enable background buffers
opt.history = 100         -- keep 100 lines of command line history
opt.inccommand = 'nosplit' -- show substitute while typing
opt.joinspaces = false    -- two spaces after a period is for old fogeys
opt.laststatus = 2        -- always show a status line (with the current filename)
opt.listchars = {tab = '»·', trail = '·'}
opt.modeline = true
opt.modelines = 5
opt.mouse = "a"           -- enable mouse mode
opt.report = 0            -- threshold for reporting nr. of lines changed
opt.ruler = true          -- show the cursor position all the time
opt.shada = "!,'10,f0,h,s100" -- keep fast by avoiding lots of file/dir stats
opt.showcmd = true        -- show (partial) command in status line
opt.showmode = true       -- message on status line to show current mode
opt.showmatch = true      -- briefly jump to matching bracket
opt.warn = false          -- don't warn for shell command when buffer changed
opt.wildmode = {'longest', 'list', 'full'}
opt.wrap = false

-- Settings: tabs and indents
opt.autoindent = true
opt.comments = 'b:#,b:##,n:>,fb:-,fb:*'
opt.expandtab = true    -- default unless overridden by autocmd
-- formatoptions are in the order presented in fo-table
-- Aron leaves out a and w because he sets them in muttrc for format=flowed
opt.formatoptions:append {'t'} -- auto-wrap using textwidth (not comments)
opt.formatoptions:append {'c'} -- auto-wrap comments too
opt.formatoptions:append {'r'} -- continue the comment header automatically on <CR>
opt.formatoptions:remove {'o'} -- don't insert comment leader with 'o' or 'O'
opt.formatoptions:append {'q'} -- allow formatting of comments with gq
opt.formatoptions:append {'w'} -- trailing white space indicates paragraph
opt.formatoptions:append {'a'} -- Automatic formatting of paragraphs
opt.formatoptions:append {'n'} -- recognize numbered lists when autoindenting
opt.formatoptions:append {'2'} -- use second line of paragraph when autoindenting
opt.formatoptions:remove {'v'} -- don't worry about vi compatiblity
opt.formatoptions:remove {'b'} -- don't worry about vi compatiblity
opt.formatoptions:append {'l'} -- don't break long lines in insert mode
opt.formatoptions:append {'1'} -- don't break lines after one-letter words, if possible
opt.shiftround = true -- round indent < and > to multiple of shiftwidth
opt.shiftwidth = 4    -- overridden by editorconfig etc.
opt.smarttab = true   -- use shiftwidth when inserting <Tab>
opt.tabstop = 8       -- number of spaces that <Tab> in file uses
opt.textwidth = 80    -- by default, although plugins or autocmds can modify

-- Settings: search and completion
opt.complete:remove {'t'} -- don't search tags files by default
opt.complete:remove {'i'} -- don't search included files -- takes too long
opt.ignorecase = true -- "foo" matches "Foo", etc
opt.infercase = true  -- adjust the case of the match with ctrl-p/ctrl-n
opt.smartcase = true  -- ignorecase only when the pattern is all lower
opt.hlsearch = false  -- by default, don't highlight matches after they're found
opt.grepprg = 'rg --hidden --line-number --smart-case --sort-files'

-- Settings: windowing
opt.splitright = true
opt.splitbelow = true
opt.equalalways = true   -- keep windows equal when splitting (default)
opt.eadirection = 'both' -- ver/hor/both - where does equalalways apply
opt.fillchars = 'vert:╎'
opt.winwidth = 40

-- Settings: terminal
opt.termguicolors = true

-- colorscheme
--vim.cmd "colorscheme everforest"

--vim.g.material_style = 'lighter'
--require('material').setup({
--	contrast = {
--		sidebars = true,
--		cursor_line = true,
--	},
--	italics = {
--		comments = true,
--		functions = true,
--	},
--	contrast_filetypes = {
--		"terminal",
--		"packer",
--		"qf",
--	},
--	disable = {
--		borders = true,
--		eob_lines = true
--	},
--	lualine_style = 'stealth'
--})
--vim.cmd "colorscheme material"

--vim.g.neon_style = "light"
--vim.cmd [[colorscheme neon]]

require("github-theme").setup( {
  theme_style = "light",
})

