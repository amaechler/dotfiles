# Pli-Cli utilities
function yarnBin($cmd, $rest) {
    Push-Location
    try {
        $cmdPath = $null
        $currentDir = (Get-Location).Path
        while (-not $cmdPath) {
            $cmdPath = (Join-Path $currentDir (Join-Path "node_modules" (Join-Path ".bin" "$cmd.cmd")))
            if (-not (Test-Path $cmdPath)) {
                $cmdPath = $null
                Set-Location ".."
                $oldCurrentDir = $currentDir
                $currentDir = (Get-Location).Path
                if ($oldCurrentDir -ieq $currentDir) {
                    Write-Error "Command `"$cmd`" not found"
                    return;
                }
            }
        }
    }
    finally {
        Pop-Location
    }

    & $cmdPath $rest
}

function gulp() { yarnBin "gulp" $args }
function jest() { yarnBin "jest" $args }
function jslint() { yarnBin "jslint" $args }
function karma() { yarnBin "karma" $args }
function lerna() { yarnBin "lerna" $args }
function mocha() { yarnBin "mocha" $args }
function newman() { yarnBin "newman" $args }
function pli() { yarnBin "pli" $args }
function prettier() { yarnBin "prettier" $args }
function repo() { yarnBin "repo" $args }
function tsc() { yarnBin "tsc" $args }
function tslint() { yarnBin "tslint" $args }
function webpack() { yarnBin "webpack" $args }