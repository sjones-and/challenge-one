$data = Get-Content ./input.txt | %{($_ -replace '[^a-z]').ToLowerInvariant()} | select @{n='len';e={$_.Length}},@{n='chars';e={($_.ToCharArray() | select -Unique).Length}}
$perfectCount = ($data | ?{$_.len -eq 26 -and $_.chars -eq 26}).Length
$nonPerfectCount = ($data | ?{$_.len -ne 26 -and $_.chars -eq 26}).Length 
($perfectCount * $nonPerfectCount) - $data.Length + $perfectCount + $nonPerfectCount