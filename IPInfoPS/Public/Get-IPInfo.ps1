function Get-IPInfo
{
<#

.EXAMPLE

Get-IPInfo
Get-IPInfo -IP 8.8.8.8
Get-IPInfo -ip '2601:9:7680:363:75df:f491:6f85:352f'
#>
[CmdletBinding()]
PARAM($IP)
    IF($IP)
    {
        $URI = "http://ipinfo.io/$IP"
    }
    ELSE{$URI = "http://ipinfo.io/"}

Invoke-RestMethod -Uri $URI | Select *,@{L='GoogleMap';E={if ($_.loc){"https://www.google.ca/maps/dir/$($_.Loc)"}}}

}


