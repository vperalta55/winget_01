# Inputs
$app = "Mozilla.Firefox"
# Query for directory where the most updated winget.exe is stored
$wingetDir = Get-ChildItem "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" | Sort-Object -Property LastWriteTime | Select-Object -Last 1

if ($wingetDir) {
    # Output directory
    Write-out "cd to directory: $($wingetDir.FullName)"

    # Construct the full path to winget.exe
    $wingetPath = Join-Path -Path $wingetDir.FullName -ChildPath "winget.exe"

    # Install the specified app using winget.exe
    & $wingetPath install --id $app --silent --accept-package-agreements --accept-source-agreements
} 
else {
    Write-out "Error: Windows Package Manager (winget) is not installed on the system."
}

