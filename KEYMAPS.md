# Neovim Keymaps Cheat Sheet

**Leader Key:** `Space`

## Vi Basics (Always Available)

| Key | Action | Mode |
|-----|--------|------|
| `x` | Delete character (no yank) | Normal |
| `+` | Increment number | Normal |
| `-` | Decrement number | Normal |
| `Ctrl+a` | Select all | Normal |

## File Operations

| Key | Action |
|-----|--------|
| `<leader>w` | Save file (`:w`) |
| `<leader>q` | Quit (`:q`) |
| `<leader>Q` | Quit all (`:qa`) |

## Search

| Key | Action |
|-----|--------|
| `Esc` | Clear search highlights |
| `/pattern` | Search forward (vi default) |
| `?pattern` | Search backward (vi default) |
| `n` | Next match (vi default) |
| `N` | Previous match (vi default) |

## Window Navigation

| Key | Action |
|-----|--------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to lower window |
| `Ctrl+k` | Move to upper window |
| `Ctrl+l` | Move to right window |
| `Ctrl+w s` | Split horizontal (vi default) |
| `Ctrl+w v` | Split vertical (vi default) |
| `Ctrl+w q` | Close window (vi default) |

## Tab Management

| Key | Action |
|-----|--------|
| `te` | Open new tab |
| `Tab` | Next tab |
| `Shift+Tab` | Previous tab |
| `tw` | Close tab |

## Terminal Mode

| Key | Action |
|-----|--------|
| `Esc Esc` | Exit terminal mode |

## Diagnostics (LSP Errors/Warnings)

| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>e` | Show diagnostic in floating window |
| `<leader>d` | Open diagnostic list |

## Telescope (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Search help tags |
| `<leader>fr` | Recent files |
| `<leader>/` | Search in current buffer |

## LSP (Language Server Features)

These work when an LSP is attached to your buffer:

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>D` | Type definition |

## Completion (Insert Mode)

| Key | Action |
|-----|--------|
| `Ctrl+n` | Next completion |
| `Ctrl+p` | Previous completion |
| `Ctrl+y` | Confirm completion |
| `Ctrl+Space` | Trigger completion |
| `Ctrl+b` | Scroll docs up |
| `Ctrl+f` | Scroll docs down |
| `Ctrl+l` | Jump to next snippet placeholder |
| `Ctrl+h` | Jump to previous snippet placeholder |

## Vi Commands You Should Know

### Motion
- `h j k l` - Move left, down, up, right
- `w` - Next word
- `b` - Previous word
- `e` - End of word
- `0` - Start of line
- `$` - End of line
- `gg` - Top of file
- `G` - Bottom of file
- `{number}G` - Go to line number

### Editing
- `i` - Insert before cursor
- `a` - Insert after cursor
- `I` - Insert at start of line
- `A` - Insert at end of line
- `o` - New line below
- `O` - New line above
- `dd` - Delete line
- `yy` - Yank (copy) line
- `p` - Paste after cursor
- `P` - Paste before cursor
- `u` - Undo
- `Ctrl+r` - Redo
- `.` - Repeat last change

### Visual Mode
- `v` - Visual mode (character)
- `V` - Visual line mode
- `Ctrl+v` - Visual block mode

### Text Objects
- `ciw` - Change inner word
- `daw` - Delete around word
- `ci"` - Change inside quotes
- `di(` - Delete inside parentheses
- `yap` - Yank around paragraph


