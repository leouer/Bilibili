$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$cookietxt = "_uuid=02546716-2D97-C184-6CD3-07016E00CF1E58559infoc; buvid3=E4AE95F3-395B-4D1D-814C-B6DD442B552F155822infoc; LIVE_BUVID=AUTO9315911141143825; PVID=1; sid=b4n4wrcp; CURRENT_FNVAL=80; blackside_state=1; bfe_id=1bad38f44e358ca77469025e0405c4a6; fingerprint=4b7b25c205cc37733d4cfbfe7effdafb; buvid_fp=3061B78E-3F74-4311-9410-3AE19C80FE0018539infoc; buvid_fp_plain=3061B78E-3F74-4311-9410-3AE19C80FE0018539infoc; DedeUserID=617146502; DedeUserID__ckMd5=9f5297c557c49e69; SESSDATA=dbd62635%2C1627017293%2C18149*11; bili_jct=d5ea365843ab17f615f548f761b7f37f"
$cookies = $cookietxt.Split(';')
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
