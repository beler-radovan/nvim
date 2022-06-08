local opt = vim.opt
local api = vim.api

local modes = setmetatable({
        ['n'] = 'NORMAL',
        ['no'] = 'N-PENDING',
        ['nov'] = 'N-PENDING',
        ['noV'] = 'N-PENDING',
        ['noCTRL-V'] = 'N-PENDING',
        ['niI'] = 'NORMAL',
        ['niR'] = 'NORMAL',
        ['niV'] = 'NORMAL',
        ['nt'] = 'N-TERMINAL',
        ['v'] = 'VISUAL',
        ['vs'] = 'VISUAL',
        ['V'] = 'V-LINE',
        ['Vs'] = 'V-LINE',
        ['\22'] = 'V-BLOCK',
        ['\22s'] = 'V-BLOCK',
        ['s'] = 'SELECT',
        ['S'] = 'SELECT',
        ['\19'] = 'SELECT',
        ['i'] = 'INSERT',
        ['ic'] = 'INSERT',
        ['ix'] = 'INSERT',
        ['R'] = 'REPLACE',
        ['Rc'] = 'REPLACE',
        ['Rx'] = 'REPLACE',
        ['Rv'] = 'R-VISUAL',
        ['Rvc'] = 'R-VISUAL',
        ['Rvx'] = 'R-VISUAL',
        ['c'] = 'EXEC',
        ['cv'] = 'EXEC',
        -- ['r'] = '',
        -- ['rm'] = '',
        -- ['r?'] = '',
        -- ['!'] = '',
        ['t'] = 'TERMINAL',
    }, {
        __index = function()
            return 'UNKNOWN'
        end
    }
)

local icons = {
    right_full_sep = '',
    right_hollow_sep = '',
    left_full_sep = '',
    left_hollow_sep = '',
}

local function set_highlight(group_name, fg, bg)
    vim.cmd('highlight '..group_name..' guifg='..fg..' guibg='..bg)
    return '%#' .. group_name .. '#'
end

local function get_colors()
    local color = {}
    if vim.g.colors_name == 'vscode' then
        local vsc_colors = require('vscode.colors').generate()
        color.blue = set_highlight('Blue', vsc_colors.vscFront, vsc_colors.vscSelection)
        color.blue_sep = set_highlight('BlueSep', vsc_colors.vscSelection, vsc_colors.vscBack)
        color.none = set_highlight('None', vsc_colors.vscFront, vsc_colors.vscNone)
    end
    return color
end

local function get_mode()
    local current_mode = api.nvim_get_mode()['mode']
    return modes[current_mode]
end

local function get_file_type()
    local file_type = vim.bo.filetype
    if file_type == "" then
        return "text"
    else
        return file_type
    end
end

local function get_encoding()
    return vim.opt.fileencoding:get()
end

local function get_diagnostics()
    local number_of_clients = #vim.lsp.get_active_clients(0)
    if number_of_clients < 1 then
        return nil
    end

    local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local hints = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    local info = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    local diagnostics = ''
    diagnostics = diagnostics .. 'E' .. #errors
    diagnostics = diagnostics .. '-W' .. #warnings
    diagnostics = diagnostics .. '-I' .. #info
    diagnostics = diagnostics .. '-H' .. #hints
    return diagnostics
end

local function get_branch()
    -- redirect output from stderr to stdout, because popen reads output
    -- only from stdout
    local output = io.popen("git branch 2>&1", "r")
    if output == nil then
        return nil
    end

    local match = ''
    for line in output:lines() do
        match = string.match(line, "^fatal:")
        if match then
            return nil
        end

        match = string.match(line, "^*")
        if match then
            local branch = string.match(line, "%g+$")
            return branch
        end
    end

    return nil
end

function get_status_line()
    local color = get_colors()

    local status_line = ''
    status_line = status_line .. color.blue
    status_line = status_line .. ' ' .. get_mode() .. ' '
    status_line = status_line .. color.blue_sep
    status_line = status_line .. icons.right_full_sep
    status_line = status_line .. color.none
    local diagnostics = get_diagnostics()
    if diagnostics ~= nil then
        status_line = status_line .. ' ' .. diagnostics .. ' '
    end
    local branch = get_branch()
    if branch ~= nil then
        if diagnostics ~= nil then
            status_line = status_line .. icons.right_hollow_sep
        end
        status_line = status_line .. ' ' .. branch .. ' '
    end
    status_line = status_line .. '%='
    status_line = status_line .. ' ' .. get_file_type() .. ' '
    status_line = status_line .. icons.left_hollow_sep
    status_line = status_line .. ' ' .. get_encoding() .. ' '
    status_line = status_line .. icons.left_hollow_sep
    status_line = status_line .. ' %p%% '
    status_line = status_line .. color.blue_sep
    status_line = status_line .. icons.left_full_sep
    status_line = status_line .. color.blue
    status_line = status_line .. ' %l:%c '

    return status_line
end
opt.statusline = '%{%luaeval("get_status_line()")%}'
