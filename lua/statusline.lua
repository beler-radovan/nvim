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

local color = {
    normal = '%#StatusLine#',
    mode = '%#Visual#',
}

local separators = {
    right = ''
}


local function getMode()
    local currentMode = api.nvim_get_mode()['mode']
    return modes[currentMode]
end

function getStatusLine()
    local statusLine = ''
    statusLine = statusLine .. color.mode
    statusLine = statusLine .. ' ' .. getMode() .. ' '
    statusLine = statusLine .. color.normal
    statusLine = statusLine .. ' %t'
    statusLine = statusLine .. ' %m '
    statusLine = statusLine .. '%='
    statusLine = statusLine .. '%y'
    statusLine = statusLine .. ' |'
    statusLine = statusLine .. ' %p%% '
    return statusLine
end

opt.statusline = '%{%luaeval("getStatusLine()")%}'
