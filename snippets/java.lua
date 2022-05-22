return {
    parse ('sout', table.concat({
        'System.out.println($1);$0\n',
    })),
}
