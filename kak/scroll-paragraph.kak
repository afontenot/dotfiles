define-command -hidden paragraph-scroll-down %{
    evaluate-commands -save-regs "mno" %{
        reg m "%val{selections_desc}"
        reg n "%val{cursor_line}"
        execute-keys "<esc>]p?\w<ret>;"
        reg o "%val{cursor_line}"
        select "%reg{m}"
        execute-keys %sh{
            while [ "$kak_main_reg_n" -lt "$kak_main_reg_o" ]; do
                printf 'jvj'
                kak_main_reg_n=$((kak_main_reg_n + 1))
            done
	    }
    }
}

define-command -hidden paragraph-scroll-up %{
    evaluate-commands -save-regs "mno" %{
        reg m "%val{selections_desc}"
        reg n "%val{cursor_line}"
        execute-keys "<esc>/\w<ret>l[p[p;"
        reg o "%val{cursor_line}"
        select "%reg{m}"
        execute-keys %sh{
            while [ "$kak_main_reg_n" -gt "$kak_main_reg_o" ]; do
                printf 'kvk'
                kak_main_reg_n=$((kak_main_reg_n - 1))
            done
	    }
    }
}

map -docstring "scroll down one paragraph" global view d "<esc>:paragraph-scroll-down<ret>"
map -docstring "scroll up one paragraph" global view u "<esc>:paragraph-scroll-up<ret>"
