function crem
    set -l name $argv[1]
    if test -z "$name"
        set name $CONDA_DEFAULT_ENV
    end
    if test -z "$name"
        echo "no env"
        return 1
    end
    conda deactivate 2>/dev/null
    conda env remove -n $name
end
