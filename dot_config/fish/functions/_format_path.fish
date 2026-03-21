function _format_path
    set -l cur (basename $PWD)
    set -l git_root (command git rev-parse --show-toplevel 2>/dev/null)

    if test -n "$git_root"
        # Inside a git repo
        set -l prefix (string replace -r '/[^/]+$' '/' $git_root)
        set prefix (string replace "$HOME" '~' $prefix)
        set -l repo (basename $git_root)
        set -l rel (string replace "$git_root" '' $PWD)
        set rel (string replace -r '^/' '' $rel)

        if test -z "$rel"
            # At repo root
            echo -n (set_color brblack)"$prefix"(set_color normal)(set_color blue)"$repo"(set_color normal)
        else
            # Inside repo
            set -l parent_dir (string replace -r '/[^/]+$' '' $rel)
            if test "$parent_dir" = "$rel"
                set parent_dir ""
            else
                set parent_dir "/$parent_dir"
            end
            echo -n (set_color brblack)"$prefix"(set_color normal)(set_color white)"$repo$parent_dir/"(set_color normal)(set_color blue)"$cur"(set_color normal)
        end
    else
        # Not a git repo
        set -l parent_path (string replace "$HOME" '~' (dirname $PWD))
        echo -n (set_color brblack)"$parent_path/"(set_color normal)(set_color brblack)"$cur"(set_color normal)
    end
end
