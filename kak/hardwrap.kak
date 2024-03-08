# functions for wrapping lines

define-command hardwrap -params 1 %{
    nowrap
    set-option window autowrap_column %arg{1}
    set-option window autowrap_format_paragraph true
    add-highlighter window/wrapline column %sh{printf $((${kak_opt_autowrap_column} + 1))} default,bright-black
    autowrap-enable
}

define-command softwrap -params 0..1 %{
    nowrap
    try %{
        set-option window autowrap_column %arg{1}
        add-highlighter window/wrapline column %sh{printf $((${kak_opt_autowrap_column} + 1))} default,bright-black
        add-highlighter window/softwrap wrap -width %arg{1} -marker " "
    } catch %{
        add-highlighter window/softwrap wrap -marker " "
    }
}

define-command nowrap %{
    remove-highlighter window/wrapline
    remove-highlighter window/softwrap
    autowrap-disable
}
