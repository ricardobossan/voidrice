-- Rencontrar e colar registers: https://stackoverflow.com/a/1498026
--[[ Replacements in macros:

| Original | Replacement |
|   ---    | ---         |
| <ESC> |  |
| <CR> | 
||�|
  :s/- /\~\~/
--]]

vim.cmd('let @q="^lF-wi~~A~~j0"')