function fish_prompt
    set -l last_status $status

    set -l bracket_color (test $last_status -eq 0; and echo green; or echo red)

    # Conda prompt segment
    set -l conda_seg ""
    set -l env_name "$CONDA_DEFAULT_ENV"
    if test -z "$env_name"
        set env_name "$MAMBA_DEFAULT_ENV"
    end
    if test -n "$env_name"
        if test "$env_name" = base
            set conda_seg " "(set_color brblack)"(base)"(set_color normal)" "
        else
            set conda_seg " "(set_color yellow)"($env_name)"(set_color normal)" "
        end
    end

    # Path
    set -l path_seg (_format_path)

    # Git branch
    set -l git_seg ""
    set -l branch (command git symbolic-ref --short HEAD 2>/dev/null; or command git describe --tags --exact-match HEAD 2>/dev/null)
    if test -n "$branch"
        set git_seg " "(set_color red)"$branch"(set_color normal)
    end

    # Two-line prompt: line 1 = path + branch, line 2 = input
    echo -n (set_color $bracket_color)"┌"(set_color normal)
    echo -n $conda_seg
    echo -n $path_seg
    echo $git_seg
    echo -n (set_color $bracket_color)"└❯"(set_color normal)" "
end
