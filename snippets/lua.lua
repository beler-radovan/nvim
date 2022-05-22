return {
    parse ('fn', table.concat({
        'function $1($2)\n',
        '   $3\n',
        'end\n',
        '$0'
    })),
    parse ('lf', table.concat({
        'local function $1($2)\n',
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
    parse ('rep', table.concat({
        'repeat\n',
        '   $1\n',
        'until $2\n',
        '$0'
    })),
    parse ('t', table.concat({
        '$1 = {\n',
        '   $2\n',
        '}\n',
        '$0'
    })),
    parse ('lt', table.concat({
        'local $1 = {\n',
        '   $2\n',
        '}\n',
        '$0'
    })),
}
