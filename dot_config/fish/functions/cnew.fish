function cnew
    set -l name $argv[1]
    if test -z "$name"
        echo "usage: cnew <name> [python_version]"
        return 1
    end

    set -l cmd conda create -y -n $name
    if test (count $argv) -ge 2
        set cmd $cmd python=$argv[2]
    end

    $cmd; and conda activate $name
end
