$PandellDevelopmentDir = 'C:\Users\andreasm\Development\Pandell\'

function Cleanup-Pandell-Project()
{
    Get-ChildItem -Path . -Recurse -Include *.csproj | `
    Foreach-Object { ..\DevTools\build\Debug\Pandell.XmlEditCli\Pandell.XmlEditCli.exe $_.FullName; Remove-Item "$($_.FullName).bak" }
}

function Scoop-Update()
{
    scoop update *; scoop cleanup *;
}

function ap-restore-dev_andy()
{
    & ${PandellDevelopmentDir}AP\tools\Restore-Database.ps1 `
        -DatabaseName AP_Development_Andy `
        -CustomDatabaseBackup AP_Development
}

function ap-restore-staging()
{
    & ${PandellDevelopmentDir}AP\tools\Restore-Database.ps1 `
        -DatabaseName AP_Staging `
        -CustomDatabaseBackup AP_Experiment

    & ${PandellDevelopmentDir}AP\tools\Restore-Database.ps1 `
        -DatabaseName AP_Staging_JV5 `
        -CustomDatabaseBackup AP_Experiment
}

function ap-restore-test()
{
    & ${PandellDevelopmentDir}AP\tools\Restore-Database.ps1 `
        -DatabaseName AP_Test `
        -CustomDatabaseBackup AP_Test
}

function ap-run-upgrade()
{
    # run all upgrade tasks
    & ${PandellDevelopmentDir}AP\nuget_modules\Pandell.Pli.Tools.6.4.1\tools\PliCmd.exe `
        -d "appConfig:${PandellDevelopmentDir}AP\src\Pandell.AP.Web\Web.config" `
        -x UpgradeDatabase
}

function pcp-restore-dev_andy()
{
    & ${PandellDevelopmentDir}PCP\tools\Restore-Database.ps1 `
        -DatabaseName PCP_Development_Andy `
        -CustomDatabaseBackup PCP_Development
}

function pcp-restore-experiment()
{
    & ${PandellDevelopmentDir}PCP\tools\Restore-Database.ps1 `
        -DatabaseName PCP_Experiment `
        -CustomDatabaseBackup PCP_Development
}

function pcp-run-upgrade()
{
    & ${PandellDevelopmentDir}PCP\nuget_modules\Pandell.Pli.Tools.6.4.0\tools\PliCmd.exe `
        -d "appConfig:${PandellDevelopmentDir}PCP\src\Pandell.PCP.Web\Web.config" `
        -x UpgradeDatabase
}


# getfileencoding implementation
function Get-FileEncoding($Path) {
    $bytes = [byte[]](Get-Content $Path -Encoding byte -ReadCount 4 -TotalCount 4)

    if(!$bytes) { return 'utf8' }

    switch -regex ('{0:x2}{1:x2}{2:x2}{3:x2}' -f $bytes[0],$bytes[1],$bytes[2],$bytes[3]) {
        '^efbbbf'   { return 'utf8' }
        '^2b2f76'   { return 'utf7' }
        '^fffe'     { return 'unicode' }
        '^feff'     { return 'bigendianunicode' }
        '^0000feff' { return 'utf32' }
        default     { return 'ascii' }
    }
}

# touch implementation
function touch {
    if (Test-Path $args[0]) {
        (Get-Item $args[0]).LastWriteTime = Get-Date
    } else {
        Set-Content -Path ($args[0]) -Value ($null)
    }
}
