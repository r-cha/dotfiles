function cexport
    set -l name $argv[1]
    if test -z "$name"
        set name $CONDA_DEFAULT_ENV
    end
    if test -z "$name"
        echo "no env"
        return 1
    end
    conda env export -n $name | sed '/^prefix:/d' >environment.yml; and echo "wrote environment.yml"
end
