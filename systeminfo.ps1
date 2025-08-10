<#
    Systeminformationen.ps1
    Erstellt von: [cofuchs]
    Beschreibung:
        Dieses PowerShell-Skript gibt grundlegende Systeminformationen aus.
        Zur Wahrung der Privatsphäre sind Computername, Benutzername,  IP-Adresse und MAC-Adresse standardmäßig auskommentiert.
        Diese Zeilen können bei Bedarf aktiviert werden.

        ⚠️ Hinweis:
        Wenn du dieses Skript öffentlich teilst, achte darauf, keine sensiblen Informationen freizugeben.
#>

Write-Host "===== Systeminformationen ====="

# Betriebssystem anzeigen
Write-Host "Betriebssystem: $(Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption)"

# Computername anzeigen (auskommentiert aus Datenschutzgründen)
# Write-Host "Computername: $env:COMPUTERNAME"

# Benutzername anzeigen (auskommentiert aus Datenschutzgründen)
# Write-Host "Benutzer: $env:USERNAME"

# CPU anzeigen
Write-Host "CPU: $(Get-CimInstance Win32_Processor | Select-Object -ExpandProperty Name)"

# RAM anzeigen (in GB, gerundet)
Write-Host "RAM (GB): $([Math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2))"

# IP-Adresse anzeigen (auskommentiert aus Datenschutzgründen)
# Write-Host "IP-Adresse: $(Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ne 'Loopback Pseudo-Interface 1' } | Select-Object -First 1 -ExpandProperty IPAddress)"

# MAC-Adresse anzeigen (auskommentiert aus Datenschutzgründen)
# Write-Host "MAC-Adresse: $(Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Select-Object -First 1 -ExpandProperty MacAddress)"

# Systemlaufzeit berechnen
Write-Host "Systemlaufzeit: $(Get-CimInstance Win32_OperatingSystem | Select-Object @{Name='Uptime';Expression={(Get-Date) - $_.LastBootUpTime}})"
