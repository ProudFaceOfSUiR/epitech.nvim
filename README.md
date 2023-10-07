# EPITECH.nvim

A very simple neovim plugin for generating headers, according to the template
```
/*
** EPITECH PROJECT, $YEAR
** $NAME_OF_THE_PROJECT
** File description:
** No file there, just an epitech header example.
** You can even have multiple lines if you want! 
*/
```

### Installation:
**lazy.nvim**
```lua
{
    "ProudFaceOfSUiR/epitech.nvim",
    lazy = false,
    config = function ()
        require("epitech-header")
    end
}
```

### Usage:
The only available command for you is `:InsertHeader`. It will ask you to type the name and description of your project and then inject the header in the beginning of your file. You can also set a keymap for it:
```lua
vim.keymap.set("n", "<leader>ih", ":InsertHeader<CR>")
```

### TODO:
- add ability to create Makefile headers
- may be something else, not sure
