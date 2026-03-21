function _conda_env_in_repo
    if test -f .conda-env
        head -n1 .conda-env | tr -d '[:space:]'
        return
    end
    if test -f environment.yml
        awk '/^[[:space:]]*name:[[:space:]]*/{print $2; exit}' environment.yml
    end
end
