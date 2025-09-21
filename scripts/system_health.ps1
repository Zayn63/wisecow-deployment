# system_health.ps1
$logFile = "C:\Users\HP\acckon\wisecow\scripts\system_health.log"

function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "$timestamp - $message"
    Write-Host $entry
    Add-Content -Path $logFile -Value $entry
}

# Thresholds
$cpuThreshold = 80
$memThreshold = 80
$diskThreshold = 90

# CPU Usage
$cpu = Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
if ($cpu -gt $cpuThreshold) {
    Log-Message "[ALERT] CPU usage is high: $cpu%"
} else {
    Log-Message "[OK] CPU usage: $cpu%"
}

# Memory Usage
$mem = Get-CimInstance Win32_OperatingSystem
$memUsage = [math]::Round((($mem.TotalVisibleMemorySize - $mem.FreePhysicalMemory)/$mem.TotalVisibleMemorySize)*100,2)
if ($memUsage -gt $memThreshold) {
    Log-Message "[ALERT] Memory usage is high: $memUsage%"
} else {
    Log-Message "[OK] Memory usage: $memUsage%"
}

# Disk Usage (C: drive)
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$diskUsage = [math]::Round((($disk.Size - $disk.FreeSpace)/$disk.Size)*100,2)
if ($diskUsage -gt $diskThreshold) {
    Log-Message "[ALERT] Disk usage is high: $diskUsage%"
} else {
    Log-Message "[OK] Disk usage: $diskUsage%"
}

# Top 5 processes by CPU
Log-Message "`nTop 5 processes by CPU:"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 | ForEach-Object {
    Log-Message "$($_.ProcessName) - CPU: $($_.CPU)"
}
