
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", 'application/json')
$headers.Add("Accept", 'application/json')
$headers.Add("Authorization", "Basic YTBIbDVSZEp4ZWNhbnRzWTB4bW9UN296cjdKRmd4SGE6TVI2QXFsNDNOTTVDdTV2MTczZ25vRTg3RmZzd3NIYXNxZk8tUmlpclZ0R2htR003VjNvT2J2WExuX2Z0akRyUQ==")
$uri = "https://api.splunknova.com/v1/events"

$headers
$colors  = 'Blue','Green','yellow','red','black','pink','white','gray'

for ($i = 1 ;$i -lt 3 ; $i++)
{
    $i
    $r = Get-Random -Minimum 2222 -Maximum 4444
    $r
    
    $c = $colors[(Get-Random -Maximum ([array]$colors).count)]
    $c

    $data = @{
        number= $r
        color=$c
        source = "splunknova/demo/test"
        entity = "splunknova/demo/entity"
    }
    $json = $data | ConvertTo-Json
    $json

    $response = Invoke-RestMethod $uri -Method post -Body $json -Headers $headers
    $response
}


#curl -X GET --header 'Accept: application/json' -u 'FnaIvfEA46J7Z55vkkKYNJWeoQCynXHy:jiHlVxZ8iU3Ktk-V3mejx0Spox_vSF4B7mxrsx5RHgOHnhLqeOQubJ907ar8BBhw' 'https://api.splunknova.com/v1/events?index=0&count=10&keywords=iphone*%20AND%20(capacity_gb%3D128)'

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", 'application/json')
$headers.Add("Authorization", "Basic YTBIbDVSZEp4ZWNhbnRzWTB4bW9UN296cjdKRmd4SGE6TVI2QXFsNDNOTTVDdTV2MTczZ25vRTg3RmZzd3NIYXNxZk8tUmlpclZ0R2htR003VjNvT2J2WExuX2Z0akRyUQ==")

$geturi = "https://api.splunknova.com/v1/events?index=0&count=20&keywords=*%20AND%20color%3DBlue%20AND%20number%3E3500"
$results =  Invoke-RestMethod $geturi -Method get -Headers $headers

$results.events

$geturi = "https://api.splunknova.com/v1/events?index=0&count=20&keywords=*&report=stats%20count%20by%20color"
$results =  Invoke-RestMethod $geturi -Method get -Headers $headers


