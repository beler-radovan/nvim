local opt = vim.opt
local api = vim.api

local modes = setmetatable(
    {
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
    },
    {
        __index = function()
            return 'UNKNOWN'
        end
    }
)

local icons = {
    rightFullSep = '',
    rightHollowSep = '',
    leftFullSep = '',
    leftHollowSep = '',
}

local function setHighlight(groupName, fg, bg)
    vim.cmd('highlight '..groupName..' guifg='..fg..' guibg='..bg)
    return '%#' .. groupName .. '#'
end

local function getColor()
    local color = {}
    if vim.g.colors_name == 'vscode' then
        local vscColors = require('vscode.colors').generate()
        color.blue = setHighlight('Blue', vscColors.vscFront, vscColors.vscSelection)
        color.blueSep = setHighlight('BlueSep', vscColors.vscSelection, vscColors.vscBack)
        color.red = setHighlight('Red', vscColors.vscRed, vscColors.vscBack)
        color.yellow = setHighlight('Yellow', vscColors.vscOrange, vscColors.vscBack)
        color.none = setHighlight('None', vscColors.vscFront, vscColors.vscNone)
    end
    return color
end

local function getMode()
    local currentMode = api.nvim_get_mode()['mode']
    return modes[currentMode]
end

local function getFileType()
    local fileType = vim.bo.filetype
    if fileType == '' then
        return 'TEXT'
    else
        return '%Y'
    end
end

local function getEncoding()
    return vim.opt.fileencoding:get()
end

local function getDiagnostics()
	local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local hints = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local info = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    local diagnostics = ''
    diagnostics = diagnostics .. 'E:' .. #errors
    diagnostics = diagnostics .. ' W:' .. #warnings
    diagnostics = diagnostics .. ' I:' .. #info
    diagnostics = diagnostics .. ' H:' .. #hints
    return diagnostics
end

local function lspClientAttached()
    local numberOfClients = #vim.lsp.get_active_clients(0)
    return numberOfClients > 0
end

local function getBranch()
    return 'master'
end

function getStatusLine()
    local color = getColor()

    local statusLine = ''
    statusLine = statusLine .. color.blue
    statusLine = statusLine .. ' ' .. getMode() .. ' '
    statusLine = statusLine .. color.blueSep
    statusLine = statusLine .. icons.rightFullSep
    statusLine = statusLine .. color.none
    -- print LSP diagnostics if at least one LSP client is attached
    -- to the current buffer
    if lspClientAttached() then
        statusLine = statusLine .. ' ' .. getDiagnostics() .. ' '
        statusLine = statusLine .. icons.rightHollowSep
    end
    statusLine = statusLine .. ' ' .. getBranch() .. ' '
    statusLine = statusLine .. '%='
    statusLine = statusLine .. ' ' .. getEncoding() .. ' '
    statusLine = statusLine .. icons.leftHollowSep
    statusLine = statusLine .. ' ' .. getFileType() .. ' '
    statusLine = statusLine .. icons.leftHollowSep
    statusLine = statusLine .. ' %p%% '
    statusLine = statusLine .. color.blueSep
    statusLine = statusLine .. icons.leftFullSep
    statusLine = statusLine .. color.blue
    statusLine = statusLine .. ' %l:%c '

    return statusLine
end
opt.statusline = '%{%luaeval("getStatusLine()")%}'
