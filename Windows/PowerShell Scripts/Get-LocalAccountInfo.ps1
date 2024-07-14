<#
.SYNOPSIS
    Retrieves the last logon, last password change, disabled status, and lockout status information for local or remote accounts on specified machines.

.DESCRIPTION
    This script queries the local or remote SAM database to retrieve information about user accounts, including
    their last logon time, last password change time, disabled status, and lockout status. It then outputs this information in a readable format.

.PARAMETER ComputerName
    The name of a single computer to query. Default is the local computer.

.PARAMETER ComputerListFile
    Path to a text file containing a list of computer names to query.

.EXAMPLE
    .\Get-LocalAccountInfo.ps1 -ComputerName "RemotePC"

    This command will run the script and display the last logon, last password change, disabled status, and lockout status information for all accounts on the specified remote computer.

.EXAMPLE
    .\Get-LocalAccountInfo.ps1 -ComputerListFile "computers.txt"

    This command will run the script and display the last logon, last password change, disabled status, and lockout status information for all accounts on the computers listed in the specified file.
#>

param(
    [string]$ComputerName = $env:COMPUTERNAME,
    [string]$ComputerListFile
)

function Get-AccountInfo {
    param(
        [string]$Computer
    )

    $ErrorActionPreference = "Stop"

    # Print the computer name
    Write-Host "Enumerating accounts on computer: $Computer" -ForegroundColor Yellow

    # Retrieve local user accounts
    $localUsers = Get-LocalUser

    # Output table header
    Write-Host ("{0,-20} {1,-25} {2,-25} {3,-15} {4,-10}" -f "UserName", "LastLogon", "LastPasswordChange", "Disabled", "LockedOut") -ForegroundColor Cyan
    Write-Host ("{0,-20} {1,-25} {2,-25} {3,-15} {4,-10}" -f "--------", "---------", "------------------", "--------", "---------") -ForegroundColor Cyan

    # Iterate through each local user and retrieve information
    foreach ($user in $localUsers) {
        # Get last logon time
        $lastLogon = if ($user.LastLogon) { $user.LastLogon.ToString("G") } else { "Never" }
        
        # Get last password change time
        $lastPasswordChange = if ($user.PasswordLastSet) { $user.PasswordLastSet.ToString("G") } else { "Never" }

        # Get disabled status
        $disabled = if ($user.Enabled -eq $false) { "Yes" } else { "No" }

        # Get lockout status
        $lockedOut = if ($user.LockedOut) { "Yes" } else { "No" }
        
        # Output the information
        Write-Host ("{0,-20} {1,-25} {2,-25} {3,-15} {4,-10}" -f $user.Name, $lastLogon, $lastPasswordChange, $disabled, $lockedOut)
    }
}

function Invoke-AccountInfo {
    param(
        [string]$Computer
    )

    try {
        # Execute on remote computer
        Invoke-Command -ComputerName $Computer -ScriptBlock {
            param (
                [string]$Computer
            )

            Import-Module Microsoft.PowerShell.LocalAccounts

            function Get-AccountInfo {
                param(
                    [string]$Computer
                )

                $ErrorActionPreference = "Stop"

                # Print the computer name
                Write-Host "Enumerating accounts on computer: $Computer" -ForegroundColor Yellow

                # Retrieve local user accounts
                $localUsers = Get-LocalUser

                # Output table header
                Write-Host ("{0,-20} {1,-25} {2,-25} {3,-15} {4,-10}" -f "UserName", "LastLogon", "LastPasswordChange", "Disabled", "LockedOut") -ForegroundColor Cyan
                Write-Host ("{0,-20} {1,-25} {2,-25} {3,-15} {4,-10}" -f "--------", "---------", "------------------", "--------", "---------") -ForegroundColor Cyan

                # Iterate through each local user and retrieve information
                foreach ($user in $localUsers) {
                    # Get last logon time
                    $lastLogon = if ($user.LastLogon) { $user.LastLogon.ToString("G") } else { "Never" }
                    
                    # Get last password change time
                    $lastPasswordChange = if ($user.PasswordLastSet) { $user.PasswordLastSet.ToString("G") } else { "Never" }

                    # Get disabled status
                    $disabled = if ($user.Enabled -eq $false) { "Yes" } else { "No" }

                    # Get lockout status
                    $lockedOut = if ($user.LockedOut) { "Yes" } else { "No" }
                    
                    # Output the information
                    Write-Host ("{0,-20} {1,-25} {2,-25} {3,-15} {4,-10}" -f $user.Name, $lastLogon, $lastPasswordChange, $disabled, $lockedOut)
                }
            }

            Get-AccountInfo -Computer $Computer
        } -ArgumentList $Computer -ErrorAction Stop
    } catch {
        Write-Host "Failed to connect to remote computer: $Computer" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}

if ($ComputerListFile) {
    # Execute for multiple computers
    $computers = Get-Content -Path $ComputerListFile
    foreach ($computer in $computers) {
        Write-Host "Querying $computer..." -ForegroundColor Yellow
        Invoke-AccountInfo -Computer $computer
    }
} else {
    # Execute for a single computer (default is local)
    Invoke-AccountInfo -Computer $ComputerName
}
