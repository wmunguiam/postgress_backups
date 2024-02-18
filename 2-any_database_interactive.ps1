#==========================================================================
#Get DB name from user
param (
    [string]$dbName
)
#==========================================================================
# DB check
if (-not $dbName) {
    Write-Host "Por favor, proporcione el nombre de la base de datos como argumento."
    Write-Host "Ejemplo: .\backup.ps1 db_encuestas_dev"
    exit 1
}
#==========================================================================
# Custom server variables
$hostName = "10.70.70.77"
$port = "5432"
$userName = "postgres"
$StoragePath = "H:\Backup\"
$pgDumpPath = "E:\PostgreSQL\14\bin\pg_dump.exe"
$fileFormat = "c"
$Env:PGPASSFILE = "E:\PostgreSQL\14\bin\pgpass.conf"
#==========================================================================
# Backup folders creation
$YearFolder = "DB_BACKUPS_$(Get-Date -Format 'yyyy')\"
New-Item -Path "$StoragePath$YearFolder" -ItemType Directory -ErrorAction SilentlyContinue

$MonthFolder = "DB_BACKUPS_$(Get-Date -Format 'yyyy_MM')\"
New-Item -Path "$StoragePath$YearFolder$MonthFolder" -ItemType Directory -ErrorAction SilentlyContinue

#==========================================================================
# Execute backup command
$dbFolder = "$dbName" + "_backup_" + $(Get-Date -Format 'yyyy_MM')
New-Item -Path "$StoragePath$YearFolder$MonthFolder$dbFolder" -ItemType Directory -ErrorAction SilentlyContinue

$timestamp = Get-Date -Format "yyyy_MM_dd_HH_mm"
$backupFolder = "$StoragePath$YearFolder$MonthFolder$dbFolder"
$backupFile = "$dbName" + "_backup_" + $timestamp + ".dump"

& $pgDumpPath --host=$hostName --port=$port --username=$userName -w --format=$fileFormat --blobs -c --verbose -f $backupFolder\$backupFile $dbName
if ($LASTEXITCODE -eq 0) {
    Write-Host "Backup successful: $backupFile"
} else {
    Write-Host "Backup failed" > Log.txt
}
#==========================================================================
