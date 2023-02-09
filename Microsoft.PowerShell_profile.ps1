if (-Not (Get-Command oh-my-posh.exe -errorAction SilentlyContinue))
{
    echo 'Y' | winget install XP8K0HKJFRXGCK
}

oh-my-posh.exe init pwsh --config "$env:POSH_THEMES_PATH\robbyrussel.omp.json" | Invoke-Expression
