function _auto_activate_conda --on-variable PWD
    set -l target (_conda_env_in_repo 2>/dev/null)

    if test -n "$target"
        if test "$__auto_conda" != "$target"
            if command -q conda
                conda activate $target 2>/dev/null
            else if command -q micromamba
                micromamba activate $target 2>/dev/null
            end
            set -g __auto_conda $target
        end
    else
        if test -n "$__auto_conda"
            if command -q conda
                conda deactivate 2>/dev/null
            else if command -q micromamba
                micromamba deactivate 2>/dev/null
            end
            set -g __auto_conda ""
        end
    end
end
