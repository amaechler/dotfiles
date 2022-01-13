# replace PowerShell built-in "curl" alias
if (Get-Alias curl*) { Remove-Item alias:curl }
Set-Alias curl ~/scoop/apps/git/current/mingw64/bin/curl.exe

function Cleanup-Pandell-Project() {
    Get-ChildItem -Path . -Recurse -Include *.csproj | `
        Foreach-Object { & ${PandellDevelopmentDir}DevTools\build\Debug\Pandell.XmlEditCli\Pandell.XmlEditCli.exe $_.FullName; Remove-Item "$($_.FullName).bak" }
}

function Scoop-Update() {
    scoop update *; scoop cleanup *;
}

function ap-restore-dev_andy() {
    # Copy-Item "\\files.net.pandell.com\Products_and_Support\TeamCityDeployDatabases\AP\AP_Development.bak" -Destination "C:\sqlbackups"

    # drop the existing AP_Development_Andy database
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "DROP DATABASE [AP_Development_Andy]"
        
    # list out logical file names and paths inside the backup
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "RESTORE FILELISTONLY FROM DISK = '/sqlbackups/AP_Development.bak'"
    
    # restore the database inside the container; specify new paths for each of the files from previous step
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "RESTORE DATABASE AP_Development_Andy FROM DISK = '/sqlbackups/AP_Development.bak' WITH MOVE 'AP_Development' TO '/var/opt/mssql/data/AP_Development_Andy.mdf', MOVE 'AP_Development_log' TO '/var/opt/mssql/data/AP_Development_Andy_log.ldf'"
}

function ap-restore-experiment_andy() {
    Copy-Item "\\files.net.pandell.com\Products_and_Support\TeamCityDeployDatabases\AP\AP_Experiment.bak" -Destination "C:\sqlbackups"

    # drop the existing AP_Development_Andy database
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "DROP DATABASE [AP_Development_Andy]"
        
    # list out logical file names and paths inside the backup
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "RESTORE FILELISTONLY FROM DISK = '/sqlbackups/AP_Experiment.bak'"
    
    # restore the database inside the container; specify new paths for each of the files from previous step
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "RESTORE DATABASE AP_Development_Andy FROM DISK = '/sqlbackups/AP_Experiment.bak' WITH MOVE 'AP_Experiment' TO '/var/opt/mssql/data/AP_Development_Andy.mdf', MOVE 'AP_Experiment_log' TO '/var/opt/mssql/data/AP_Development_Andy_log.ldf'"
}

function ap-restore-staging() {
    & ${PandellDevelopmentDir}AP\tools\Restore-Database.ps1 `
        -DatabaseName AP_Staging `
        -CustomDatabaseBackup AP_Experiment

    & ${PandellDevelopmentDir}AP\tools\Restore-Database.ps1 `
        -DatabaseName AP_Staging_JV5 `
        -CustomDatabaseBackup AP_Experiment
}

function ap-restore-test() {
    & ${PandellDevelopmentDir}AP\tools\Restore-Database.ps1 `
        -DatabaseName AP_Test `
        -CustomDatabaseBackup AP_Test
}

function ap-run-upgrade() {
    # run all upgrade tasks
    & ${PandellDevelopmentDir}AP\nuget_modules\Pandell.Pli.Tools.6.4.1\tools\PliCmd.exe `
        -d "appConfig:${PandellDevelopmentDir}AP\src\Pandell.AP.Web\Web.config" `
        -x UpgradeDatabase
}

function connect-restore-dev_andy() {
    Copy-Item "${PandellDevelopmentDir}_Databases\Connect_Development.bak" -Destination "C:\Temp"

    # drop the database
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "USE master; ALTER DATABASE Connect_Development_Andy SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE Connect_Development_Andy;"
    
    # restore the database inside the container; specify new paths for each of the files from previous step
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "RESTORE DATABASE Connect_Development_Andy FROM DISK = '/tmp/Connect_Development.bak' WITH MOVE 'Connect_Development_Andy' TO '/var/opt/mssql/data/Connect_Development_Andy.mdf', MOVE 'Connect_Development_Andy_log' TO '/var/opt/mssql/data/Connect_Development_Andy_log.ldf'"
}

function connect-run-upgrade() {
    # run all upgrade tasks
    & ${PandellDevelopmentDir}Connect\nuget_modules\Pandell.Pli.Tools.6.4.1\tools\PliCmd.exe `
        -d "appConfig:${PandellDevelopmentDir}Connect\src\Pandell.Connect.Web\Web.config" `
        -x UpgradeDatabase
}

function pcp-restore-dev_andy() {
    # Copy-Item "\\wm2016sql01.net.pandell.com\SQLDROPFOLDER\PCP\PCP_Development.bak" -Destination "C:\sqlbackups"

    # drop the existing AP_Development_Andy database
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "DROP DATABASE [PCP_Development_Andy]"
        
    # list out logical file names and paths inside the backup
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "RESTORE FILELISTONLY FROM DISK = '/sqlbackups/PCP_Development.bak'"
    
    # restore the database inside the container; specify new paths for each of the files from previous step
    & docker exec -it test-sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "yourStrong(!)Password" `
        -Q "RESTORE DATABASE PCP_Development_Andy FROM DISK = '/sqlbackups/PCP_Development.bak' WITH MOVE 'PCP_Prod' TO '/var/opt/mssql/data/PCP_Development_Andy.mdf', MOVE 'PCP_Prod_log' TO '/var/opt/mssql/data/PCP_Development_Andy_log.ldf'"
}

function pcp-restore-experiment() {
    & ${PandellDevelopmentDir}PCP\tools\Restore-Database.ps1 `
        -DatabaseName PCP_Experiment `
        -CustomDatabaseBackup PCP_Development
}

function pcp-run-upgrade() {
    & ${PandellDevelopmentDir}PCP\nuget_modules\Pandell.Pli.Tools.6.4.1\tools\PliCmd.exe `
        -d "appConfig:${PandellDevelopmentDir}PCP\src\Pandell.PCP.Web\Web.config" `
        -x UpgradeDatabase
}

# getfileencoding implementation
function Get-FileEncoding($Path) {
    $bytes = [byte[]](Get-Content $Path -Encoding byte -ReadCount 4 -TotalCount 4)

    if (!$bytes) { return 'utf8' }

    switch -regex ('{0:x2}{1:x2}{2:x2}{3:x2}' -f $bytes[0], $bytes[1], $bytes[2], $bytes[3]) {
        '^efbbbf' { return 'utf8' }
        '^2b2f76' { return 'utf7' }
        '^fffe' { return 'unicode' }
        '^feff' { return 'bigendianunicode' }
        '^0000feff' { return 'utf32' }
        default { return 'ascii' }
    }
}

# touch implementation
function touch {
    if (Test-Path $args[0]) {
        (Get-Item $args[0]).LastWriteTime = Get-Date
    }
    else {
        Set-Content -Path ($args[0]) -Value ($null)
    }
}
