local function generateHeader(projectName, projectDescription)
    local year = vim.fn.system('date +%Y')
    vim.cmd("1")
    local header = {
        [[/*]],
        [[** EPITECH PROJECT, ]] .. year:sub(1, -2) .. "",
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
end

function InsertHeader()
    local cursor = vim.fn.getcurpos()

    local projectName = vim.fn.input("Enter a new project name: ")
    local projectDescription = vim.fn.input("Enter a new project description: ")
    generateHeader(projectName, projectDescription)
    cursor[1] = cursor[1] - 6
    vim.fn.setpos(".", cursor)
end

function CreateTest()
    local fileName = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), ''):sub(2)
    local filePath = "./tests/test_" .. fileName
    vim.fn.system("mkdir -p tests")
    local fileAlreadyExisted = vim.fn.system("test -f " .. filePath .. " && echo -n true")
    vim.fn.system("touch " .. filePath)
    vim.cmd(":e " .. filePath)
    print(fileAlreadyExisted)
    if fileAlreadyExisted ~= "true" then
        local criterionDeclaration = "#include <criterion/criterion.h>"
        vim.fn.append(0, criterionDeclaration)
        generateHeader("Test " .. fileName:sub(2, -2), "Unit test")
    end
end

vim.cmd("command! InsertHeader lua InsertHeader()")
vim.cmd("command! CreateTest lua CreateTest()")
