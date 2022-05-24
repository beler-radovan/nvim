local ls = require "luasnip"
local s = ls.s
local i = ls.i
local t = ls.text_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep

return {
    s("req", fmt("local {} = require(\"{}\")",
        {i(1), i(2)})
    ),
    s("fn", fmt(table.concat({
        "function {}({})\n",
        "    {}\n",
        "end{}"}),
        {i(1), i(2), i(3), i(4)})
    ),
    s("lf", fmt(table.concat({
        "local function {}({})\n",
        "    {}\n",
        "end{}"}),
        {i(1), i(2), i(3), i(4)})
    ),
    s("ta", fmt(table.concat({
        "{}{} = {{\n",
        "    {}\n",
        "}}{}"}),
        {c(1, {t"local ", t""}), i(2), i(3), i(4)})
    ),
}
