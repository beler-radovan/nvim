return {
    parse ('main', table.concat({
        'int main() {\n',
        '    $0\n\n',
        '    return 0;\n',
        '}',
    })),
    parse ('for', table.concat({
        'for ($1; $2; $3) {\n',
        '    $4\n',
        '}\n$0',
    })),
    parse ('if', table.concat({
        'if ($1) {\n',
        '    $2\n',
        '}\n$0',
    })),
    parse ('do', table.concat({
        'do {\n',
        '    $1\n',
        '} while ($2);\n$0',
    })),
    parse ('while', table.concat({
        'while ($1) {\n',
        '    $2\n',
        '}\n$0',
    })),
}
