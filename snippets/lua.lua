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
    s("req", fmt("local {} = require(\"{}\")",
        {i(1), i(2)})
    ),
    s("fn", fmt(table.concat({
        "{} = function({})\n",
        "    {}\n",
        "end{}"}),
        {i(1), i(2), i(3), i(4)})
    ),
    s("lf", fmt(table.concat({
        "local {} = function({})\n",
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
    s("if", fmt(table.concat({
        "if {} then\n",
        "    {}\n",
        "end{}"}),
        {i(1), i(2), i(3)})
    ),
    s("for", fmt(table.concat({
        "for {} do\n",
        "    {}\n",
        "end{}"}),
        {i(1), i(2), i(3)})
    ),
    s("fori", fmt(table.concat({
        "for {} in ipairs({}) do\n",
        "    {}\n",
        "end{}"}),
        {i(1), i(2), i(3), i(4)})
    ),
    s("forp", fmt(table.concat({
        "for {} in pairs({}) do\n",
        "    {}\n",
        "end{}"}),
        {i(1), i(2), i(3), i(4)})
    ),
    s("while", fmt(table.concat({
        "while {} do\n",
        "    {}\n",
        "end{}"}),
        {i(1), i(2), i(3)})
    ),
    s("repeat", fmt(table.concat({
        "repeat\n",
        "    {}\n",
        "until {}"}),
        {i(1), i(2)})
    ),
    s("rv", fmt(table.concat({
        "local {} = {}\n",
        "{}\n",
        "return {}"}),
        {i(1), i(2), i(3), rep(1)})
    ),
    -- Frequently used functions
    s("print", fmt("print({})", i(1))),

    -- Frequently used statements
    s("en", fmt("{}", t("== nil"))),
    s("nn", fmt("{}", t("~= nil"))),
    s("loc", fmt("local {} = {}", { i(1), i(2) })),
}
