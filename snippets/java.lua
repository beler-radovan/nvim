local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.text_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local sn = ls.sn
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
    -- Language statements
    s("pc", fmt(table.concat({
        "public class {} {{\n",
        "\n",
        "    {}\n",
        "\n",
        "}}"}),
        {i(1), i(2)})
    ),
    s("main", fmt(table.concat({
        "public static void main(String[] args) {{\n",
        "    {}\n",
        "}}"}),
        {i(1)})
    ),
    s("sout", fmt("System.out.println({});{}", { i(1), i(2) }))
}
