<#
.SYNOPSIS
    Find installed fonts by name.
    
.EXAMPLE
    # Find all fonts that include "Sarasa" in their name
    .\FindFont.ps1 "Sarasa"
#>

param (
    [Parameter(Mandatory=$false, Position=0)]
    [string]$FontName
)

if ([string]::IsNullOrEmpty($FontName) -or [string]::IsNullOrWhiteSpace($FontName)) {
    Write-Host "Please input font name."
    return
}

Add-Type -AssemblyName PresentationCore

$SystemFonts = [Windows.Media.Fonts]::SystemFontFamilies

$SystemFonts | Where-Object { $_.Source -like "*$FontName*" } | Select-Object Source
