return {
    parse ('lf', table.concat({
        'local function $1($2)\n',
        '   $3\n',
        'end\n',
        '$0'
    })),
    parse ('fn', table.concat({
        'function $1($2)\n',
        '   $3\n',
        'end\n',
        '$0'
    })),
    parse ('if', table.concat({
        'if $1 then\n',
        '   $2\n',
        'end\n',
        '$0'
    })),
    parse ('for', table.concat({
        'for $1 do\n',
        '   $2\n',
        'end\n',
        '$0'
    })),
    parse ('wh', table.concat({
        'while $1 do\n',
        '   $2\n',
        'end\n',
        '$0'
    })),
}
