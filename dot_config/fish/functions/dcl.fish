function dcl
    if test (count $argv) -eq 0
        docker compose logs -f
    else
        docker compose logs $argv[1] -f
    end
end
