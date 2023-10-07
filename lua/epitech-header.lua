function InsertHeader()
    local cursor = vim.fn.getcurpos()

    local projectName = vim.fn.input("Enter a new project name: ")
    local projectDescription = vim.fn.input("Enter a new project description: ")
    vim.cmd("1")
    local header = {
        [[/*]],
        [[** EPITECH PROJECT, 2023]],
        [[** ]],
        [[** File description:]],
        [[** ]],
        [[*/]]
    }

    for i, h_line in ipairs(header) do
        if i == 3 then
            vim.fn.append(i - 1, h_line .. projectName)
            goto continue
        end
        if i == 5 then
            vim.fn.append(i - 1, h_line .. projectDescription)
            goto continue
        end
        vim.fn.append(i - 1, h_line)
        ::continue::
    end
    cursor[1] = cursor[1] - 6
    vim.fn.setpos(".", cursor)
end

vim.cmd("command! InsertHeader lua InsertHeader()")


