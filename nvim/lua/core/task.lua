--[[ task.lua ]]

local function capture_task()
    -- Function to get user input and clear the command line
    local function get_input(prompt)
        vim.api.nvim_out_write("\n") -- Add a newline before the prompt
        local input = vim.fn.input(prompt .. " (or 'qq' to quit): ")
        vim.cmd("normal! :") -- Clear the command line
        return input
    end

    -- Get outcome
    local outcome = get_input("Outcome")
    if outcome == "qq" then
        vim.api.nvim_out_write("Task capture cancelled.\n")
        vim.cmd("redraw")
        return
    end

    -- Get next action
    local next_action = get_input("Next Action")
    if next_action == "qq" then
        vim.api.nvim_out_write("Task capture cancelled.\n")
        vim.cmd("redraw")
        return
    end

    -- Prepare the task entry with a level 3 header for the Outcome and nested Next Action
    local task_entry = string.format("\n### %s\n\t- %s\n", outcome, next_action)

    -- Set the file path
    local file_path = vim.fn.expand("~/Documents/notes/pages/inbox.md")

    -- Ensure the directory exists
    vim.fn.mkdir(vim.fn.fnamemodify(file_path, ":h"), "p")

    -- Append the task to the file
    local file = io.open(file_path, "a")
    if file then
        file:write(task_entry)
        file:close()
        vim.api.nvim_out_write("Task captured successfully!\n")
    else
        vim.api.nvim_err_writeln("Error: Unable to open file for writing.")
    end

    -- Clear the command line again
    vim.cmd("redraw")
end

-- Set up the command and key mapping for capturing tasks
vim.api.nvim_create_user_command("CaptureTask", capture_task, {})
vim.api.nvim_set_keymap("n", "<Leader>t", ":CaptureTask<CR>", {noremap = true, silent = true})

-- Set up the key mapping for opening the capture.md file
vim.api.nvim_set_keymap("n", "<Leader>ot", ":edit ~/Documents/notes/pages/inbox.md<CR>", {noremap = true, silent = true})

