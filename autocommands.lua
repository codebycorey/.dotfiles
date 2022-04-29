vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        -- vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

local test = 'yes'

print(test)
