[CmdletBinding()]
Param(
    [string]$Cookietxt
)

$Cookietxt

$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$cookies = $Cookietxt.Split(';')
$cookies[0]
foreach($c in $cookies)
{
    $cc = $c.Split('=')
    $cc
    $co=@{
        name=$cc[0]
        value=$cc[1]
    }
    $cookie = New-Object System.Net.Cookie
    $cookie.Name=$co.name.Trim()
    $cookie.Value=$co.value.Trim()
    $cookie.Domain='.bilibili.com'
    $session.Cookies.Add($cookie)
}

$session

$res = Invoke-WebRequest -Uri 'https://api.bilibili.com/x/web-interface/nav' -WebSession $session -UseBasicParsing   -Method 'GET'
$res
