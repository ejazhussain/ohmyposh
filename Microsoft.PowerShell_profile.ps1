# -----------------------------
# Oh My Posh
# -----------------------------
$theme = "$HOME\.poshthemes\m365pnp.omp.json"
if (Test-Path $theme) {
    oh-my-posh init pwsh --config $theme | Invoke-Expression
}

# -----------------------------
# CompletionPredictor (optional, defensive)
# -----------------------------
$completionPredictorModule = 'CompletionPredictor'

if (-not (Get-Module -ListAvailable -Name $completionPredictorModule)) {
    try {
        Install-Module `
            -Name $completionPredictorModule `
            -Repository PSGallery `
            -Scope CurrentUser `
            -Force `
            -ErrorAction Stop
    }
    catch {
        Write-Verbose "CompletionPredictor installation skipped: $_"
    }
}

Import-Module -Name $completionPredictorModule -ErrorAction SilentlyContinue

# -----------------------------
# PSReadLine configuration
# -----------------------------
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows