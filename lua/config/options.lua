-- sets the leader key to space ; leader key - a key which will precde every shortcut
vim.g.mapleader = " "

-- syncs os clipboard with noevim
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- sets the encoding of vim scripts to utf-8
vim.scriptencoding = "utf-8"

-- sets the overall encoding to utf-8
vim.opt.encoding = "utf-8"

-- specifies that files should we written and read using utf-8 
vim.opt.fileencoding = "utf-8"

-- enables line numbers in the editor
vim.opt.number = true

-- enables relative line numbers depending on current line
vim.opt.relativenumber = true

-- displays the file name in the title bar of the terminal window
vim.opt.title = true

-- automatically indents new lines to march indentation level of the previous line
vim.opt.autoindent = true

-- provides intelligent automatic indentation based on syntax of the code being edited
vim.opt.smartindent = true

-- enables highlights of all matches of the last searched pattern
vim.opt.hlsearch = true

-- disables backup file creation - not sure of this one yet (?)
vim.opt.backup = false

-- displays incomplete commands in the command area at the bottom of the window
vim.opt.showcmd = true

-- converts tabs into spaces - will try it out, not sure  (?)
vim.opt.expandtab = true

-- keeps 10 lines visible above and below the cursor when scrolling
vim.opt.scrolloff = 10

-- shows a live preview of substitutions when using s:
vim.opt.inccommand = "split"

-- makes searches case insensetive unless uppercase letters are used in the search pattern
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- allows for smarter tabbing behaviour
vim.opt.smarttab = true

-- allows wrapped lines to be visually indented (?)
vim.opt.breakindent = true

-- sets the number of spaces used for each step of autoindentation
vim.opt.shiftwidth = 2

-- sets how many spaces is a tab
vim.opt.tabstop = 2

-- disables line wrapping
vim.opt.wrap = false

-- configures backspacing behaviour to allow backspacing over insertion start points, end-of-line characters and indentation levels (?)
vim.opt.backspace = {"start", "eol", "indent"}

-- adds all subdirectories recursively to the search path for file commands (for example find:) - this allows faster searching threw nested directories (?)
vim.opt.path:append({"**"})

-- ignores files and directories matching the pattern - here node modules
vim.opt.wildignore:append({"*/node_modules/*"})

-- keeps the cursor stable when opening new splits
vim.opt.splitkeep = "cursor"

-- enables mouse mode for resizing window splits
vim.opt.mouse = "a"

-- saves undo history
vim.opt.undofile = true

-- keeps sign column on as default - not sure yet (?)
vim.opt.signcolumn = "yes"

-- decrease update time for smoother workflow (file creation etc.)
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
-- displays which-key popup sooner
vim.opt.timeoutlen = 300

-- configures how new splits should be open
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
-- :help list for more
-- :help listchars
vim.opt.list = true
vim.opt.listchars = { tab ='» ', trail = '·', nbsp = '␣'}

-- shows which line your cursor is currently on
vim.opt.cursorline = true

-- all for now



