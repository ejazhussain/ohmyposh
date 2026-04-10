# -----------------------------
# Oh My Posh
# -----------------------------
$theme = "$HOME\.poshthemes\m365pnp.omp.json"
if (Test-Path $theme) {
    oh-my-posh init pwsh --config $theme | Invoke-Expression
}

