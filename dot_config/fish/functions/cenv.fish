function cenv
    set -l selected (conda env list 2>/dev/null | awk 'NR>2 && $1!=""{print $1}' | fzf --prompt="conda env> ")
    if test -n "$selected"
        conda activate $selected
    end
end
