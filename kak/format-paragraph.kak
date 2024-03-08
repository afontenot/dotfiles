define-command format-paragraph %{
    evaluate-commands -save-regs 'm|'%{
        reg m "%val{selections_desc}"
        execute-keys -draft "<a-i>p|%opt{formatcmd}<ret>"
        select "%reg{m}"
    }
}
