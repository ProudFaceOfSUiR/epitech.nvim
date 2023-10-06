-- Define your predefined header
local header = "-- This is the header\n\n"

-- Function to insert the header at the top of the current buffer
local function insertHeader()
    -- Save the current cursor position
    local cursor = vim.fn.getcurpos()

    -- Move to the first line of the buffer
    vim.cmd("1")

    -- Insert the header at the beginning
    vim.fn.append(0, header)

    -- Restore the cursor position
    vim.fn.setpos(".", cursor)
end

-- Define a command to trigger the header insertion
vim.cmd("command! InsertHeader lua insertHeader()")


