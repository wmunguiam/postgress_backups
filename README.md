# Postgres DB's backup scripts with Powershell

3 options to backup databases:

| Option | Usage    | File    |
| :---:   | :---: | :---: |
| 1 | To backup specific database. Database name is defined inside the script.   | 1-one_database.ps1  |
| 2 | To backup any database as database name is passed as argument interactively. Database name is managed as variable inside the script.   | 2-any_database_interactive.ps1 |
| 3 | To backup manu databases. Database names are defined inside the script as an array.   | 3-many_databases.ps1  |

Options use postgress authentication by using pgpass.conf

## Option 1 - Usage

On Powershell:
```powershell
.\1-one_database.ps1
```

As a Task in Windows:
```bash
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File "C:\zabbix\Tasks\1-one_database.ps1"
```

## Option 2 - Usage

Only on Powershell: (Interactive)
```powershell
.\2-any_database_interactive.ps1 db_examplename
```

## Option 3 - Usage

On Powershell:
```powershell
.\3-many_databases.ps1
```

As a Task in Windows:
```bash
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File "C:\zabbix\Tasks\3-many_databases.ps1"
```
