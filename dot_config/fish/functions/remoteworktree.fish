function remoteworktree
    set -l branch $argv[1]
    set -l base worktrees
    mkdir -p $base
    git fetch origin $branch
    git worktree add "$base/$branch" "origin/$branch" -b $branch
end
