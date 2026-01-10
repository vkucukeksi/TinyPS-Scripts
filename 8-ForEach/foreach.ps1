<#
.SYNOPSIS
Create or delete folders from a list in a text file.

.DESCRIPTION
This script reads folder names from one of several text files and either creates or deletes the corresponding folders under the Data\Share directory.

.PARAMETER Source
Which source list to use. Allowed values: FolderNames (default), Departments, Custom.

.PARAMETER Action
Create (default) or Delete.

.PARAMETER CustomPath
When Source is Custom, provide the full path to the text file containing folder names.

.EXAMPLE
.\foreach.ps1 -Source Departments -Action Create
#>

[CmdletBinding(SupportsShouldProcess=$true)]
param(
    [ValidateSet('FolderNames','Departments','Custom')]
    [string]$Source = 'FolderNames',

    [ValidateSet('Create','Delete')]
    [string]$Action = 'Create',

    [string]$CustomPath,

    [switch]$DryRun
)

# Resolve script root and known file paths
$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
switch ($Source) {
    'FolderNames' { $sourceFile = Join-Path $scriptRoot 'Data\Share\FolderNames.txt' }
    'Departments' { $sourceFile = Join-Path $scriptRoot 'Data\Departments.txt' }
    'Custom' {
        if (-not $CustomPath) {
            Write-Error "When Source is 'Custom' you must provide -CustomPath.`nExample: .\foreach.ps1 -Source Custom -CustomPath 'C:\path\to\list.txt'"
            exit 1
        }
        $sourceFile = $CustomPath
    }
}

if (-not (Test-Path -Path $sourceFile)) {
    Write-Error "Source file not found: $sourceFile"
    exit 1
}

# Read folder names, trim, remove blanks and duplicates
$folders = Get-Content -Path $sourceFile | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' } | Select-Object -Unique

# Ensure target base folder exists
$targetBase = Join-Path $scriptRoot 'Data\Share'
if (-not (Test-Path -Path $targetBase)) {
    if ($DryRun) {
        Write-Host "DRY-RUN: Would create base folder: $targetBase"
    } else {
        New-Item -Path $targetBase -ItemType Directory -Force | Out-Null
    }
}

# Counters for summary
$created = 0
$deleted = 0
$skipped = 0
$alreadyExists = 0

foreach ($folder in $folders) {
    # Remove characters invalid in file/folder names
    $safeName = ($folder -replace '[<>:\"/\\|?*]','').Trim()
    if ($safeName -eq '') {
        Write-Warning "Skipping invalid/empty folder name from input: '$folder'"
        continue
    }

    $fullPath = Join-Path $targetBase $safeName

    if ($Action -eq 'Create') {
        if (-not (Test-Path -Path $fullPath)) {
            if ($DryRun) {
                Write-Host "DRY-RUN: Would create folder: $fullPath"
                $created++
            } else {
                if ($PSCmdlet.ShouldProcess($fullPath, 'Create folder')) {
                    New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
                    Write-Host "Created folder: $fullPath"
                } else {
                    Write-Host "WhatIf/Confirm prevented creating: $fullPath"
                }
                $created++
            }
        } else {
            Write-Host "Folder already exists: $fullPath"
            $alreadyExists++
        }
    } else {
        if (Test-Path -Path $fullPath) {
            if ($DryRun) {
                Write-Host "DRY-RUN: Would delete folder: $fullPath"
                $deleted++
            } else {
                if ($PSCmdlet.ShouldProcess($fullPath, 'Delete folder')) {
                    Remove-Item -Path $fullPath -Recurse -Force
                    Write-Host "Deleted folder: $fullPath"
                } else {
                    Write-Host "WhatIf/Confirm prevented deleting: $fullPath"
                }
                $deleted++
            }
        } else {
            Write-Host "Folder does not exist: $fullPath"
            $skipped++
        }
    }
}

# Summary
if ($DryRun) {
    Write-Host "\nDRY-RUN summary: Would have created: $created, would have deleted: $deleted, already existed: $alreadyExists, not existing (skipped): $skipped"
} else {
    Write-Host "\nOperation summary: Created: $created, Deleted: $deleted, Already existed: $alreadyExists, Not existing (skipped): $skipped"
}


